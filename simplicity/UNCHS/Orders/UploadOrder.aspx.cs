using System;
using System.Linq;
using System.Collections;
using System.IO;
using EstateAgentEntityModel;
using System.Collections.Generic;
using LumenWorks.Framework.IO.Csv;


public partial class Orders_UploadOrder : DepartmentPage
{
    private SimplicityWebEstateAgentEntities estateAgentDB = null;

    protected override void Department_Page_Handling(object sender, EventArgs e)
    {
        estateAgentDB = new SimplicityWebEstateAgentEntities();
        IEnumerable<EstateAgentEntityModel.RefDepartment> departments = (from dept in estateAgentDB.RefDepartments where dept.CompanySequence == loggedInUserCoId && dept.FlgDeleted != true select dept);
        ddlDepartments.DataSource = departments;
        ddlDepartments.DataBind();

        IEnumerable<EstateAgentEntityModel.RefCategory> categories = (from categ in estateAgentDB.RefCategories where categ.CompanySequence == loggedInUserCoId && categ.FlgDeleted != true select categ);
        ddlCategory.DataSource = categories;
        ddlCategory.DataBind();
    }

    protected void ddlDepartments_DataBound(object sender, EventArgs e)
    {
        if (ddlDepartments.Items.Count <= 1)
        {
            ddlDepartments.Visible = false;
            lblDepartment.Visible = false;
        }
        else
        {
            ddlDepartments.Visible = true;
            lblDepartment.Visible = true;
        }
    }

    protected void ddlCategories_DataBound(object sender, EventArgs e)
    {
        if (ddlCategory.Items.Count <= 1)
        {
            ddlCategory.Visible = false;
            lblCategory.Visible = false;
        }
        else
        {
            ddlCategory.Visible = true;
            lblCategory.Visible = true;
        }
    }

    
    protected void btnUpload_Click(object sender, EventArgs e)
    {
        using (CsvReader csv = new CsvReader(new StreamReader(fileUpload.FileContent), true))
        {
            int count = 0;
            RefDepartment orderTA = new RefDepartment();
            int fieldCount = csv.FieldCount;
            string[] headers = csv.GetFieldHeaders();

            while (csv.ReadNextRecord())
            {
                string fullAddress = csv["address_line1"] + " " + csv["address_line2"] + csv["address_line3"] + csv["address_line4"] + csv["address_line5"] + csv["address_post_code"];

                PropertyDetail property = new PropertyDetail();
                //property.AddressNo = tbPopupFlat.Text;
                property.AddressLine1 = csv["address_line1"];
                property.AddressLine2 = csv["address_line2"];
                property.AddressLine3 = csv["address_line3"];
                property.AddressLine4 = csv["address_line4"];
                property.AddressLine5 = csv["address_line5"];
                property.AddressPostCode = csv["address_post_code"];
                property.AddressFull = fullAddress;
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
                propFieldDepartment.DepartmentSequence = int.Parse(ddlDepartments.SelectedValue);
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

                count++;
            }

            SetInfoMessage(count + " properties added to the system.");
        }
    }

    //private string getOrderSMS(string orderSMS)
    //{
    //    string smsOrder = orderSMS.ToString();
    //    while (smsOrder.Length < 6)
    //    {
    //        smsOrder = smsOrder.Insert(0, "0");
    //    }
    //    return smsOrder;
    //}
}