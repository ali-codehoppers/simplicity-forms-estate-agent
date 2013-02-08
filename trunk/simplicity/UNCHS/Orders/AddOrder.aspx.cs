using System;
using System.Linq;
using System.Collections;
using System.Text;
using EstateAgentEntityModel;
using System.Collections.Generic;

public partial class Orders_AddOrder : DepartmentPage
{
    protected PropertyDetail propertyDetail = null;
    private SimplicityWebEstateAgentEntities estateAgentDB = null;
    protected override void  Department_Page_Handling(object sender, EventArgs e)
    {
        estateAgentDB = new SimplicityWebEstateAgentEntities();
        if (Request[WebConstants.Request.PROPERTY_ORDER_ID] != null)
        {
            int propertyID = int.Parse(Request[WebConstants.Request.PROPERTY_ORDER_ID]);
            propertyDetail = estateAgentDB.PropertyDetails.SingleOrDefault(prop => prop.Sequence == propertyID);
            if (IsPostBack == false)
            {
                IEnumerable<EstateAgentEntityModel.RefDepartment> departments = (from dept in estateAgentDB.RefDepartments where dept.CompanySequence == loggedInUserCoId && dept.FlgDeleted != true select dept);
                ddlDepartment.DataSource = departments;
                ddlDepartment.DataBind();

                IEnumerable<EstateAgentEntityModel.RefCategory> categories = (from categ in estateAgentDB.RefCategories where categ.CompanySequence == loggedInUserCoId && categ.FlgDeleted != true select categ);
                ddlCategory.DataSource = categories;
                ddlCategory.DataBind();

                if (propertyDetail != null)
                {
                    tbAddressNo.Text = propertyDetail.AddressNo;
                    tbAddress1.Text = propertyDetail.AddressLine1;
                    tbAddress2.Text = propertyDetail.AddressLine2;
                    tbAddress3.Text = propertyDetail.AddressLine3;
                    tbAddress4.Text = propertyDetail.AddressLine4;
                    tbAddress5.Text = propertyDetail.AddressLine5;
                    tbPostalCode.Text = propertyDetail.AddressPostCode;

                    
                    //zain


                    if (propertyDetail.upsizeTs == true)
                    {
                        CheckBoxUpsizeTs.Checked=true;
                    }
                    else
                    {
                        CheckBoxUpsizeTs.Checked = false;
                    }
                    TextBoxContactName.Text = propertyDetail.contactName;
                    TextBoxContactDetails.Text = propertyDetail.contactDetails;
                    TextBoxContactTeleponeHome.Text = propertyDetail.contactTelHome;
                    TextBoxContactTeleponeWork.Text = propertyDetail.contactTelWork;
                    TextBoxContactTeleponeWorkExtension.Text = propertyDetail.contactTelWorkExt;
                    TextBoxVisitDetails.Text = propertyDetail.visitDetails;
                    if (propertyDetail.dateVisit != null)
                    {
                        TextBoxDateVisit.Text = propertyDetail.dateVisit.Value.ToShortDateString();
                    }
                    else
                    {
                        TextBoxDateVisit.Text = "";
                    }
                    
                    //zain



                    //add
                    PropertyFieldDepartment propFieldDepartment = null;
                    PropertyFieldCategory propFieldCategory = null;
                    try
                    {
                        propFieldDepartment = propertyDetail.PropertyFieldDepartments.SingleOrDefault(proFieDept => proFieDept.PropertySequence == propertyDetail.Sequence && proFieDept.CompanySequence == propertyDetail.CompanySequence);
                        propFieldCategory = propertyDetail.PropertyFieldCategories.SingleOrDefault(proFieCategory => proFieCategory.PropertySequence == propertyDetail.Sequence && proFieCategory.CompanySequence == propertyDetail.CompanySequence);
                    }
                    catch { }
                    if (propFieldCategory != null)
                        ddlCategory.SelectedValue = propFieldCategory.CategorySequence.ToString();
                    if(propFieldDepartment != null)
                        ddlDepartment.SelectedValue = propFieldDepartment.DepartmentSequence.ToString();
                    ValuationCodeTextBoxId.Text = propertyDetail.ValuationCode;
                    PropertyHeadingTextBox.Text = propertyDetail.PropHeading;
                    PropertyDetailTextBox.Text = propertyDetail.PropDetailed;
                    PropertySummaryTextBox.Text = propertyDetail.PropSummary;
                    BulletPoint1TextBox.Text = propertyDetail.PropBulletPoint01;
                    BulletPoint2TextBox.Text = propertyDetail.PropBulletPoint02;
                    BulletPoint3TextBox.Text = propertyDetail.PropBulletPoint03;
                    BulletPoint4TextBox.Text = propertyDetail.PropBulletPoint04;
                    BulletPoint5TextBox.Text = propertyDetail.PropBulletPoint05;
                    BulletPoint6TextBox.Text = propertyDetail.PropBulletPoint06;
                    BulletPoint7TextBox.Text = propertyDetail.PropBulletPoint07;
                    BulletPoint8TextBox.Text = propertyDetail.PropBulletPoint08;
                }
            }

        }
        else
        {
          ClientScript.RegisterStartupScript(this.GetType(), "showCopyDialog", "YAHOO.util.Event.onDOMReady(showCopyDialog);", true);

          IEnumerable<EstateAgentEntityModel.RefDepartment> departments = (from dept in estateAgentDB.RefDepartments where dept.CompanySequence == loggedInUserCoId && dept.FlgDeleted != true select dept);
          ddlDepartment.DataSource = departments;
          ddlDepartment.DataBind();
          ddlDepartment.Visible = true;
          lblDepartment.Visible = true;
          ddlDepartment.SelectedValue = departments.FirstOrDefault().Sequence.ToString();

          IEnumerable<EstateAgentEntityModel.RefCategory> categories = (from categ in estateAgentDB.RefCategories where categ.CompanySequence == loggedInUserCoId && categ.FlgDeleted != true select categ);
          ddlCategory.DataSource = categories;
          ddlCategory.DataBind();
          ddlCategory.Visible = true;
          lblCategory.Visible = true;
          ddlCategory.SelectedValue = categories.FirstOrDefault().Sequence.ToString();
        }
    }


