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
using System.Data.SqlClient;
using System.Text;

using System.Linq;

using EstateAgentEntityModel;

public partial class Orders_SearchOrder : AuthenticatedPage
{

    SimplicityWebEstateAgentEntities db = new SimplicityWebEstateAgentEntities();
    protected override void Page_Load_Extended(object sender, EventArgs e)
    {
        SetWhereClause();
    }
    

    private void SetWhereClause()
    {
        edsProperties.Where = "";
        if (tbValuationCode.Text.Length > 0)
        {
            edsProperties.Where += "it.ValuationCode LIKE @ValuationCode";
            if (edsProperties.WhereParameters["ValuationCode"] != null)
            {
                edsProperties.WhereParameters["ValuationCode"].DefaultValue = "%" + tbValuationCode.Text + "%";
            }
            else
            {
                Parameter parameter = new Parameter();
                parameter.Name = "ValuationCode";
                parameter.DbType = System.Data.DbType.String;
                parameter.DefaultValue = "%" + tbValuationCode.Text + "%";
                edsProperties.WhereParameters.Add(parameter);
            }
        }
        if (tbAddress.Text.Length > 0)
        {
            if(edsProperties.Where.Length > 0)
            {
                edsProperties.Where += " AND ";
            }
            edsProperties.Where += "it.AddressFull LIKE @Address";

            if (edsProperties.WhereParameters["Address"] != null)
            {
                edsProperties.WhereParameters["Address"].DefaultValue = "%" + tbAddress.Text + "%";
            }
            else
            {
                Parameter parameter = new Parameter();
                parameter.Name = "Address";
                parameter.DbType = System.Data.DbType.String;
                parameter.DefaultValue = "%" + tbAddress.Text + "%";
                edsProperties.WhereParameters.Add(parameter);
            }
        }
        if (tbPostalCode.Text.Length > 0)
        {
            if (edsProperties.Where.Length > 0)
            {
                edsProperties.Where += " AND ";
            }
            edsProperties.Where += "it.AddressPostCode LIKE @PostalCode";

            if (edsProperties.WhereParameters["PostalCode"] != null)
            {
                edsProperties.WhereParameters["PostalCode"].DefaultValue = "%" + tbPostalCode.Text + "%";
            }
            else
            {
                Parameter parameter = new Parameter();
                parameter.Name = "PostalCode";
                parameter.DbType = System.Data.DbType.String;
                parameter.DefaultValue = "%" + tbPostalCode.Text + "%";
                   edsProperties.WhereParameters.Add(parameter);
            }
        }

        if (tbFromDate.Text.Length > 0)
        {
            if (edsProperties.Where.Length > 0)
            {
                edsProperties.Where += " AND ";
            }
            edsProperties.Where += "it.DateCreated >= @FromDate";
                
            if (edsProperties.WhereParameters["FromDate"] != null)
            {
                edsProperties.WhereParameters["FromDate"].DefaultValue = tbFromDate.Text ;
            }
            else
            {
                Parameter parameter = new Parameter();
                parameter.Name = "FromDate";
                parameter.DbType = System.Data.DbType.Date;
                parameter.DefaultValue = tbFromDate.Text;
                edsProperties.WhereParameters.Add(parameter);
            }
        }

        if (tbToDate.Text.Length > 0)
        {
            if (edsProperties.Where.Length > 0)
            {
                edsProperties.Where += " AND ";
            }
            edsProperties.Where += "it.DateCreated <= @ToDate";
            
            if (edsProperties.WhereParameters["ToDate"] != null)
            {
                edsProperties.WhereParameters["ToDate"].DefaultValue = DateTime.Parse(tbToDate.Text).AddDays(1).ToShortDateString();
            }
            else
            {
                Parameter parameter = new Parameter();
                parameter.Name = "ToDate";
                parameter.DbType = System.Data.DbType.Date;
                parameter.DefaultValue = tbToDate.Text;
                edsProperties.WhereParameters.Add(parameter);
            }
        }
    }

