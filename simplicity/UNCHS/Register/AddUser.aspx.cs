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
using System.Linq;

public partial class Register_AddUser : GenericPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session[WebConstants.Session.WIZARD_STEP] == null ||
            (int)Session[WebConstants.Session.WIZARD_STEP] < 3)
        {
            Response.Redirect("~/Register/AddDeparment.aspx");
        }
        if (IsPostBack == false)
        {
            if (Session[WebConstants.Session.REG_CO_ID] != null
                && Session[WebConstants.Session.REG_DEPT_ID] != null
                && Session[WebConstants.Session.REG_USER_ID] != null)
            {
                int userId = (int)Session[WebConstants.Session.REG_USER_ID];
                UserTableAdapters.un_co_user_detailsTableAdapter userTA = new UserTableAdapters.un_co_user_detailsTableAdapter();

                IEnumerator iEnum = userTA.GetUserById(userId).GetEnumerator();
                if (iEnum.MoveNext())
                {
                    User.un_co_user_detailsRow user = (User.un_co_user_detailsRow)iEnum.Current;
                    tbUserName.Text = user.user_name;
                    tbUserLogon.Text = user.user_logon;
                    if (user.Isuser_telephoneNull() == false) tbTelephone.Text = user.user_telephone;
                    if (user.Isuser_tel_extNull() == false) tbTelExt.Text = user.user_tel_ext;
                    if (user.Isuser_tel_mobileNull() == false) tbMobile.Text = user.user_tel_mobile;
                    if (user.Isuser_emailNull() == false) tbEmail.Text = user.user_email;
                    if (user.Isuser_departmentNull() == false) tbDepartment.Text = user.user_department;
                    if (user.Isuser_locationNull() == false) tbLocation.Text = user.user_location;
                    btnSave.Visible = false;
                    btnUpdate.Visible = true;
                }
            }
            else
            {
                tbUserEnable.Visible = true;
                tbConfirmUserEnable.Visible = true;
                tbUserEnableReminder.Visible = true;
                tbUserLogon.Enabled = true;
            }
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {

        UserTableAdapters.un_co_user_detailsTableAdapter userTA = new UserTableAdapters.un_co_user_detailsTableAdapter();
        if (tbUserEnable.Text != tbConfirmUserEnable.Text)
        {
            SetErrorMessage("Passwords do not match");
            return;
        }
        if (userTA.GetUserByLogonName(tbUserLogon.Text, null).GetEnumerator().MoveNext())
        {
            SetErrorMessage(WebConstants.Messages.Error.ALREAD_EXISTS);
        }
        else
        {
            IEnumerator ie = userTA.InsertAndReturn(false, (int)Session[WebConstants.Session.REG_CO_ID],1, tbUserName.Text, tbUserLogon.Text,
                Utility.GetMd5Sum(tbUserEnable.Text), tbUserEnableReminder.Text, tbTelephone.Text, tbTelExt.Text, tbMobile.Text, tbEmail.Text, tbDepartment.Text,
                tbLocation.Text, null, DateTime.Now, null, DateTime.Now,WebConstants.Roles.User).GetEnumerator();
            if(ie.MoveNext())
            {
                User.un_co_user_detailsRow user = (User.un_co_user_detailsRow)ie.Current;
                Session[WebConstants.Session.REG_USER_ID] = user.user_id;
                SetInfoMessage(WebConstants.Messages.Information.RECORD_SAVED);
                TransferTableAdapters.TransferTableAdapter tranTA = new TransferTableAdapters.TransferTableAdapter();
                tranTA.TransferAll(int.Parse(AppSettings["SourceCompanyId"]),
                    int.Parse(AppSettings["SourceDepartmentId"]), (int)Session[WebConstants.Session.REG_CO_ID],
                    (int)Session[WebConstants.Session.REG_DEPT_ID], user.user_id);
                UpdateTrialLicense();
                Session[WebConstants.Session.WIZARD_STEP] = 4;
                Response.Redirect("~/Register/UploadOrders.aspx");

            }
        }
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        UserTableAdapters.un_co_user_detailsTableAdapter userTA = new UserTableAdapters.un_co_user_detailsTableAdapter();
        if (userTA.GetUserByLogonName(tbUserLogon.Text, (int)Session[WebConstants.Session.REG_USER_ID]).GetEnumerator().MoveNext())
        {
            SetErrorMessage(WebConstants.Messages.Error.ALREAD_EXISTS);
        }
        else
        {
            IEnumerator ieUsers = userTA.GetUserById((int)Session[WebConstants.Session.REG_USER_ID]).GetEnumerator();
            if (ieUsers.MoveNext())
            {
                User.un_co_user_detailsRow user = (User.un_co_user_detailsRow)ieUsers.Current;
                //user.user_name = tbUserName.Text;
                user.user_telephone = tbTelephone.Text;
                user.user_tel_ext = tbTelExt.Text;
                user.user_tel_mobile = tbMobile.Text;
                user.user_email = tbEmail.Text;
                user.user_department = tbDepartment.Text;
                user.user_location = tbLocation.Text;
                user.date_last_amended = DateTime.Now;

                userTA.Update(user);

                TransferTableAdapters.TransferTableAdapter tranTA = new TransferTableAdapters.TransferTableAdapter();
                tranTA.TransferAll(int.Parse(ConfigurationSettings.AppSettings["SourceCompanyId"]),
                    int.Parse(ConfigurationSettings.AppSettings["SourceDepartmentId"]), (int)Session[WebConstants.Session.REG_CO_ID],
                    (int)Session[WebConstants.Session.REG_DEPT_ID], (int)Session[WebConstants.Session.REG_USER_ID]);
                UpdateTrialLicense();
                Session[WebConstants.Session.WIZARD_STEP] = 4;
                Response.Redirect("~/Register/UploadOrders.aspx");
            }
        }
    }

    protected string DivDisplay()
    {
        if (Session[WebConstants.Session.REG_CO_ID] != null
            && Session[WebConstants.Session.REG_DEPT_ID] != null
            && Session[WebConstants.Session.REG_USER_ID] != null)
        {
            return "style='display:none'";
        }
        return "";
    }

    private void UpdateTrialLicense()
    {
        CompanyTableAdapters.un_co_detailsTableAdapter compTA = new CompanyTableAdapters.un_co_detailsTableAdapter();
        if (Session[WebConstants.Session.REGISTERING_FOR_TRIAL] != null)
        {
            compTA.CompanyTrialUpdate((int)Session[WebConstants.Session.SIMPLICITY_COMPANY_ID], true);
            Simplicity.Data.SimplicityEntities simplicityDatabaseContext = new Simplicity.Data.SimplicityEntities();
            int userId = (int)Session[WebConstants.Session.SIMPLICITY_USER_ID];
            Simplicity.Data.UserProduct userProduct = (from userProd in simplicityDatabaseContext.UserProducts where userProd.ProductID == 2 && userProd.UserID == userId select userProd).FirstOrDefault();
            if (userProduct == null)
            {
                userProduct = new Simplicity.Data.UserProduct();
                userProduct.UserID = userId;
                userProduct.ProductID = 2;
                simplicityDatabaseContext.AddToUserProducts(userProduct);
            }
            userProduct.IsTrial = true;
            userProduct.StartDate = DateTime.Now;
            userProduct.EndDate = DateTime.Now.AddDays(15);
            simplicityDatabaseContext.SaveChanges();
        }
        else
        {
            compTA.CompanyTrialUpdate((int)Session[WebConstants.Session.SIMPLICITY_COMPANY_ID], false);
        }
    }
}
