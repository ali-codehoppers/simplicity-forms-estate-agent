using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

/// <summary>
/// Summary description for AuthenticatedUserControl
/// </summary>
public abstract class AuthenticatedUserControl : System.Web.UI.UserControl
{
    protected int loggedInUserId;
    protected int loggedInUserCoId;
    protected string loggedInUserRole;
	public AuthenticatedUserControl()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    protected override void OnLoad(EventArgs e)
    {
        base.OnLoad(e);
    }
    protected override void OnInit(EventArgs e)
    {
        LoginProcessing processing = new LoginProcessing();
        if (processing.Process(this.Page,ref loggedInUserId, ref loggedInUserCoId, ref loggedInUserRole))
        {
            base.OnInit(e);
        }
    }
    protected void SetErrorMessage(string error)
    {
        SetMessage(error, "lblError");
    }
    protected void SetInfoMessage(string info)
    {
        SetMessage(info, "lblInfo");
    }
    private void SetMessage(string msg, string control)
    {
        Label label = (Label)this.Page.Master.FindControl(control);
        label.Visible = true;
        label.Text = msg;
    }
}