    private void preSaveProperty()
    {
        if (propertyDetail == null)
        {
            propertyDetail = new PropertyDetail();
            propertyDetail.AddressNo = tbPopupFlat.Text;
            propertyDetail.AddressLine1 = tbPopupAddress1.Text;
            propertyDetail.AddressLine2 = tbPopupAddress2.Text;
            propertyDetail.AddressLine3 = tbPopupAddress3.Text;
            propertyDetail.AddressLine4 = tbPopupAddress4.Text;
            propertyDetail.AddressLine5 = tbPopupAddress5.Text;
            propertyDetail.AddressPostCode = tbPopupPostCode.Text;
            propertyDetail.AddressFull = getPopupFullAddress();
            propertyDetail.CompanySequence = loggedInUserCoId;

            //zain
            propertyDetail.contactName = TextBoxContactName.Text;
            propertyDetail.contactDetails = TextBoxContactDetails.Text;
            propertyDetail.contactTelHome = TextBoxContactTeleponeHome.Text;
            propertyDetail.contactTelWork = TextBoxContactTeleponeWork.Text;
            propertyDetail.contactTelWorkExt = TextBoxContactTeleponeWorkExtension.Text;
            propertyDetail.visitDetails = TextBoxVisitDetails.Text;
            if (TextBoxDateVisit.Text != null && TextBoxDateVisit.Text != "")
            {
                propertyDetail.dateVisit = Convert.ToDateTime(TextBoxDateVisit.Text);
            }

            
            if (CheckBoxUpsizeTs.Checked)
            {
                propertyDetail.upsizeTs = true;
            }
            else
            {
                propertyDetail.upsizeTs = false;
            }

            

            
            //zain

            propertyDetail.CreatedBy = loggedInUserId;
            propertyDetail.LastAmendedBy = loggedInUserId;
            propertyDetail.DateCreated = System.DateTime.Now;
            propertyDetail.DateLastAmended = System.DateTime.Now;
            propertyDetail.FlgDeleted = false;
            estateAgentDB.PropertyDetails.AddObject(propertyDetail);
            estateAgentDB.SaveChanges();

            PropertyFieldDepartment propFieldDepartment = new PropertyFieldDepartment();
            propFieldDepartment.CompanySequence = loggedInUserCoId;
            propFieldDepartment.PropertySequence = propertyDetail.Sequence;
            propFieldDepartment.DepartmentSequence = int.Parse(ddlDepartment.SelectedValue);
            propFieldDepartment.CreatedBy = loggedInUserId;
            propFieldDepartment.LastAmendedBy = loggedInUserId;
            propFieldDepartment.DateCreated = System.DateTime.Now;
            propFieldDepartment.DateLastAmended = System.DateTime.Now;
            propertyDetail.PropertyFieldDepartments.Add(propFieldDepartment);

            PropertyFieldCategory propFieldCategory = new PropertyFieldCategory();
            propFieldCategory.CompanySequence = loggedInUserCoId;
            propFieldCategory.PropertySequence = propertyDetail.Sequence;
            propFieldCategory.CategorySequence = int.Parse(ddlCategory.SelectedValue);
            propFieldCategory.CreatedBy = loggedInUserId;
            propFieldCategory.LastAmendedBy = loggedInUserId;
            propFieldCategory.DateCreated = System.DateTime.Now;
            propFieldCategory.DateLastAmended = System.DateTime.Now;
            propertyDetail.PropertyFieldCategories.Add(propFieldCategory);

            estateAgentDB.SaveChanges();
            Response.Redirect("~/Orders/AddOrder.aspx?" + WebConstants.Request.PROPERTY_ORDER_ID + "=" + propertyDetail.Sequence);
        }
    }

    
    
