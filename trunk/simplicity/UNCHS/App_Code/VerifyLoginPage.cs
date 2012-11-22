using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI.WebControls;
using System.Collections.Specialized;
using Simplicity.Data;
using System.Linq;
using System.Collections;
using System.Web.Security;
using System.Web.Configuration;
using EstateAgentEntityModel;


/// <summary>
/// Summary description for VerifyLoginPage
/// </summary>
public abstract class VerifyLoginPage : GenericPage
{
    private SimplicityEntities databaseContext = null;

    protected int loggedInUserId = 0;
    protected int loggedInUserCoId = 0;
    protected string loggedInUserRole = null;

    protected abstract void AfterLoginVerifiedProcessing(object sender, EventArgs e);

    public VerifyLoginPage()
    {
    }

    protected override void OnLoad(EventArgs e)
    {
        Process();
        AfterLoginVerifiedProcessing(null, e);
    }

    private void Process()
    {
      
        if (User.Identity.IsAuthenticated)
        {
            databaseContext = new SimplicityEntities();
            Simplicity.Data.Session session = (from ses in databaseContext.Sessions where ses.SessionUID == User.Identity.Name select ses).FirstOrDefault();
            int EAProductId = int.Parse(AppSettings["EAProductIDInSimplicity"]);

            //UserTableAdapters.un_co_user_detailsTableAdapter userTa = new UserTableAdapters.un_co_user_detailsTableAdapter();
            //IEnumerator<User.un_co_user_detailsRow> users = userTa.GetBySimplicityID(session.User.UserID).GetEnumerator();
            //if (users.MoveNext())
            //{
                Session[WebConstants.Session.SIMPLICITY_USER_ID] = session.User.UserID;
                Session[WebConstants.Session.USER_ID] = session.User.UserID;
                Session[WebConstants.Session.USER_ROLE] = WebConstants.Roles.User;
                //Session["userName"] = session.User.Email;
                loggedInUserRole = WebConstants.Roles.User;
                loggedInUserId = session.User.UserID;
                if (session.User.Company != null)
                {

                    Session[WebConstants.Session.SIMPLICITY_COMPANY_ID] = session.User.Company.CompanyID;
                    //CompanyTableAdapters.un_co_detailsTableAdapter ta = new CompanyTableAdapters.un_co_detailsTableAdapter();
                    //IEnumerator<Company.un_co_detailsRow> companies = ta.GetBySimplicityID(session.User.Company.CompanyID).GetEnumerator();
                    //if (companies.MoveNext())
                    //{
                        Session[WebConstants.Session.USER_CO_ID] = session.User.Company.CompanyID;
                        Session[WebConstants.Session.COMPANY_NAME] = session.User.Company.Name;
                        loggedInUserCoId = session.User.Company.CompanyID;

                        //going to check for licenses                        
                        List<CompanyProduct> companyProducts = (from cp in databaseContext.CompanyProducts where cp.CompanyID == session.User.Company.CompanyID && cp.ProductID == EAProductId select cp).ToList<CompanyProduct>();
                        int numOfLicenses = 0;
                        foreach (CompanyProduct cp in companyProducts)
                        {
                            if (cp.EndDate.CompareTo(DateTime.Now) >= 0)
                            {
                                numOfLicenses = numOfLicenses + cp.NumOfLicenses;
                            }
                        }
                        if (numOfLicenses > 0)//check for available licenses now
                        {
                            int numOfUsedLicenses = 0;
                            var check = (from userTable in databaseContext.Users where userTable.CompanyID == session.User.Company.CompanyID select userTable).ToList() ;
                            List<Session> userSessions = (from ses in databaseContext.Sessions where ses.ProductID == EAProductId && (from userTable in databaseContext.Users where userTable.CompanyID == session.User.Company.CompanyID select userTable.UserID).Contains(ses.UserID) && DateTime.Compare(DateTime.Now,ses.LastActivityTime)>30 && ses.SessionID != session.SessionID select ses).ToList<Session>();
                            foreach (Session ses in userSessions)
                            {
                                numOfUsedLicenses = numOfUsedLicenses + 1;
                            }
                            if (numOfLicenses - numOfUsedLicenses > 0)
                            {

                                //GoToPage(companies.Current.flg_show_wizard, companies.Current.co_id, users.Current);
                            }
                            else
                            {
                                Response.Redirect(AppSettings["SimplicityErrorURL"] + "?" + "message" + "=All licenses are consumed right now. Please try later");
                            }
                        }
                        else //check if trial version is available
                        {
                            bool isTrial = false;
                            List<UserProduct> userProducts = (from up in databaseContext.UserProducts where up.UserID == session.User.UserID && up.ProductID == EAProductId select up).ToList<UserProduct>();
                            foreach (UserProduct up in userProducts)
                            {
                                if (up.EndDate.CompareTo(DateTime.Now) >= 0)
                                {
                                    isTrial = true;
                                    Session["isTrial"] = isTrial;
                                    break;
                                }
                            }
                            if (!isTrial)
                            {
                                Response.Redirect(AppSettings["SimplicityErrorURL"] + "?" + "message" + "=You are not authorized to access Health and Safety");
                            }
                            else
                            {
                                //GoToPage(companies.Current.flg_show_wizard, companies.Current.co_id, users.Current);
                            }
                        }
                    //}
                    //else
                    //{
                    //    Response.Redirect(AppSettings["SimplicityErrorURL"] + "?" + "message" + "=You have no company assigned. Please contact administrator");
                    //}
                }
                else
                {
                    Response.Redirect(AppSettings["SimplicityErrorURL"] + "?" + "message" + "=You have no company assigned. Please contact administrator");
                }
            //}
            //else
            //{
            //    Response.Redirect(AppSettings["SimplicityErrorURL"] + "?" + "message" + "=No user found in Health and Safety for Simplicity user. Please contact administrator");
            //}
        }
        else
        {
            Response.Redirect("~/Login.aspx" + "?" + WebConstants.Request.SESSION_EXPIRED + "=true&GOTO_URL=" + Request.Url);
        }
    }

    protected Simplicity.Data.Company GetCompany()
    {
        Simplicity.Data.Company company = null;
        if (loggedInUserCoId > 0)
        {
            company = databaseContext.Companies.SingleOrDefault(c => c.CompanyID == loggedInUserCoId);
            Session[WebConstants.Session.COMPANY_NAME] = company.Name;
        }
        return company;
    }

    //private void GoToPage(bool isShowWizard, int companyId, User.un_co_user_detailsRow user)
    //{
    //    if (isShowWizard)
    //    {
    //        Session[WebConstants.Session.REG_CO_ID] = companyId;
    //        Session[WebConstants.Session.REG_USER_ID] = user.user_id;
    //        DepartmentTableAdapters.DepartmentSelectCommandTableAdapter deptTA = new DepartmentTableAdapters.DepartmentSelectCommandTableAdapter();
    //        IEnumerator ieDept = deptTA.GetDepartmentsByCoId(companyId).GetEnumerator();
    //        if (ieDept.MoveNext())
    //        {
    //            Department.DepartmentSelectCommandRow department = (Department.DepartmentSelectCommandRow)ieDept.Current;
    //            Session[WebConstants.Session.REG_DEPT_ID] = department.dept_id;
    //        }
    //        Response.Redirect("~/Register/AddCompany.aspx");
    //    }
        
    //}

}
