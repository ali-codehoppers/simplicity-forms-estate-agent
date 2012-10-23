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

public partial class Orders_AddOrderRequirements : RoomDetailPage
{
    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);
        this.suggestionsSelectControl.SuggestionAdded += new Common_UserControls_SuggestionsSelectControl.SuggestionAddedEventHandler(suggestionsSelectControl_SuggestionAdded);
        this.suggestionsSelectControl.AdditionComplete += new EventHandler(suggestionsSelectControl_AditionComplete);
    }
    private void suggestionsSelectControl_SuggestionAdded(object sender, SuggestionAddedEventArgs e)
    {
        DepartmentOrderDetailTableAdapters.DepartmentOrderRequirementTableAdapter ta = new DepartmentOrderDetailTableAdapters.DepartmentOrderRequirementTableAdapter();
        ta.Insert(propertyId, loggedInUserCoId, int.Parse(Request[WebConstants.Request.DEPT_ORDER_ID]), e.SuggestionText,"", loggedInUserId);
    }
    private void suggestionsSelectControl_AditionComplete(object sender, EventArgs e)
    {
        BindPopup();
        gvRequirement.DataBind();
    }
    private void BindPopup()
    {
        DepartmentOrderDetailTableAdapters.DepartmentOrderRequirementTableAdapter ta = new DepartmentOrderDetailTableAdapters.DepartmentOrderRequirementTableAdapter();
        suggestionsSelectControl.DataSource = ta.GetAllRequirements(int.Parse(hfDeptId.Value), loggedInUserCoId, int.Parse(Request[WebConstants.Request.DEPT_ORDER_ID]));
        suggestionsSelectControl.DataBind();
    }
    public override void Order_Detail_Handling(object sender, EventArgs e, int deptId)
    {
        hfDeptId.Value = deptId.ToString();
        suggestionsSelectControl.DataTextField = "requirement_header";
        suggestionsSelectControl.DepartmentId = deptId;
        if (IsPostBack == false)
        {
            BindPopup();
        }
    }
    #region REQUIREMENTS
    private bool isValidRequirement(string nameDesc)
    {
        bool isValid = true;
        DepartmentOrderDetailTableAdapters.DepartmentOrderRequirementTableAdapter tableAdapter = new DepartmentOrderDetailTableAdapters.DepartmentOrderRequirementTableAdapter();
        if (tableAdapter.GetRequirementByName(int.Parse(hfDeptId.Value), loggedInUserCoId, int.Parse(Request[WebConstants.Request.DEPT_ORDER_ID]), nameDesc).GetEnumerator().MoveNext())
        {
            isValid = false;
            SetErrorMessage(WebConstants.Messages.Error.ALREAD_EXISTS);
        }
        return isValid;
    }
    protected void btnAddRequirement_Click(object sender, EventArgs e)
    {
        if (isValidRequirement(tbRequirementTitle.Text))
        {
            DepartmentOrderDetailTableAdapters.DepartmentOrderRequirementTableAdapter tableAdapter = new DepartmentOrderDetailTableAdapters.DepartmentOrderRequirementTableAdapter();
            tableAdapter.Insert(int.Parse(hfDeptId.Value), loggedInUserCoId, int.Parse(Request[WebConstants.Request.DEPT_ORDER_ID]), tbRequirementTitle.Text, "", loggedInUserId);
            gvRequirement.DataBind();
            //tbRequirementDesc.Text = "";
            tbRequirementTitle.Text = "";
            btnAddRequirement.Focus();
        }
    }
    protected void gvRequirement_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        e.Cancel = true;
        int sequence = (int)e.Keys["sequence"];
        DepartmentOrderDetailTableAdapters.DepartmentOrderRequirementTableAdapter tableAdapter = new DepartmentOrderDetailTableAdapters.DepartmentOrderRequirementTableAdapter();
        tableAdapter.Delete(loggedInUserId, sequence);
        gvRequirement.DataBind();
        btnAddRequirement.Focus();
    }
    protected void gvRequirement_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        e.Cancel = true;
        string header = (string)e.NewValues["requirement_header"];
        string description = (string)e.NewValues["requirement_desc"];
        int sequence = (int)e.Keys["sequence"];
        if (isValidRequirement(header))
        {
            DepartmentOrderDetailTableAdapters.DepartmentOrderRequirementTableAdapter tableAdapter = new DepartmentOrderDetailTableAdapters.DepartmentOrderRequirementTableAdapter();
            tableAdapter.Update(header, description, loggedInUserId, sequence, sequence);
            gvRequirement.EditIndex = -1;
            gvRequirement.DataBind();
            btnAddRequirement.Focus();
        }
    }
    #endregion
    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Orders/AddOrderEmergencyExits.aspx?" + WebConstants.Request.DEPT_ORDER_ID + "=" + Request[WebConstants.Request.DEPT_ORDER_ID]);



    }
    protected void btnNext_Click(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(this.tbRequirementTitle.Text))
        {
            Company.un_co_detailsRow dr = null;//GetCompany();
            if (dr != null && dr.Isflg_autosaveNull() == false && dr.flg_autosave)
            {
                if (isValidRequirement(tbRequirementTitle.Text))
                {
                    DepartmentOrderDetailTableAdapters.DepartmentOrderRequirementTableAdapter tableAdapter = new DepartmentOrderDetailTableAdapters.DepartmentOrderRequirementTableAdapter();
                    tableAdapter.Insert(int.Parse(hfDeptId.Value), loggedInUserCoId, int.Parse(Request[WebConstants.Request.DEPT_ORDER_ID]), tbRequirementTitle.Text, "", loggedInUserId);
                    Response.Redirect("~/Orders/AddOrderKeyAspects.aspx?" + WebConstants.Request.DEPT_ORDER_ID + "=" + Request[WebConstants.Request.DEPT_ORDER_ID]);
                }
            }
            else
                SetErrorMessage(WebConstants.Messages.Error.NEXT_WARNING_COMPANYAUTOSAVE);

        }
        else if (this.gvRequirement.Rows.Count > 0)
        {
            Response.Redirect("~/Orders/AddOrderKeyAspects.aspx?" + WebConstants.Request.DEPT_ORDER_ID + "=" + Request[WebConstants.Request.DEPT_ORDER_ID]);
        }
        else
            SetErrorMessage(WebConstants.Messages.Error.NEXT_WARNING_ENTERRECORD);
    }
}
