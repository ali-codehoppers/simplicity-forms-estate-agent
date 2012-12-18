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
            if (!IsPostBack)
            {
                RoomsList.DataSource = property.PropertyRooms.OrderBy(rooms => rooms.RoomNo) ;
                RoomsList.DataBind();
            }
        }
        catch (Exception exc)
        {
            Response.Redirect("~/Orders/AddOrder.aspx?" + WebConstants.Request.PROPERTY_ORDER_ID + "=" + Request[WebConstants.Request.PROPERTY_ORDER_ID]);
        }
    }

    //protected void Page_Load(object sender, EventArgs e)
    //{
    //    try
    //    {
    //        //propertyId = int.Parse(Request[WebConstants.Request.PROPERTY_ID]);
    //        if (!IsPostBack)
    //        {
    //            //Property property = entity.Properties1.SingleOrDefault(c => c.Sequence == propertyId);
    //            //PropertyHeadingTextBox.Text = property.PropHeading;
    //            RoomsList.DataSource = property.PropertyRooms;
    //            RoomsList.DataBind();
    //        }
    //    }
    //    catch (Exception exc)
    //    {
    //        Response.Redirect("~/Orders/AddOrder.aspx?" + WebConstants.Request.PROPERTY_ORDER_ID + "=" + Request[WebConstants.Request.PROPERTY_ORDER_ID]);
    //    }
    //}

    public override void Order_Detail_Handling(object sender, EventArgs e, int deptId)
    {
        
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
        Response.Redirect("~/Orders/AddRoom.aspx?" + WebConstants.Request.PROPERTY_ORDER_ID + "=" + property.Sequence);
    }
}
