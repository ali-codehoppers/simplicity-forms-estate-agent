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

public partial class mainMasterPage : System.Web.UI.MasterPage
{
    protected string helpHTML;

    protected override void OnLoad(EventArgs e)
    {
        base.OnLoad(e);
        if (Session["userName"] != null)
            Logginuser.Text = Session["userName"].ToString();
    }

    protected void btnLogout_Click(object sender, EventArgs e)
    {
        FormsAuthentication.SignOut();
        if (Session[WebConstants.Session.USER_ID] != null)
        {
            Cache.Remove(Session[WebConstants.Session.USER_ID].ToString());
        }
        Session.Clear();
        Response.Redirect(ConfigurationSettings.AppSettings["LogoutURL"]);
    }
    protected void btnAccount_Click(object sender, EventArgs e)
    {
        Response.Redirect(ConfigurationSettings.AppSettings["SCurl"]+"/SignUp.aspx");
    }
    
}

