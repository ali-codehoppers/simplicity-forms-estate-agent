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

public partial class Maintenance_DocumentTypeList : AdminPage
{
    protected override void AdminPageHandling(object sender, EventArgs e)
    {
        
    }
    protected void btnTransfer_Click(object sender, EventArgs e)
    {
        if (ddlTransferDeparment.SelectedValue == ddlDepartment.SelectedValue)
        {
            SetErrorMessage("Source and Target Departments are the same");
            return;
        }
        int targetCoId = int.Parse(ddlTransferCompany.SelectedValue);
        int targetDeptId = int.Parse(ddlTransferDeparment.SelectedValue);

        int sourceCoId = int.Parse(ddlCompany.SelectedValue);
        int sourceDeptId = int.Parse(ddlDepartment.SelectedValue);
        bool isInserted = false;
        foreach (GridViewRow gr in gvDocTypes.Rows)
        {
            CheckBox cb = (CheckBox)gr.FindControl("cbSelect");
            if (cb.Checked)
            {
                int docTypeId = int.Parse(((HiddenField)gr.FindControl("hfDocTypeId")).Value);
                DepartmentOrderDoc.DocumentTypeEntityRow documentType = DatabaseUtility.GetDocumentType(sourceCoId, sourceDeptId, docTypeId);
                if (documentType != null)
                {
                    DepartmentOrderDocTableAdapters.DocumentTypeTableAdapter docTypeTA = new DepartmentOrderDocTableAdapters.DocumentTypeTableAdapter();
                    IEnumerator ie = docTypeTA.GetDocTypeByDeptId(targetDeptId, targetCoId).GetEnumerator();
                    bool alreadyExists = false;
                    while (ie.MoveNext())
                    {
                        DepartmentOrderDoc.DocumentTypeEntityRow targetDocType = (DepartmentOrderDoc.DocumentTypeEntityRow)ie.Current;
                        if (targetDocType.doc_data_type_desc == documentType.doc_data_type_desc)
                        {
                            SetErrorMessage(WebConstants.Messages.Error.ALREAD_EXISTS);
                            alreadyExists = true;
                            break;
                        }
                    }
                    if (alreadyExists == false)
                    {
                        Nullable<bool> flgLandscape = null;
                        if (documentType.Isflg_landscapeNull() == false) flgLandscape = documentType.flg_landscape;
                        Nullable<int> numOfSections = null;
                        if (documentType.Isnum_of_sectionsNull() == false) numOfSections = documentType.num_of_sections;


                        docTypeTA.DocumentTypeInsert(documentType.doc_data_type_desc, false, targetCoId, targetDeptId, documentType.sort_order,
                            (documentType.Isfield_typeNull()) ? null : documentType.field_type, (documentType.Isgenerator_classNull()) ? null : documentType.generator_class,
                            documentType.required, (documentType.IsstyleNull()) ? null : documentType.style, flgLandscape,
                            numOfSections, documentType.flg_checked, (documentType.IscategoryNull()) ? null : documentType.category);
                        isInserted = true;

                        if (cbTransferDocs.Checked)
                        {
                            DepartmentOrderDoc.DocumentTypeEntityRow targetDocType = DatabaseUtility.GetDocumentType(targetCoId, targetDeptId, documentType.doc_data_type_desc);
                            if (targetDocType != null)
                            {
                                //insert templates section
                                DocumentTemplateTableAdapters.DocumentSectionTableAdapter sectionTA = new DocumentTemplateTableAdapters.DocumentSectionTableAdapter();
                                IEnumerator ieSections = sectionTA.GetByDocType(sourceCoId, sourceDeptId, docTypeId).GetEnumerator();
                                while (ieSections.MoveNext())
                                {
                                    DocumentTemplate.DocumentSectionEntityRow sourceSection = (DocumentTemplate.DocumentSectionEntityRow)ieSections.Current;
                                    DocumentTemplate.DocumentSectionEntityRow targetSection = DatabaseUtility.GetSection(targetCoId, targetDeptId, sourceSection.section_desc);
                                    if (targetSection == null)
                                    {
                                        sectionTA.Insert(false, targetCoId, targetDeptId, sourceSection.section_index, sourceSection.section_desc, sourceSection.section_type,
                                            targetDocType.doc_data_type_id, sourceSection.repeat_columns);
                                        targetSection = DatabaseUtility.GetSection(targetCoId, targetDeptId, sourceSection.section_desc);
                                    }
                                    //insert section details for the sections for which it exists
                                    DocumentTemplateTableAdapters.DocumentSectionDetailsTableAdapter sectionDetailTA = new DocumentTemplateTableAdapters.DocumentSectionDetailsTableAdapter();
                                    IEnumerator ieSectionDetails = sectionDetailTA.GetBySecId(sourceCoId, sourceDeptId, sourceSection.section_id).GetEnumerator();
                                    while (ie.MoveNext())
                                    {
                                        DocumentTemplate.DocumentSectionDetailsEntityRow sourceSectionDetail = (DocumentTemplate.DocumentSectionDetailsEntityRow)ieSectionDetails.Current;
                                        DocumentTemplate.DocumentSectionDetailsEntityRow targetSectionDetail = DatabaseUtility.GetSectionDetail(targetCoId, targetDeptId, targetSection.section_id, sourceSectionDetail.section_detail_desc);
                                        if (targetSectionDetail == null)
                                        {
                                            sectionDetailTA.Insert(targetSection.section_id, targetCoId, targetDeptId, sourceSectionDetail.section_detail_index, sourceSectionDetail.section_detail_desc);
                                        }
                                    }
                                }                                
                                //insert docs
                                DepartmentOrderDocTableAdapters.DocumentTableAdapter docTA = new DepartmentOrderDocTableAdapters.DocumentTableAdapter();
                                IEnumerator ieDocs = docTA.GetDocsByTypeId(sourceCoId, sourceDeptId, docTypeId).GetEnumerator();
                                {
                                    DepartmentOrderDoc.DocumentEntityRow sourceDocument = (DepartmentOrderDoc.DocumentEntityRow)ieDocs.Current;
                                    DepartmentOrderDoc.DocumentEntityRow targetDocument = DatabaseUtility.GetDocument(targetCoId, targetDeptId, targetDocType.doc_data_type_id, sourceDocument.doc_name);
                                    if (targetDocument == null)
                                    {
                                        Categories.CategoryEntityRow targetCategory = DatabaseUtility.GetCategory(targetCoId, targetDeptId, "D", sourceDocument.category_name);
                                        if (targetCategory == null)
                                        {
                                            CategoriesTableAdapters.CategoryTableAdapter catTA = new CategoriesTableAdapters.CategoryTableAdapter();
                                            catTA.Insert(targetCoId, targetDeptId, sourceDocument.category_name, "D");
                                            targetCategory = DatabaseUtility.GetCategory(targetCoId, targetDeptId, "D", sourceDocument.category_name);
                                        }
                                        byte[] fileContents = null;

                                        //get fille contents if they are present
                                        DepartmentOrderDocTableAdapters.DocumentContentTableAdapter docContentTA = new DepartmentOrderDocTableAdapters.DocumentContentTableAdapter();
                                        IEnumerator iEDocContents = docContentTA.GetDocumentContentById(sourceDocument.doc_id, sourceCoId, sourceDeptId).GetEnumerator();
                                        if (iEDocContents.MoveNext())
                                        {
                                            fileContents = ((DepartmentOrderDoc.DocumentContentEntityRow)iEDocContents.Current).file_contents;
                                        }
                                        
                                        docTA.Insert1(targetCoId, targetDeptId, targetDocType.doc_data_type_id, sourceDocument.doc_name, sourceDocument.doc_desc, sourceDocument.doc_code,
                                            targetCategory.category_id, sourceDocument.doc_index, fileContents,sourceDocument.flg_default);

                                    }
                                }

                                //insert template items
                            }
                        }
                    }
                }
            }
        }
        if (isInserted)
        {
            ddlCompany.SelectedValue = ddlTransferCompany.SelectedValue;
            ddlDepartment.DataBind();
            ddlDepartment.SelectedValue = ddlTransferDeparment.SelectedValue;
            gvDocTypes.DataBind();
            SetInfoMessage(WebConstants.Messages.Information.RECORD_SAVED);
        }
    }
    protected void ddlTransferCompany_SelectedIndexChanged(object sender, EventArgs e)
    {
        ClientScript.RegisterClientScriptBlock(this.GetType(), "LoadDialog", "<script>YAHOO.util.Event.onDOMReady(showTransferDialog);</script>");
    }

/*    protected void btnAdd_Click(object sender, EventArgs e)
    {
        DepartmentOrderDocTableAdapters.DocumentTypeTableAdapter ta = new DepartmentOrderDocTableAdapters.DocumentTypeTableAdapter();
        ta.Insert1(tbDesc.Text, false, loggedInUserCoId, int.Parse(ddlDepartment.SelectedValue), byte.Parse(tbSortOrder.Text), "Signage",
            "SignageGenerator", cbReqd.Checked, tbStyle.Text, false, 0, false, fileContents.FileBytes);
        SetInfoMessage(WebConstants.Messages.Information.RECORD_SAVED);
    }
    */
}
