using System;
using System.Linq;
using System.Collections;
using System.Text;
using EstateAgentEntityModel;
using System.Collections.Generic;

public partial class Orders_AddOrder : DepartmentPage
{
    protected EstateAgentEntityModel.PropertyDetail property = null;
    private SimplicityWebEstateAgentEntities estateAgentDB = null;
    protected override void  Department_Page_Handling(object sender, EventArgs e)
    {
        estateAgentDB = new SimplicityWebEstateAgentEntities();
        if (Request[WebConstants.Request.PROPERTY_ORDER_ID] != null)
        {
            int propertyID = int.Parse(Request[WebConstants.Request.PROPERTY_ORDER_ID]);
            property = estateAgentDB.PropertyDetails.SingleOrDefault(prop => prop.Sequence == propertyID);
            if (IsPostBack == false)
            {
                IEnumerable<EstateAgentEntityModel.RefDepartment> departments = (from dept in estateAgentDB.RefDepartments where dept.CompanySequence == loggedInUserCoId && dept.FlgDeleted != true select dept);
                ddlDepartment.DataSource = departments;
                ddlDepartment.DataBind();

                IEnumerable<EstateAgentEntityModel.RefCategory> categories = (from categ in estateAgentDB.RefCategories where categ.CompanySequence == loggedInUserCoId && categ.FlgDeleted != true select categ);
                ddlCategory.DataSource = categories;
                ddlCategory.DataBind();

                if (property != null)
                {
                    tbAddressNo.Text = property.AddressNo;
                    tbAddress1.Text = property.AddressLine1;
                    tbAddress2.Text = property.AddressLine2;
                    tbAddress3.Text = property.AddressLine3;
                    tbAddress4.Text = property.AddressLine4;
                    tbAddress5.Text = property.AddressLine5;
                    tbPostalCode.Text = property.AddressPostCode;

                    PropertyFieldDepartment propFieldDepartment = null;
                    PropertyFieldCategory propFieldCategory = null;
                    try
                    {
                        propFieldDepartment = property.PropertyFieldDepartments.SingleOrDefault(proFieDept => proFieDept.PropertySequence == property.Sequence && proFieDept.CompanySequence == property.CompanySequence);
                        propFieldCategory = property.PropertyFieldCategories.SingleOrDefault(proFieCategory => proFieCategory.PropertySequence == property.Sequence && proFieCategory.CompanySequence == property.CompanySequence);
                    }
                    catch { }
                    if (propFieldCategory != null)
                        ddlCategory.SelectedValue = propFieldCategory.CategorySequence.ToString();
                    if(propFieldDepartment != null)
                        ddlDepartment.SelectedValue = propFieldDepartment.DepartmentSequence.ToString();
                    ValuationCodeTextBoxId.Text = property.ValuationCode;
                    PropertyHeadingTextBox.Text = property.PropHeading;
                    PropertyDetailTextBox.Text = property.PropDetailed;
                    PropertySummaryTextBox.Text = property.PropSummary;
                    BulletPoint1TextBox.Text = property.PropBulletPoint01;
                    BulletPoint2TextBox.Text = property.PropBulletPoint02;
                    BulletPoint3TextBox.Text = property.PropBulletPoint03;
                    BulletPoint4TextBox.Text = property.PropBulletPoint04;
                    BulletPoint5TextBox.Text = property.PropBulletPoint05;
                    BulletPoint6TextBox.Text = property.PropBulletPoint06;
                    BulletPoint7TextBox.Text = property.PropBulletPoint07;
                    BulletPoint8TextBox.Text = property.PropBulletPoint08;
                }
            }

        }
        else
        {
          ClientScript.RegisterStartupScript(this.GetType(), "showCopyDialog", "YAHOO.util.Event.onDOMReady(showCopyDialog);", true);

          IEnumerable<EstateAgentEntityModel.RefDepartment> departments = (from dept in estateAgentDB.RefDepartments where dept.CompanySequence == loggedInUserCoId && dept.FlgDeleted != true select dept);
          ddlDepartment.DataSource = departments;
          ddlDepartment.DataBind();
          ddlDepartment.SelectedValue = departments.FirstOrDefault().Sequence.ToString();

          IEnumerable<EstateAgentEntityModel.RefCategory> categories = (from categ in estateAgentDB.RefCategories where categ.CompanySequence == loggedInUserCoId && categ.FlgDeleted != true select categ);
          ddlCategory.DataSource = categories;
          ddlCategory.DataBind();
          ddlCategory.SelectedValue = categories.FirstOrDefault().Sequence.ToString();
        }
    }