    private string getOrderSMS(string order_sms)
    {
        string smsOrder = order_sms.ToString();
        while (smsOrder.Length < 6)
        {
            smsOrder = smsOrder.Insert(0, "0");
        }
        return smsOrder;
    }

    private void handleDisplayLogic(bool isCancelled)
    {
        enableFields(!isCancelled);
        btnCancel.Visible = !isCancelled;
        btnUpdate.Visible = !isCancelled;
        btnUncancel.Visible = isCancelled;
    }

    private void enableFields(bool enable)
    {
        ddlDepartment.Enabled = enable;
        ddlCategory.Enabled = enable;
        tbAddressNo.Enabled = enable;
        tbAddress1.Enabled = enable;
        tbAddress2.Enabled = enable;
        tbAddress3.Enabled = enable;
        tbAddress4.Enabled = enable;
        tbAddress5.Enabled = enable;
        tbPostalCode.Enabled = enable;
    }
    protected void ddlDepartment_DataBound(object sender, EventArgs e)
    {
        if (ddlDepartment.Items.Count <= 1)
        {
            ddlDepartment.Visible = false;
            lblDepartment.Visible = false;
        }
    }
    protected void ddlCategory_DataBound(object sender, EventArgs e)
    {
        if (ddlCategory.Items.Count <= 1)
        {
            ddlCategory.Visible = false;
            lblCategory.Visible = false;
        }
    }

    protected void cbReview_CheckedChanged(object sender, EventArgs e)
    {
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        handleDisplayLogic(true);
    }

