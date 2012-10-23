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

public partial class Admin_TransferAspects : AdminPage
{
    protected override void AdminPageHandling(object sender, EventArgs e)
    {
        
    }
    protected override void OnPreRenderComplete(EventArgs e)
    {
        TransferSuggestions1.BindGrids();
        base.OnPreRenderComplete(e);
    }
}
