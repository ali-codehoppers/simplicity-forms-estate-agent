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
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    public override void Order_Detail_Handling(object sender, EventArgs e, int deptId)
    {

    }

    protected void SaveNewRoomDetails(object sender, EventArgs e)
    {
        try
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
            //roomId = int.Parse(Request[WebConstants.Request.ROOM_ID]);
            // = entity.PropertyRooms1.SingleOrDefault(c => c.Sequence == roomId);

            //if (RoomNoTextBox.Text != null && RoomNoTextBox.Text.CompareTo("") != 0)
            //    propRoom.RoomNo = int.Parse(RoomNoTextBox.Text);
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


    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Orders/AddOrder.aspx?" + WebConstants.Request.PROPERTY_ORDER_ID + "=" + Request[WebConstants.Request.PROPERTY_ORDER_ID]);
    }
    protected void btnNext_Click(object sender, EventArgs e)
    {
        //if (Save())
        {
            Response.Redirect("~/Orders/AddOrderHazard.aspx?" + WebConstants.Request.DEPT_ORDER_ID + "=" + Request[WebConstants.Request.DEPT_ORDER_ID]);
        }
    }
}
