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

public partial class Maintenance_RelatedDocumentList : System.Web.UI.Page//: AuthenticatedPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack == false)
        {
            gvDocs.DataBind();
            if (Request[WebConstants.Request.DOC_ID] != null)
            {
                DepartmentOrderDoc.DocumentEntityRow document = DatabaseUtility.GetDocument(int.Parse(Request[WebConstants.Request.DOC_ID]));
                if (document != null)
                {
                    if (document.Isrelated_doc_codesNull() == false && document.related_doc_codes.Length > 0)
                    {
                        string[] seperator = new string[1];
                        seperator[0] = ",";
                        string[] docCodes = document.related_doc_codes.Split(seperator, StringSplitOptions.RemoveEmptyEntries);
                        foreach (string docCode in docCodes)
                        {
                            foreach (GridViewRow grRow in gvDocs.Rows)
                            {
                                if (grRow.RowType == DataControlRowType.DataRow)
                                {
                                    Label docCodeLabel = (Label)grRow.FindControl("lblDocCode");
                                    if (docCodeLabel != null && docCodeLabel.Text.Equals(docCode))
                                    {
                                        CheckBox cbSelect = (CheckBox)grRow.FindControl("cbSelect");
                                        cbSelect.Checked = true;
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }

    protected void gvDocs_DataBound(object sender, EventArgs e)
    {
        foreach (GridViewRow grRow in gvDocs.Rows)
        {
            if (grRow.RowType == DataControlRowType.DataRow)
            {
                HiddenField hfDocId = (HiddenField)grRow.FindControl("hfDocId");
                if (hfDocId != null && Request[WebConstants.Request.DOC_ID] != null && hfDocId.Value.Equals(Request[WebConstants.Request.DOC_ID]))
                {
                    grRow.Visible = false;
                }
            }
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (Request[WebConstants.Request.DOC_ID] != null)
        {
            string docCodes = "";
            foreach (GridViewRow grRow in gvDocs.Rows)
            {
                if (grRow.RowType == DataControlRowType.DataRow)
                {
                    CheckBox cbSelect = (CheckBox)grRow.FindControl("cbSelect");
                    if (cbSelect != null && cbSelect.Checked == true)
                    {
                        Label docCodeLabel = (Label)grRow.FindControl("lblDocCode");
                        if (docCodeLabel != null)
                        {
                            if (docCodes.Length > 0)
                            {
                                docCodes += ",";
                            }
                            docCodes += docCodeLabel.Text;
                        }
                    }

                }
            }
            if (docCodes.Length == 0) docCodes = null;
            DepartmentOrderDocTableAdapters.DocumentTableAdapter docTA = new DepartmentOrderDocTableAdapters.DocumentTableAdapter();
            docTA.UpdateRelatedDocCodes(docCodes, int.Parse(Request[WebConstants.Request.DOC_ID]));
        }
    }
}
