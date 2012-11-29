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
using Simplicity.Data;

public partial class Common_subMain : System.Web.UI.MasterPage
{
    //protected string helpHTML;
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (Session[WebConstants.Session.COMPANY_NAME] != null)
        //{
        //    lblCompany.Text = Session[WebConstants.Session.COMPANY_NAME].ToString();
        //}
        if (Session[WebConstants.Session.USER_CO_ID] != null)
        {
            //SetHelp((int)Session[WebConstants.Session.USER_CO_ID]);
        }
        //BackToSimplicityButton.PostBackUrl = ConfigurationManager.AppSettings["SCDefaulturl"];
        //FormsIdentity id = (FormsIdentity)(HttpContext.Current.User.Identity);
        //FormsAuthenticationTicket ticket = FormsAuthentication.Decrypt(id.Ticket);
        //Simplicity.Data.SimplicityEntities db = new SimplicityEntities();
        //Simplicity.Data.Session session = from c in db.Sessions where c.SessionID == userId select c; 

        if (Session["userName"] != null)
            Logginuser.Text = Session["userName"].ToString();
        if (Session[WebConstants.Session.USER_CO_ID] != null)
        {
        //    Company.un_co_detailsRow company = DatabaseUtility.GetCompany((int)Session[WebConstants.Session.USER_CO_ID]);
        //    if (company != null)
        //    {
        //        if (company.Isflg_trialNull() == false && company.flg_trial)
        //        {
        //            productTrial.Visible = true;
        //        }
        //        else
        //        {
            //notproductTrial.Visible = true;
        //        }
        }
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
        Response.Redirect(ConfigurationSettings.AppSettings["SCurl"] + "/SignUp.aspx");
    }
}
