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
using System.Text;
using EstateAgentEntityModel;
using System.Collections.Generic;

public partial class Maintenance_AddDepartment : AuthenticatedPage
{
    //DataTable dt;
    int dept_id;
    override protected void Page_Load_Extended(object sender, EventArgs e)
    {
        Simplicity.Data.SimplicityEntities simplicityDB = new Simplicity.Data.SimplicityEntities();
        int prodId = int.Parse(AppSettings["EAProductIDInSimplicity"]);
        IEnumerable<Simplicity.Data.Company> companies = (from comp in simplicityDB.CompanyProducts where comp.ProductID == prodId select comp.Company);
        ddlCompany.DataSource = companies;
        ddlCompany.DataBind();
        if (loggedInUserRole != WebConstants.Roles.Admin)
        {
            ddlCompany.SelectedValue = loggedInUserCoId.ToString();
            lblCompany.Visible = false;
            ddlCompany.Visible = false;
        }
        if (Request[WebConstants.Request.NO_DEPT] != null)
        {
            SetErrorMessage(WebConstants.Messages.Error.NO_DEPT_DEFINED);
        }
        if (Request[WebConstants.Request.DEPT_ID] != null)
        {
            if (IsPostBack == false)
            {
                SimplicityWebEstateAgentEntities estateAgentDB = new SimplicityWebEstateAgentEntities();
                int deptId = int.Parse(Request[WebConstants.Request.DEPT_ID]);
                EstateAgentEntityModel.RefDepartment department = estateAgentDB.RefDepartments.SingleOrDefault(dept => dept.Sequence == deptId);
                if (department != null)
                {
                    ddlCompany.SelectedValue = department.CompanySequence.ToString();
                    ddlCompany.Enabled = false;
                    txtDeptDescription.Text = department.DepartmentDesc;
                    btnUpdate.Visible = true;
                    btnSave.Visible = false;
                }
                else
                {
                    SetErrorMessage(WebConstants.Messages.Error.INVALID_ID);
                }
            }
        }
        else
        {
            btnUpdate.Visible = false;
            btnSave.Visible = true;
        }
    }
    protected void btnSave_Update_Click(object sender, EventArgs e)
    {
    }
    
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        try
        {
            SimplicityWebEstateAgentEntities estateAgentDB = new SimplicityWebEstateAgentEntities();
            int deptId = int.Parse(Request[WebConstants.Request.DEPT_ID]);
            EstateAgentEntityModel.RefDepartment department = estateAgentDB.RefDepartments.SingleOrDefault(dept => dept.Sequence == deptId);

            department.DateLastAmended = System.DateTime.Now;
            department.LastAmendedBy = loggedInUserId;
            department.DepartmentDesc = txtDeptDescription.Text;

            estateAgentDB.SaveChanges();
            Response.Redirect("DepartmentList.aspx");
        }
        catch
        {
            SetErrorMessage(WebConstants.Messages.Error.CONNECTION_ERROR);
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        try
        {
            SimplicityWebEstateAgentEntities estateAgentDB = new SimplicityWebEstateAgentEntities();
            EstateAgentEntityModel.RefDepartment department = new RefDepartment();

            department.CompanySequence = loggedInUserCoId;
            department.CreatedBy = loggedInUserId;
            department.DateCreated = System.DateTime.Now;
            department.LastAmendedBy = loggedInUserId;
            department.DateLastAmended = System.DateTime.Now;
            department.DepartmentDesc = txtDeptDescription.Text;
            department.FlgDeleted = false;
            
            IEnumerable<EstateAgentEntityModel.RefDepartment> departments = (from dept in estateAgentDB.RefDepartments where dept.CompanySequence == loggedInUserCoId select dept);
            department.RowIndex = (departments.Count()+1);

            estateAgentDB.RefDepartments.AddObject(department);
            estateAgentDB.SaveChanges();
            Response.Redirect("DepartmentList.aspx");
        }
        catch(Exception exc)
        {
            SetErrorMessage(WebConstants.Messages.Error.CONNECTION_ERROR);
        }

    }

}
