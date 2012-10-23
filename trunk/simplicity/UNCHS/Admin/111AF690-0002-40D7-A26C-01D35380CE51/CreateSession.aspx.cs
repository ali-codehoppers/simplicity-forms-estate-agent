using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

public partial class CreateSession : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request["userEmail"] != null && Request["clientIP"] != null && Request["key"] != null && Request["key"].Equals("CC17DEC2-5727-4FA8-937A-C4D3107BBE8B"))
        {
            UserTableAdapters.un_co_user_detailsTableAdapter ta = new UserTableAdapters.un_co_user_detailsTableAdapter();
            IEnumerator ie = ta.GetUserByLogonName(Request["userEmail"], null).GetEnumerator();
            if (ie.MoveNext())
            {
                User.un_co_user_detailsRow user = (User.un_co_user_detailsRow)ie.Current;
                Session[WebConstants.Session.USER_ID] = user.user_id;
                Session[WebConstants.Session.USER_ROLE] = user.role;
                Session[WebConstants.Session.USER_CO_ID] = user.co_id;
                Session[WebConstants.Session.COMPANY_NAME] = user.co_name_short;
                TimeSpan SessTimeOut = new TimeSpan(0, 0, HttpContext.Current.Session.Timeout, 0, 0);
                Cache.Insert(user.user_id.ToString(), Request["clientIP"], null, DateTime.MaxValue, SessTimeOut, System.Web.Caching.CacheItemPriority.NotRemovable, null);
                Company.un_co_detailsRow company = DatabaseUtility.GetCompany(user.co_id);
                if (company != null && company.flg_show_wizard)
                {
                    Session[WebConstants.Session.REG_CO_ID] = company.co_id;
                    Session[WebConstants.Session.REG_USER_ID] = user.user_id;
                    DepartmentTableAdapters.DepartmentSelectCommandTableAdapter deptTA = new DepartmentTableAdapters.DepartmentSelectCommandTableAdapter();
                    IEnumerator ieDept = deptTA.GetDepartmentsByCoId(company.co_id).GetEnumerator();
                    if (ieDept.MoveNext())
                    {
                        Department.DepartmentSelectCommandRow department = (Department.DepartmentSelectCommandRow)ieDept.Current;
                        Session[WebConstants.Session.REG_DEPT_ID] = department.dept_id;
                    }
                    Response.Redirect("~/Register/AddCompany.aspx");
                }
                else
                {
                    Response.Redirect("~/UserHome.aspx");
                }
            }
            else
            {
                Response.Redirect(ConfigurationManager.AppSettings["SCurl"]);
            }
        }
        else
        {
            Response.Redirect(ConfigurationManager.AppSettings["SCurl"]);
        }
    }
}
