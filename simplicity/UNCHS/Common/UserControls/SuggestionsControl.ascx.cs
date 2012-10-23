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
using System.Collections.Generic;


public partial class Common_UserControls_SuggestionsControl : AuthenticatedUserControl
{
    private string categoryType;
    public string CategoryType
    {
        get { return categoryType; }
        set { categoryType = value; }
    }

    private string suggestionType;
    public string SuggestionType
    {
        get { return suggestionType; }
        set { suggestionType = value; }
    }
    
    private string entityName;
    public string EntityName
    {
        get { return entityName; }
        set { entityName = value; }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack == false)
        {
            BindDepartmentDDL();
            btnAdd.Text = "Add " + entityName;
            btnUpate.Text = "Update " + entityName;
        }
    }
    private void BindDepartmentDDL()
    {
        DepartmentTableAdapters.DepartmentSelectCommandTableAdapter departmentTA = new DepartmentTableAdapters.DepartmentSelectCommandTableAdapter();
        ddlDepartment.DataSource = departmentTA.GetDepartmentsByCoId((int)Session[WebConstants.Session.USER_CO_ID]);
        ddlDepartment.DataTextField = "co_name_short";
        ddlDepartment.DataValueField = "dept_id";
        ddlDepartment.DataBind();
    }
    private void BindCategoriesDDL()
    {
        CategoriesTableAdapters.CategoryTableAdapter categoriesTA = new CategoriesTableAdapters.CategoryTableAdapter();
        ddlCategory.DataSource = categoriesTA.GetCategoriesByType(int.Parse(ddlDepartment.SelectedValue), loggedInUserCoId, categoryType);
        ddlCategory.DataTextField = "category_name";
        ddlCategory.DataValueField = "category_id";
        ddlCategory.DataBind();
    }

    private void BindRepeater()
    {
        SuggestionsTableAdapters.SuggestionTableAdapter suggestionTA = new SuggestionsTableAdapters.SuggestionTableAdapter();
        repeater.DataSource = suggestionTA.GetSuggestionsByType(loggedInUserCoId, int.Parse(ddlDepartment.SelectedValue), suggestionType);
        repeater.DataBind();
    }
    protected void ddlDepartment_DataBound(object sender, EventArgs e)
    {
        BindCategoriesDDL();
        BindRepeater();
        if (ddlDepartment.Items.Count <= 1)
        {
            lblDepartment.Visible = false;
            ddlDepartment.Visible = false;
        }
    }
    protected void ddlDepartment_SelectedIndexChanged(object sender, EventArgs e)
    {
        BindCategoriesDDL();
        BindRepeater();
    }

    private Suggestions.SuggestionEntityRow getSuggestion(int suggestionId)
    {
        Suggestions.SuggestionEntityRow dataRow = null;
        SuggestionsTableAdapters.SuggestionTableAdapter tableAdapter = new SuggestionsTableAdapters.SuggestionTableAdapter();
        IEnumerator iEnumerator = tableAdapter.GetSuggestionById(suggestionId).GetEnumerator();
        if (iEnumerator.MoveNext())
        {
            dataRow = (Suggestions.SuggestionEntityRow)iEnumerator.Current;
        }
        return dataRow;
    }

    private bool isValid(int id)
    {
        SuggestionsTableAdapters.SuggestionTableAdapter tableAdapter = new SuggestionsTableAdapters.SuggestionTableAdapter();
        IEnumerator iEnumerator = tableAdapter.GetSuggestionByName(loggedInUserCoId,int.Parse(ddlDepartment.SelectedValue),suggestionType, tbName.Text,id).GetEnumerator();
        if (iEnumerator.MoveNext())
        {
            SetErrorMessage(WebConstants.Messages.Error.ALREAD_EXISTS);
            return false;
        }
        return true;
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        if (isValid(0))
        {
            SuggestionsTableAdapters.SuggestionTableAdapter tableAdapter = new SuggestionsTableAdapters.SuggestionTableAdapter();
            tableAdapter.Insert(loggedInUserCoId, int.Parse(ddlDepartment.SelectedValue),false, int.Parse(ddlCategory.SelectedValue),tbName.Text,suggestionType,cbDefault.Checked);
            BindRepeater();
            SetInfoMessage(WebConstants.Messages.Information.RECORD_SAVED);
        }
        //lbl
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        string[] idList = Request["idOrdering"].Split(',');
        if (idList != null)
        {
            //-i because we have an extra comma at the end
            for (int i = 0; i < idList.Length - 1; i++)
            {
                Suggestions.SuggestionEntityRow dataRow = getSuggestion(int.Parse(idList[i]));
                if (dataRow != null)
                {
                    SuggestionsTableAdapters.SuggestionTableAdapter tableAdapter = new SuggestionsTableAdapters.SuggestionTableAdapter();
                    dataRow.index_seq = i + 1;
                    tableAdapter.Update(dataRow);
                }
            }
        }
        SetInfoMessage(WebConstants.Messages.Information.RECORD_SAVED);
        BindRepeater();
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        hfSuggestionId.Value = "";
        tbName.Text = "";
        cbDefault.Checked = false;
        btnAdd.Visible = true;
        btnUpate.Visible = false;

    }
    protected void btnUpate_Click(object sender, EventArgs e)
    {
        int id = int.Parse(hfSuggestionId.Value);
        if (isValid(id))
        {
            Suggestions.SuggestionEntityRow dataRow = getSuggestion(id);
            if (dataRow != null)
            {
                SuggestionsTableAdapters.SuggestionTableAdapter tableAdapter = new SuggestionsTableAdapters.SuggestionTableAdapter();
                dataRow.suggestion_text = tbName.Text;
                dataRow.flg_default = cbDefault.Checked;
                dataRow.dept_id = int.Parse(ddlDepartment.SelectedValue);
                dataRow.category_id = int.Parse(ddlCategory.SelectedValue);
                tableAdapter.Update(dataRow);
                BindRepeater();
                SetInfoMessage(WebConstants.Messages.Information.RECORD_SAVED);
            }
            btnAdd.Visible = true;
            btnUpate.Visible = false;
            tbName.Text = "";
        }
    }
    protected void repeater_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName.Equals("Edit"))
        {
            Suggestions.SuggestionEntityRow  dataRow = getSuggestion(int.Parse(e.CommandArgument.ToString()));
            if (dataRow != null)
            {
                tbName.Text = dataRow.suggestion_text;
                ddlDepartment.SelectedValue = dataRow.dept_id.ToString();
                ddlCategory.SelectedValue = dataRow.category_id.ToString();
                cbDefault.Checked = dataRow.flg_default;
                btnAdd.Visible = false;
                btnUpate.Visible = true;
                hfSuggestionId.Value = e.CommandArgument.ToString();
            }
        }
        else if (e.CommandName.Equals("Delete"))
        {
            SuggestionsTableAdapters.SuggestionTableAdapter tableAdapter = new SuggestionsTableAdapters.SuggestionTableAdapter();
            tableAdapter.Delete(int.Parse(e.CommandArgument.ToString()));
            BindRepeater();
            SetInfoMessage(WebConstants.Messages.Information.RECORD_DELETED);
        }
    }
}
