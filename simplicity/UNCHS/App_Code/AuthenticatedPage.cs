using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

/// <summary>
/// Summary description for AuthenticatedPage
/// </summary>
public abstract class AuthenticatedPage : VerifyLoginPage
{
    protected abstract void Page_Load_Extended(object sender, EventArgs e);
    //private Company.un_co_detailsRow company = null;
	public AuthenticatedPage():base()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    

    protected override void AfterLoginVerifiedProcessing(object sender, EventArgs e)
    {
        this.Page.Master.FindControl(loggedInUserRole + "Menu").Visible = true;
        if (Session[WebConstants.Session.HAS_AGREED] != null && (bool)Session[WebConstants.Session.HAS_AGREED])
        {
            Page_Load_Extended(sender, e);
        }
        else
        {
            Response.Redirect("~/TermsConditions.aspx");
        }
    }
}
    