using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using System.Text;

public partial class Orders_SearchOrder : DepartmentPage
{
    protected override void  Department_Page_Handling(object sender, EventArgs e)
    {
    }
    protected void btnCopy_Click(object sender, EventArgs e)
    {
       
        DepartmentOrder.DepartmentOrderRowRow order = DatabaseUtility.GetDepartmentOrder(int.Parse(hfSourceOrderId.Value));
        if (order != null)
        {
            Nullable<bool> flgDocToClient = null;
            Nullable<int> estWork = null;
            Nullable<bool> multiEmerExits = null;
            Nullable<bool> multiAssemPts = null;
            Nullable<bool> flgCancelled = null;
            Nullable<DateTime> dateCancelled = null;
            Nullable<int> estNumOfOperatives = null;
            if (order.Isflg_order_doc_to_clientNull() == false) flgDocToClient = order.flg_order_doc_to_client;
            if (order.Isorder_est_of_worksNull() == false) estWork = order.order_est_of_works;
            if (order.Isflg_multi_emer_exitsNull() == false) multiEmerExits = order.flg_multi_emer_exits;
            if (order.Isflg_multi_assem_pointsNull() == false) multiAssemPts = order.flg_multi_assem_points;
            if (order.Isflg_cancelledNull() == false) flgCancelled = order.flg_cancelled;
            if (order.Isdate_cancelledNull() == false) dateCancelled = order.date_cancelled;
            if (order.Isest_num_of_operativesNull() == false) estNumOfOperatives = order.est_num_of_operatives;

            DepartmentOrderTableAdapters.DepartmentOrderRowTableAdapter da = new DepartmentOrderTableAdapters.DepartmentOrderRowTableAdapter();
            IEnumerator iEnum = da.InsertAndReturn(false, order.dept_id, order.co_id, order.order_ref, order.order_client_ref, order.order_sms,
                DateTime.Now, estWork, DateTime.Now.AddYears(1), flgDocToClient, tbAddressNo.Text,tbAddress1.Text,tbAddress2.Text,tbAddress3.Text,
                tbAddress4.Text,tbAddress5.Text,tbPostalCode.Text,getFullAddress(),(order.Isorder_descNull()) ? null : order.order_desc,
                multiEmerExits, multiAssemPts, flgCancelled, dateCancelled,(order.Isdesc_of_workNull()) ? null : order.desc_of_work,estNumOfOperatives,
                (order.Isrisk_takingNull())?null:order.risk_taking,loggedInUserId, DateTime.Now, loggedInUserId, DateTime.Now).GetEnumerator();
            if (iEnum.MoveNext())
            {
                DepartmentOrder.DepartmentOrderRowRow newOrder = (DepartmentOrder.DepartmentOrderRowRow)iEnum.Current;

                //copy persons
                DepartmentOrderPersonTableAdapters.DepartmentOrderPersonEntityTableAdapter personTA = new DepartmentOrderPersonTableAdapters.DepartmentOrderPersonEntityTableAdapter();
                IEnumerator iEPerson = personTA.GetAllOrderPersonsByOrderId(order.dept_id, order.co_id, order.sequence).GetEnumerator();
                
                while (iEPerson.MoveNext())
                {
                    DepartmentOrderPerson.DepartmentOrderPersonEntityRow personDR = (DepartmentOrderPerson.DepartmentOrderPersonEntityRow)iEPerson.Current;
                    Nullable<bool> flgSupervisor = null;
                    Nullable<bool> flgFirstAider = null;
                    Nullable<bool> flgFireWarden = null;
                    string personName = (personDR.Isname_descNull()) ? null : personDR.name_desc;
                    if (personDR.Issuperrvisor_checkNull() == false) flgSupervisor = Convert.ToBoolean(personDR.superrvisor_check);
                    if (personDR.Isfirstaiderr_checkNull() == false) flgFirstAider = Convert.ToBoolean(personDR.firstaiderr_check);
                    if (personDR.Isfirewardenn_checkNull() == false) flgFireWarden = Convert.ToBoolean(personDR.firewardenn_check);

                    personTA.Insert(personDR.dept_id, personDR.co_id, newOrder.sequence, personName, loggedInUserId, flgSupervisor, flgFirstAider, flgFireWarden,false);
                }

                //copy hazards
                DepartmentOrderDetailTableAdapters.DepartmentOrderHazardTableAdapter hazaradTA = new DepartmentOrderDetailTableAdapters.DepartmentOrderHazardTableAdapter();
                IEnumerator iEHazard = hazaradTA.GetAllHazards(order.dept_id, order.co_id, order.sequence).GetEnumerator();
                while (iEHazard.MoveNext())
                {
                    DepartmentOrderDetail.DepartmentOrderHazardRow hazardDR = (DepartmentOrderDetail.DepartmentOrderHazardRow)iEHazard.Current;
                    hazaradTA.Insert(order.dept_id, order.co_id, newOrder.sequence, hazardDR.hazard_desc, loggedInUserId);
                }

                //copy sequence of work
                DepartmentOrderDetailTableAdapters.DepartmentOrderWorkTableAdapter workTA = new DepartmentOrderDetailTableAdapters.DepartmentOrderWorkTableAdapter();
                IEnumerator iEWork = workTA.GetAllWorks(order.dept_id, order.co_id, order.sequence).GetEnumerator();
                while (iEWork.MoveNext())
                {
                    DepartmentOrderDetail.DepartmentOrderWorkRow workDR = (DepartmentOrderDetail.DepartmentOrderWorkRow)iEWork.Current;
                    workTA.Insert(order.dept_id, order.co_id, newOrder.sequence, workDR.work_desc, loggedInUserId);
                }

                //copy plats and tools
                DepartmentOrderDetailTableAdapters.DepartmentOrderToolTableAdapter toolTA = new DepartmentOrderDetailTableAdapters.DepartmentOrderToolTableAdapter();
                IEnumerator iETool = toolTA.GetAllDepartmentTool(order.dept_id, order.co_id, order.sequence).GetEnumerator();
                while (iETool.MoveNext())
                {
                    DepartmentOrderDetail.DepartmentOrderToolRow toolDR = (DepartmentOrderDetail.DepartmentOrderToolRow)iETool.Current;
                    toolTA.Insert(order.dept_id, order.co_id, newOrder.sequence, toolDR.tool_desc, loggedInUserId);
                }

                //copy PPE
                DepartmentOrderDetailTableAdapters.DepartmentOrderPPETableAdapter ppeTA = new DepartmentOrderDetailTableAdapters.DepartmentOrderPPETableAdapter();
                IEnumerator iEPPE = ppeTA.GetAllPPE(order.dept_id, order.co_id, order.sequence).GetEnumerator();
                while (iEPPE.MoveNext())
                {
                    DepartmentOrderDetail.DepartmentOrderPPERow ppeDR = (DepartmentOrderDetail.DepartmentOrderPPERow)iEPPE.Current;
                    ppeTA.Insert(order.dept_id, order.co_id, newOrder.sequence, ppeDR.ppe_desc, loggedInUserId);
                }

                //copy Emergency
                DepartmentOrderDetailTableAdapters.DepartmentOrderEmergencyExitTableAdapter emergencyTA = new DepartmentOrderDetailTableAdapters.DepartmentOrderEmergencyExitTableAdapter();
                IEnumerator iEEmergency = emergencyTA.GetAllEmergencyExits(order.dept_id, order.co_id, order.sequence).GetEnumerator();
                while (iEEmergency.MoveNext())
                {
                    DepartmentOrderDetail.DepartmentOrderEmergencyExitRow emergencyDR = (DepartmentOrderDetail.DepartmentOrderEmergencyExitRow)iEEmergency.Current;
                    emergencyTA.Insert(order.dept_id, order.co_id, newOrder.sequence, emergencyDR.emer_exit_title, null, loggedInUserId);
                }

                //copy Requirements
                DepartmentOrderDetailTableAdapters.DepartmentOrderRequirementTableAdapter requirementTA = new DepartmentOrderDetailTableAdapters.DepartmentOrderRequirementTableAdapter();
                IEnumerator iERequirements = requirementTA.GetAllRequirements(order.dept_id,order.co_id,order.sequence).GetEnumerator();
                while(iERequirements.MoveNext())
                {
                    DepartmentOrderDetail.DepartmentOrderRequirementRow requirementDR = (DepartmentOrderDetail.DepartmentOrderRequirementRow)iERequirements.Current;
                    requirementTA.Insert(order.dept_id,order.co_id,newOrder.sequence,requirementDR.requirement_header,null,loggedInUserId);
                }
                
                //copy Aspects
                DepartmentOrderDetailTableAdapters.DepartmentOrderKeyAspectsTableAdapter aspectsTA = new DepartmentOrderDetailTableAdapters.DepartmentOrderKeyAspectsTableAdapter();
                IEnumerator iEAspects = aspectsTA.GetAllKeyAspects(order.dept_id,order.co_id,order.sequence).GetEnumerator();
                while(iEAspects.MoveNext())
                {
                    DepartmentOrderDetail.DepartmentOrderKeyAspectsRow aspectsDR = (DepartmentOrderDetail.DepartmentOrderKeyAspectsRow)iEAspects.Current;
                    aspectsTA.Insert(order.dept_id,order.co_id,newOrder.sequence,aspectsDR.key_aspect_header,null,loggedInUserId);
                }

                //copy Docs

                DepartmentOrderDocTableAdapters.DepartmentOrderDocTableAdapter docTA = new DepartmentOrderDocTableAdapters.DepartmentOrderDocTableAdapter();
                IEnumerator iEDocs = docTA.GetAllDocs(order.co_id,order.dept_id,order.sequence).GetEnumerator();
                while(iEDocs.MoveNext())
                {
                    DepartmentOrderDoc.DepartmentOrderDocEntityRow docDR = (DepartmentOrderDoc.DepartmentOrderDocEntityRow)iEDocs.Current;
                    docTA.Insert(newOrder.sequence,docDR.doc_id,order.dept_id,order.co_id,false);
                }
            }
        }
    
        GridView1.DataBind();
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        GridView1.DataBind();
    }
    protected void DeleteDepartmentOrder(int deptOrderId)
    {

        DataTable department = getDepartmentOrder(deptOrderId);
        if (department == null)
        {
            SetErrorMessage(WebConstants.Messages.Error.INVALID_ID);
        }
        else
        {
            try
            {
                DepartmentOrderTableAdapters.DepartmentOrderRowTableAdapter tableAdapter = new DepartmentOrderTableAdapters.DepartmentOrderRowTableAdapter();
                tableAdapter.Delete(deptOrderId);
                SetInfoMessage(WebConstants.Messages.Information.RECORD_DELETED);
                GridView1.DataBind();
            }
            catch
            {
                SetErrorMessage(WebConstants.Messages.Error.CONNECTION_ERROR);
            }
        }
    }
    private DataTable getDepartmentOrder(int DepartmentOrderId)
    {
        DepartmentOrderTableAdapters.DepartmentOrderRowTableAdapter tableAdaptor = new DepartmentOrderTableAdapters.DepartmentOrderRowTableAdapter();
        DataTable dt = tableAdaptor.GetDepartmentOrderById(DepartmentOrderId);
        return dt;
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        e.Cancel = true;
        DeleteDepartmentOrder((int)e.Keys["sequence"]);
    }
    protected void ddlDepartments_DataBound(object sender, EventArgs e)
    {
        if (ddlDepartments.Items.Count <= 1)
        {
            ddlDepartments.Visible = false;
            lblDepartment.Visible = false;
        }
        else
        {
            ddlDepartments.Visible = true;
            lblDepartment.Visible = true;
        }
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {        
        DepartmentOrderTableAdapters.DepartmentOrderRowTableAdapter ta = new DepartmentOrderTableAdapters.DepartmentOrderRowTableAdapter();
        if (e.CommandName.Equals("CancelOrder"))
        {
            int orderId = int.Parse(e.CommandArgument.ToString());
            ta.UpdateCancel(loggedInUserId,orderId,true,DateTime.Now);
            SetInfoMessage(WebConstants.Messages.Information.ORDER_CANCELLED);
            GridView1.DataBind();
        }
        else if (e.CommandName.Equals("UncancelOrder"))
        {
            int orderId = int.Parse(e.CommandArgument.ToString());
            ta.UpdateCancel(loggedInUserId,orderId,false,null);
            SetInfoMessage(WebConstants.Messages.Information.ORDER_UNCANCELLED);
            GridView1.DataBind();
        }
        else if (e.CommandName.Equals("EditOrder"))
        {
            int orderId = int.Parse(e.CommandArgument.ToString());
            Response.Redirect("~/Orders/AddOrder.aspx?" + WebConstants.Request.DEPT_ORDER_ID + "=" + orderId);
        }        
    }
    private string getFullAddress()
    {
        StringBuilder addressFull = new StringBuilder();
        addressFull.Append(tbAddressNo.Text).Append(" ");
        addressFull.Append(tbAddress1.Text).Append(" ");
        addressFull.Append(tbAddress2.Text).Append(" ");
        addressFull.Append(tbAddress3.Text).Append(" ");
        addressFull.Append(tbAddress4.Text).Append(" ");
        addressFull.Append(tbAddress5.Text).Append(" ");
        addressFull.Append(tbPostalCode.Text);
        return addressFull.ToString();
    }

}
