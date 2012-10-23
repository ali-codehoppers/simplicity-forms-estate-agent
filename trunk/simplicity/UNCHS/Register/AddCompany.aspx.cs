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
using System.Text;
using System.Collections.Generic;

public partial class Register_AddCompany : GenericPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session[WebConstants.Session.USER_CO_ID] != null)
        {
            if (IsPostBack == false)
            {
                Company.un_co_detailsRow company = DatabaseUtility.GetCompany((int)Session[WebConstants.Session.REG_CO_ID]);
                if (company != null)
                {
                    if (company.Isaddress_line1Null() == false) txtAddress1.Text = company.address_line1;
                    if (company.Isaddress_line2Null() == false) txtAddress2.Text = company.address_line2;
                    if (company.Isaddress_line3Null() == false) txtAddress3.Text = company.address_line3;
                    if (company.Isaddress_line4Null() == false) txtAddress4.Text = company.address_line4;
                    if (company.Isaddress_line5Null() == false) txtAddress5.Text = company.address_line5;

                    txtCompanyShortName.Text = company.co_name_short;
                    txtCompanyLongName.Text = company.co_name_long;
                    if (company.Isco_notesNull() == false) txtCoNotes.Text = company.co_notes;
                    if (company.Iscontact_initialsNull() == false) txtContactInitial.Text = company.contact_initials;
                    if (company.Iscontact_titleNull() == false) txtContactTitle.Text = company.contact_title;
                    if (company.IsemailNull() == false) txtEmail.Text = company.email;
                    if (company.Istel_faxNull() == false) txtFax.Text = company.tel_fax;
                    if (company.Iscontact_forenameNull() == false) txtForename.Text = company.contact_forename;
                    if (company.Iscontact_surnameNull() == false) txtSurname.Text = company.contact_surname;
                    if (company.Istel_1Null() == false) txtTele.Text = company.tel_1;
                    if (company.Istel_2Null() == false) txtTele1.Text = company.tel_2;
                    if (company.Isaddress_noNull() == false) txtAddressNo.Text = company.address_no;
                    if (company.Isaddress_post_codeNull() == false) txtPostalCode.Text = company.address_post_code;
                    if (company.Isflg_autosaveNull() == false) cbAutoSave.Checked = company.flg_autosave;
                    if (company.Isflg_multi_supervisorsNull() == false) cbMultiSups.Checked = company.flg_multi_supervisors;
                    if (company.Isfire_warden_labelNull() == false) tbFireWarden.Text = company.fire_warden_label;
                    if (company.Isfirst_aider_labelNull() == false) tbFirstAider.Text = company.first_aider_label;
                    if (company.Issupervisor_labelNull() == false) tbSupervisor.Text = company.supervisor_label;

                    btnUpdate.Visible = true;
                    btnSave.Visible = false;
                }

            }
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        CompanyTableAdapters.un_co_detailsTableAdapter coTA = new CompanyTableAdapters.un_co_detailsTableAdapter();
        if (coTA.GetCompanyByName(txtCompanyShortName.Text, null).GetEnumerator().MoveNext())
        {
            SetErrorMessage(WebConstants.Messages.Error.ALREAD_EXISTS);
        }
        else
        {
            IEnumerator ie = coTA.InsertAndReturn(false, txtCompanyShortName.Text, txtCompanyLongName.Text, txtContactTitle.Text, txtContactInitial.Text, txtForename.Text, txtSurname.Text,
                    txtAddressNo.Text, txtAddress1.Text, txtAddress2.Text, txtAddress3.Text, txtAddress4.Text, txtAddress5.Text, txtPostalCode.Text, getFullAddress(),
                    txtTele.Text, txtTele1.Text, txtFax.Text, txtEmail.Text, txtCoNotes.Text, 0, 0, false,null, DateTime.Now, null,
                    DateTime.Now, cbAutoSave.Checked, tbFireWarden.Text, tbFirstAider.Text, cbMultiSups.Checked, tbSupervisor.Text, true, 1, true,
                    DateTime.Today, 15, Utility.GetTrialEndDate(DateTime.Today,15),true).GetEnumerator();
            if (ie.MoveNext())
            {
                int coId = ((Company.un_co_detailsRow)ie.Current).co_id;
                Session[WebConstants.Session.REG_CO_ID] = coId;
                DepartmentTableAdapters.DepartmentSelectCommandTableAdapter deptTA = new DepartmentTableAdapters.DepartmentSelectCommandTableAdapter();
                IEnumerator ieDept = deptTA.InsertAndReturn(coId,false,txtCompanyShortName.Text,txtCompanyLongName.Text,txtContactTitle.Text, txtContactInitial.Text, txtForename.Text, txtSurname.Text,
                    txtAddressNo.Text, txtAddress1.Text, txtAddress2.Text, txtAddress3.Text, txtAddress4.Text, txtAddress5.Text, txtPostalCode.Text, getFullAddress(),
                    txtTele.Text, txtTele1.Text, txtFax.Text, txtEmail.Text,txtCoNotes.Text,null,DateTime.Now,null,DateTime.Now).GetEnumerator();

                if(ieDept.MoveNext())
                {
                    Session[WebConstants.Session.REG_DEPT_ID] = ((Department.DepartmentSelectCommandRow)ieDept.Current).dept_id;
                }
                SetInfoMessage(WebConstants.Messages.Information.RECORD_SAVED);
                Session[WebConstants.Session.WIZARD_STEP] = 2;
                Response.Redirect("~/Register/AddDepartment.aspx");
            }            
        }
    }

    private string getFullAddress()
    {
        StringBuilder addressFull = new StringBuilder();
        addressFull.Append(txtAddressNo.Text).Append(" ");
        addressFull.Append(txtAddress1.Text).Append(" ");
        addressFull.Append(txtAddress2.Text).Append(" ");
        addressFull.Append(txtAddress3.Text).Append(" ");
        addressFull.Append(txtAddress4.Text).Append(" ");
        addressFull.Append(txtAddress5.Text).Append(" ");
        addressFull.Append(txtPostalCode.Text);
        return addressFull.ToString();
    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        int coId = (int)Session[WebConstants.Session.REG_CO_ID];
        CompanyTableAdapters.un_co_detailsTableAdapter coTA = new CompanyTableAdapters.un_co_detailsTableAdapter();
        if (coTA.GetCompanyByName(txtCompanyShortName.Text, coId).GetEnumerator().MoveNext())
        {
            SetErrorMessage(WebConstants.Messages.Error.ALREAD_EXISTS);
        }
        else
        {
            coTA.Update(false, txtCompanyShortName.Text, txtCompanyLongName.Text, txtContactTitle.Text, txtContactInitial.Text, txtForename.Text, txtSurname.Text,
                txtAddressNo.Text, txtAddress1.Text, txtAddress2.Text, txtAddress3.Text, txtAddress4.Text, txtAddress5.Text, txtPostalCode.Text, getFullAddress(),
                txtTele.Text, txtTele1.Text, txtFax.Text, txtEmail.Text, txtCoNotes.Text, 0, 0, false, null, DateTime.Now, cbAutoSave.Checked,
                tbFireWarden.Text, tbFirstAider.Text, cbMultiSups.Checked, tbSupervisor.Text, true, DateTime.Today,
                15, Utility.GetTrialEndDate(DateTime.Today,15),true, coId);
            SetInfoMessage(WebConstants.Messages.Information.RECORD_SAVED);
            Session[WebConstants.Session.WIZARD_STEP] = 2;
            Response.Redirect("~/Register/AddDepartment.aspx");

        }
    }
}
