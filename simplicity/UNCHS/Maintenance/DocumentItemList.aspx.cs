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

public partial class Maintenance_DocumentItemList : DepartmentPage
{
    protected override void Department_Page_Handling(object sender, EventArgs e)
    {
        if (IsPostBack == false)
        {
            int deptId = int.Parse(Request[WebConstants.Request.DEPT_ID]);
            int docId = int.Parse(Request[WebConstants.Request.DOC_ID]);
            Department.DepartmentSelectCommandRow department = DatabaseUtility.GetDepartment(deptId);
            if (department != null)
            {
                lblDepartment.Text = department.co_name_long;
            }
            DepartmentOrderDoc.DocumentEntityRow docment = DatabaseUtility.GetDocument(docId);
            if (docment != null)
            {
                lblDocName.Text = docment.doc_name;                
            }
        }
    }
    protected bool CompareType(object value,string type)
    {
        if (value.ToString() == type)
        {
            return true;
        }
        return false;
    }
    protected DataTable DataSource(object sectionId)
    {
        int deptId = int.Parse(Request[WebConstants.Request.DEPT_ID]);
        DocumentTemplateTableAdapters.DocumentSectionDetailsTableAdapter secDetTA = new DocumentTemplateTableAdapters.DocumentSectionDetailsTableAdapter();
        return secDetTA.GetBySecId(loggedInUserCoId, deptId,int.Parse(sectionId.ToString()));
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        int deptId = int.Parse(Request[WebConstants.Request.DEPT_ID]);
        int docId = int.Parse(Request[WebConstants.Request.DOC_ID]);
        foreach (RepeaterItem ri in rptSections.Items)
        {
            int sectionId = int.Parse(((HiddenField)ri.FindControl("hfSectionId")).Value);
            DocumentTemplate.DocumentSectionEntityRow section = DatabaseUtility.GetSection(loggedInUserCoId, deptId, sectionId);
            if (section != null)
            {
                DocumentTemplateTableAdapters.DocumentItemEntityTableAdapter itemTA = new DocumentTemplateTableAdapters.DocumentItemEntityTableAdapter();
                itemTA.DeleteBySecId(loggedInUserCoId, deptId, docId, sectionId);
                if (section.section_type == WebConstants.SectionTypes.FREE_TEXT)
                {
                    TextBox tbItem = (TextBox)ri.FindControl("tbItem");
                    itemTA.Insert(loggedInUserCoId, deptId, sectionId, docId, tbItem.Text, 1, null);
                }
                else
                {
                    CheckBoxList cbItem = (CheckBoxList)ri.FindControl("cbItem");
                    for (int i=0; i < cbItem.Items.Count; i++)
                    {
                        if (cbItem.Items[i].Selected)
                        {
                            itemTA.Insert(loggedInUserCoId, deptId, sectionId, docId, "", byte.Parse((i+1).ToString()), int.Parse(cbItem.Items[i].Value));
                        }
                    }
                }
                SetInfoMessage(WebConstants.Messages.Information.RECORD_SAVED);
            }
        }
    }
    protected void rptSections_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        int sectionId = int.Parse(((HiddenField)e.Item.FindControl("hfSectionId")).Value);
        int deptId = int.Parse(Request[WebConstants.Request.DEPT_ID]);
        int docId = int.Parse(Request[WebConstants.Request.DOC_ID]);
        DocumentTemplate.DocumentSectionEntityRow section = DatabaseUtility.GetSection(loggedInUserCoId, deptId, sectionId);
        if (section != null)
        {
            if (section.section_type == WebConstants.SectionTypes.FREE_TEXT)
            {
                TextBox tbItem = (TextBox)e.Item.FindControl("tbItem");
                DocumentTemplateTableAdapters.DocumentItemEntityTableAdapter itemTA = new DocumentTemplateTableAdapters.DocumentItemEntityTableAdapter();
                IEnumerator ie = itemTA.GetBySecId(loggedInUserId, deptId, docId, sectionId).GetEnumerator();
                while (ie.MoveNext())
                {
                    DocumentTemplate.DocumentItemEntityRow itemRow = (DocumentTemplate.DocumentItemEntityRow)ie.Current;
                    tbItem.Text += itemRow.item_name;
                }
            }
            else if (section.section_type == WebConstants.SectionTypes.MULTIPLE_SELECT_LIST)
            {
                CheckBoxList cbItem = (CheckBoxList)e.Item.FindControl("cbItem");
                DocumentTemplateTableAdapters.DocumentItemEntityTableAdapter itemTA = new DocumentTemplateTableAdapters.DocumentItemEntityTableAdapter();
                DataTable itemsDT = itemTA.GetBySecId(loggedInUserId, deptId, docId, sectionId);
                foreach (ListItem li in cbItem.Items)                    
                {
                    foreach (DataRow row in itemsDT.Rows)
                    {
                        if (li.Value == row["section_detail_id"].ToString())
                        {
                            li.Selected = true;
                            break;
                        }
                    }
                }
            }
        }
    }
    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Maintenance/DocumentList.aspx");
    }
}
