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

public partial class Orders_AddOrderRiskAssessments : RoomDetailPage
{
    public override void Order_Detail_Handling(object sender, EventArgs e, int deptId)
    {
    }

    protected void btnNext_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Orders/AddOrderDocuments.aspx?" + WebConstants.Request.DEPT_ORDER_ID + "=" + Request[WebConstants.Request.DEPT_ORDER_ID]);
    }
    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Orders/AddOrderKeyAspects.aspx?" + WebConstants.Request.DEPT_ORDER_ID + "=" + Request[WebConstants.Request.DEPT_ORDER_ID]);
    }
}
