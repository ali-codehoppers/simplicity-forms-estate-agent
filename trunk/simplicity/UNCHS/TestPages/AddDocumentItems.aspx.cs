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

public partial class TestPages_AddDocumentItems : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack == false)
        {
            lblCoId.Text = ConfigurationManager.AppSettings["SourceCompanyId"];
            lblDeptId.Text = ConfigurationManager.AppSettings["SourceDepartmentId"];
            DocumentTemplate.DocumentSectionEntityRow section = DatabaseUtility.GetSection(int.Parse(lblCoId.Text), int.Parse(lblDeptId.Text), "12. RISK ASSESSMENT TOP BE SUPPORTED BY THE FOLLOWING DOCUMENTATION");
            if (section != null)
            {
                lblSectionId.Text = section.section_id.ToString();
            }
            DepartmentOrderDoc.DocumentTypeEntityRow docType = DatabaseUtility.GetDocumentType(int.Parse(lblCoId.Text), int.Parse(lblDeptId.Text), "Risk Assessments");
            if (docType != null)
            {
                lblDocTypeId.Text = docType.doc_data_type_id.ToString();
            }
        }
    }
    protected void tbDocCode_TextChanged(object sender, EventArgs e)
    {
        DepartmentOrderDoc.DocumentEntityRow doc = DatabaseUtility.GetDocument(int.Parse(lblCoId.Text), int.Parse(lblDeptId.Text),
            int.Parse(lblDocTypeId.Text), tbDocName.Text);
        if (doc != null)
        {
            lblDocId.Text = doc.doc_id.ToString();
        }
        else
        {
            tbDocName.Text = "";
            lblDocId.Text = "";
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {

        DocumentTemplateTableAdapters.DocumentItemEntityTableAdapter docItemTA = new DocumentTemplateTableAdapters.DocumentItemEntityTableAdapter();
        DocumentTemplateTableAdapters.DocumentSectionDetailsTableAdapter docSectionTA = new DocumentTemplateTableAdapters.DocumentSectionDetailsTableAdapter();
        byte count = 1;
        foreach (ListItem li in CheckBoxList1.Items)
        {
            if (li.Selected)
            {
                DocumentTemplate.DocumentSectionDetailsEntityRow secDetail = DatabaseUtility.GetSectionDetail(int.Parse(lblCoId.Text),
                    int.Parse(lblDeptId.Text),int.Parse(lblSectionId.Text),li.Text);
                if(secDetail != null)
                {
                    docItemTA.Insert(int.Parse(lblCoId.Text), int.Parse(lblDeptId.Text), int.Parse(lblSectionId.Text), int.Parse(lblDocId.Text), li.Text,
                        count, secDetail.section_detail_id);
                }
            }
            count++;
        }
        //DatabaseUtility.GetSectionDetail(
    }
    
}
