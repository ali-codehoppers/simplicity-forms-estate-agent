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

public partial class Register_CSVHelp : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(Request["return"] != null)
        {
            if(Request["return"].Equals("1"))
            {
                hlBack.NavigateUrl = "~/Register/UploadOrders.aspx";
            }
            else if (Request["return"].Equals("2"))
            {
                hlBack.NavigateUrl = "~/Register/UploadPeople.aspx";
            }            
        }
    }
}
