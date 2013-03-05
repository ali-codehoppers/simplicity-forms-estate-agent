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

public partial class Order_AddRoom : RoomDetailPage
{
    PropertyRoom propRoom = null;

    protected override void OnLoad(EventArgs e)
    {
 	     base.OnLoad(e);
         Load_Page();
    }

    private void Load_Page()
    {
        if (!IsPostBack)
        {
            if (Request[WebConstants.Request.PROPERTY_ORDER_ID] != null && Request[WebConstants.Request.Room_ID] != null)
            {
                int roomID = int.Parse(Request[WebConstants.Request.Room_ID]);
                PropertyRoom propRoom = property.PropertyRooms.SingleOrDefault(room => room.Sequence == roomID);
                if(propRoom.RoomHeading != null)
                    HeadingTextBox.Text = propRoom.RoomHeading;
                if(propRoom.RoomAspect != null)
                    AspectTextBox.Text = propRoom.RoomAspect;
                if(propRoom.RoomText != null)
                    ParagraphTextBox.Text = propRoom.RoomText;
                if(propRoom.RoomNo != null)
                    RoomNoTextBox.Text = propRoom.RoomNo.ToString();
                double roomLengthM = 0;
                double roomLengthFeet = 0;
                double roomLengthIn = 0;
                double roomWidthM = 0;
                double roomWidthFeet = 0;
                double roomWidthIn = 0;
                if (propRoom.RoomLengthM != null)
                    roomLengthM = double.Parse(propRoom.RoomLengthM.ToString());
                if (propRoom.RoomLengthFt != null)
                    roomLengthFeet = double.Parse(propRoom.RoomLengthFt.ToString());
                if (propRoom.RoomLengthIn != null)
                    roomLengthIn = double.Parse(propRoom.RoomLengthIn.ToString());
                if (propRoom.RoomWidthM != null)
                    roomWidthM = double.Parse(propRoom.RoomWidthM.ToString());
                if (propRoom.RoomWidthFt != null)
                    roomWidthFeet = double.Parse(propRoom.RoomWidthFt.ToString());
                if (propRoom.RoomWidthIn != null)
                    roomWidthIn = double.Parse(propRoom.RoomWidthIn.ToString());
                String tempText = roomLengthM + "m(" + roomLengthFeet + "'" + roomLengthIn + "\") X " + roomWidthM + "m(" + roomWidthFeet + "'" + roomWidthIn + "\")";
                DimensionsTextBox.Text = tempText;

                if (propRoom.RoomLengthM != null)
                    RoomLengthInMeters.Value = propRoom.RoomLengthM.ToString();
                if (propRoom.RoomLengthFt != null)
                    RoomLengthInFeet.Value = propRoom.RoomLengthFt.ToString();
                if (propRoom.RoomLengthIn != null)
                    RoomLengthInInches.Value = propRoom.RoomLengthIn.ToString();
                if (propRoom.RoomLengthText != null)
                    RoomLengthText.Value = propRoom.RoomLengthText.ToString();

                if (propRoom.RoomWidthM != null)
                    RoomWidthInMeters.Value = propRoom.RoomWidthM.ToString();
                if (propRoom.RoomWidthFt != null)
                    RoomWidthInFeet.Value = propRoom.RoomWidthFt.ToString();
                if (propRoom.RoomWidthIn != null)
                    RoomWidthInInches.Value = propRoom.RoomWidthIn.ToString();
                if (propRoom.RoomWidthText != null)
                    RoomWidthText.Value = propRoom.RoomWidthText.ToString();
                if (propRoom.RoomHeading != null)
                {
                    TabControl1.Selected = propRoom.RoomHeading.ToString() + WebConstants.ToSplit.ROOM_TAB_SPLIT + propRoom.Sequence;
                }
                TabControl1.RefreshTabs();
            }
            
        }
    }

    public override void Order_Detail_Handling(object sender, EventArgs e, int deptId)
    {

    }

    protected void SaveNewRoomDetails(object sender, EventArgs e)
    {
        try
        {
            if (Request[WebConstants.Request.Room_ID] == null || Request[WebConstants.Request.Room_ID] == "")
            {
                propRoom = new PropertyRoom();
                propRoom.CreatedBy = loggedInUserId;
                propRoom.DateCreated = DateTime.Now;
                propRoom.CompanySequence = loggedInUserCoId;
                propRoom.DateLastAmended = DateTime.Now;
                propRoom.LastAmendedBy = loggedInUserId;
                propRoom.PropertySequence = property.Sequence;


                int totalRoomsInProperty = property.PropertyRooms.Count;
                propRoom.RoomNo = totalRoomsInProperty + 1;
                property.PropertyRooms.Add(propRoom);
                estateAgentDB.SaveChanges();
            }
            else {
                int roomID = int.Parse(Request[WebConstants.Request.Room_ID]);
                propRoom = property.PropertyRooms.SingleOrDefault(room => room.Sequence == roomID);
            }
            
            if (HeadingTextBox.Text != null && HeadingTextBox.Text.CompareTo("") != 0)
                propRoom.RoomHeading = HeadingTextBox.Text;
            if (AspectTextBox.Text != null && AspectTextBox.Text.CompareTo("") != 0)
                propRoom.RoomAspect = AspectTextBox.Text;
            if (ParagraphTextBox.Text != null && ParagraphTextBox.Text.CompareTo("") != 0)
                propRoom.RoomText = ParagraphTextBox.Text;
            if (RoomLengthInMeters.Value != null && RoomLengthInMeters.Value.CompareTo("") != 0)
                propRoom.RoomLengthM = double.Parse(RoomLengthInMeters.Value);
            if (RoomLengthInFeet.Value != null && RoomLengthInFeet.Value.CompareTo("") != 0)
                propRoom.RoomLengthFt = double.Parse(RoomLengthInFeet.Value);
            if (RoomLengthInInches.Value != null && RoomLengthInInches.Value.CompareTo("") != 0)
                propRoom.RoomLengthIn = double.Parse(RoomLengthInInches.Value);
            if (RoomLengthText.Value != null && RoomLengthText.Value.CompareTo("") != 0)
                propRoom.RoomLengthText = RoomLengthText.Value;

            if (RoomWidthInMeters.Value != null && RoomWidthInMeters.Value.CompareTo("") != 0)
                propRoom.RoomWidthM = double.Parse(RoomWidthInMeters.Value);
            if (RoomWidthInFeet.Value != null && RoomWidthInFeet.Value.CompareTo("") != 0)
                propRoom.RoomWidthFt = double.Parse(RoomWidthInFeet.Value);
            if (RoomWidthInInches.Value != null && RoomWidthInInches.Value.CompareTo("") != 0)
                propRoom.RoomWidthIn = double.Parse(RoomWidthInInches.Value);
            if (RoomWidthText.Value != null && RoomWidthText.Value.CompareTo("") != 0)
                propRoom.RoomWidthText = RoomWidthText.Value;

            estateAgentDB.SaveChanges();
            propRoom = null;
            Response.Redirect("~/Orders/AddOrderPeople.aspx?" + WebConstants.Request.PROPERTY_ORDER_ID + "=" + property.Sequence, false);

        }
        catch (Exception exc)
        {
            Response.Redirect("~/Orders/AddOrderPeople.aspx?" + WebConstants.Request.PROPERTY_ORDER_ID + "=" + property.Sequence + "&" + WebConstants.Request.ERROR + "=invalid property id: " + Request[WebConstants.Request.PROPERTY_ORDER_ID]);
        }
    }

}
