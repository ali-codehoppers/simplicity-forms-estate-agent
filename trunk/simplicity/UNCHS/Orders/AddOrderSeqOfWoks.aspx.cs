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

public partial class Orders_AddOrderSeqOfWoks : RoomDetailPage
{

    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);
        this.suggestionsSelectControl.SuggestionAdded += new Common_UserControls_SuggestionsSelectControl.SuggestionAddedEventHandler(suggestionsSelectControl_SuggestionAdded);
        this.suggestionsSelectControl.AdditionComplete += new EventHandler(suggestionsSelectControl_AditionComplete);
    }
    private void suggestionsSelectControl_SuggestionAdded(object sender, SuggestionAddedEventArgs e) 
    {
        DepartmentOrderDetailTableAdapters.DepartmentOrderWorkTableAdapter ta = new DepartmentOrderDetailTableAdapters.DepartmentOrderWorkTableAdapter();
        ta.Insert(propertyId, loggedInUserCoId, int.Parse(Request[WebConstants.Request.DEPT_ORDER_ID]), e.SuggestionText, loggedInUserId);
    }
    private void suggestionsSelectControl_AditionComplete(object sender, EventArgs e)
    {
        BindPopup();
        gvWork.DataBind();
    }
    private void BindPopup()
    {
        DepartmentOrderDetailTableAdapters.DepartmentOrderWorkTableAdapter ta = new DepartmentOrderDetailTableAdapters.DepartmentOrderWorkTableAdapter();
        suggestionsSelectControl.DataSource = ta.GetAllWorks(int.Parse(hfDeptId.Value), loggedInUserCoId, int.Parse(Request[WebConstants.Request.DEPT_ORDER_ID]));
        suggestionsSelectControl.DataBind();
    }
    public override void Order_Detail_Handling(object sender, EventArgs e, int deptId)
    {
        hfDeptId.Value = deptId.ToString();
        suggestionsSelectControl.DataTextField = "work_desc";
        suggestionsSelectControl.DepartmentId = deptId;
        if (IsPostBack == false)
        {
            BindPopup();
        }
    }

    #region SEQ_OF_WORKS
    private bool isValidWork(string nameDesc)
    {
        bool isValid = true;
        DepartmentOrderDetailTableAdapters.DepartmentOrderWorkTableAdapter tableAdapter = new DepartmentOrderDetailTableAdapters.DepartmentOrderWorkTableAdapter();
        if (tableAdapter.GetWorkByName(int.Parse(hfDeptId.Value), loggedInUserCoId, int.Parse(Request[WebConstants.Request.DEPT_ORDER_ID]), nameDesc).GetEnumerator().MoveNext())
        {
            isValid = false;
            SetErrorMessage(WebConstants.Messages.Error.ALREAD_EXISTS);
        }
        return isValid;
    }
    protected void btnAddWork_Click(object sender, EventArgs e)
    {
        if (isValidWork(tbWork.Text))
        {
            DepartmentOrderDetailTableAdapters.DepartmentOrderWorkTableAdapter tableAdapter = new DepartmentOrderDetailTableAdapters.DepartmentOrderWorkTableAdapter();
            tableAdapter.Insert(int.Parse(hfDeptId.Value), loggedInUserCoId, int.Parse(Request[WebConstants.Request.DEPT_ORDER_ID]), tbWork.Text, loggedInUserId);
            gvWork.DataBind();
            tbWork.Text = "";
            btnAddWork.Focus();
        }
    }
    protected void gvWork_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        e.Cancel = true;
        int sequence = (int)e.Keys["sequence"];
        DepartmentOrderDetailTableAdapters.DepartmentOrderWorkTableAdapter tableAdapter = new DepartmentOrderDetailTableAdapters.DepartmentOrderWorkTableAdapter();
        tableAdapter.Delete(loggedInUserId, sequence);
        gvWork.DataBind();
        btnAddWork.Focus();
    }
    protected void gvWork_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        e.Cancel = true;
        string header = (string)e.NewValues["work_desc"];
        int sequence = (int)e.Keys["sequence"];
        if (isValidWork(header))
        {
            DepartmentOrderDetailTableAdapters.DepartmentOrderWorkTableAdapter tableAdapter = new DepartmentOrderDetailTableAdapters.DepartmentOrderWorkTableAdapter();
            tableAdapter.Update(header, loggedInUserId, sequence, sequence);
            gvWork.EditIndex = -1;
            gvWork.DataBind();
            btnAddWork.Focus();
        }
    }
    #endregion
    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Orders/AddOrderHazard.aspx?" + WebConstants.Request.DEPT_ORDER_ID + "=" + Request[WebConstants.Request.DEPT_ORDER_ID]);
    }
    protected void btnNext_Click(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(this.tbWork.Text))
        {
            Company.un_co_detailsRow dr = null;//GetCompany();
            if (dr != null && dr.Isflg_autosaveNull() == false && dr.flg_autosave)
            {
                if (isValidWork(tbWork.Text))
                {
                    DepartmentOrderDetailTableAdapters.DepartmentOrderWorkTableAdapter tableAdapter = new DepartmentOrderDetailTableAdapters.DepartmentOrderWorkTableAdapter();
                    tableAdapter.Insert(int.Parse(hfDeptId.Value), loggedInUserCoId, int.Parse(Request[WebConstants.Request.DEPT_ORDER_ID]), tbWork.Text, loggedInUserId);
                    Response.Redirect("~/Orders/AddOrderTool.aspx?" + WebConstants.Request.DEPT_ORDER_ID + "=" + Request[WebConstants.Request.DEPT_ORDER_ID]);
                }
            }
            else
                SetErrorMessage(WebConstants.Messages.Error.NEXT_WARNING_COMPANYAUTOSAVE);

        }
        else if (this.gvWork.Rows.Count > 0)
        {
            Response.Redirect("~/Orders/AddOrderTool.aspx?" + WebConstants.Request.DEPT_ORDER_ID + "=" + Request[WebConstants.Request.DEPT_ORDER_ID]);
        }
        else
            SetErrorMessage(WebConstants.Messages.Error.NEXT_WARNING_ENTERRECORD);
    }
}
