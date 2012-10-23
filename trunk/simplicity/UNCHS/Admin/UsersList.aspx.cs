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

public partial class Admin_UsersList : AdminPage
{
    protected override void AdminPageHandling(object sender, EventArgs e)
    {
        
    }
    protected void ddlCompany_DataBound(object sender, EventArgs e)
    {
        ddlCompany.Items.Insert(0, new ListItem("All", "-1"));
    }
}
