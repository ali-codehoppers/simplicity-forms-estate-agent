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

public partial class Home : AuthenticatedPage
{
    protected override void Page_Load_Extended(object sender, EventArgs e)
    {
        Simplicity.Data.Company dataRow = GetCompany();
        //if(dataRow != null)
        //{
        //    lblCompany.Text = dataRow.co_name_long;
        //}        
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Orders/SearchOrder.aspx");
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Orders/AddOrder.aspx");
    }
    protected void btnCOSHH_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Orders/GenerateCOSHH.aspx");
    }
    protected void btnSignage_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/GenerateSignage.aspx");
    }
}
