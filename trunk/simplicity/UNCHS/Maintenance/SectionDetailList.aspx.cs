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

public partial class Maintenance_SectionDetailList : DepartmentPage
{
    protected override void Department_Page_Handling(object sender, EventArgs e)
    {
        if (IsPostBack == false)
        {
            int deptId = int.Parse(Request[WebConstants.Request.DEPT_ID]);

            DocumentTemplate.DocumentSectionEntityRow section = DatabaseUtility.GetSection(loggedInUserCoId, deptId, int.Parse(Request[WebConstants.Request.SEC_ID]));
            if (section != null)
            {
                lblSection.Text = section.section_desc;
            }

            Department.DepartmentSelectCommandRow department = DatabaseUtility.GetDepartment(deptId);
            if(department != null)
            {
                lblDept.Text = department.co_name_long;
            }
        }
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        odsSecDetails.InsertParameters["co_id"].DefaultValue = loggedInUserCoId.ToString();
        odsSecDetails.InsertParameters["dept_id"].DefaultValue = Request[WebConstants.Request.DEPT_ID];
        odsSecDetails.InsertParameters["section_id"].DefaultValue = Request[WebConstants.Request.SEC_ID];
        odsSecDetails.InsertParameters["section_detail_index"].DefaultValue = tbIndex.Text;
        odsSecDetails.InsertParameters["section_detail_desc"].DefaultValue = tbSecDetail.Text;
        odsSecDetails.Insert();
        gvSecDetails.DataBind();
    }
    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Maintenance/SectionList.aspx");
    }
    protected void gvSecDetails_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        if (e.NewValues["section_detail_index"] == null)
        {
            SetErrorMessage("Section detail index is required for sorting");
            e.Cancel = true;
            return;
        }
        if (e.NewValues["section_detail_desc"] == null)
        {
            SetErrorMessage("Section Detail Description is required");
            e.Cancel = true;
            return;
        }
    }
}
