using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using Simplicity.Data;

public partial class Register_ForTrial : GenericPage
{

    protected void Page_Load(object sender, EventArgs e)
    {
        Process();
    }

    private void Process()
    {
        if (User.Identity.IsAuthenticated)
        {
            SimplicityEntities databaseContext = new SimplicityEntities();
            Simplicity.Data.Session session = (from ses in databaseContext.Sessions where ses.SessionUID == User.Identity.Name select ses).FirstOrDefault();

            UserTableAdapters.un_co_user_detailsTableAdapter userTa = new UserTableAdapters.un_co_user_detailsTableAdapter();
            IEnumerator<User.un_co_user_detailsRow> users = userTa.GetBySimplicityID(session.User.UserID).GetEnumerator();
            if (users.MoveNext())
            {
                Session[WebConstants.Session.SIMPLICITY_USER_ID] = session.User.UserID;
                Session[WebConstants.Session.USER_ID] = users.Current.user_id;
                Session[WebConstants.Session.USER_ROLE] = WebConstants.Roles.User;
                if (session.User.Company != null)
                {
                    Session[WebConstants.Session.SIMPLICITY_COMPANY_ID] = session.User.Company.CompanyID;
                    CompanyTableAdapters.un_co_detailsTableAdapter ta = new CompanyTableAdapters.un_co_detailsTableAdapter();
                    IEnumerator<Company.un_co_detailsRow> companies = ta.GetBySimplicityID(session.User.Company.CompanyID).GetEnumerator();
                    if (companies.MoveNext())
                    {
                        Session[WebConstants.Session.USER_CO_ID] = companies.Current.co_id;
                        Session[WebConstants.Session.COMPANY_NAME] = companies.Current.co_name_long;
                        if (companies.Current.flg_show_wizard)
                        {
                            Session[WebConstants.Session.REG_CO_ID] = companies.Current.co_id;
                            Session[WebConstants.Session.REG_USER_ID] = users.Current.user_id;
                            Session[WebConstants.Session.REGISTERING_FOR_TRIAL] = 1;
                            DepartmentTableAdapters.DepartmentSelectCommandTableAdapter deptTA = new DepartmentTableAdapters.DepartmentSelectCommandTableAdapter();
                            IEnumerator ieDept = deptTA.GetDepartmentsByCoId(companies.Current.co_id).GetEnumerator();
                            if (ieDept.MoveNext())
                            {
                                Department.DepartmentSelectCommandRow department = (Department.DepartmentSelectCommandRow)ieDept.Current;
                                Session[WebConstants.Session.REG_DEPT_ID] = department.dept_id;
                            }
                            Response.Redirect("~/Register/AddCompany.aspx");
                        }
                        else
                        {
                            Response.Redirect(AppSettings["SimplicityErrorURL"] + "?" + "message" + "=Trial version is not available. For further assistance please contact administrator.");
                        }

                    }
                    else
                    {
                        Response.Redirect(AppSettings["SimplicityErrorURL"] + "?" + "message" + "=You have no company assigned. Please contact administrator");
                    }
                }
                else
                {
                    Response.Redirect(AppSettings["SimplicityErrorURL"] + "?" + "message" + "=You have no company assigned. Please contact administrator");
                }
            }
            else
            {
                Response.Redirect(AppSettings["SimplicityErrorURL"] + "?" + "message" + "=No user found in Health and Safety for Simplicity user. Please contact administrator");
            }
        }
        else
        {
            //Response.Redirect("~/Login.aspx" + "?" + WebConstants.Request.SESSION_EXPIRED + "=true&GOTO_URL=" + Request.Url);
            Response.Redirect(AppSettings["SCurl"] + "/CustomerLogin.aspx" + "?" + WebConstants.Request.SESSION_EXPIRED + "=true&GOTO_URL=" + Request.Url);
        }
    }
}