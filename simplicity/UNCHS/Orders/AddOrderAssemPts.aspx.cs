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

public partial class Orders_AddOrderAssemPts : RoomDetailPage
{
    public override void Order_Detail_Handling(object sender, EventArgs e, int deptId)
    {
        hfDeptId.Value = deptId.ToString();

        //if (!string.IsNullOrEmpty(this.tbAssembleHeader.Text) && this.gvAssemble.Rows.Count > 0)
        //    hfNext.Value = "1";
        //else hfNext.Value = "0";
    }
    #region ASSEMBLE
    private bool isValidAssemble(string nameDesc)
    {
        bool isValid = true;
        DepartmentOrderDetailTableAdapters.DepartmentOrderAssemblePtTableAdapter tableAdapter = new DepartmentOrderDetailTableAdapters.DepartmentOrderAssemblePtTableAdapter();
        if (tableAdapter.GetAssemblePtByName(int.Parse(hfDeptId.Value), loggedInUserCoId, int.Parse(Request[WebConstants.Request.DEPT_ORDER_ID]), nameDesc).GetEnumerator().MoveNext())
        {
            isValid = false;
            SetErrorMessage(WebConstants.Messages.Error.ALREAD_EXISTS);
        }
        return isValid;
    }
    protected void btnAddAssemble_Click(object sender, EventArgs e)
    {
        if (isValidAssemble(tbAssembleHeader.Text))
        {
            int deptId = int.Parse(hfDeptId.Value);
            int deptOrderId = int.Parse(Request[WebConstants.Request.DEPT_ORDER_ID]);
            DepartmentOrderDetailTableAdapters.DepartmentOrderAssemblePtTableAdapter tableAdapter = new DepartmentOrderDetailTableAdapters.DepartmentOrderAssemblePtTableAdapter();
            tableAdapter.Insert(deptId, loggedInUserCoId, deptOrderId, tbAssembleHeader.Text, tbAssembleDesc.Text, loggedInUserId);
            if (tableAdapter.GetAllAssemblePts(deptId, loggedInUserCoId, deptOrderId).Rows.Count > 1)
            {
                DepartmentOrderTableAdapters.DepartmentOrderRowTableAdapter orderTA = new DepartmentOrderTableAdapters.DepartmentOrderRowTableAdapter();
                orderTA.UpdateMultiAssemblePoints(true, loggedInUserId, deptOrderId);
            }
            gvAssemble.DataBind();
            tbAssembleHeader.Text = "";
            tbAssembleDesc.Text = "";
            btnAddAssemble.Focus();
        }
    }
    protected void gvAssemble_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int deptId = int.Parse(hfDeptId.Value);
        int deptOrderId = int.Parse(Request[WebConstants.Request.DEPT_ORDER_ID]);

        e.Cancel = true;
        int sequence = (int)e.Keys["sequence"];
        DepartmentOrderDetailTableAdapters.DepartmentOrderAssemblePtTableAdapter tableAdapter = new DepartmentOrderDetailTableAdapters.DepartmentOrderAssemblePtTableAdapter();
        tableAdapter.Delete(loggedInUserId, sequence);
        if (tableAdapter.GetAllAssemblePts(deptId, loggedInUserCoId, deptOrderId).Rows.Count <= 1)
        {
            DepartmentOrderTableAdapters.DepartmentOrderRowTableAdapter orderTA = new DepartmentOrderTableAdapters.DepartmentOrderRowTableAdapter();
            orderTA.UpdateMultiAssemblePoints(false, loggedInUserId, deptOrderId);
        }
        gvAssemble.DataBind();
        btnAddAssemble.Focus();
    }
    protected void gvAssemble_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        e.Cancel = true;
        string header = (string)e.NewValues["assem_point_title"];
        string description = (string)e.NewValues["assem_point_desc"];
        int sequence = (int)e.Keys["sequence"];
        if (isValidAssemble(header))
        {
            DepartmentOrderDetailTableAdapters.DepartmentOrderAssemblePtTableAdapter tableAdapter = new DepartmentOrderDetailTableAdapters.DepartmentOrderAssemblePtTableAdapter();
            tableAdapter.Update(header, description, loggedInUserId, sequence, sequence);
            gvAssemble.EditIndex = -1;
            gvAssemble.DataBind();
            btnAddAssemble.Focus();
        }
    }
    #endregion
    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Orders/AddOrderSeqOfWoks.aspx?" + WebConstants.Request.DEPT_ORDER_ID + "=" + Request[WebConstants.Request.DEPT_ORDER_ID]);

    }
    protected void btnNext_Click(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(this.tbAssembleHeader.Text))
        {
            Company.un_co_detailsRow dr = null;//GetCompany();
            if (dr != null && dr.Isflg_autosaveNull() == false && dr.flg_autosave)
            {
                if (isValidAssemble(tbAssembleHeader.Text))
                {
                    int deptId = int.Parse(hfDeptId.Value);
                    int deptOrderId = int.Parse(Request[WebConstants.Request.DEPT_ORDER_ID]);
                    DepartmentOrderDetailTableAdapters.DepartmentOrderAssemblePtTableAdapter tableAdapter = new DepartmentOrderDetailTableAdapters.DepartmentOrderAssemblePtTableAdapter();
                    tableAdapter.Insert(deptId, loggedInUserCoId, deptOrderId, tbAssembleHeader.Text, tbAssembleDesc.Text, loggedInUserId);
                    if (tableAdapter.GetAllAssemblePts(deptId, loggedInUserCoId, deptOrderId).Rows.Count > 1)
                    {
                        DepartmentOrderTableAdapters.DepartmentOrderRowTableAdapter orderTA = new DepartmentOrderTableAdapters.DepartmentOrderRowTableAdapter();
                        orderTA.UpdateMultiAssemblePoints(true, loggedInUserId, deptOrderId);
                    }
                    Response.Redirect("~/Orders/AddOrderRequirements.aspx?" + WebConstants.Request.DEPT_ORDER_ID + "=" + Request[WebConstants.Request.DEPT_ORDER_ID]);
                }
            }
            else
                SetErrorMessage(WebConstants.Messages.Error.NEXT_WARNING_COMPANYAUTOSAVE);
        }
        else if (this.gvAssemble.Rows.Count > 0)
        {
            Response.Redirect("~/Orders/AddOrderRequirements.aspx?" + WebConstants.Request.DEPT_ORDER_ID + "=" + Request[WebConstants.Request.DEPT_ORDER_ID]);
        }
        else
            SetErrorMessage(WebConstants.Messages.Error.NEXT_WARNING_ENTERRECORD);
    }
}
