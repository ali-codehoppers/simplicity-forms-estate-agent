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
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session[WebConstants.Session.COMPANY_NAME] != null)
        {
            //lblCompany.Text = Session[WebConstants.Session.COMPANY_NAME].ToString();
        }
        if (Session[WebConstants.Session.USER_CO_ID] != null)
        {
            //SetHelp((int)Session[WebConstants.Session.USER_CO_ID]);
        }
        //BackToSimplicityButton.PostBackUrl = ConfigurationManager.AppSettings["SCDefaulturl"];
        //int user_id = Int32.Parse(Session[WebConstants.Session.USER_ID].ToString());
        //      Simplicity.Data.SimplicityEntities db=new SimplicityEntities();
        //     Simplicity.Data.Session session=from c in db.Sessions where c.SessionID==user_id select c; 
        Logginuser.Text = Session["userName"].ToString();  
        if (Session[WebConstants.Session.USER_CO_ID] != null)
        {
            //Company.un_co_detailsRow company = DatabaseUtility.GetCompany((int)Session[WebConstants.Session.USER_CO_ID]);
            //if (company != null)
            //{
            //    if (company.Isflg_trialNull() == false && company.flg_trial)
            //    {
            //        productTrial.Visible = true;
            //    }
            //    else {
                //notproductTrial.Visible = true;
            //    }  
            //}
        }
   
    }
    //private void SetHelp(int loggedInUserCoId)
    //{
    //    char[] seperator = new char[1];
    //    seperator[0] = '/';
    //    string[] paths = Request.Path.Split(seperator);
    //    string path = paths[paths.Length - 1];
    //    ScreensTableAdapters.ScreenTableAdapter screenTA = new ScreensTableAdapters.ScreenTableAdapter();
    //    IEnumerator ieScreen = screenTA.GetScreenByURL(loggedInUserCoId, path).GetEnumerator();
    //    if (ieScreen.MoveNext())
    //    {
    //        Screens.ScreenEntityRow screenDR = (Screens.ScreenEntityRow)ieScreen.Current;
    //        //imgHelp.Visible = true;
    //        helpHTML = screenDR.help_html;
    //    }
    //    else
    //    {
    //        //imgHelp.Visible = false;
    //    }
    //}

    protected void btnLogout_Click(object sender, EventArgs e)
    {
        if (Session[WebConstants.Session.USER_ID] != null)
        {
            Cache.Remove(Session[WebConstants.Session.USER_ID].ToString());
        }
        Session.Clear();
        Response.Redirect(ConfigurationSettings.AppSettings["LogoutURL"]);
        //Response.Redirect("~/Login.aspx");

    }
    protected void btnAccount_Click(object sender, EventArgs e)
    {
        Response.Redirect(ConfigurationSettings.AppSettings["SCurl"]+"/SignUp.aspx");
    }
    
    //protected string GetTrialHTML()
    //{
    //    string html = "";
    //    if (Session[WebConstants.Session.USER_CO_ID] != null)
    //    {
    //        Company.un_co_detailsRow company = DatabaseUtility.GetCompany((int)Session[WebConstants.Session.USER_CO_ID]);
    //        if (company != null)
    //        {
    //            if (company.Isflg_trialNull() == false && company.flg_trial)
    //            {
    //                string url = ConfigurationManager.AppSettings["SCurl"] + "/Products/HS/HSPrice.aspx?productId=2";
    //                html = "<div class='trial_txt'>Your trial ends in " + company.trial_end_date.Subtract(DateTime.Now).Days + " days on " + company.trial_end_date.ToShortDateString() + "</div>";
    //                html += "<div style='float:right'><a href='" + url + "'><img src='" + this.ResolveClientUrl("~/Images/Buy_Now.jpg")  + "'\"/></a></div><div style='clear:both'></div>";
    //            }
    //        }
    //    }
    //    return html;
    //}
}

