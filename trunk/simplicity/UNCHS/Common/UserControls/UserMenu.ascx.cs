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

public partial class Common_UserControls_UserMenu : System.Web.UI.UserControl
{
    private String urlString;
    private String[] order = { "AddOrder.aspx", "AddOrderPeople.aspx", "AddRoom.aspx" };

    protected void Page_Load(object sender, EventArgs e)
    {
        urlString = Request.Url.ToString();
        HomeNode.CssClass = SelectClass("UserHome.aspx", HomeNodeImage);
        foreach (String n in order)
        {
            if (urlString.Contains(n))
            {
                CreateNode.CssClass = SelectClass(n, CreateNodeImage);
                break;
            }
            else {
                CreateNode.CssClass = SelectClass(n, CreateNodeImage);
            }
        }
        
        UploadNode.CssClass = SelectClass("UploadOrder.aspx", UploadNodeImage);
        CreateDeptNode.CssClass = SelectClass("AddDepartment.aspx",CreateDeptNodeImage);
        CreateDeptListNode.CssClass = SelectClass("DepartmentList.aspx",CreateDeptListNodeImage);
        CreateCategoryNode.CssClass = SelectClass("AddCategories.aspx", CreateCategoryNodeImage);
        CreateCategoryListNode.CssClass = SelectClass("CategoriesList.aspx", CreateCategoryListNodeImage);
        SearchNode.CssClass = SelectClass("SearchOrder.aspx", PropertiesListNodeImage);
        
        GuideNode.CssClass = SelectClass("help.pdf", GuideNodeImage);
    }
    public String SelectClass(String Page , Image Node)
    {
        if (urlString.Contains(Page))
        {
            Node.ImageUrl = "~/Images/arrow_select.jpg";
            Node.CssClass = "selectNodeSelected";
            return "txt_select";
        }
        else
        {
            Node.ImageUrl = "~/Images/arrow_left.jpg";
            Node.CssClass = "selectNodeNotSelected";
            return "txt_black";
        }
    }
 
}