    protected void btnCopy_Click(object sender, EventArgs e)
    {

        int propertyId = int.Parse(hfSourceOrderId.Value);
        PropertyDetail property = (from p in db.PropertyDetails where p.Sequence == propertyId select p).FirstOrDefault();
        PropertyDetail newProperty = new PropertyDetail();
        newProperty.AddressNo = tbAddressNo.Text;
        newProperty.AddressLine1 = tbAddress1.Text;
        newProperty.AddressLine2 = tbAddress2.Text;
        newProperty.AddressLine3 = tbAddress3.Text;
        newProperty.AddressLine4 = tbAddress4.Text;
        newProperty.AddressLine5 = tbAddress5.Text;
        newProperty.AddressPostCode = tbPostalCode.Text;
        newProperty.AddressFull = GetFullAddress();

        newProperty.CompanySequence = property.CompanySequence;
        newProperty.DateCreated = DateTime.Now;
        newProperty.CreatedBy = loggedInUserId;
        newProperty.FlgDeleted = false;
        newProperty.LastAmendedBy = loggedInUserId;
        newProperty.DateLastAmended = DateTime.Now;
        newProperty.PropBulletPoint01 = property.PropBulletPoint01;
        newProperty.PropBulletPoint02 = property.PropBulletPoint02;
        newProperty.PropBulletPoint03 = property.PropBulletPoint03;
        newProperty.PropBulletPoint04 = property.PropBulletPoint04;
        newProperty.PropBulletPoint05 = property.PropBulletPoint05;
        newProperty.PropBulletPoint06 = property.PropBulletPoint06;
        newProperty.PropBulletPoint07 = property.PropBulletPoint07;
        newProperty.PropBulletPoint08 = property.PropBulletPoint08;
        newProperty.PropDetailed = property.PropDetailed;
        newProperty.PropertyCode = property.PropertyCode;
        //categories
        //departments
        //rooms
        newProperty.PropHeading = property.PropHeading;
        newProperty.PropSummary = property.PropSummary;
        newProperty.ValuationCode = property.ValuationCode;

        foreach (PropertyFieldCategory propertyCategory in property.PropertyFieldCategories)
        {
            PropertyFieldCategory newPropertyCategory = new PropertyFieldCategory();
            newPropertyCategory.CategorySequence = propertyCategory.CategorySequence;
            newPropertyCategory.CreatedBy = loggedInUserId;
            newPropertyCategory.DateCreated = DateTime.Now;
            newPropertyCategory.DateLastAmended = DateTime.Now;
            newPropertyCategory.LastAmendedBy = loggedInUserId;
            newProperty.PropertyFieldCategories.Add(newPropertyCategory);
        }

        foreach (PropertyFieldDepartment propertyDepartment in property.PropertyFieldDepartments)
        {
            PropertyFieldDepartment newPropertyDepartment = new PropertyFieldDepartment();
            newPropertyDepartment.CompanySequence = propertyDepartment.CompanySequence;
            newPropertyDepartment.CreatedBy = loggedInUserId;
            newPropertyDepartment.DateCreated = DateTime.Now;
            newPropertyDepartment.DateLastAmended = DateTime.Now;
            newPropertyDepartment.LastAmendedBy = loggedInUserId;
            newPropertyDepartment.DepartmentSequence = propertyDepartment.DepartmentSequence;
            newProperty.PropertyFieldDepartments.Add(newPropertyDepartment);
        }

        foreach (PropertyRoom room in property.PropertyRooms)
        {
            PropertyRoom newRoom = new PropertyRoom();
            newRoom.CompanySequence = room.CompanySequence;
            newRoom.CreatedBy = loggedInUserId;
            newRoom.DateCreated = DateTime.Now;
            newRoom.DateLastAmended = DateTime.Now;
            newRoom.LastAmendedBy = loggedInUserId;
            newRoom.RoomAspect = room.RoomAspect;
            newRoom.RoomHeading = room.RoomHeading;
            newRoom.RoomLengthFt = room.RoomLengthFt;
            newRoom.RoomLengthIn = room.RoomLengthIn;
            newRoom.RoomLengthM = room.RoomLengthM;
            newRoom.RoomLengthText = room.RoomLengthText;
            newRoom.RoomNo = room.RoomNo;
            newRoom.RoomText = room.RoomText;
            newRoom.RoomWidthFt = room.RoomWidthFt;
            newRoom.RoomWidthIn = room.RoomWidthIn;
            newRoom.RoomWidthM = room.RoomWidthM;
            newRoom.RoomWidthText = room.RoomWidthText;
            newProperty.PropertyRooms.Add(newRoom);
        }
        db.PropertyDetails.AddObject(newProperty);
        db.SaveChanges();
        
        GridView1.DataBind();
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        GridView1.DataBind();
    }

    protected void btnCreate_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Orders/AddOrder.aspx");
    }

    protected void DeleteDepartmentOrder(int deptOrderId)
    {
        /*
        DataTable department = getDepartmentOrder(deptOrderId);
        if (department == null)
        {
            SetErrorMessage(WebConstants.Messages.Error.INVALID_ID);
        }
        else
        {
            try
            {
                DepartmentOrderTableAdapters.DepartmentOrderRowTableAdapter tableAdapter = new DepartmentOrderTableAdapters.DepartmentOrderRowTableAdapter();
                tableAdapter.Delete(deptOrderId);
                SetInfoMessage(WebConstants.Messages.Information.RECORD_DELETED);
                GridView1.DataBind();
            }
            catch
            {
                SetErrorMessage(WebConstants.Messages.Error.CONNECTION_ERROR);
            }
        }*/
    }
    private DataTable getDepartmentOrder(int DepartmentOrderId)
    {
        DepartmentOrderTableAdapters.DepartmentOrderRowTableAdapter tableAdaptor = new DepartmentOrderTableAdapters.DepartmentOrderRowTableAdapter();
        DataTable dt = tableAdaptor.GetDepartmentOrderById(DepartmentOrderId);
        return dt;
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        e.Cancel = true;
        DeleteDepartmentOrder((int)e.Keys["sequence"]);
    }
    
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {        
        
        if (e.CommandName.Equals("CancelOrder"))
        {
            int propertyId = int.Parse(e.CommandArgument.ToString());
            PropertyDetail property = GetProperty(propertyId);
            if (property != null)
            {
                property.FlgDeleted = true;
                db.SaveChanges();
                GridView1.DataBind();
            }                        
        }
        else if (e.CommandName.Equals("UncancelOrder"))
        {
            int propertyId = int.Parse(e.CommandArgument.ToString());
            PropertyDetail property = GetProperty(propertyId);
            if (property != null)
            {
                property.FlgDeleted = false;
                db.SaveChanges();
                GridView1.DataBind();
            }
        }
        else if (e.CommandName.Equals("EditOrder"))
        {
            int propertyId = int.Parse(e.CommandArgument.ToString());
            Response.Redirect("~/Orders/AddOrder.aspx?" + WebConstants.Request.PROPERTY_ORDER_ID + "=" + propertyId);
        }        
    }

    private PropertyDetail GetProperty(int propertyId)
    {
        return (from p in db.PropertyDetails where p.Sequence == propertyId select p).FirstOrDefault();
    }
    private string GetFullAddress()
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

}