    private string getFullAddress()
    {
        StringBuilder addressFull = new StringBuilder();
        addressFull.Append(tbAddressNo.Text).Append(" ");
        addressFull.Append(tbAddress1.Text).Append(" ");
        addressFull.Append(tbAddress2.Text).Append(" ");
        addressFull.Append(tbAddress3.Text).Append(" ");
        addressFull.Append(tbAddress4.Text).Append(" ");
        addressFull.Append(tbAddress5.Text).Append(" ");
        addressFull.Append(tbPostalCode.Text);
        return addressFull.ToString();
    }

    private string getPopupFullAddress()
    {
        StringBuilder addressFull = new StringBuilder();
        addressFull.Append(tbPopupFlat.Text).Append(" ");
        addressFull.Append(tbPopupAddress1.Text).Append(" ");
        addressFull.Append(tbPopupAddress2.Text).Append(" ");
        addressFull.Append(tbPopupAddress3.Text).Append(" ");
        addressFull.Append(tbPopupAddress4.Text).Append(" ");
        addressFull.Append(tbPopupAddress5.Text).Append(" ");
        addressFull.Append(tbPopupPostCode.Text);
        return addressFull.ToString();
    }

    protected void btnUncancel_Click(object sender, EventArgs e)
    {
    }
    protected void ShowRoomDetails(object sender, EventArgs e)
    {
        saveProperty();
        Response.Redirect("~/Orders/AddOrderPeople.aspx?" + WebConstants.Request.PROPERTY_ORDER_ID + "=" + propertyDetail.Sequence);
    }

