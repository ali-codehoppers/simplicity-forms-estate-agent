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
using System.Collections.Generic;
using System.Text;
using System.Linq;
using EstateAgentEntityModel;

public partial class Common_TabControl : System.Web.UI.UserControl
{
    public string Selected = "Main";
    private Dictionary<string, string> menuItems = new Dictionary<string, string>();
    
    protected string LiList = "";

    public void RefreshTabs()
    {
        menuItems.Clear();
        InitializeComponent();
    }

    protected void InitializeComponent()
    {
        if (Request[WebConstants.Request.PROPERTY_ORDER_ID] != null && Request[WebConstants.Request.PROPERTY_ORDER_ID].CompareTo("") != 0)
        {
            int propertyId = int.Parse(Request[WebConstants.Request.PROPERTY_ORDER_ID]);
            menuItems.Add("Main", "AddOrder.aspx?" + WebConstants.Request.PROPERTY_ORDER_ID + "=" + propertyId);
            menuItems.Add("Room Details", "AddOrderPeople.aspx?" + WebConstants.Request.PROPERTY_ORDER_ID + "=" + propertyId);

            hlAddRoomPannel.Visible = true;
            linkAddRoom.NavigateUrl = "~/Orders/AddRoom.aspx?" + WebConstants.Request.PROPERTY_ORDER_ID + "=" + propertyId;

            SimplicityWebEstateAgentEntities estateAgentDB = new SimplicityWebEstateAgentEntities();
            IEnumerable<EstateAgentEntityModel.PropertyRoom> propertyRooms = (from propRooms in estateAgentDB.PropertyRooms where propRooms.PropertySequence == propertyId select propRooms);
            foreach (EstateAgentEntityModel.PropertyRoom room in propertyRooms)
            {
                menuItems.Add(room.RoomHeading + WebConstants.ToSplit.ROOM_TAB_SPLIT + room.Sequence, "AddRoom.aspx?" + WebConstants.Request.PROPERTY_ORDER_ID + "=" + propertyId + "&" + WebConstants.Request.Room_ID + "=" + room.Sequence);
            }
        }
        else
        {
            menuItems.Add("Main", "AddOrder.aspx");
        }

        StringBuilder lis = new StringBuilder();
        lis.Append("<div style='width:100%'>");
        foreach (KeyValuePair<string, string> kvPair in menuItems)
        {
            
            if (kvPair.Key.Equals(Selected))
            {
                lis.Append("<div class='floatLeft'><img src=" + ResolveClientUrl("~/images/btn_y_left.jpg") + " width='8' height='33' /></div>");
                lis.Append("<div class='mid_yellow'><a class='txt_yellow' href='").Append(kvPair.Value);
            }
            else {
                lis.Append("<div class='floatLeft'><img src=" + ResolveClientUrl("~/images/btn_b_left.jpg") + " width='8' height='33' /></div>");
                lis.Append("<div class='mid_blue'><a class='txt_blue' href='").Append(kvPair.Value);
            }
            if(Request[WebConstants.Request.DEPT_ORDER_ID] != null)
            {
                lis.Append("?").Append(WebConstants.Request.DEPT_ORDER_ID).Append("=").Append(Request[WebConstants.Request.DEPT_ORDER_ID]);
            }

            String keyToPrint = kvPair.Key.Split(new String[] { WebConstants.ToSplit.ROOM_TAB_SPLIT }, StringSplitOptions.None)[0];
            lis.Append("'>").Append(keyToPrint).Append("</a></div>");
            if (kvPair.Key.Equals(Selected))
            {
                lis.Append("<div class='floatLeft'><img style='margin-right:4px' src=" + ResolveClientUrl("~/images/btn_y_right.jpg") + " width='8' height='33' /></div>");
            }
            else {
                lis.Append("<div class='floatLeft'><img style='margin-right:4px' src=" + ResolveClientUrl("~/images/btn_b_right.jpg") + " width='8' height='33' /></div>");
            }
            

        }
        lis.Append("</div>");
        LiList = lis.ToString();
    }


    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    override protected void OnInit(EventArgs e)
    {
        InitializeComponent();
        base.OnInit(e); // be care of this
    }
    
}
