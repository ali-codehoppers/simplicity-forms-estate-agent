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

public partial class Maintenance_DepartmentPersonList : DepartmentPage
{
    protected override void Department_Page_Handling(object sender, EventArgs e)
    {        
    }

    private bool isValid(int id)
    {
        DepartmentPersonTableAdapters.un_ref_co_dept_peopleTableAdapter tableAdapter = new DepartmentPersonTableAdapters.un_ref_co_dept_peopleTableAdapter();
        IEnumerator iEnumerator = tableAdapter.GetDepartmentPersonByName(int.Parse(ddlDepartment.SelectedValue),loggedInUserCoId,tbName.Text,id).GetEnumerator();
        if (iEnumerator.MoveNext())
        {
            SetErrorMessage(WebConstants.Messages.Error.ALREAD_EXISTS);
            return false;
        }
        return true;
    }

    private DepartmentPerson.un_ref_co_dept_peopleRow getDepartmentPerson(int departmentPersonId)
    {
        DepartmentPerson.un_ref_co_dept_peopleRow dataRow = null;
        DepartmentPersonTableAdapters.un_ref_co_dept_peopleTableAdapter tableAdapter = new DepartmentPersonTableAdapters.un_ref_co_dept_peopleTableAdapter();
        IEnumerator iEnumerator = tableAdapter.GetDepartmentPersonByIdNCoId(departmentPersonId, loggedInUserCoId).GetEnumerator();
        if (iEnumerator.MoveNext())
        {
            dataRow = (DepartmentPerson.un_ref_co_dept_peopleRow)iEnumerator.Current;
        }
        return dataRow;
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        if (isValid(0))
        {
            DepartmentPersonTableAdapters.un_ref_co_dept_peopleTableAdapter tableAdapter = new DepartmentPersonTableAdapters.un_ref_co_dept_peopleTableAdapter();
            tableAdapter.Insert(int.Parse(ddlDepartment.SelectedValue), loggedInUserCoId, tbName.Text, loggedInUserId,chkboxSupervisor.Checked,chkboxFirstAider.Checked,chkboxWarden.Checked);
            GridView1.DataBind();
            SetInfoMessage(WebConstants.Messages.Information.RECORD_SAVED);
        }
        //lbl
    }
    /*
    protected void btnSave_Click(object sender, EventArgs e)
    {
        string[] idList = Request["idOrdering"].Split(',');
        if (idList != null)
        {
            //-i because we have an extra comma at the end
            for(int i=0;i<idList.Length-1;i++)
            {
                DepartmentPerson.un_ref_co_dept_peopleRow dataRow = getDepartmentPerson(int.Parse(idList[i]));
                if (dataRow != null)
                {
                    DepartmentPersonTableAdapters.un_ref_co_dept_peopleTableAdapter tableAdapter = new DepartmentPersonTableAdapters.un_ref_co_dept_peopleTableAdapter();
                    tableAdapter.Update(dataRow.dept_id, dataRow.name_desc, i + 1, loggedInUserId, dataRow.sequence,dataRow.flg_supervisor,dataRow.flg_first_aider,dataRow.flg_fire_warden);
                }
            }
        }
        SetInfoMessage(WebConstants.Messages.Information.RECORD_SAVED);
        GridView1.DataBind();
    }
     */
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/"+loggedInUserRole + "Home.aspx");        
    }
    protected void btnUpate_Click(object sender, EventArgs e)
    {
        int id = int.Parse(hfDeptPersonId.Value);
        if (isValid(id))
        {
            DepartmentPerson.un_ref_co_dept_peopleRow dataRow = getDepartmentPerson(id);
            if (dataRow != null)
            {
                DepartmentPersonTableAdapters.un_ref_co_dept_peopleTableAdapter tableAdapter = new DepartmentPersonTableAdapters.un_ref_co_dept_peopleTableAdapter();
                tableAdapter.Update(int.Parse(ddlDepartment.SelectedValue), tbName.Text, dataRow.index_seq, loggedInUserId, dataRow.sequence,chkboxSupervisor.Checked,chkboxFirstAider.Checked,chkboxWarden.Checked);
                GridView1.DataBind();
                SetInfoMessage(WebConstants.Messages.Information.RECORD_SAVED);
            }
            btnAdd.Visible = true;
            btnUpate.Visible = false;
            tbName.Text = "";
            chkboxSupervisor.Checked = false;
            chkboxWarden.Checked = false;
            chkboxFirstAider.Checked = false;
        }
    }
    protected void UpdateDepartmentPerson(Object sender, CommandEventArgs e)
    {
        DepartmentPerson.un_ref_co_dept_peopleRow dataRow = getDepartmentPerson(int.Parse(e.CommandArgument.ToString()));
        if (dataRow != null)
        {
            tbName.Text = dataRow.name_desc;
            ddlDepartment.SelectedValue = dataRow.dept_id.ToString();
            btnAdd.Visible = false;
            btnUpate.Visible = true;
            chkboxSupervisor.Checked = bool.Parse(dataRow.flg_supervisor.ToString());
            chkboxWarden.Checked = bool.Parse(dataRow.flg_fire_warden.ToString());
            chkboxFirstAider.Checked = bool.Parse(dataRow.flg_first_aider.ToString());
            hfDeptPersonId.Value = e.CommandArgument.ToString();
        }
    }
    protected void DeleteDepartmentPerson(Object sender, CommandEventArgs e)
    {
            DepartmentPersonTableAdapters.un_ref_co_dept_peopleTableAdapter tableAdapter = new DepartmentPersonTableAdapters.un_ref_co_dept_peopleTableAdapter();
            tableAdapter.Delete(int.Parse(e.CommandArgument.ToString()), loggedInUserId);
            GridView1.DataBind();
            SetInfoMessage(WebConstants.Messages.Information.RECORD_DELETED);        
    }
    protected void GridView1_DataBound(object sender, EventArgs e)
    {
        //Company.un_co_detailsRow dataRow = GetCompany();
        //if (dataRow != null)
        //{
        //    if (dataRow.Issupervisor_labelNull() == false)
        //    {
        //        GridView1.Columns[3].HeaderText = dataRow.supervisor_label;
        //        lblSupervisor.Text = dataRow.supervisor_label + ":";
        //    }
        //    if (dataRow.Isfirst_aider_labelNull() == false)
        //    {
        //        GridView1.Columns[4].HeaderText = dataRow.first_aider_label;
        //        lblFirstAider.Text = dataRow.first_aider_label + ":";
        //    }
        //    if (dataRow.Isfire_warden_labelNull() == false)
        //    {
        //        GridView1.Columns[5].HeaderText = dataRow.fire_warden_label;
        //        lblFireWarden.Text = dataRow.fire_warden_label + ":";
        //    }
        //}
    }
}
