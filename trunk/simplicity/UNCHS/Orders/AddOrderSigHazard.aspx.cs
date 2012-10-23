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

public partial class Orders_AddOrderSigHazard : RoomDetailPage
{
    public override void Order_Detail_Handling(object sender, EventArgs e, int deptId)
    {
        hfDeptId.Value = deptId.ToString();
    }
    private bool isValidSigHazard(string nameDesc)
    {
        bool isValid = true;
        DepartmentOrderDetailTableAdapters.DepartmentOrderHazardSigTableAdapter tableAdapter = new DepartmentOrderDetailTableAdapters.DepartmentOrderHazardSigTableAdapter();
        if (tableAdapter.GetSigHazardByName(int.Parse(hfDeptId.Value), loggedInUserCoId, int.Parse(Request[WebConstants.Request.DEPT_ORDER_ID]), nameDesc).GetEnumerator().MoveNext())
        {
            isValid = false;
            SetErrorMessage(WebConstants.Messages.Error.ALREAD_EXISTS);
        }
        return isValid;
    }
    protected void btnAddSigHazard_Click(object sender, EventArgs e)
    {
        if (isValidSigHazard(tbSigHazard.Text))
        {
            DepartmentOrderDetailTableAdapters.DepartmentOrderHazardSigTableAdapter tableAdapter = new DepartmentOrderDetailTableAdapters.DepartmentOrderHazardSigTableAdapter();
            tableAdapter.Insert(int.Parse(hfDeptId.Value), loggedInUserCoId, int.Parse(Request[WebConstants.Request.DEPT_ORDER_ID]), tbSigHazard.Text, loggedInUserId);
            gvSigHazard.DataBind();
            tbSigHazard.Text = "";
            cbHazards.DataBind();
        }
    }
    protected void gvSigHazard_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        e.Cancel = true;
        int sequence = (int)e.Keys["sequence"];
        DepartmentOrderDetailTableAdapters.DepartmentOrderHazardSigTableAdapter tableAdapter = new DepartmentOrderDetailTableAdapters.DepartmentOrderHazardSigTableAdapter();
        tableAdapter.Delete(loggedInUserId, sequence);
        gvSigHazard.DataBind();
        cbHazards.DataBind();
    }
    protected void gvSigHazard_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        e.Cancel = true;
        string nameDesc = (string)e.NewValues["hazard_desc"];
        int sequence = (int)e.Keys["sequence"];
        if (isValidSigHazard(nameDesc))
        {
            DepartmentOrderDetailTableAdapters.DepartmentOrderHazardSigTableAdapter tableAdapter = new DepartmentOrderDetailTableAdapters.DepartmentOrderHazardSigTableAdapter();
            tableAdapter.Update(nameDesc, loggedInUserId, sequence, sequence);
            gvSigHazard.EditIndex = -1;
            gvSigHazard.DataBind();
            cbHazards.DataBind();
        }
    }

    protected void btnAddHazards_Click(object sender, EventArgs e)
    {
        DepartmentOrderDetailTableAdapters.DepartmentOrderHazardSigTableAdapter ta = new DepartmentOrderDetailTableAdapters.DepartmentOrderHazardSigTableAdapter();
        foreach (ListItem listItem in cbHazards.Items)
        {
            if (listItem.Selected)
            {
                ta.Insert(int.Parse(hfDeptId.Value), loggedInUserCoId, int.Parse(Request[WebConstants.Request.DEPT_ORDER_ID]), listItem.Text, loggedInUserId);
            }
        }
        gvSigHazard.DataBind();
        cbHazards.DataBind();
    }
    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Orders/AddOrderHazard.aspx?" + WebConstants.Request.DEPT_ORDER_ID + "=" + Request[WebConstants.Request.DEPT_ORDER_ID]);
    }
    protected void btnNext_Click(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(this.tbSigHazard.Text))
        {
            Company.un_co_detailsRow dr = null;//GetCompany();
            if (dr != null && dr.Isflg_autosaveNull() == false && dr.flg_autosave)
            {
                if (isValidSigHazard(tbSigHazard.Text))
                {
                    DepartmentOrderDetailTableAdapters.DepartmentOrderHazardSigTableAdapter tableAdapter = new DepartmentOrderDetailTableAdapters.DepartmentOrderHazardSigTableAdapter();
                    tableAdapter.Insert(int.Parse(hfDeptId.Value), loggedInUserCoId, int.Parse(Request[WebConstants.Request.DEPT_ORDER_ID]), tbSigHazard.Text, loggedInUserId);
                    Response.Redirect("~/Orders/AddOrderKeyAspects.aspx?" + WebConstants.Request.DEPT_ORDER_ID + "=" + Request[WebConstants.Request.DEPT_ORDER_ID]);
                }
            }
            else
                SetErrorMessage(WebConstants.Messages.Error.NEXT_WARNING_COMPANYAUTOSAVE);

        }
        else if (this.gvSigHazard.Rows.Count > 0)
        {
            Response.Redirect("~/Orders/AddOrderKeyAspects.aspx?" + WebConstants.Request.DEPT_ORDER_ID + "=" + Request[WebConstants.Request.DEPT_ORDER_ID]);
        }
        else
            SetErrorMessage(WebConstants.Messages.Error.NEXT_WARNING_ENTERRECORD);
    }
}
