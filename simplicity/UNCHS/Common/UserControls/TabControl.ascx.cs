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

public partial class Common_TabControl : System.Web.UI.UserControl
{
    public string Selected = "Main";
    private Dictionary<string, string> menuItems = new Dictionary<string, string>();
    
    protected string LiList = "";
    protected void InitializeComponent()
    {
        menuItems.Add("Main", "AddOrder.aspx");
        menuItems.Add("Add Room", "AddOrderPeople.aspx");
            //menuItems.Add("Key Hazards", "AddOrderHazard.aspx");
            //menuItems.Add("Work", "AddOrderSeqOfWoks.aspx");
            //menuItems.Add("Plants & Tools", "AddOrderTool.aspx");
            //menuItems.Add("PPE", "AddOrderPPE.aspx");
            //menuItems.Add("Emergency", "AddOrderEmergencyExits.aspx");
            //menuItems.Add("Requirements", "AddOrderRequirements.aspx");
            //menuItems.Add("Aspects", "AddOrderKeyAspects.aspx");
            //menuItems.Add("Risks", "AddOrderRiskAssessments.aspx");I need additonal tab content later.
        //menuItems.Add("COSHH", "AddOrderCOSHH.aspx");
        //menuItems.Add("Sig Hazards", "AddOrderSigHazard.aspx");
        //menuItems.Add("Assem Pts", "AddOrderAssemPts.aspx");        
        //menuItems.Add("Measures", "AddOrderCtrlMeasures.aspx");
        menuItems.Add("Docs", "AddOrderDocuments.aspx");
        //menuItems.Add("Log", "OrderLog.aspx");

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
            lis.Append("'>").Append(kvPair.Key).Append("</a></div>");
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
