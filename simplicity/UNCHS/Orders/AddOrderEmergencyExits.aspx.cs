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

public partial class Orders_AddOrderEmergencyExits : RoomDetailPage
{
    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);
        this.suggestionsSelectControl.SuggestionAdded += new Common_UserControls_SuggestionsSelectControl.SuggestionAddedEventHandler(suggestionsSelectControl_SuggestionAdded);
        this.suggestionsSelectControl.AdditionComplete += new EventHandler(suggestionsSelectControl_AditionComplete);
    }
    private void suggestionsSelectControl_SuggestionAdded(object sender, SuggestionAddedEventArgs e)
    {
        DepartmentOrderDetailTableAdapters.DepartmentOrderEmergencyExitTableAdapter ta = new DepartmentOrderDetailTableAdapters.DepartmentOrderEmergencyExitTableAdapter();
        ta.Insert(propertyId, loggedInUserCoId, int.Parse(Request[WebConstants.Request.DEPT_ORDER_ID]), e.SuggestionText,"",loggedInUserId);
    }
    private void suggestionsSelectControl_AditionComplete(object sender, EventArgs e)
    {
        BindPopup();
        gvExit.DataBind();
    }
    private void BindPopup()
    {
        DepartmentOrderDetailTableAdapters.DepartmentOrderEmergencyExitTableAdapter ta = new DepartmentOrderDetailTableAdapters.DepartmentOrderEmergencyExitTableAdapter();
        suggestionsSelectControl.DataSource = ta.GetAllEmergencyExits(propertyId, loggedInUserCoId, int.Parse(Request[WebConstants.Request.DEPT_ORDER_ID]));
        suggestionsSelectControl.DataBind();
    }
    public override void Order_Detail_Handling(object sender, EventArgs e, int deptId)
    {
        suggestionsSelectControl.DataTextField = "emer_exit_title";
        suggestionsSelectControl.DepartmentId = deptId;
        if (IsPostBack == false)
        {
            BindPopup();
        }
    }
    private bool isValidExit(string nameDesc)
    {
        bool isValid = true;
        DepartmentOrderDetailTableAdapters.DepartmentOrderEmergencyExitTableAdapter tableAdapter = new DepartmentOrderDetailTableAdapters.DepartmentOrderEmergencyExitTableAdapter();
        if (tableAdapter.GetEmergencyExitsByName((int)Session[WebConstants.Session.DEPT_ID], loggedInUserCoId, int.Parse(Request[WebConstants.Request.DEPT_ORDER_ID]), nameDesc).GetEnumerator().MoveNext())
        {
            isValid = false;
            SetErrorMessage(WebConstants.Messages.Error.ALREAD_EXISTS);
        }
        return isValid;
    }
    protected void btnAddExit_Click(object sender, EventArgs e)
    {
        if (isValidExit(tbExitHeader.Text))
        {
            int deptId = (int)Session[WebConstants.Session.DEPT_ID];
            int deptOrderId = int.Parse(Request[WebConstants.Request.DEPT_ORDER_ID]);
            DepartmentOrderDetailTableAdapters.DepartmentOrderEmergencyExitTableAdapter tableAdapter = new DepartmentOrderDetailTableAdapters.DepartmentOrderEmergencyExitTableAdapter();
            tableAdapter.Insert(deptId,loggedInUserCoId,deptOrderId, tbExitHeader.Text, "", loggedInUserId);
            if (tableAdapter.GetAllEmergencyExits(deptId, loggedInUserCoId, deptOrderId).Rows.Count > 1)
            {
                DepartmentOrderTableAdapters.DepartmentOrderRowTableAdapter orderTA = new DepartmentOrderTableAdapters.DepartmentOrderRowTableAdapter();
                orderTA.UpdateMultiEmergencyExits(true, loggedInUserId, deptOrderId);
            }
            gvExit.DataBind();
            tbExitHeader.Text = "";
            
            
        }
    }
    protected void gvExit_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int deptId = (int)Session[WebConstants.Session.DEPT_ID];
        int deptOrderId = int.Parse(Request[WebConstants.Request.DEPT_ORDER_ID]);

        e.Cancel = true;
        int sequence = (int)e.Keys["sequence"];
        DepartmentOrderDetailTableAdapters.DepartmentOrderEmergencyExitTableAdapter tableAdapter = new DepartmentOrderDetailTableAdapters.DepartmentOrderEmergencyExitTableAdapter();
        tableAdapter.Delete(loggedInUserId, sequence);
        if (tableAdapter.GetAllEmergencyExits(deptId, loggedInUserCoId, deptOrderId).Rows.Count <= 1)
        {
            DepartmentOrderTableAdapters.DepartmentOrderRowTableAdapter orderTA = new DepartmentOrderTableAdapters.DepartmentOrderRowTableAdapter();
            orderTA.UpdateMultiEmergencyExits(false, loggedInUserId, deptId);
        }        
        gvExit.DataBind();
        btnAddExit.Focus();
    }
    protected void gvExit_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        e.Cancel = true;
        string header = (string)e.NewValues["emer_exit_title"];
        string description = (string)e.NewValues["emer_exit_desc"];
        int sequence = (int)e.Keys["sequence"];
        if (isValidExit(header))
        {
            DepartmentOrderDetailTableAdapters.DepartmentOrderEmergencyExitTableAdapter tableAdapter = new DepartmentOrderDetailTableAdapters.DepartmentOrderEmergencyExitTableAdapter();
            tableAdapter.Update(header, description, loggedInUserId, sequence, sequence);
            gvExit.EditIndex = -1;
            gvExit.DataBind();
            btnAddExit.Focus();
        }
    }
    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Orders/AddOrderPPE.aspx?" + WebConstants.Request.DEPT_ORDER_ID + "=" + Request[WebConstants.Request.DEPT_ORDER_ID]);
    }
    protected void btnNext_Click(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(this.tbExitHeader.Text))
        {
            Company.un_co_detailsRow dr = null;// GetCompany();
            if (dr != null && dr.Isflg_autosaveNull() == false && dr.flg_autosave)
            {
                if (isValidExit(tbExitHeader.Text))
                {
                    DepartmentOrderDetailTableAdapters.DepartmentOrderEmergencyExitTableAdapter tableAdapter = new DepartmentOrderDetailTableAdapters.DepartmentOrderEmergencyExitTableAdapter();
                    tableAdapter.Insert((int)Session[WebConstants.Session.DEPT_ID], loggedInUserCoId, int.Parse(Request[WebConstants.Request.DEPT_ORDER_ID]), tbExitHeader.Text,"", loggedInUserId);
                    Response.Redirect("~/Orders/AddOrderRequirements.aspx?" + WebConstants.Request.DEPT_ORDER_ID + "=" + Request[WebConstants.Request.DEPT_ORDER_ID]);
                }
            }
            else
                SetErrorMessage(WebConstants.Messages.Error.NEXT_WARNING_COMPANYAUTOSAVE);

        }
        else if (this.gvExit.Rows.Count > 0)
        {
            Response.Redirect("~/Orders/AddOrderRequirements.aspx?" + WebConstants.Request.DEPT_ORDER_ID + "=" + Request[WebConstants.Request.DEPT_ORDER_ID]);
        }
        else
            SetErrorMessage(WebConstants.Messages.Error.NEXT_WARNING_ENTERRECORD);
    }

}
