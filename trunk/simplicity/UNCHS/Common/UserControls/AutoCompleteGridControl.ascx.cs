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

public partial class Common_AutoCompleteGridControl : System.Web.UI.UserControl
{
    public object AutoCompleteDataSource = null;
    protected void Page_Load(object sender, EventArgs e)
    {
        //this.Id
        if (IsPostBack == false)
        {
            rptrAutoComplete.DataSource = AutoCompleteDataSource;
            rptrAutoComplete.DataBind();
        }
    }

}
