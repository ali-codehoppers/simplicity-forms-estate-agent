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

public partial class Orders_AddOrderCOSHH : DepartmentPage
{
    protected override void Department_Page_Handling(object sender, EventArgs e)
    {
        
    }
    protected void btnNext_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Orders/AddOrderDocuments.aspx?" + WebConstants.Request.DEPT_ORDER_ID + "=" + Request[WebConstants.Request.DEPT_ORDER_ID]);

    }
    protected void btnBack_Click(object sender, EventArgs e)
    {
         Response.Redirect("~/Orders/AddOrderRiskAssessments.aspx?" + WebConstants.Request.DEPT_ORDER_ID + "=" + Request[WebConstants.Request.DEPT_ORDER_ID]);

    }
}
