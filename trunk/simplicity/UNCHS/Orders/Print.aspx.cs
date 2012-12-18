using EstateAgentEntityModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Orders_Print : VerifyLoginPage
{
    protected override void AfterLoginVerifiedProcessing(object sender, EventArgs e)
    {
        PropertyDetail property = null;
        try
        {
            int propertyId = int.Parse(Request[WebConstants.Request.PROPERTY_ORDER_ID]);
            SimplicityWebEstateAgentEntities estateAgent = new SimplicityWebEstateAgentEntities();
            property = estateAgent.PropertyDetails.SingleOrDefault(prop => prop.Sequence == propertyId);

        
            DepartmentPropertyLabel.Text = property.PropertyFieldDepartments.SingleOrDefault(propDept => propDept.CompanySequence == property.CompanySequence && propDept.PropertySequence == property.Sequence).RefDepartment.DepartmentDesc;
            CategoryPropertyLabel.Text = property.PropertyFieldCategories.SingleOrDefault(propCateg => propCateg.CompanySequence == property.CompanySequence && propCateg.PropertySequence == property.Sequence).RefCategory.CategoryDesc;
        }catch
        {
            Response.Redirect("~/Orders/SearchOrder.aspx");
        }
        AddressPropertyLabel.Text = property.AddressFull;
        ValuationCodeLabel.Text = property.ValuationCode;
        PropertyHeadingLabel.Text = property.PropHeading;
        PropertyDetailLabel.Text = property.PropDetailed;
        PropertySummaryLabel.Text = property.PropSummary;
        BulletPoint1Label.Text = property.PropBulletPoint01;
        BulletPoint2Label.Text = property.PropBulletPoint02;
        BulletPoint3Label.Text = property.PropBulletPoint03;
        BulletPoint4Label.Text = property.PropBulletPoint04;
        BulletPoint5Label.Text = property.PropBulletPoint05;
        BulletPoint6Label.Text = property.PropBulletPoint06;
        BulletPoint7Label.Text = property.PropBulletPoint07;
        BulletPoint8Label.Text = property.PropBulletPoint08;

        if (!IsPostBack)
        {
            RoomsListPrint.DataSource = property.PropertyRooms.OrderBy(rooms => rooms.RoomNo);
            RoomsListPrint.DataBind();
        }
    }
}