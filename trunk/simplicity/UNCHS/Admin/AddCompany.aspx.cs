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

public partial class Admin_AddCompany : AdminPage
{    
    protected override void  AdminPageHandling(object sender, EventArgs e)
    {
        if (Request[WebConstants.Request.CO_ID] != null)
        {
            if (IsPostBack == false)
            {
                Company.un_co_detailsRow company = DatabaseUtility.GetCompany(int.Parse(Request[WebConstants.Request.CO_ID]));
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
                    if (company.Isflg_trialNull() == false)
                    {
                        cbTrial.Checked = company.flg_trial;
                        EnableTrialFields(cbTrial.Checked);
                        if (company.Istrial_start_dateNull() == false)
                        {
                            tbTrialStartDate.SelectedDate = company.trial_start_date;
                        }
                        
                        if (company.Istrial_num_of_daysNull() == false)
                        {
                            tbTrialNumOfDays.Text = company.trial_num_of_days.ToString();
                        }                        
                    }
                    cbWizard.Checked = company.flg_show_wizard;
                    
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
    protected void btnSave_Click(object sender, EventArgs e)
    {
        CompanyTableAdapters.un_co_detailsTableAdapter coTA = new CompanyTableAdapters.un_co_detailsTableAdapter();
        if (coTA.GetCompanyByName(txtCompanyShortName.Text, null).GetEnumerator().MoveNext())
        {
            SetErrorMessage(WebConstants.Messages.Error.ALREAD_EXISTS);
        }
        else if (Validate())
        {
            if (cbTrial.Checked)
            {
                coTA.Insert(false, txtCompanyShortName.Text, txtCompanyLongName.Text, txtContactTitle.Text, txtContactInitial.Text, txtForename.Text, txtSurname.Text,
                    txtAddressNo.Text, txtAddress1.Text, txtAddress2.Text, txtAddress3.Text, txtAddress4.Text, txtAddress5.Text, txtPostalCode.Text, getFullAddress(),
                    txtTele.Text, txtTele1.Text, txtFax.Text, txtEmail.Text, txtCoNotes.Text, 0, 0, false, loggedInUserId, DateTime.Now, loggedInUserId,
                    DateTime.Now, cbAutoSave.Checked, tbFireWarden.Text, tbFirstAider.Text, cbMultiSups.Checked, tbSupervisor.Text, true, 1, cbTrial.Checked,
                    tbTrialStartDate.SelectedDate, int.Parse(tbTrialNumOfDays.Text), GetTrialEndDate(),cbWizard.Checked);
            }
            else
            {
                coTA.Insert(false, txtCompanyShortName.Text, txtCompanyLongName.Text, txtContactTitle.Text, txtContactInitial.Text, txtForename.Text, txtSurname.Text,
                    txtAddressNo.Text, txtAddress1.Text, txtAddress2.Text, txtAddress3.Text, txtAddress4.Text, txtAddress5.Text, txtPostalCode.Text, getFullAddress(),
                    txtTele.Text, txtTele1.Text, txtFax.Text, txtEmail.Text, txtCoNotes.Text, 0, 0, false, loggedInUserId, DateTime.Now, loggedInUserId,
                    DateTime.Now, cbAutoSave.Checked, tbFireWarden.Text, tbFirstAider.Text, cbMultiSups.Checked, tbSupervisor.Text, true, 1, cbTrial.Checked, null, null, null,cbWizard.Checked);
            }
            SetInfoMessage(WebConstants.Messages.Information.RECORD_SAVED);
        }
    }
    private bool Validate()
    {
        if (cbTrial.Checked)
        {
            if (tbTrialStartDate.SelectedDate == null || tbTrialStartDate.SelectedDate == new DateTime(1900,1,1))
            {
                SetErrorMessage("Trial Start Date must be provided");
                return false;
            }
            else if (tbTrialNumOfDays.Text.Length == 0)
            {
                SetErrorMessage("Trial Number of Days must be provided");
                return false;
            }
        }
        return true;
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
        int coId = int.Parse(Request[WebConstants.Request.CO_ID]);
        CompanyTableAdapters.un_co_detailsTableAdapter coTA = new CompanyTableAdapters.un_co_detailsTableAdapter();
        if (coTA.GetCompanyByName(txtCompanyShortName.Text, coId).GetEnumerator().MoveNext())
        {
            SetErrorMessage(WebConstants.Messages.Error.ALREAD_EXISTS);
        }
        else if(Validate())
        {
            if (cbTrial.Checked)
            {
                coTA.Update(false, txtCompanyShortName.Text, txtCompanyLongName.Text, txtContactTitle.Text, txtContactInitial.Text, txtForename.Text, txtSurname.Text,
                    txtAddressNo.Text, txtAddress1.Text, txtAddress2.Text, txtAddress3.Text, txtAddress4.Text, txtAddress5.Text, txtPostalCode.Text, getFullAddress(),
                    txtTele.Text, txtTele1.Text, txtFax.Text, txtEmail.Text, txtCoNotes.Text, 0, 0, false, loggedInUserId, DateTime.Now, cbAutoSave.Checked,
                    tbFireWarden.Text, tbFirstAider.Text, cbMultiSups.Checked, tbSupervisor.Text, cbTrial.Checked, tbTrialStartDate.SelectedDate,
                    int.Parse(tbTrialNumOfDays.Text), GetTrialEndDate(),cbWizard.Checked, coId);
            }
            else
            {
                coTA.Update(false, txtCompanyShortName.Text, txtCompanyLongName.Text, txtContactTitle.Text, txtContactInitial.Text, txtForename.Text, txtSurname.Text,
                    txtAddressNo.Text, txtAddress1.Text, txtAddress2.Text, txtAddress3.Text, txtAddress4.Text, txtAddress5.Text, txtPostalCode.Text, getFullAddress(),
                    txtTele.Text, txtTele1.Text, txtFax.Text, txtEmail.Text, txtCoNotes.Text, 0, 0, false, loggedInUserId, DateTime.Now, cbAutoSave.Checked,
                    tbFireWarden.Text, tbFirstAider.Text, cbMultiSups.Checked, tbSupervisor.Text, cbTrial.Checked, null,null,null,cbWizard.Checked,coId);

            }
            SetInfoMessage(WebConstants.Messages.Information.RECORD_SAVED);
        }
    }
    private DateTime GetTrialEndDate()
    {
        return Utility.GetTrialEndDate(tbTrialStartDate.SelectedDate,int.Parse(tbTrialNumOfDays.Text));
    }
    protected void cbTrial_CheckedChanged(object sender, EventArgs e)
    {
        EnableTrialFields(cbTrial.Checked);
        SetFocus(this);
    }

    protected void tbTrialStartDate_Changed(object sender, EventArgs e)
    {
        UpdateTrialEndDate();
        SetFocus(this);
    }

    protected void tbTrialNumOfDays_Changed(object sender, EventArgs e)
    {
        UpdateTrialEndDate();
        SetFocus(this);
    }
    private void EnableTrialFields(bool enable)
    {
        tbTrialNumOfDays.Enabled = enable;
        tbTrialStartDate.Enabled = enable;

        if (enable && tbTrialStartDate.SelectedDate == new DateTime(1900, 1, 1))
        {
            tbTrialStartDate.SelectedDate = DateTime.Now;
        }
        else
        {
            tbTrialFinishDate.Text = "";
            tbTrialNumOfDays.Text = "";
            //tbTrialStartDate.Text = "";
        }
    }

    private void UpdateTrialEndDate()
    {
        tbTrialFinishDate.Text = "";
        if (tbTrialStartDate.SelectedDate != new DateTime(1900, 1, 1) && tbTrialNumOfDays.Text.Length>0)
        {
            DateTime dt = GetTrialEndDate();
            tbTrialFinishDate.Text = dt.ToString("dd/MM/yyyy");
        }
    }

    public void SetFocus(Page sPage)
    {
        string[] sCtrl = null;
        string sCtrlId = null;
        Control sCtrlFound = default(Control);
        string sCtrlClientId = null;
        string sScript = null;

        sCtrl = sPage.Request.Form.GetValues("__EVENTTARGET");
        if ((sCtrl != null))
        {
            sCtrlId = sCtrl[0];
            sCtrlFound = sPage.FindControl(sCtrlId);
            if ((sCtrlFound != null))
            {
                sCtrlClientId = sCtrlFound.ClientID;
                sScript = "<SCRIPT language='javascript'>document.getElementById('" + sCtrlClientId + "').focus(); if (document.getElementById('" + sCtrlClientId + "').scrollIntoView(false)) {document.getElementById('" + sCtrlClientId + "').scrollIntoView(true)} </SCRIPT>";
                sPage.ClientScript.RegisterStartupScript(typeof(string), "controlFocus", sScript);
            }
        }
    }
}
