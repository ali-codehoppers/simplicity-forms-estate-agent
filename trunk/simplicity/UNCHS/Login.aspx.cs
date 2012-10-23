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
using System.Collections.Specialized;
using System.Linq;

public partial class nLogin : GenericPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if ((LoggedIsUser != null) || (User.Identity.IsAuthenticated))
        {
            Response.Redirect("TermsConditions.aspx");
        }
        else
        {
            if (Request[WebConstants.Request.NEED_LOGIN] != null)
            {
                errorPanel.Visible = true;
                SetErrorMessage("Please login to continue");
            }
            else if (Request[WebConstants.Request.FROM_PAGE] != null)
            {
                errorPanel.Visible = true;
                SetInfoMessage("An email has been sent to you for your login details");
            }
        }

    }


    protected void btnLogin_Click(object sender, EventArgs e)
    {
        String Collectpassword = Utility.GetMd5Sum(tbPassword.Text);
        Simplicity.Data.SimplicityEntities DatabaseContext = new Simplicity.Data.SimplicityEntities();
        Simplicity.Data.User user = (from u in DatabaseContext.Users
                                     where u.Email == tbUserName.Text
                                     && u.Password == Collectpassword
                                     && u.Verified == true
                                     select u).FirstOrDefault();
        if (user != null)
        {
            Simplicity.Data.Session session = new Simplicity.Data.Session();
            session.SessionUID = System.Guid.NewGuid().ToString();
            session.User = user;
            session.StartTime = DateTime.Now;
            session.LastActivityTime = DateTime.Now;
            session.EndTime = DateTime.Now.AddMinutes(30);
            session.IP = Request.UserHostAddress;
            DatabaseContext.AddToSessions(session);
            DatabaseContext.SaveChanges();
            FormsAuthentication.SetAuthCookie(session.SessionUID, false);
            Session[WebConstants.Session.USER_ID] = user.UserID;
            Session["userName"] = user.Email;
            Session["userFullName"]=user.FullName;
            //Session["isTrial"] = user.UserProducts.FirstOrDefault().IsTrial;
            Session["sessionID"] = session.SessionUID;
            if (Session[WebConstants.Session.RETURN_URL] != null)
            {
                Response.Redirect((string)Session[WebConstants.Session.RETURN_URL]);
            }
            else if (Request["GOTO_URL"] != null)
            {
                Response.Redirect((string)Request["GOTO_URL"]);
            }
            else
            {
                Response.Redirect("TermsConditions.aspx",false);
            }
        }
        else
        {
            errorPanel.Visible = true;
            SetErrorMessage(WebConstants.Messages.Error.CANNOT_LOGIN);
        }
    }
}
