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

public partial class Maintenance_SectionList : DepartmentPage
{
    
    protected override void Department_Page_Handling(object sender, EventArgs e)
    {
        
    }

    protected bool DoShowDetail(object sectionType)
    {
        if(sectionType.ToString().Equals(WebConstants.SectionTypes.MULTIPLE_SELECT_LIST))
        {
            return true;
        }
        return false;
    }

    protected string GetSectionText(object sectionValue)
    {
        if (sectionValue.ToString().Equals(WebConstants.SectionTypes.MULTIPLE_SELECT_LIST))
        {
            return "Multiple Select List";
        }
        return "Free Text";
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        if (ddlType.SelectedValue == WebConstants.SectionTypes.NOT_APPLICABLE)
        {
            SetErrorMessage("Selected Document Type does not allow sections");
            return;
        }
        if (ddlType.SelectedValue == WebConstants.SectionTypes.MULTIPLE_SELECT_LIST && tbNumOfCols.Text.Length == 0)
        {
            SetErrorMessage("Number of Columns is required for Multiple Select Lists");
            return;
        }
        IEnumerator ienum = odsSections.Select().GetEnumerator();
        while (ienum.MoveNext())
        {
            DocumentTemplate.DocumentSectionEntityRow dataRow = (DocumentTemplate.DocumentSectionEntityRow)((DataRowView)ienum.Current).Row;
            if (dataRow.section_desc == tbSec.Text)
            {
                SetErrorMessage(WebConstants.Messages.Error.ALREAD_EXISTS);
                return;
            }
        }
       
        DocumentTemplateTableAdapters.DocumentSectionTableAdapter secTA = new DocumentTemplateTableAdapters.DocumentSectionTableAdapter();
        if (ddlType.SelectedValue == WebConstants.SectionTypes.MULTIPLE_SELECT_LIST)
        {
            secTA.Insert(false, loggedInUserCoId, int.Parse(ddlDepartment.SelectedValue), int.Parse(tbIndex.Text), tbSec.Text, ddlType.SelectedValue,
                int.Parse(ddlDocType.SelectedValue), int.Parse(tbNumOfCols.Text));

        }
        else
        {
            secTA.Insert(false, loggedInUserCoId, int.Parse(ddlDepartment.SelectedValue), int.Parse(tbIndex.Text), tbSec.Text, ddlType.SelectedValue,
                int.Parse(ddlDocType.SelectedValue), null);
        }
        gvSections.DataBind();
    }
    protected void gvSections_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {

        if (e.NewValues["section_desc"] == null)
        {
            SetErrorMessage("Section Name is required.");
            e.Cancel = true;
            return;
        }
        if (e.NewValues["section_index"] == null)
        {
            SetErrorMessage("Section Index is required for ordering.");
            e.Cancel = true;
            return;
        }
        if ((string)e.NewValues["section_type"] == WebConstants.SectionTypes.MULTIPLE_SELECT_LIST && e.NewValues["repeat_columns"] == null)
        {
            SetErrorMessage("Number of Columns is required for Multiple Select Lists");
            e.Cancel = true;
        }
    }
    protected void ddlType_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlType.Items.Clear();
        ddlType.Items.AddRange(WebConstants.SectionTypes.GetSections(ddlDocType.SelectedItem.Text));
    }


    protected void ddlDocType_DataBound(object sender, EventArgs e)
    {
        ddlType.Items.Clear();
        ddlType.Items.AddRange(WebConstants.SectionTypes.GetSections(ddlDocType.SelectedItem.Text));
        SetLabel();
    }

    private void SetLabel()
    {
        lblWarning.Visible = false;
        DepartmentOrderDoc.DocumentTypeEntityRow docType = DatabaseUtility.GetDocumentType(loggedInUserCoId, int.Parse(ddlDepartment.SelectedValue), int.Parse(ddlDocType.SelectedValue));
        if (docType != null)
        {
            if (docType.Isnum_of_sectionsNull() == false)
            {
                lblWarning.Text = "In this section you can only have " + docType.num_of_sections + " " + docType.doc_data_type_desc + " sections.  You are able to Delete, Edit or Add up to and including " + docType.num_of_sections + " sections.";
                lblWarning.Visible = true;
            }
        }
    }
    protected void gvSections_PreRender(object sender, EventArgs e)
    {
        if (this.gvSections.EditIndex != -1)
        {
            if (this.gvSections.Rows.Count > 0)
            {
                DropDownList ddl = this.gvSections.Rows[this.gvSections.EditIndex].FindControl("ddlGridType") as DropDownList;
                if (ddl != null)
                {
                    ddl.Items.Clear();
                    ddl.Items.AddRange(WebConstants.SectionTypes.GetSections(ddlDocType.SelectedItem.Text));
                }
            }
        }
    }
    protected void ddlDocType_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlType.Items.Clear();
        ddlType.Items.AddRange(WebConstants.SectionTypes.GetSections(ddlDocType.SelectedItem.Text)); 
        SetLabel();
    }
}
