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

public partial class Orders_AddOrderCtrlMeasures : RoomDetailPage
{
    public override void Order_Detail_Handling(object sender, EventArgs e, int deptId)
    {
        hfDeptId.Value = deptId.ToString();
    }
    #region CONTROL_MEASURE
    private bool isValidControl(string nameDesc)
    {
        bool isValid = true;
        DepartmentOrderDetailTableAdapters.DepartmentOrderControlMeasureTableAdapter tableAdapter = new DepartmentOrderDetailTableAdapters.DepartmentOrderControlMeasureTableAdapter();
        if (tableAdapter.GetControlMeasureByName(int.Parse(hfDeptId.Value), loggedInUserCoId, int.Parse(Request[WebConstants.Request.DEPT_ORDER_ID]), nameDesc).GetEnumerator().MoveNext())
        {
            isValid = false;
            SetErrorMessage(WebConstants.Messages.Error.ALREAD_EXISTS);
        }
        return isValid;
    }
    protected void btnAddControl_Click(object sender, EventArgs e)
    {
        if (isValidControl(tbControl.Text))
        {
            DepartmentOrderDetailTableAdapters.DepartmentOrderControlMeasureTableAdapter tableAdapter = new DepartmentOrderDetailTableAdapters.DepartmentOrderControlMeasureTableAdapter();
            tableAdapter.Insert(int.Parse(hfDeptId.Value), loggedInUserCoId, int.Parse(Request[WebConstants.Request.DEPT_ORDER_ID]), tbControl.Text, loggedInUserId);
            gvControl.DataBind();
        }
    }
    protected void gvControl_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        e.Cancel = true;
        int sequence = (int)e.Keys["sequence"];
        DepartmentOrderDetailTableAdapters.DepartmentOrderControlMeasureTableAdapter tableAdapter = new DepartmentOrderDetailTableAdapters.DepartmentOrderControlMeasureTableAdapter();
        tableAdapter.Delete(loggedInUserId, sequence);
        gvControl.DataBind();
        btnAddControl.Focus();
    }
    protected void gvControl_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        e.Cancel = true;
        string header = (string)e.NewValues["control_measure_desc"];
        int sequence = (int)e.Keys["sequence"];
        if (isValidControl(header))
        {
            DepartmentOrderDetailTableAdapters.DepartmentOrderControlMeasureTableAdapter tableAdapter = new DepartmentOrderDetailTableAdapters.DepartmentOrderControlMeasureTableAdapter();
            tableAdapter.Update(header, loggedInUserId, sequence, sequence);
            gvControl.EditIndex = -1;
            gvControl.DataBind();
            btnAddControl.Focus();
        }
    }
    #endregion

    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Orders/AddOrderRequirements.aspx?" + WebConstants.Request.DEPT_ORDER_ID + "=" + Request[WebConstants.Request.DEPT_ORDER_ID]);

    }
    protected void btnNext_Click(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(this.tbControl.Text))
        {
            Company.un_co_detailsRow dr = null;//GetCompany();
            if (dr != null && dr.Isflg_autosaveNull() == false && dr.flg_autosave)
            {
                if (isValidControl(tbControl.Text))
                {
                    DepartmentOrderDetailTableAdapters.DepartmentOrderControlMeasureTableAdapter tableAdapter = new DepartmentOrderDetailTableAdapters.DepartmentOrderControlMeasureTableAdapter();
                    tableAdapter.Insert(int.Parse(hfDeptId.Value), loggedInUserCoId, int.Parse(Request[WebConstants.Request.DEPT_ORDER_ID]), tbControl.Text, loggedInUserId);
                    Response.Redirect("~/Orders/AddOrderDocuments.aspx?" + WebConstants.Request.DEPT_ORDER_ID + "=" + Request[WebConstants.Request.DEPT_ORDER_ID]);
                }
            }
            else
                SetErrorMessage(WebConstants.Messages.Error.NEXT_WARNING_COMPANYAUTOSAVE);


        }
        else if (this.gvControl.Rows.Count > 0)
        {
            Response.Redirect("~/Orders/AddOrderDocuments.aspx?" + WebConstants.Request.DEPT_ORDER_ID + "=" + Request[WebConstants.Request.DEPT_ORDER_ID]);
        }
        else
            SetErrorMessage(WebConstants.Messages.Error.NEXT_WARNING_ENTERRECORD);
    }
}
