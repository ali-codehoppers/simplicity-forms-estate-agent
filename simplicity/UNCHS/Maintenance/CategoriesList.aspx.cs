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


public partial class Maintenance_CategoriesList : AuthenticatedPage
{
    RefCategory category = null;
    SimplicityWebEstateAgentEntities estateAgentDB = null;
    override protected void Page_Load_Extended(object sender, EventArgs e)
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
        estateAgentDB = new SimplicityWebEstateAgentEntities();
        int compId = int.Parse(hfCoId.Value);
        IEnumerable<EstateAgentEntityModel.RefCategory> categories = (from categ in estateAgentDB.RefCategories where categ.CompanySequence == compId && categ.FlgDeleted != true select categ);
        GridView1.DataSource = categories;
        GridView1.DataBind();
    }

    protected void DeleteCategory(int category_id)
    {
        category = getCategory(category_id);
        if (category == null)
        {
            SetErrorMessage(WebConstants.Messages.Error.INVALID_ID);
        }
        else
        {
            try
            {
                //DepartmentTableAdapters.DepartmentSelectCommandTableAdapter tableAdapter = new DepartmentTableAdapters.DepartmentSelectCommandTableAdapter();
                //tableAdapter.DeleteDepartment(int.Parse(department.Rows[0]["dept_id"].ToString()));
                category.FlgDeleted = true;
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
    private RefCategory getCategory(int categoryId)
    {
        RefCategory ct = estateAgentDB.RefCategories.SingleOrDefault(categ => categ.Sequence == categoryId);
        //DepartmentTableAdapters.DepartmentSelectCommandTableAdapter tableAdapter = new DepartmentTableAdapters.DepartmentSelectCommandTableAdapter();
        //DataTable dt = tableAdapter.GetDepartmentByDeptId(departmentId);
        return ct;
    }
    protected void ddlCompanies_SelectedIndexChanged(object sender, EventArgs e)
    {
        hfCoId.Value = ddlCompanies.SelectedValue;
        GridView1.DataBind();
    }

    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        DeleteCategory(int.Parse(categoryId.Value));
        GridView1.DataBind();
        Response.Redirect("~/Maintenance/CategoriesList.aspx");
    }
    protected object GetDeleteButton(object categId)
    {
        return "return deleteCategory(" + categId + ")";
    }

}