    private void saveProperty()
    {
        PropertyFieldDepartment propFieldDepartment = null;
        PropertyFieldCategory propFieldCategory = null;
        if (propertyDetail == null)
        {
            propertyDetail = new PropertyDetail();
            propertyDetail.CompanySequence = loggedInUserCoId;
            propertyDetail.CreatedBy = loggedInUserId;
            propertyDetail.DateCreated = System.DateTime.Now;
            propertyDetail.FlgDeleted = false;


            //zain
            if (CheckBoxUpsizeTs.Checked)
            {
                propertyDetail.upsizeTs = true;
            }
            else
            {
                propertyDetail.upsizeTs = false;
            }
            propertyDetail.contactName = TextBoxContactName.Text;
            propertyDetail.contactDetails = TextBoxContactDetails.Text;
            propertyDetail.contactTelHome = TextBoxContactTeleponeHome.Text;
            propertyDetail.contactTelWork = TextBoxContactTeleponeWork.Text;
            propertyDetail.contactTelWorkExt = TextBoxContactTeleponeWorkExtension.Text;
            propertyDetail.visitDetails = TextBoxVisitDetails.Text;
            if (TextBoxDateVisit.Text != null && TextBoxDateVisit.Text != "")
            {
                propertyDetail.dateVisit = Convert.ToDateTime(TextBoxDateVisit.Text);
            }
                //property.upsizeTs = TextBoxUpsizeTs.;
            
            //property.visitDetails =text
            //zain




            estateAgentDB.PropertyDetails.AddObject(propertyDetail);
            estateAgentDB.SaveChanges();

            propFieldDepartment = new PropertyFieldDepartment();
            propFieldDepartment.CompanySequence = loggedInUserCoId;
            propFieldDepartment.PropertySequence = propertyDetail.Sequence;
            propFieldDepartment.CreatedBy = loggedInUserId;
            propFieldDepartment.DateCreated = System.DateTime.Now;
            propertyDetail.PropertyFieldDepartments.Add(propFieldDepartment);

            propFieldCategory = new PropertyFieldCategory();
            propFieldCategory.CompanySequence = loggedInUserCoId;
            propFieldCategory.PropertySequence = propertyDetail.Sequence;
            propFieldCategory.CreatedBy = loggedInUserId;
            propFieldCategory.DateCreated = System.DateTime.Now;
            propertyDetail.PropertyFieldCategories.Add(propFieldCategory);
            //add

        }

        if (propFieldDepartment == null)
            propFieldDepartment = propertyDetail.PropertyFieldDepartments.SingleOrDefault(proFieDept => proFieDept.PropertySequence == propertyDetail.Sequence && proFieDept.CompanySequence == propertyDetail.CompanySequence);
        if (propFieldDepartment != null)
        {
            propFieldDepartment.DepartmentSequence = int.Parse(ddlDepartment.SelectedValue);
            propFieldDepartment.LastAmendedBy = loggedInUserId;
            propFieldDepartment.DateLastAmended = System.DateTime.Now;
        }

        if (propFieldCategory == null)
            propFieldCategory = propertyDetail.PropertyFieldCategories.SingleOrDefault(proFieCategory => proFieCategory.PropertySequence == propertyDetail.Sequence && proFieCategory.CompanySequence == propertyDetail.CompanySequence);
        if (propFieldCategory != null)
        {
            propFieldCategory.CategorySequence = int.Parse(ddlCategory.SelectedValue);
            propFieldCategory.LastAmendedBy = loggedInUserId;
            propFieldCategory.DateLastAmended = System.DateTime.Now;
        }

        propertyDetail.AddressNo = tbAddressNo.Text;
        propertyDetail.AddressLine1 = tbAddress1.Text;
        propertyDetail.AddressLine2 = tbAddress2.Text;
        propertyDetail.AddressLine3 = tbAddress3.Text;
        propertyDetail.AddressLine4 = tbAddress4.Text;
        propertyDetail.AddressLine5 = tbAddress5.Text;
        propertyDetail.AddressPostCode = tbPostalCode.Text;
        propertyDetail.AddressFull = getFullAddress();

        propertyDetail.LastAmendedBy = loggedInUserId;
        propertyDetail.DateLastAmended = System.DateTime.Now;
        propertyDetail.ValuationCode = ValuationCodeTextBoxId.Text;
        propertyDetail.PropHeading = PropertyHeadingTextBox.Text;
        propertyDetail.PropDetailed = PropertyDetailTextBox.Text;
        propertyDetail.PropSummary = PropertySummaryTextBox.Text;
        propertyDetail.PropBulletPoint01 = BulletPoint1TextBox.Text;
        propertyDetail.PropBulletPoint02 = BulletPoint2TextBox.Text;
        propertyDetail.PropBulletPoint03 = BulletPoint3TextBox.Text;
        propertyDetail.PropBulletPoint04 = BulletPoint4TextBox.Text;
        propertyDetail.PropBulletPoint05 = BulletPoint5TextBox.Text;
        propertyDetail.PropBulletPoint06 = BulletPoint6TextBox.Text;
        propertyDetail.PropBulletPoint07 = BulletPoint7TextBox.Text;
        propertyDetail.PropBulletPoint08 = BulletPoint8TextBox.Text;
        //zain

        if (CheckBoxUpsizeTs.Checked)
        {
            propertyDetail.upsizeTs = true;
        }
        else
        {
            propertyDetail.upsizeTs = false;
        }
        propertyDetail.contactName = TextBoxContactName.Text;
        propertyDetail.contactDetails = TextBoxContactDetails.Text;
        propertyDetail.contactTelHome = TextBoxContactTeleponeHome.Text;
        propertyDetail.contactTelWork = TextBoxContactTeleponeWork.Text;
        propertyDetail.contactTelWorkExt = TextBoxContactTeleponeWorkExtension.Text;
        propertyDetail.visitDetails = TextBoxVisitDetails.Text;
        if (TextBoxDateVisit.Text != null && TextBoxDateVisit.Text != "")
        {
            propertyDetail.dateVisit = Convert.ToDateTime(TextBoxDateVisit.Text);
        }
        //zain

        estateAgentDB.SaveChanges();
    }
    protected void SavePropertyDetails(object sender, EventArgs e)
    {

        saveProperty();
        Response.Redirect("~/Orders/SearchOrder.aspx");
    }

    protected void btnCreate_Click(object sender, EventArgs e)
    {
        preSaveProperty();
    }


}
