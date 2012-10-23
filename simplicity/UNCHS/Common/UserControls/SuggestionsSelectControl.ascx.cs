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

public class SuggestionAddedEventArgs : EventArgs
{
    private string suggestionText;
    public string SuggestionText
    {
        get { return suggestionText; }
        set { suggestionText = value; }
    }
}
public partial class Common_UserControls_SuggestionsSelectControl : AuthenticatedUserControl
{
    public delegate void SuggestionAddedEventHandler(object sender, SuggestionAddedEventArgs e);

    public event SuggestionAddedEventHandler SuggestionAdded;
    public event System.EventHandler AdditionComplete;

    Dictionary<string, List<Suggestions.SuggestionEntityRow>> categories = new Dictionary<string, List<Suggestions.SuggestionEntityRow>>();
    string suggestionType;
    public string SuggestionType
    {
        get { return suggestionType; }
        set { suggestionType = value; }
    }

    private string imageName;
    public string ImageName
    {
        get { return imageName; }
        set { imageName = value; }
    }

    string entityName;
    public string EntityName
    {
        get { return entityName; }
        set { entityName = value; }
    }

    int departmentId;
    public int DepartmentId
    {
        get { return departmentId; }
        set { departmentId = value; }
    }
    object dataSource;
    public object DataSource
    {
        get { return dataSource; }
        set { dataSource = value; }
    }

    string dataTextField;
    public string DataTextField
    {
        get { return dataTextField; }
        set { dataTextField = value; }
    }

    private bool isPresent(string suggestionText)
    {
        foreach (DataRow dataRow in ((DataTable)dataSource).Rows)
        {
            if (dataRow[dataTextField].ToString().ToLower().Equals(suggestionText.ToLower()))
            {
                return true;
            }
        }
        return false;
    }

    public override void DataBind()
    {
        SuggestionsTableAdapters.SuggestionTableAdapter suggestionTA = new SuggestionsTableAdapters.SuggestionTableAdapter();
        IEnumerator iEnum = suggestionTA.GetSuggestionsByType(loggedInUserCoId, departmentId, suggestionType).GetEnumerator();
        while (iEnum.MoveNext())
        {
            Suggestions.SuggestionEntityRow suggestion = (Suggestions.SuggestionEntityRow)iEnum.Current;
            if (isPresent(suggestion.suggestion_text) == false)
            {
                if (categories.ContainsKey(suggestion.category_name) == false)
                {
                    categories.Add(suggestion.category_name, new List<Suggestions.SuggestionEntityRow>());
                }
                List<Suggestions.SuggestionEntityRow> hazards = categories[suggestion.category_name];
                hazards.Add(suggestion);
            }
        }
        rptSuggestions.DataSource = categories.Keys;
        rptSuggestions.DataBind();
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        imageName=imageName.Replace('_', ' ');
        btnAddSuggestions.Text= imageName ;        
//        Add_Sequence_of_work_rol_sel
        //btnAddSuggestions.Attributes["onmouseover"] = "this.src='../Images/" + imageName + "_roll_sel.gif'";
   //     btnAddSuggestions.Attributes["onmouseout"] = "this.src='../Images/" + imageName + ".gif'";
    }
    protected void rptSuggestions_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        CheckBoxList cbSuggestions = e.Item.FindControl("cbSuggestions") as CheckBoxList;
        cbSuggestions.Items.Clear();
        HiddenField categoryName = e.Item.FindControl("hfCategoryName") as HiddenField;
        if (categories.ContainsKey(categoryName.Value))
        {
            foreach (Suggestions.SuggestionEntityRow suggestion in categories[categoryName.Value])
            {
                cbSuggestions.Items.Add(new ListItem(suggestion.suggestion_text,suggestion.suggestion_id.ToString()));
            }
        }
    }
    protected void btnAddSuggestions_Click(object sender, EventArgs e)
    {
        foreach (RepeaterItem repeaterItem in rptSuggestions.Items)
        {
            CheckBoxList cbSuggestions = repeaterItem.FindControl("cbSuggestions") as CheckBoxList;
            foreach (ListItem listItem in cbSuggestions.Items)
            {
                if (listItem.Selected)
                {
                    SuggestionAddedEventArgs suggestionAddedEventArgs = new SuggestionAddedEventArgs();
                    suggestionAddedEventArgs.SuggestionText = listItem.Text;
                    this.SuggestionAdded(this, suggestionAddedEventArgs);
                }
            }
        }
        this.AdditionComplete(this, new EventArgs());
    }
}
