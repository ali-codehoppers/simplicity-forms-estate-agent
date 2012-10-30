using System;
using System.Data;
using System.Linq;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using EstateAgentEntityModel;

public partial class Orders_AddOrderPeople : RoomDetailPage
{

    protected override void OnLoad(EventArgs e)
    {
        base.OnLoad(e);
        try
        {
            //propertyId = int.Parse(Request[WebConstants.Request.PROPERTY_ID]);
            if (!IsPostBack)
            {
                //Property property = entity.Properties1.SingleOrDefault(c => c.Sequence == propertyId);
                //PropertyHeadingTextBox.Text = property.PropHeading;
                RoomsList.DataSource = property.PropertyRooms;
                RoomsList.DataBind();
            }
        }
        catch (Exception exc)
        {
            Response.Redirect("~/Orders/AddOrder.aspx?" + WebConstants.Request.PROPERTY_ORDER_ID + "=" + Request[WebConstants.Request.PROPERTY_ORDER_ID]);
        }
        
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            //propertyId = int.Parse(Request[WebConstants.Request.PROPERTY_ID]);
            if (!IsPostBack)
            {
                //Property property = entity.Properties1.SingleOrDefault(c => c.Sequence == propertyId);
                //PropertyHeadingTextBox.Text = property.PropHeading;
                RoomsList.DataSource = property.PropertyRooms;
                RoomsList.DataBind();
            }
        }
        catch (Exception exc)
        {
            Response.Redirect("~/Orders/AddOrder.aspx?" + WebConstants.Request.PROPERTY_ORDER_ID + "=" + Request[WebConstants.Request.PROPERTY_ORDER_ID]);
        }
    }

    public override void Order_Detail_Handling(object sender, EventArgs e, int deptId)
    {
        
    }

    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Orders/AddOrder.aspx?" + WebConstants.Request.PROPERTY_ORDER_ID + "=" + Request[WebConstants.Request.PROPERTY_ORDER_ID]);
    }
    protected void btnNext_Click(object sender, EventArgs e)
    {
        if (Save())
        {
            Response.Redirect("~/Orders/AddOrderHazard.aspx?" + WebConstants.Request.DEPT_ORDER_ID + "=" + Request[WebConstants.Request.DEPT_ORDER_ID]);
        }
    }
    protected void btnSaveAll_Click(object sender, EventArgs e)
    {
        Save();
    }
    private bool Save()
    {
        //int supervisorcount = 0;
        //Company.un_co_detailsRow company = null;//GetCompany();
        //if (!(company != null && company.Isflg_multi_supervisorsNull() == false && company.flg_multi_supervisors == true))
        //{
        //foreach (GridViewRow row in gvPeople.Rows)
        //{
        //    CheckBox flg_supervisor_chkbox1 = (CheckBox)(row.FindControl("chkboxSupervisor"));
        //    if (flg_supervisor_chkbox1.Checked == true)
        //    {
        //        supervisorcount++;
        //    }
        //    if (supervisorcount > 1)
        //    {
        //        SetErrorMessage(WebConstants.Messages.Error.SUPERVISOR_SELECTION_ERROR);
        //        return false;
        //    }
        //}
        //}
        //DepartmentOrderPersonTableAdapters.DepartmentOrderPersonEntityTableAdapter tableAdaptor = new DepartmentOrderPersonTableAdapters.DepartmentOrderPersonEntityTableAdapter();
        //tableAdaptor.DeleteExistingOrderPersonCommand(int.Parse(Request.QueryString["deptOrderId"].ToString()));

        //foreach (GridViewRow row in gvPeople.Rows)
        //{
        //    string name_desc = "";
        //    bool flg_supervisor = false;
        //    bool flg_fire_warden = false;
        //    bool flg_first_aider = false;

        //    name_desc = row.Cells[0].Text;
        //    CheckBox flg_supervisor_chkbox = (CheckBox)(row.FindControl("chkboxSupervisor"));
        //    flg_supervisor = flg_supervisor_chkbox.Checked;
        //    CheckBox flg_fire_warden_chkbox = (CheckBox)(row.FindControl("chkboxFireWarden"));
        //    flg_fire_warden = flg_fire_warden_chkbox.Checked;
        //    CheckBox flg_first_aider_chkbox = (CheckBox)(row.FindControl("chkboxFirstAider"));
        //    flg_first_aider = flg_first_aider_chkbox.Checked;

        //    tableAdaptor.Insert(int.Parse(hfDeptId.Value), loggedInUserCoId, int.Parse(Request.QueryString["deptOrderId"].ToString()), name_desc, loggedInUserId, flg_supervisor, flg_first_aider, flg_fire_warden, false);
        //    SetInfoMessage(WebConstants.Messages.Information.RECORD_SAVED);
        //}
        return true;
    }
    public bool GetChecked(string returned)
    {
        if (returned == "" || returned == "0")
        {
            return false;
        }
        else
        {
            return true;
        }
    }

    public string GetClassName(bool enabled)
    {
        return (enabled) ? "disabled_checkbox" : "";
    }
    protected void gvPeople_DataBound(object sender, EventArgs e)
    {
        //Company.un_co_detailsRow dataRow = null;//GetCompany();
        //if (dataRow != null)
        //{
        //    if (dataRow.Issupervisor_labelNull() == false)
        //    {
        //        gvPeople.Columns[1].HeaderText = dataRow.supervisor_label + "?";
        //    }
        //    if (dataRow.Isfirst_aider_labelNull() == false)
        //    {
        //        gvPeople.Columns[2].HeaderText = dataRow.first_aider_label + "?";
        //    }
        //    if (dataRow.Isfire_warden_labelNull() == false)
        //    {
        //        gvPeople.Columns[3].HeaderText = dataRow.fire_warden_label + "?";
        //    }
        //}
    }

    protected void SaveRoomDetails(object sender, EventArgs e)
    {
        int i = 0;
        int count = RoomsList.Items.Count;
        for (i = 0; i < count; i++)
        {
            HtmlInputHidden roomSeqNo = RoomsList.Items[i].FindControl("RoomSequenceNo") as HtmlInputHidden;

            HtmlInputHidden roomLenInM = RoomsList.Items[i].FindControl("RoomLengthInMeters") as HtmlInputHidden;
            HtmlInputHidden roomLenInFt = RoomsList.Items[i].FindControl("RoomLengthInFeet") as HtmlInputHidden;
            HtmlInputHidden roomLenInInch = RoomsList.Items[i].FindControl("RoomLengthInInches") as HtmlInputHidden;
            HtmlInputHidden roomLenText = RoomsList.Items[i].FindControl("RoomLengthText") as HtmlInputHidden;
            HtmlInputHidden roomWidInM = RoomsList.Items[i].FindControl("RoomWidthInMeters") as HtmlInputHidden;
            HtmlInputHidden roomWidInFt = RoomsList.Items[i].FindControl("RoomWidthInFeet") as HtmlInputHidden;
            HtmlInputHidden roomWidInInch = RoomsList.Items[i].FindControl("RoomWidthInInches") as HtmlInputHidden;
            HtmlInputHidden roomWidText = RoomsList.Items[i].FindControl("RoomWidthText") as HtmlInputHidden;

            TextBox roomHeadingTextBox = RoomsList.Items[i].FindControl("HeadingTextBox") as TextBox;
            TextBox roomAspectTextBox = RoomsList.Items[i].FindControl("AspectTextBox") as TextBox;
            TextBox roomTextTextBox = RoomsList.Items[i].FindControl("ParagraphTextBox") as TextBox;

            int roomSequenceNo = -999;
            try
            {
                roomSequenceNo = int.Parse(roomSeqNo.Value);
                PropertyRoom propRoom = estateAgentDB.PropertyRooms.SingleOrDefault(r => r.Sequence == roomSequenceNo);
                if (roomHeadingTextBox.Text != null && roomHeadingTextBox.Text.CompareTo("") != 0)
                    propRoom.RoomHeading = roomHeadingTextBox.Text;
                if (roomAspectTextBox.Text != null && roomAspectTextBox.Text.CompareTo("") != 0)
                    propRoom.RoomAspect = roomAspectTextBox.Text;
                if (roomTextTextBox.Text != null && roomTextTextBox.Text.CompareTo("") != 0)
                    propRoom.RoomText = roomTextTextBox.Text;
                if (roomLenInM.Value != null && roomLenInM.Value.CompareTo("") != 0)
                    propRoom.RoomLengthM = double.Parse(roomLenInM.Value);
                if (roomLenInFt.Value != null && roomLenInFt.Value.CompareTo("") != 0)
                    propRoom.RoomLengthFt = double.Parse(roomLenInFt.Value);
                if (roomLenInInch.Value != null && roomLenInInch.Value.CompareTo("") != 0)
                    propRoom.RoomLengthIn = double.Parse(roomLenInInch.Value);
                if (roomLenText.Value != null && roomLenText.Value.CompareTo("") != 0)
                    propRoom.RoomLengthText = roomLenText.Value;

                if (roomWidInM.Value != null && roomWidInM.Value.CompareTo("") != 0)
                    propRoom.RoomWidthM = double.Parse(roomWidInM.Value);
                if (roomWidInFt.Value != null && roomWidInFt.Value.CompareTo("") != 0)
                    propRoom.RoomWidthFt = double.Parse(roomWidInFt.Value);
                if (roomWidInInch.Value != null && roomWidInInch.Value.CompareTo("") != 0)
                    propRoom.RoomWidthIn = double.Parse(roomWidInInch.Value);
                if (roomWidText.Value != null && roomWidText.Value.CompareTo("") != 0)
                    propRoom.RoomWidthText = roomWidText.Value;

                estateAgentDB.SaveChanges();

                propRoom = null;
                //Response.Redirect("~/PropertyDetails.aspx?" + WebConstants.Request.PROPERTY_ID + "=" + Request[WebConstants.Request.PROPERTY_ID]);
            }
            catch (Exception exc)
            {
                Response.Redirect("~/Orders/AddOrder.aspx?" + WebConstants.Request.PROPERTY_ORDER_ID + "=" + property.Sequence + "&" + WebConstants.Request.ERROR + "=invalid room id: " + roomSeqNo.Value);
            }
        }
        Response.Redirect("~/Orders/AddOrder.aspx?" + WebConstants.Request.PROPERTY_ORDER_ID + "=" + property.Sequence);
    }

    protected void AddNewRoom(object sender, EventArgs e)
    {
        //PropertyRoom newRoom = new PropertyRoom();
        //newRoom.CreatedBy = loggedInUserId;
        //newRoom.DateCreated = DateTime.Now;
        //newRoom.CompanySequence = loggedInUserCoId;
        //newRoom.DateLastAmended = DateTime.Now;
        //newRoom.LastAmendedBy = loggedInUserId;
        //int propertyId = property.Sequence;
        //newRoom.PropertySequence = propertyId;

        
        //int totalRoomsInProperty = property.PropertyRooms.Count;
        //newRoom.RoomNo = totalRoomsInProperty + 1;
        //property.PropertyRooms.Add(newRoom);
        //estateAgentDB.SaveChanges();
        Response.Redirect("~/Orders/AddRoom.aspx?" + WebConstants.Request.PROPERTY_ORDER_ID + "=" + property.Sequence);
    }
}
