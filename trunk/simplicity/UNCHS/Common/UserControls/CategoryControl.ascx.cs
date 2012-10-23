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

public partial class Common_UserControls_CategoryControl : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    
    public string CategoryType
    {
        get { return hfCategoryType.Value; }
        set { hfCategoryType.Value = value; }
    }
    protected void ddlDepartment_DataBound(object sender, EventArgs e)
    {
        switch (ddlDepartment.Items.Count)
        {
            case 0:
                Response.Redirect("~/Maintenance/AddDepartment.aspx");
                break;
            case 1:
                lblDepartment.Visible = false;
                ddlDepartment.Visible = false;
                //deptId = int.Parse(ddlDepartment.SelectedValue);
                break;
            default:
                lblDepartment.Visible = true;
                ddlDepartment.Visible = true;
                break;
        }
    }
    protected void ddlDepartment_SelectedIndexChanged(object sender, EventArgs e)
    {
        gvCategories.DataBind();
    }
    protected void btnAddCategory_Click(object sender, EventArgs e)
    {
        int coId = (int)Session[WebConstants.Session.USER_CO_ID];
        int deptId = int.Parse(ddlDepartment.SelectedValue);
        
        CategoriesTableAdapters.CategoryTableAdapter ta = new CategoriesTableAdapters.CategoryTableAdapter();
        if (ta.GetCategoryByName(deptId, coId, CategoryType, tbCategory.Text, 0).GetEnumerator().MoveNext())
        {
            SetErrorMessage(WebConstants.Messages.Error.ALREAD_EXISTS);
        }
        else
        {
            ta.Insert(coId, deptId, tbCategory.Text, CategoryType);
            gvCategories.DataBind();
        }
    }

    protected void SetErrorMessage(string error)
    {
        SetMessage(error, "lblError");
    }
    protected void SetInfoMessage(string info)
    {
        SetMessage(info, "lblInfo");
    }
    private void SetMessage(string msg, string control)
    {
        Label label = (Label)this.Page.Master.FindControl(control);
        label.Visible = true;
        label.Text = msg;
    }

    protected void gvCategories_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        int categoryId = (int)e.Keys["category_id"];
        string categoryName = (string)e.NewValues["category_name"];
        int deptId = int.Parse(ddlDepartment.SelectedValue);
        int coId = (int)Session[WebConstants.Session.USER_CO_ID];
        CategoriesTableAdapters.CategoryTableAdapter ta = new CategoriesTableAdapters.CategoryTableAdapter();
        if (ta.GetCategoryByName(deptId, coId, CategoryType, categoryName, categoryId).GetEnumerator().MoveNext())
        {
            e.Cancel = true;
            SetErrorMessage(WebConstants.Messages.Error.ALREAD_EXISTS);
        }
    }
}
