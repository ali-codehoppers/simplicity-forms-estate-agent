using System;
using System.Data;
using System.Linq;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using EstateAgentEntityModel;

/// <summary>
/// Summary description for OrderDetailPage
/// </summary>
public abstract class RoomDetailPage : DepartmentPage
{
    protected EstateAgentEntityModel.PropertyDetail property = null;
    protected SimplicityWebEstateAgentEntities estateAgentDB = null;

    protected int propertyId;//to be removed.

    public abstract void Order_Detail_Handling(object sender, EventArgs e, int deptId);

	public RoomDetailPage()
	{
		//
		// TODO: Add constructor logic here
		//
	}


    protected override void  Department_Page_Handling(object sender, EventArgs e)
    {
        if (Request[WebConstants.Request.PROPERTY_ORDER_ID] != null)
        {
            try
            {
                if (estateAgentDB == null)
                {
                    estateAgentDB = new SimplicityWebEstateAgentEntities();
                }
                int propId = int.Parse(Request[WebConstants.Request.PROPERTY_ORDER_ID]);
                property = estateAgentDB.PropertyDetails.SingleOrDefault(prop => prop.Sequence == propId);
                if (property != null)
                {
                    Session[WebConstants.Session.DEPT_ID] = property.PropertyFieldDepartments.FirstOrDefault().DepartmentSequence;
                }
                else
                {
                    Session[WebConstants.Session.DEPT_ID] = null; 
                    Response.Redirect("~/Orders/AddOrder.aspx");
                }
            }
            catch (Exception ex)
            {
                Session[WebConstants.Session.DEPT_ID] = null; 
                Response.Redirect("~/Orders/AddOrder.aspx");
            }
        }
        else
        {
            Session[WebConstants.Session.DEPT_ID] = null; 
            Response.Redirect("~/Orders/AddOrder.aspx");
        }
    }
}
