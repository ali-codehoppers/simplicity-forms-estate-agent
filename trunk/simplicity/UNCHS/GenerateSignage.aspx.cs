using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class GenerateSignage : AuthenticatedPage
{
    protected override void Page_Load_Extended(object sender, EventArgs e)
    {
        
    }
    protected void btnGenerate_Click(object sender, EventArgs e)
    {
        DepartmentOrderDoc.DocumentTypeEntityRow docType = DatabaseUtility.GetDocumentType(loggedInUserCoId, int.Parse(ddlDepartments.SelectedValue), "Signage");
        if (docType != null)
        {
            DocumentType docTypeObject = new DocumentType();
            docTypeObject.CoId = loggedInUserCoId;
            docTypeObject.DeptId = int.Parse(ddlDepartments.SelectedValue);
            docTypeObject.GeneratorClass = docType.generator_class;
            docTypeObject.Id = docType.doc_data_type_id;
            docTypeObject.IncludeBlankPage = false;
            docTypeObject.IsLandScape = false;
            if (docType.Isflg_landscapeNull() == false) docTypeObject.IsLandScape = docType.flg_landscape;
            docTypeObject.Name = docType.doc_data_type_desc;
            docTypeObject.Number = 0;
            docTypeObject.Type = docType.field_type;
            foreach (GridViewRow gr in gvDocs.Rows)
            {
                CheckBox cb = (CheckBox)gr.FindControl("cbSelect");
                HiddenField hfDocId = (HiddenField)gr.FindControl("hfDocId");
                HiddenField hfDocName = (HiddenField)gr.FindControl("hfDocName");
                if (cb.Checked)
                {
                    docTypeObject.DocList.Add(int.Parse(hfDocId.Value), hfDocName.Value);
                }
            }
            if (docTypeObject.DocList.Count == 0)
            {
                SetErrorMessage("No document selected");
            }
            else
            {
                List<DocumentType> docTypes = new List<DocumentType>();
                docTypes.Add(docTypeObject);
                FolderGenerator folderGenerator = new FolderGenerator(docTypes);
                if (folderGenerator.Generate())
                {
                    string completePath = "~/Folders/" + folderGenerator.fileName;
                    ClientScript.RegisterStartupScript(this.GetType(), "redirect", "window.open(\"Folders/" + folderGenerator.fileName + "\");", true);
                    hlDoc.Visible = true;
                    hlDoc.NavigateUrl = completePath;
                }
                else
                {
                    SetErrorMessage(WebConstants.Messages.Error.DOC_NOT_GENERATED);
                }
            }
        }
        else
        {
            SetErrorMessage("Document Type not found for selected Department");
        }

    }
}
