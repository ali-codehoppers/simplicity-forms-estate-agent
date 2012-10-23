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


public partial class TestPages_MD5 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        UserTableAdapters.un_co_user_detailsTableAdapter ta = new UserTableAdapters.un_co_user_detailsTableAdapter();
        IEnumerator ie = ta.GetAllUsers().GetEnumerator();
        while (ie.MoveNext())
        {
            User.un_co_user_detailsRow user = (User.un_co_user_detailsRow)ie.Current;
            user.user_enable = Utility.GetMd5Sum(user.user_enable);
            ta.Update(user);
        }
    }
}
