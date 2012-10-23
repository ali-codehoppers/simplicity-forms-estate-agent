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

public partial class Maintenance_DocumentList : DepartmentPage
{
    protected override void Department_Page_Handling(object sender, EventArgs e)
    {
        if (IsPostBack == false)
        {
            if (loggedInUserRole.Equals(WebConstants.Roles.Admin) == false)
            {
                ddlCompany.SelectedValue = loggedInUserCoId.ToString();
                ddlTransferCompany.SelectedValue = loggedInUserCoId.ToString();
            }
        }
        
    }
    
    protected override void  OnPreRenderComplete(EventArgs e)
    {
        if (loggedInUserRole.Equals(WebConstants.Roles.Admin) == false)
        {
            ddlCompany.Visible = false;
            lblCompany.Visible = false;

            ddlTransferCompany.Visible = false;
            lblTransferCompany.Visible = false;
        }                
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        DepartmentOrderDocTableAdapters.DocumentTableAdapter docTA = new DepartmentOrderDocTableAdapters.DocumentTableAdapter();
        docTA.Insert1(loggedInUserCoId, int.Parse(ddlDepartment.SelectedValue), int.Parse(ddlDocTypes.SelectedValue), tbName.Text, tbName.Text, tbCode.Text,
            int.Parse(ddlCategories.SelectedValue), int.Parse(tbIndex.Text), fileUpload.FileBytes,cbDefault.Checked);
        gvDocs.DataBind();
    }
    protected void btnUpate_Click(object sender, EventArgs e)
    {

    }
    protected void ddlDepartment_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlDocTypes.SelectedItem.Text.Equals("Signage"))
        {
            lblContents.Visible = true;
            fileUpload.Visible = true;
        }
        //gvDocs.DataBind();
    }
    protected void gvDocs_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        if (e.NewValues["doc_code"] == null)
        {
            SetErrorMessage("Document code is required.");
            e.Cancel = true;
            return;
        }
        if (e.NewValues["doc_name"] == null)
        {
            SetErrorMessage("Document Name is required.");
            e.Cancel = true;
            return;
        }
        if (e.NewValues["doc_index"] == null)
        {
            SetErrorMessage("Document index is required.");
            e.Cancel = true;
            return;
        }
    }
    protected void gvDocs_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName.Equals("Detail"))//Command Name
        {
            DepartmentOrderDoc.DocumentEntityRow document = DatabaseUtility.GetDocument(int.Parse(e.CommandArgument.ToString()));
            if (ddlDocTypes.SelectedItem.Text.Equals("Signage"))
            {
                DepartmentOrderDocTableAdapters.DocumentContentTableAdapter ta = new DepartmentOrderDocTableAdapters.DocumentContentTableAdapter();
                IEnumerator ie = ta.GetDocumentContentById(document.doc_id, document.co_id, document.dept_id).GetEnumerator();
                while (ie.MoveNext())
                {
                    DepartmentOrderDoc.DocumentContentEntityRow docContent = (DepartmentOrderDoc.DocumentContentEntityRow)ie.Current;
                    openPDF(docContent.file_contents);
                }
            }
            else
            {
                Response.Redirect("~/Maintenance/DocumentItemList.aspx?" + WebConstants.Request.DEPT_ID + "=" + ddlDepartment.SelectedValue + "&" + WebConstants.Request.DOC_ID + "=" + e.CommandArgument + "&" + WebConstants.Request.DOC_TYPE_ID + "=" + document.doc_type_id);
            }
        }
    }
    protected void openPDF(byte[] data)
    {
        HttpContext contexto = HttpContext.Current;
        contexto.Response.Clear();
        contexto.Response.AppendHeader("content-type", "application/pdf");
        contexto.Response.AppendHeader("Expires", "Mon, 26 Jul 1990 05:00:00 GMT");
        contexto.Response.AppendHeader("Cache-Control", "no-cache, must-revalidate");
        contexto.Response.AppendHeader("Pragma", "no-cache");
        contexto.Response.Expires = -1;
        contexto.Response.AppendHeader("Content-Disposition", "inline; filename=labels.pdf");
        contexto.Response.AddHeader("content-length", data.Length.ToString());
        contexto.Response.OutputStream.Write(data, 0, data.Length);
        contexto.Response.OutputStream.Flush();
        contexto.Response.End();
    }
    protected void ddlTransferCompany_SelectedIndexChanged(object sender, EventArgs e)
    {
        ClientScript.RegisterClientScriptBlock(this.GetType(), "LoadDialog", "<script>YAHOO.util.Event.onDOMReady(showTransferDialog);</script>");
    }
    //TODO: The transfer should be in one transaction. 
    protected void btnTransfer_Click(object sender, EventArgs e)
    {
        if (ddlTransferDeparment.SelectedValue == ddlDepartment.SelectedValue)
        {
            SetErrorMessage("Source and Target Departments are the same");
            return;
        }
        int targetCoId = int.Parse(ddlTransferCompany.SelectedValue);
        int targetDeptId = int.Parse(ddlTransferDeparment.SelectedValue);
        foreach (GridViewRow gr in gvDocs.Rows)
        {
            CheckBox cb = (CheckBox)gr.FindControl("cbSelect");
            HiddenField hfDocId = (HiddenField)gr.FindControl("hfDocId");
            if (cb.Checked)
            {
                DepartmentOrderDoc.DocumentEntityRow document = DatabaseUtility.GetDocument(int.Parse(hfDocId.Value));
                DepartmentOrderDoc.DocumentTypeEntityRow documentType = DatabaseUtility.GetDocumentType(document.co_id, document.dept_id, document.doc_type_id);

                //see if the document type exists in the target co and dept. If not then create it
                DepartmentOrderDoc.DocumentTypeEntityRow targetDocumentType = DatabaseUtility.GetDocumentType(targetCoId,targetDeptId, documentType.doc_data_type_desc);
                if (targetDocumentType == null)
                {
                    DepartmentOrderDocTableAdapters.DocumentTypeTableAdapter docTypeTA = new DepartmentOrderDocTableAdapters.DocumentTypeTableAdapter();
                    docTypeTA.Insert1(documentType.doc_data_type_desc, false, targetCoId, targetDeptId, documentType.sort_order, documentType.field_type, documentType.generator_class,
                        documentType.required, documentType.style, documentType.flg_landscape, documentType.num_of_sections, documentType.flg_checked);
                    targetDocumentType = DatabaseUtility.GetDocumentType(targetCoId, targetDeptId, documentType.doc_data_type_desc);
                }

                //see if the category exists in the target co and dept. If not then create it
                Categories.CategoryEntityRow targetCategory = DatabaseUtility.GetCategory(targetCoId, targetDeptId, "D", document.category_name);
                if (targetCategory == null)
                {
                    CategoriesTableAdapters.CategoryTableAdapter catTA = new CategoriesTableAdapters.CategoryTableAdapter();
                    catTA.Insert(targetCoId, targetDeptId, document.category_name, "D");
                    targetCategory = DatabaseUtility.GetCategory(targetCoId, targetDeptId, "D", document.category_name);
                }
                byte[] fileContents = null;

                //get fille contents if they are present
                DepartmentOrderDocTableAdapters.DocumentContentTableAdapter docContentTA = new DepartmentOrderDocTableAdapters.DocumentContentTableAdapter();
                IEnumerator iEDocContents = docContentTA.GetDocumentContentById(document.doc_id, document.co_id, document.dept_id).GetEnumerator();
                if (iEDocContents.MoveNext())
                {
                    fileContents = ((DepartmentOrderDoc.DocumentContentEntityRow)iEDocContents.Current).file_contents;
                }

                DepartmentOrderDocTableAdapters.DocumentTableAdapter docTA = new DepartmentOrderDocTableAdapters.DocumentTableAdapter();
                docTA.Insert1(targetCoId, targetDeptId, targetDocumentType.doc_data_type_id, document.doc_name, document.doc_desc, document.doc_code,
                    targetCategory.category_id, document.doc_index, fileContents,document.flg_default);

                
            }
        }
        SetInfoMessage(WebConstants.Messages.Information.RECORD_SAVED);
    }

}
