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

public partial class Maintenance_DepartmentToolList : DepartmentPage
{
    protected override void  Department_Page_Handling(object sender, EventArgs e)
    {
 	    
    }

    private bool isValid(int id)
    {
        DepartmentToolTableAdapters.DepartmentToolSelectCommandTableAdapter tableAdapter = new DepartmentToolTableAdapters.DepartmentToolSelectCommandTableAdapter();
        IEnumerator iEnumerator = tableAdapter.GetDepartmentToolByName(int.Parse(ddlDepartment.SelectedValue), loggedInUserCoId, tbName.Text,id).GetEnumerator();
        if (iEnumerator.MoveNext())
        {
            SetErrorMessage(WebConstants.Messages.Error.ALREAD_EXISTS);
            return false;
        }
        return true;
    }

    private DepartmentTool.DepartmentToolSelectCommandRow getDepartmentPerson(int departmentPersonId)
    {
        DepartmentTool.DepartmentToolSelectCommandRow dataRow = null;
        DepartmentToolTableAdapters.DepartmentToolSelectCommandTableAdapter tableAdapter = new DepartmentToolTableAdapters.DepartmentToolSelectCommandTableAdapter();
        IEnumerator iEnumerator = tableAdapter.GetDepartmentToolById(departmentPersonId, loggedInUserCoId).GetEnumerator();
        if (iEnumerator.MoveNext())
        {
            dataRow = (DepartmentTool.DepartmentToolSelectCommandRow)iEnumerator.Current;
        }
        return dataRow;
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        if (isValid(0))
        {
            DepartmentToolTableAdapters.DepartmentToolSelectCommandTableAdapter tableAdapter = new DepartmentToolTableAdapters.DepartmentToolSelectCommandTableAdapter();
            tableAdapter.Insert(int.Parse(ddlDepartment.SelectedValue), loggedInUserCoId, tbName.Text, loggedInUserId,int.Parse(ddlCategory.SelectedValue),cbDefault.Checked);
            repeater.DataBind();
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
                DepartmentTool.DepartmentToolSelectCommandRow dataRow = getDepartmentPerson(int.Parse(idList[i]));
                if (dataRow != null)
                {
                    DepartmentToolTableAdapters.DepartmentToolSelectCommandTableAdapter tableAdapter = new DepartmentToolTableAdapters.DepartmentToolSelectCommandTableAdapter();
                    tableAdapter.Update(dataRow.dept_id, dataRow.name_desc, i + 1, loggedInUserId, dataRow.sequence,dataRow.category_id,dataRow.flg_default);
                }
            }
        }
        SetInfoMessage(WebConstants.Messages.Information.RECORD_SAVED);
        repeater.DataBind();
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/"+loggedInUserRole + "Home.aspx");
    }
    protected void btnUpate_Click(object sender, EventArgs e)
    {
        int id = int.Parse(hfDeptPersonId.Value);
        if (isValid(id))
        {
            DepartmentTool.DepartmentToolSelectCommandRow dataRow = getDepartmentPerson(id);
            if (dataRow != null)
            {
                DepartmentToolTableAdapters.DepartmentToolSelectCommandTableAdapter tableAdapter = new DepartmentToolTableAdapters.DepartmentToolSelectCommandTableAdapter();
                tableAdapter.Update(int.Parse(ddlDepartment.SelectedValue), tbName.Text, dataRow.index_seq, loggedInUserId, dataRow.sequence,int.Parse(ddlCategory.SelectedValue),cbDefault.Checked);
                repeater.DataBind();
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
            DepartmentTool.DepartmentToolSelectCommandRow dataRow = getDepartmentPerson(int.Parse(e.CommandArgument.ToString()));
            if (dataRow != null)
            {
                tbName.Text = dataRow.name_desc;
                ddlDepartment.SelectedValue = dataRow.dept_id.ToString();
                ddlCategory.SelectedValue = dataRow.category_id.ToString();
                cbDefault.Checked = dataRow.flg_default;
                btnAdd.Visible = false;
                btnUpate.Visible = true;
                hfDeptPersonId.Value = e.CommandArgument.ToString();
            }
        }
        else if (e.CommandName.Equals("Delete"))
        {
            DepartmentToolTableAdapters.DepartmentToolSelectCommandTableAdapter tableAdapter = new DepartmentToolTableAdapters.DepartmentToolSelectCommandTableAdapter();
            tableAdapter.Delete(int.Parse(e.CommandArgument.ToString()), loggedInUserId);
            repeater.DataBind();
            SetInfoMessage(WebConstants.Messages.Information.RECORD_DELETED);
        }
    }
}
