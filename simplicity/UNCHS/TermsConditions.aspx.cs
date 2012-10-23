using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TermsConditions : VerifyLoginPage 
{
    protected override void AfterLoginVerifiedProcessing(object sender, EventArgs e)
    {
        
    }
    protected void btnAgree_Click(object sender, EventArgs e)
    {
        Session[WebConstants.Session.HAS_AGREED] = true;
        Response.Redirect(loggedInUserRole + "Home.aspx",false);
    }
}
