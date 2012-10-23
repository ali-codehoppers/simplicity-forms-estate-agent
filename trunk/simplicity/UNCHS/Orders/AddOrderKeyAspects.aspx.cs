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

public partial class Orders_AddOrderKeyAspects : RoomDetailPage
{
    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);
        this.suggestionsSelectControl.SuggestionAdded += new Common_UserControls_SuggestionsSelectControl.SuggestionAddedEventHandler(suggestionsSelectControl_SuggestionAdded);
        this.suggestionsSelectControl.AdditionComplete += new EventHandler(suggestionsSelectControl_AditionComplete);
    }
    private void suggestionsSelectControl_SuggestionAdded(object sender, SuggestionAddedEventArgs e)
    {
        DepartmentOrderDetailTableAdapters.DepartmentOrderKeyAspectsTableAdapter ta = new DepartmentOrderDetailTableAdapters.DepartmentOrderKeyAspectsTableAdapter();
        ta.Insert(propertyId, loggedInUserCoId, int.Parse(Request[WebConstants.Request.DEPT_ORDER_ID]), e.SuggestionText,"",loggedInUserId);
    }
    private void suggestionsSelectControl_AditionComplete(object sender, EventArgs e)
    {
        BindPopup();
        gvKeyAspect.DataBind();
    }
    private void BindPopup()
    {
        DepartmentOrderDetailTableAdapters.DepartmentOrderKeyAspectsTableAdapter ta = new DepartmentOrderDetailTableAdapters.DepartmentOrderKeyAspectsTableAdapter();
        suggestionsSelectControl.DataSource = ta.GetAllKeyAspects(int.Parse(hfDeptId.Value), loggedInUserCoId, int.Parse(Request[WebConstants.Request.DEPT_ORDER_ID]));
        suggestionsSelectControl.DataBind();
    }

    public override void Order_Detail_Handling(object sender, EventArgs e, int deptId)
    {
        hfDeptId.Value = deptId.ToString();
        suggestionsSelectControl.DataTextField = "key_aspect_header";
        suggestionsSelectControl.DepartmentId = deptId;
        if (IsPostBack == false)
        {
            BindPopup();
        }
    }

    #region KEY_ASPECTS
    private bool isValidKeyAspect(string nameDesc)
    {
        bool isValid = true;
        DepartmentOrderDetailTableAdapters.DepartmentOrderKeyAspectsTableAdapter tableAdapter = new DepartmentOrderDetailTableAdapters.DepartmentOrderKeyAspectsTableAdapter();
        if (tableAdapter.GetKeyAspectsByName(int.Parse(hfDeptId.Value), loggedInUserCoId, int.Parse(Request[WebConstants.Request.DEPT_ORDER_ID]), nameDesc).GetEnumerator().MoveNext())
        {
            isValid = false;
            SetErrorMessage(WebConstants.Messages.Error.ALREAD_EXISTS);
        }
        return isValid;
    }
    protected void btnAddKeyAspect_Click(object sender, EventArgs e)
    {
        if (isValidKeyAspect(tbKeyAspectHeader.Text))
        {
            DepartmentOrderDetailTableAdapters.DepartmentOrderKeyAspectsTableAdapter tableAdapter = new DepartmentOrderDetailTableAdapters.DepartmentOrderKeyAspectsTableAdapter();
            tableAdapter.Insert(int.Parse(hfDeptId.Value), loggedInUserCoId, int.Parse(Request[WebConstants.Request.DEPT_ORDER_ID]), tbKeyAspectHeader.Text, "", loggedInUserId);
            gvKeyAspect.DataBind();
            tbKeyAspectHeader.Text = "";
            //tbKeyAspectDesc.Text = "";
            btnAddKeyAspect.Focus();
        }
    }
    protected void gvKeyAspect_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        e.Cancel = true;
        int sequence = (int)e.Keys["sequence"];
        DepartmentOrderDetailTableAdapters.DepartmentOrderKeyAspectsTableAdapter tableAdapter = new DepartmentOrderDetailTableAdapters.DepartmentOrderKeyAspectsTableAdapter();
        tableAdapter.Delete(loggedInUserId, sequence);
        gvKeyAspect.DataBind();
        btnAddKeyAspect.Focus();
    }
    protected void gvKeyAspect_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        e.Cancel = true;
        string header = (string)e.NewValues["key_aspect_header"];
        string description = (string)e.NewValues["key_aspect_desc"];
        int sequence = (int)e.Keys["sequence"];
        if (isValidKeyAspect(header))
        {
            DepartmentOrderDetailTableAdapters.DepartmentOrderKeyAspectsTableAdapter tableAdapter = new DepartmentOrderDetailTableAdapters.DepartmentOrderKeyAspectsTableAdapter();
            tableAdapter.Update(header, description, loggedInUserId, sequence, sequence);
            gvKeyAspect.EditIndex = -1;
            gvKeyAspect.DataBind();
            btnAddKeyAspect.Focus();
        }
    }
    #endregion
    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Orders/AddOrderRequirements.aspx?" + WebConstants.Request.DEPT_ORDER_ID + "=" + Request[WebConstants.Request.DEPT_ORDER_ID]);
    }
    protected void btnNext_Click(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(this.tbKeyAspectHeader.Text))
        {
            Company.un_co_detailsRow dr = null;//GetCompany();
            if (dr != null && dr.Isflg_autosaveNull() == false && dr.flg_autosave)
            {
                if (isValidKeyAspect(tbKeyAspectHeader.Text))
                {
                    DepartmentOrderDetailTableAdapters.DepartmentOrderKeyAspectsTableAdapter tableAdapter = new DepartmentOrderDetailTableAdapters.DepartmentOrderKeyAspectsTableAdapter();
                    tableAdapter.Insert(int.Parse(hfDeptId.Value), loggedInUserCoId, int.Parse(Request[WebConstants.Request.DEPT_ORDER_ID]), tbKeyAspectHeader.Text, "", loggedInUserId);
                    Response.Redirect("~/Orders/AddOrderRiskAssessments.aspx?" + WebConstants.Request.DEPT_ORDER_ID + "=" + Request[WebConstants.Request.DEPT_ORDER_ID]);
                }
            }
            else
                SetErrorMessage(WebConstants.Messages.Error.NEXT_WARNING_COMPANYAUTOSAVE);

        }
        else if (this.gvKeyAspect.Rows.Count > 0)
        {
            Response.Redirect("~/Orders/AddOrderRiskAssessments.aspx?" + WebConstants.Request.DEPT_ORDER_ID + "=" + Request[WebConstants.Request.DEPT_ORDER_ID]);
        }
        else
            SetErrorMessage(WebConstants.Messages.Error.NEXT_WARNING_ENTERRECORD);
    }
}
