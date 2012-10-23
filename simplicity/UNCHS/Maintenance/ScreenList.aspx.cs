using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Maintenance_ScreenList : AuthenticatedPage
{
    protected override void Page_Load_Extended(object sender, EventArgs e)
    {
        if (Request[WebConstants.Request.SCREEN_ID] != null && IsPostBack == false)
        {
            if (Request[WebConstants.Request.DELETE] != null)
            {
                ScreensTableAdapters.ScreenTableAdapter screenTA = new ScreensTableAdapters.ScreenTableAdapter();
                screenTA.Delete(int.Parse(Request[WebConstants.Request.SCREEN_ID]));
                Response.Redirect("~/Maintenance/ScreenList.aspx");
            }
            else
            {
                btnAddScreen.Visible = false;
                btnUpdateScreen.Visible = true;
                ScreensTableAdapters.ScreenTableAdapter screenTA = new ScreensTableAdapters.ScreenTableAdapter();
                Screens.ScreenEntityRow screen = DatabaseUtility.GetScreen(int.Parse(Request[WebConstants.Request.SCREEN_ID]));
                if (screen != null)
                {
                    hfScreenId.Value = screen.screen_id.ToString();
                    tbScreenName.Text = screen.screen_name;
                    tbScreenURL.Text = screen.screen_url;
                    tbHelpHTML.Text = screen.help_html;
                }
            }
        }
        if (loggedInUserRole != WebConstants.Roles.Admin)
        {
            hfCoId.Value = loggedInUserCoId.ToString();
            ddlCompanies.Visible = false;
            lblCompany.Visible = false;
            gvScreens.DataBind();
        }
    }
    protected void btnAddScreen_Click(object sender, EventArgs e)
    {
        ScreensTableAdapters.ScreenTableAdapter screenTA = new ScreensTableAdapters.ScreenTableAdapter();
        if (loggedInUserRole != WebConstants.Roles.Admin)
        {
            screenTA.Insert(tbScreenName.Text, tbScreenURL.Text, tbHelpHTML.Text, loggedInUserCoId);
        }
        else
        {
            screenTA.Insert(tbScreenName.Text, tbScreenURL.Text, tbHelpHTML.Text, int.Parse(ddlCompanies.SelectedValue));
        }
        gvScreens.DataBind();
    }
    protected void ddlCompanies_SelectedIndexChanged(object sender, EventArgs e)
    {
        hfCoId.Value = ddlCompanies.SelectedValue;
        gvScreens.DataBind();
    }
    protected void ddlCompanies_DataBound(object sender, EventArgs e)
    {
        hfCoId.Value = ddlCompanies.SelectedValue;
        gvScreens.DataBind();
    }
    protected void btnUpdateScreen_Click(object sender, EventArgs e)
    {
        ScreensTableAdapters.ScreenTableAdapter screenTA = new ScreensTableAdapters.ScreenTableAdapter();
        if (loggedInUserRole == WebConstants.Roles.Admin)
        {
            screenTA.Update(tbScreenName.Text, tbScreenURL.Text, tbHelpHTML.Text, int.Parse(ddlCompanies.SelectedValue), int.Parse(hfScreenId.Value), int.Parse(hfScreenId.Value));
        }
        else
        {
            screenTA.Update(tbScreenName.Text, tbScreenURL.Text, tbHelpHTML.Text,loggedInUserCoId, int.Parse(hfScreenId.Value), int.Parse(hfScreenId.Value));
        }
        gvScreens.DataBind();
    }

}
