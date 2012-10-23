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

public partial class Admin_CompanyList : AdminPage
{
    protected override void AdminPageHandling(object sender, EventArgs e)
    {
        
    }
    protected string GetDetailContact(object title, object foreName, object surName)
    {
        string detailContact = "";
        if (title.ToString().Length > 0)
        {
            detailContact += title.ToString() + " ";
        }
        if (foreName.ToString().Length > 0)
        {
            detailContact += foreName.ToString() + " ";
        }
        if (surName.ToString().Length > 0)
        {
            detailContact += surName.ToString();
        }
        return detailContact;
    }


    protected void gvCompanies_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        CompanyTableAdapters.un_co_detailsTableAdapter coTA = new CompanyTableAdapters.un_co_detailsTableAdapter();
        int coId = int.Parse(e.CommandArgument.ToString());
        //HyperLink1.Text = e.CommandName;
        if (e.CommandName.Equals("Activate"))
        {
            coTA.UpdateActive(true, coId);
        }
        else if (e.CommandName.Equals("Deactivate"))
        {
            coTA.UpdateActive(false, coId);
        }
        gvCompanies.DataBind();
    }
}
