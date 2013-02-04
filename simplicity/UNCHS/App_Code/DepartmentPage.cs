using System;
using System.Linq;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Collections;
using EstateAgentEntityModel;
using System.Collections.Generic;

/// <summary>
/// Summary description for DepartmentPage
/// </summary>
public abstract class DepartmentPage : AuthenticatedPage
{
    protected abstract void Department_Page_Handling(object sender, EventArgs e);
    protected int firstDepartmentId;

	public DepartmentPage()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    
    protected override void Page_Load_Extended(object sender, EventArgs e)
    {
        SimplicityWebEstateAgentEntities estateAgentDB = new SimplicityWebEstateAgentEntities();
        IEnumerable<EstateAgentEntityModel.RefDepartment> departments = (from dept in estateAgentDB.RefDepartments where dept.CompanySequence == loggedInUserCoId && dept.FlgDeleted != true select dept);
        if (departments.Count() > 0)
        {
            IEnumerable<EstateAgentEntityModel.RefCategory> categories = (from categ in estateAgentDB.RefCategories where categ.CompanySequence == loggedInUserCoId && categ.FlgDeleted != true select categ);
            if (categories.Count() <= 0)
            {
                Response.Redirect("~/Maintenance/AddCategories.aspx?" + WebConstants.Request.NO_CATEGORY + "=true");
            }
            foreach (var department in departments)
            {
                if (department != null)
                {
                    firstDepartmentId = department.Sequence;
                    Department_Page_Handling(sender, e);
                }
                else
                {
                    Response.Redirect("~/Maintenance/AddDepartment.aspx?" + WebConstants.Request.NO_DEPT + "=true");
                }
                break;
            }
        }
        else {
            Response.Redirect("~/Maintenance/AddDepartment.aspx?" + WebConstants.Request.NO_DEPT + "=true");
        }
    }
}
