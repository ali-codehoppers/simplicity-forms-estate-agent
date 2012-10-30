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

public partial class Maintenance_AddCategories : AuthenticatedPage
{
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
        if (Request[WebConstants.Request.NO_CATEGORY] != null)//to do
        {
            SetErrorMessage(WebConstants.Messages.Error.NO_CATEGORY_DEFINED);
        }
        if (Request[WebConstants.Request.CATEGORY_ID] != null)
        {
            if (IsPostBack == false)
            {
                SimplicityWebEstateAgentEntities estateAgentDB = new SimplicityWebEstateAgentEntities();
                int categId = int.Parse(Request[WebConstants.Request.CATEGORY_ID]);
                EstateAgentEntityModel.RefCategory category = estateAgentDB.RefCategories.SingleOrDefault(categ => categ.Sequence == categId);
                if (category != null)
                {
                    ddlCompany.SelectedValue = category.CompanySequence.ToString();
                    ddlCompany.Enabled = false;
                    txtCategoryDescription.Text = category.CategoryDesc;
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
            int categoryId = int.Parse(Request[WebConstants.Request.CATEGORY_ID]);
            EstateAgentEntityModel.RefCategory category = estateAgentDB.RefCategories.SingleOrDefault(categ => categ.Sequence == categoryId);

            category.DateLastAmended = System.DateTime.Now;
            category.LastAmendedBy = loggedInUserId;
            category.CategoryDesc = txtCategoryDescription.Text;

            estateAgentDB.SaveChanges();
            Response.Redirect("CategoriesList.aspx");
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
            EstateAgentEntityModel.RefCategory category = new RefCategory();

            category.CompanySequence = loggedInUserCoId;
            category.CreatedBy = loggedInUserId;
            category.DateCreated = System.DateTime.Now;
            category.LastAmendedBy = loggedInUserId;
            category.DateLastAmended = System.DateTime.Now;
            category.CategoryDesc = txtCategoryDescription.Text;
            category.FlgDeleted = false;

            IEnumerable<EstateAgentEntityModel.RefCategory> categories = (from categ in estateAgentDB.RefCategories where categ.CompanySequence == loggedInUserCoId select categ);
            category.RowIndex = (categories.Count() + 1);

            estateAgentDB.RefCategories.AddObject(category);
            estateAgentDB.SaveChanges();
            Response.Redirect("CategoriesList.aspx");

            //DepartmentTableAdapters.DepartmentSelectCommandTableAdapter dep_Adapter = new DepartmentTableAdapters.DepartmentSelectCommandTableAdapter();
            //DataTable dt = dep_Adapter.GetDepartmentByShortName(txtCompanyShortName.Text, loggedInUserCoId);
            //if (dt.Rows.Count == 0)
            //{
            //    int coId = 0;
            //    if (loggedInUserRole == WebConstants.Roles.Admin)
            //    {
            //        coId = int.Parse(ddlCompany.SelectedValue);
            //    }
            //    else
            //    {
            //        coId = loggedInUserCoId;
            //    }

            //}
            //else
            //{
            //    SetErrorMessage(WebConstants.Messages.Error.ALREAD_EXISTS);
            //}
        }
        catch (Exception exc)
        {
            SetErrorMessage(WebConstants.Messages.Error.CONNECTION_ERROR);
        }

    }
}