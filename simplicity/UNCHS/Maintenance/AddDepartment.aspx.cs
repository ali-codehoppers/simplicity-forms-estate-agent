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
using System.Text;

public partial class Maintenance_AddDepartment : AuthenticatedPage
{
    DataTable dt;
    int dept_id;
    override protected void Page_Load_Extended(object sender, EventArgs e)
    {
        if (loggedInUserRole != WebConstants.Roles.Admin)
        {
            ddlCompany.SelectedValue = loggedInUserCoId.ToString();
            lblCompany.Visible = false;
            ddlCompany.Visible = false;
        }
        if (Request[WebConstants.Request.NO_DEPT] != null)
        {
            SetErrorMessage(WebConstants.Messages.Error.NO_DEPT_DEFINED);
        }
        if (Request[WebConstants.Request.DEPT_ID] != null)
        {
            if (IsPostBack == false)
            {
                Department.DepartmentSelectCommandRow department = DatabaseUtility.GetDepartment(int.Parse(Request[WebConstants.Request.DEPT_ID]));
                if (department != null)
                {
                    ddlCompany.SelectedValue = department.co_id.ToString();
                    ddlCompany.Enabled = false;
                    if (department.Isaddress_line1Null() == false) txtAddress1.Text = department.address_line1;
                    if (department.Isaddress_line2Null() == false) txtAddress2.Text = department.address_line2;
                    if (department.Isaddress_line3Null() == false) txtAddress3.Text = department.address_line3;
                    if (department.Isaddress_line4Null() == false) txtAddress4.Text = department.address_line4;
                    if (department.Isaddress_line5Null() == false) txtAddress5.Text = department.address_line5;

                    txtCompanyShortName.Text = department.co_name_short;
                    txtCompanyLongName.Text = department.co_name_long;
                    if (department.Isco_notesNull() == false) txtCoNotes.Text = department.co_notes;
                    if (department.Iscontact_initailsNull() == false) txtContactInitial.Text = department.contact_initails;
                    if (department.Iscontact_titleNull() == false) txtContactTitle.Text = department.contact_title;
                    if (department.IsemailNull() == false) txtEmail.Text = department.email;
                    if (department.Istel_faxNull() == false) txtFax.Text = department.tel_fax;
                    if (department.Iscontact_forenameNull() == false) txtForename.Text = department.contact_forename;
                    if (department.Iscontact_surnameNull() == false) txtSurname.Text = department.contact_surname;
                    if (department.Istel_1Null() == false) txtTele.Text = department.tel_1;
                    if (department.Istel_2Null() == false) txtTele1.Text = department.tel_2;
                    if (department.Isaddress_noNull() == false) txtAddressNo.Text = department.address_no;
                    if (department.Isaddress_post_codeNull() == false) txtPostalCode.Text = department.address_post_code;
                    btnUpdate.Visible = true;
                    btnSave.Visible = false;
                }
                else
                {
                    SetErrorMessage(WebConstants.Messages.Error.INVALID_ID);
                }
            }
        }
        else
        {
            btnUpdate.Visible = false;
            btnSave.Visible = true;
        }
    }
    protected void btnSave_Update_Click(object sender, EventArgs e)
    {
    }
    private DataTable getDepartment(int departmentId)
    {
        DepartmentTableAdapters.DepartmentSelectCommandTableAdapter tableAdapter = new DepartmentTableAdapters.DepartmentSelectCommandTableAdapter();
        DataTable dt = tableAdapter.GetDepartmentByDeptId(departmentId);
        return dt;
    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        try
        {
            DepartmentTableAdapters.DepartmentSelectCommandTableAdapter dep_Adapter = new DepartmentTableAdapters.DepartmentSelectCommandTableAdapter();
            DataTable count = dep_Adapter.GetShortNameCountByDeptId(int.Parse(Request[WebConstants.Request.DEPT_ID]), txtCompanyShortName.Text);
            if (count.Rows.Count == 0)
            {
                dep_Adapter.UpdateDepartment(txtCompanyShortName.Text, txtCompanyLongName.Text, txtContactTitle.Text, txtContactInitial.Text.Trim(), txtForename.Text.Trim(), txtSurname.Text.Trim(), txtAddressNo.Text.Trim(), txtAddress1.Text.Trim(), txtAddress2.Text.Trim(), txtAddress3.Text.Trim(), txtAddress4.Text.Trim(), txtAddress5.Text.Trim(), txtPostalCode.Text.Trim(), GetFullAddress(), txtTele.Text.Trim(), txtTele1.Text.Trim(), txtFax.Text.Trim(), txtEmail.Text.Trim(), txtCoNotes.Text.Trim(), loggedInUserId, DateTime.Now, int.Parse(Request[WebConstants.Request.DEPT_ID]));
                Response.Redirect("DepartmentList.aspx");
            }
            else
            {
                SetErrorMessage(WebConstants.Messages.Error.ALREAD_EXISTS);
            }
        }
        catch
        {
            SetErrorMessage(WebConstants.Messages.Error.CONNECTION_ERROR);
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        try
        {
            DepartmentTableAdapters.DepartmentSelectCommandTableAdapter dep_Adapter = new DepartmentTableAdapters.DepartmentSelectCommandTableAdapter();
            DataTable dt = dep_Adapter.GetDepartmentByShortName(txtCompanyShortName.Text, loggedInUserCoId);
            if (dt.Rows.Count == 0)
            {
                int coId = 0;
                if (loggedInUserRole == WebConstants.Roles.Admin)
                {
                    coId = int.Parse(ddlCompany.SelectedValue);
                }
                else
                {
                    coId = loggedInUserCoId;
                }
                dep_Adapter.InsertDepartment(coId, false, txtCompanyShortName.Text, txtCompanyLongName.Text, txtContactTitle.Text, txtContactInitial.Text.Trim(), txtForename.Text.Trim(), txtSurname.Text.Trim(), txtAddressNo.Text.Trim(), txtAddress1.Text.Trim(), txtAddress2.Text.Trim(), txtAddress3.Text.Trim(), txtAddress4.Text.Trim(), txtAddress5.Text.Trim(), txtPostalCode.Text.Trim(),GetFullAddress(), txtTele.Text.Trim(), txtTele1.Text.Trim(), txtFax.Text.Trim(), txtEmail.Text.Trim(), txtCoNotes.Text.Trim(), loggedInUserId, DateTime.Now, loggedInUserId, DateTime.Now);
                Response.Redirect("DepartmentList.aspx");
            }
            else
            {
                SetErrorMessage(WebConstants.Messages.Error.ALREAD_EXISTS);
            }
        }
        catch
        {
            SetErrorMessage(WebConstants.Messages.Error.CONNECTION_ERROR);
        }

    }
    private string GetFullAddress()
    {
        StringBuilder addressFull = new StringBuilder();
        addressFull.Append(txtAddressNo.Text).Append(" ");
        addressFull.Append(txtAddress1.Text).Append(" ");
        addressFull.Append(txtAddress2.Text).Append(" ");
        addressFull.Append(txtAddress3.Text).Append(" ");
        addressFull.Append(txtAddress4.Text).Append(" ");
        addressFull.Append(txtAddress5.Text).Append(" ");
        addressFull.Append(txtPostalCode.Text);
        return addressFull.ToString().Trim();
    }

}
