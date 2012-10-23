using System;
using System.Collections.Generic;
//using System.Web;
//using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;

public partial class Admin_AddUser : AdminPage
{
    protected override void AdminPageHandling(object sender, EventArgs e)
    {
        if (IsPostBack == false)
        {
            if (Request[WebConstants.Request.USER_ID] != null)
            {
                int userId = int.Parse(Request[WebConstants.Request.USER_ID]);
                UserTableAdapters.un_co_user_detailsTableAdapter userTA = new UserTableAdapters.un_co_user_detailsTableAdapter();

                IEnumerator iEnum = userTA.GetUserById(userId).GetEnumerator();
                if (iEnum.MoveNext())
                {
                    User.un_co_user_detailsRow user = (User.un_co_user_detailsRow)iEnum.Current;
                    ddlCompany.SelectedValue = user.co_id.ToString();
                    tbUserLevel.Text = user.user_level.ToString();
                    tbUserName.Text = user.user_name;
                    tbUserLogon.Text = user.user_logon;
                    tbUserEnableReminder.Text = user.user_enable_reminder;
                    if(user.Isuser_telephoneNull() == false)  tbTelephone.Text = user.user_telephone;
                    if (user.Isuser_tel_extNull() == false) tbTelExt.Text = user.user_tel_ext;
                    if (user.Isuser_tel_mobileNull() == false) tbMobile.Text = user.user_tel_mobile;
                    if (user.Isuser_emailNull() == false) tbEmail.Text = user.user_email;
                    if (user.Isuser_departmentNull() == false) tbDepartment.Text = user.user_department;
                    if (user.Isuser_locationNull() == false) tbLocation.Text = user.user_location;
                    ddlRole.SelectedValue = user.role;
                    btnSave.Visible = false;
                    btnUpdate.Visible = true;
                    ddlCompany.Enabled = false;
                }
            }
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (IsValid())
        {
            UserTableAdapters.un_co_user_detailsTableAdapter userTA = new UserTableAdapters.un_co_user_detailsTableAdapter();
            if (userTA.GetUserByLogonName(tbUserLogon.Text, null).GetEnumerator().MoveNext())
            {
                SetErrorMessage(WebConstants.Messages.Error.ALREAD_EXISTS);
            }
            else
            {
                userTA.Insert(false, int.Parse(ddlCompany.SelectedValue), int.Parse(tbUserLevel.Text), tbUserName.Text, tbUserLogon.Text,
                    Utility.GetMd5Sum(tbUserEnable.Text), tbUserEnableReminder.Text, tbTelephone.Text, tbTelExt.Text, tbMobile.Text, tbEmail.Text, tbDepartment.Text,
                    tbLocation.Text, loggedInUserId, DateTime.Now, loggedInUserId, DateTime.Now, ddlRole.SelectedValue);
                SetInfoMessage(WebConstants.Messages.Information.RECORD_SAVED);
            }
        }
    }

    private bool IsValid()
    {
        bool valid = true;
        if (tbUserEnable.Text.Equals(tbConfirmUserEnable.Text) == false)
        {
            SetErrorMessage(WebConstants.Messages.Error.PASSWORDS_DONOT_MATCH);
            valid = false;
        }
        return valid;
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        if (IsValid())
        {
            UserTableAdapters.un_co_user_detailsTableAdapter userTA = new UserTableAdapters.un_co_user_detailsTableAdapter();
            if (userTA.GetUserByLogonName(tbUserLogon.Text, int.Parse(Request[WebConstants.Request.USER_ID])).GetEnumerator().MoveNext())
            {
                SetErrorMessage(WebConstants.Messages.Error.ALREAD_EXISTS);
            }
            else
            {
                userTA.Update(int.Parse(tbUserLevel.Text), tbUserName.Text, tbUserLogon.Text, Utility.GetMd5Sum(tbUserEnable.Text), tbUserEnableReminder.Text, tbTelephone.Text,
                    tbTelExt.Text, tbMobile.Text, tbEmail.Text, tbDepartment.Text, tbLocation.Text, loggedInUserId, DateTime.Now, int.Parse(Request[WebConstants.Request.USER_ID]));
                SetInfoMessage(WebConstants.Messages.Information.RECORD_SAVED);
            }
        }
    }
}
