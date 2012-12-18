using System;
using System.Data;
using System.Linq;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Collections.Generic;
using EstateAgentEntityModel;

public partial class Maintenance_DepartmentList : AuthenticatedPage
{
    RefDepartment department = null;
    SimplicityWebEstateAgentEntities estateAgentDB = null;
    override protected void Page_Load_Extended(object sender, EventArgs e)
    {
        estateAgentDB = new SimplicityWebEstateAgentEntities();
        if (!IsPostBack)
        {
            Simplicity.Data.SimplicityEntities simplicityDB = new Simplicity.Data.SimplicityEntities();
            int prodId = int.Parse(AppSettings["EAProductIDInSimplicity"]);
            IEnumerable<Simplicity.Data.Company> companies = (from comp in simplicityDB.CompanyProducts where comp.ProductID == prodId select comp.Company);
            ddlCompanies.DataSource = companies;
            ddlCompanies.DataBind();

            if (loggedInUserRole != WebConstants.Roles.Admin)
            {
                hfCoId.Value = loggedInUserCoId.ToString();
                ddlCompanies.Visible = false;
                lblCompany.Visible = false;
            }
            else
            {
                ddlCompanies.Visible = true;
                lblCompany.Visible = true;
                hfCoId.Value = ddlCompanies.SelectedValue;
            }

            int compId = int.Parse(hfCoId.Value);
            IEnumerable<EstateAgentEntityModel.RefDepartment> departments = (from dept in estateAgentDB.RefDepartments where dept.CompanySequence == compId && dept.FlgDeleted != true select dept);
            GridView1.DataSource = departments;
            GridView1.DataBind();
        }
    }

    protected void DeleteDepartment(int dept_id)
    {   
        department = getDepartment(dept_id);
        if (department == null)
        {
            SetErrorMessage(WebConstants.Messages.Error.INVALID_ID);
        }
        else
        {
            try
            {
                department.FlgDeleted = true;
                estateAgentDB.SaveChanges();
                SetInfoMessage(WebConstants.Messages.Information.RECORD_DELETED);
                GridView1.DataBind();
            }
            catch
            {
                SetErrorMessage(WebConstants.Messages.Error.CONNECTION_ERROR);                
            }
      }
    }
    private RefDepartment getDepartment(int departmentId)
    {
        
        RefDepartment dt = estateAgentDB.RefDepartments.SingleOrDefault(dept => dept.Sequence == departmentId);
        return dt;
    }
    protected void ddlCompanies_SelectedIndexChanged(object sender, EventArgs e)
    {
        hfCoId.Value = ddlCompanies.SelectedValue;
        GridView1.DataBind();
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        DeleteDepartment(int.Parse(deptId.Value));
        GridView1.DataBind();
        Response.Redirect("~/Maintenance/DepartmentList.aspx");
    }
    protected object GetDeleteButton(object deptId)
    {
        return "return deleteDepartment(" + deptId + ")";
    }
}
