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

public partial class Maintenance_DepartmentList : AuthenticatedPage
{
    DataTable department = new DataTable();
    override protected void Page_Load_Extended(object sender, EventArgs e)
    {
        if (loggedInUserRole != WebConstants.Roles.Admin)
        {
            hfCoId.Value = loggedInUserCoId.ToString();
            GridView1.DataBind();
            ddlCompanies.Visible = false;
            lblCompany.Visible = false;
        }
        else
        {
            ddlCompanies.Visible = true;
            lblCompany.Visible = true;
            hfCoId.Value = ddlCompanies.SelectedValue;
            GridView1.DataBind();
        }
    }
    protected void DeleteDepartment(Object sender, CommandEventArgs e)
    {
        int dept_id = int.Parse(e.CommandArgument.ToString());
        
        department = getDepartment(dept_id);
        if (department == null)
        {
            SetErrorMessage(WebConstants.Messages.Error.INVALID_ID);
        }
        else
        {
            try
            {
                DepartmentTableAdapters.DepartmentSelectCommandTableAdapter tableAdapter = new DepartmentTableAdapters.DepartmentSelectCommandTableAdapter();
                tableAdapter.DeleteDepartment(int.Parse(department.Rows[0]["dept_id"].ToString()));
                SetInfoMessage(WebConstants.Messages.Information.RECORD_DELETED);
                GridView1.DataBind();
            }
            catch
            {
                SetErrorMessage(WebConstants.Messages.Error.CONNECTION_ERROR);                
            }
      }
    }
    private DataTable getDepartment(int departmentId)
    {
        DepartmentTableAdapters.DepartmentSelectCommandTableAdapter tableAdapter = new DepartmentTableAdapters.DepartmentSelectCommandTableAdapter();
        DataTable dt = tableAdapter.GetDepartmentByDeptId(departmentId);
        return dt;
    }
    protected void ddlCompanies_SelectedIndexChanged(object sender, EventArgs e)
    {
        hfCoId.Value = ddlCompanies.SelectedValue;
        GridView1.DataBind();
    }
}