    private void preSaveProperty()
    {
        if (property == null)
        {
            property = new PropertyDetail();
            property.AddressNo = tbPopupFlat.Text;
            property.AddressLine1 = tbPopupAddress1.Text;
            property.AddressLine2 = tbPopupAddress2.Text;
            property.AddressLine3 = tbPopupAddress3.Text;
            property.AddressLine4 = tbPopupAddress4.Text;
            property.AddressLine5 = tbPopupAddress5.Text;
            property.AddressPostCode = tbPopupPostCode.Text;
            property.AddressFull = getPopupFullAddress();
            property.CompanySequence = loggedInUserCoId;
            property.CreatedBy = loggedInUserId;
            property.LastAmendedBy = loggedInUserId;
            property.DateCreated = System.DateTime.Now;
            property.DateLastAmended = System.DateTime.Now;
            property.FlgDeleted = false;
            estateAgentDB.PropertyDetails.AddObject(property);
            estateAgentDB.SaveChanges();

            PropertyFieldDepartment propFieldDepartment = new PropertyFieldDepartment();
            propFieldDepartment.CompanySequence = loggedInUserCoId;
            propFieldDepartment.PropertySequence = property.Sequence;
            propFieldDepartment.DepartmentSequence = int.Parse(ddlDepartment.SelectedValue);
            propFieldDepartment.CreatedBy = loggedInUserId;
            propFieldDepartment.LastAmendedBy = loggedInUserId;
            propFieldDepartment.DateCreated = System.DateTime.Now;
            propFieldDepartment.DateLastAmended = System.DateTime.Now;
            property.PropertyFieldDepartments.Add(propFieldDepartment);

            PropertyFieldCategory propFieldCategory = new PropertyFieldCategory();
            propFieldCategory.CompanySequence = loggedInUserCoId;
            propFieldCategory.PropertySequence = property.Sequence;
            propFieldCategory.CategorySequence = int.Parse(ddlCategory.SelectedValue);
            propFieldCategory.CreatedBy = loggedInUserId;
            propFieldCategory.LastAmendedBy = loggedInUserId;
            propFieldCategory.DateCreated = System.DateTime.Now;
            propFieldCategory.DateLastAmended = System.DateTime.Now;
            property.PropertyFieldCategories.Add(propFieldCategory);

            estateAgentDB.SaveChanges();
            Response.Redirect("~/Orders/AddOrder.aspx?" + WebConstants.Request.PROPERTY_ORDER_ID + "=" + property.Sequence);
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
        Response.Redirect("~/Orders/AddOrderPeople.aspx?" + WebConstants.Request.PROPERTY_ORDER_ID + "=" + property.Sequence);
    }

    private void saveProperty()
    {
        PropertyFieldDepartment propFieldDepartment = null;
        PropertyFieldCategory propFieldCategory = null;
        if (property == null)
        {
            property = new PropertyDetail();
            property.CompanySequence = loggedInUserCoId;
            property.CreatedBy = loggedInUserId;
            property.DateCreated = System.DateTime.Now;
            property.FlgDeleted = false;
            estateAgentDB.PropertyDetails.AddObject(property);
            estateAgentDB.SaveChanges();

            propFieldDepartment = new PropertyFieldDepartment();
            propFieldDepartment.CompanySequence = loggedInUserCoId;
            propFieldDepartment.PropertySequence = property.Sequence;
            propFieldDepartment.CreatedBy = loggedInUserId;
            propFieldDepartment.DateCreated = System.DateTime.Now;
            property.PropertyFieldDepartments.Add(propFieldDepartment);

            propFieldCategory = new PropertyFieldCategory();
            propFieldCategory.CompanySequence = loggedInUserCoId;
            propFieldCategory.PropertySequence = property.Sequence;
            propFieldCategory.CreatedBy = loggedInUserId;
            propFieldCategory.DateCreated = System.DateTime.Now;
            property.PropertyFieldCategories.Add(propFieldCategory);
        }

        if (propFieldDepartment == null)
            propFieldDepartment = property.PropertyFieldDepartments.SingleOrDefault(proFieDept => proFieDept.PropertySequence == property.Sequence && proFieDept.CompanySequence == property.CompanySequence);
        if (propFieldDepartment != null)
        {
            propFieldDepartment.DepartmentSequence = int.Parse(ddlDepartment.SelectedValue);
            propFieldDepartment.LastAmendedBy = loggedInUserId;
            propFieldDepartment.DateLastAmended = System.DateTime.Now;
        }

        if (propFieldCategory == null)
            propFieldCategory = property.PropertyFieldCategories.SingleOrDefault(proFieCategory => proFieCategory.PropertySequence == property.Sequence && proFieCategory.CompanySequence == property.CompanySequence);
        if (propFieldCategory != null)
        {
            propFieldCategory.CategorySequence = int.Parse(ddlCategory.SelectedValue);
            propFieldCategory.LastAmendedBy = loggedInUserId;
            propFieldCategory.DateLastAmended = System.DateTime.Now;
        }

        property.AddressNo = tbAddressNo.Text;
        property.AddressLine1 = tbAddress1.Text;
        property.AddressLine2 = tbAddress2.Text;
        property.AddressLine3 = tbAddress3.Text;
        property.AddressLine4 = tbAddress4.Text;
        property.AddressLine5 = tbAddress5.Text;
        property.AddressPostCode = tbPostalCode.Text;
        property.AddressFull = getFullAddress();

        property.LastAmendedBy = loggedInUserId;
        property.DateLastAmended = System.DateTime.Now;
        property.ValuationCode = ValuationCodeTextBoxId.Text;
        property.PropHeading = PropertyHeadingTextBox.Text;
        property.PropDetailed = PropertyDetailTextBox.Text;
        property.PropSummary = PropertySummaryTextBox.Text;
        property.PropBulletPoint01 = BulletPoint1TextBox.Text;
        property.PropBulletPoint02 = BulletPoint2TextBox.Text;
        property.PropBulletPoint03 = BulletPoint3TextBox.Text;
        property.PropBulletPoint04 = BulletPoint4TextBox.Text;
        property.PropBulletPoint05 = BulletPoint5TextBox.Text;
        property.PropBulletPoint06 = BulletPoint6TextBox.Text;
        property.PropBulletPoint07 = BulletPoint7TextBox.Text;
        property.PropBulletPoint08 = BulletPoint8TextBox.Text;

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
