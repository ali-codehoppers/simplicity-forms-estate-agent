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

public partial class Admin_TransferTool : AdminPage
{
    protected override void AdminPageHandling(object sender, EventArgs e)
    {
    }


    private void HideTransferButtons()
    {
        int hiddenCount = 0;
        foreach (GridViewRow gr1 in gv1.Rows)
        {
            foreach (GridViewRow gr2 in gv2.Rows)
            {
                Label lbl1 = (Label)gr1.FindControl("lbl1");
                Label lbl2 = (Label)gr2.FindControl("lbl2");
                if (lbl1.Text.Equals(lbl2.Text))
                {
                    Button btnTransfer1 = (Button)gr1.FindControl("btnTransfer1");
                    Button btnTransfer2 = (Button)gr2.FindControl("btnTransfer2");
                    btnTransfer1.Visible = false;
                    btnTransfer2.Visible = false;
                    hiddenCount++;
                }
            }
        }
        btnTransferAll1.Visible = !(hiddenCount == gv1.Rows.Count);
        btnTransferAll2.Visible = !(hiddenCount == gv2.Rows.Count);
    }
    protected override void OnPreRenderComplete(EventArgs e)
    {
        BindGrids();
        base.OnPreRenderComplete(e);
    }

    private void BindGrids()
    {
        try
        {
            DepartmentToolTableAdapters.DepartmentToolSelectCommandTableAdapter ta = new DepartmentToolTableAdapters.DepartmentToolSelectCommandTableAdapter();
            gv1.DataSource = ta.GetDepartmentToolByDeptId(int.Parse(ddlDepartment1.SelectedValue), int.Parse(ddlCompany1.SelectedValue));
            gv1.DataBind();
            gv2.DataSource = ta.GetDepartmentToolByDeptId(int.Parse(ddlDepartment2.SelectedValue), int.Parse(ddlCompany2.SelectedValue));
            gv2.DataBind();
            HideTransferButtons();
        }
        catch
        {
            //this is needed as some time the ddls are not set. 
        }
    }
    protected void gv2_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName.Equals("Transfer"))
        {
            try
            {
                int id = int.Parse(e.CommandArgument.ToString());
                TransferTableAdapters.TransferTableAdapter transferTA = new TransferTableAdapters.TransferTableAdapter();
                transferTA.TransferTool(id, int.Parse(ddlCompany1.Text), int.Parse(ddlDepartment1.Text), loggedInUserId);
            }
            catch { }
        }
    }
    protected void btnTransferAll1_Click(object sender, EventArgs e)
    {
        foreach (GridViewRow gr in gv1.Rows)
        {
            try
            {
                HiddenField hfId = (HiddenField)gr.FindControl("hfId1");
                TransferTableAdapters.TransferTableAdapter ta = new TransferTableAdapters.TransferTableAdapter();
                ta.TransferTool(int.Parse(hfId.Value), int.Parse(ddlCompany2.SelectedValue), int.Parse(ddlDepartment2.SelectedValue), loggedInUserId);
            }
            catch { }
        }
    }
    protected void btnTransferAll2_Click(object sender, EventArgs e)
    {
        foreach (GridViewRow gr in gv2.Rows)
        {
            try
            {
                HiddenField hfId = (HiddenField)gr.FindControl("hfId2");
                TransferTableAdapters.TransferTableAdapter ta = new TransferTableAdapters.TransferTableAdapter();
                ta.TransferTool(int.Parse(hfId.Value), int.Parse(ddlCompany1.SelectedValue), int.Parse(ddlDepartment1.SelectedValue), loggedInUserId);
            }
            catch { }
        }
    }
    protected void gv1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName.Equals("Transfer"))
        {
            try
            {
                int id = int.Parse(e.CommandArgument.ToString());
                TransferTableAdapters.TransferTableAdapter transferTA = new TransferTableAdapters.TransferTableAdapter();
                transferTA.TransferTool(id, int.Parse(ddlCompany2.Text), int.Parse(ddlDepartment2.Text), loggedInUserId);
            }
            catch { }
        }
    }


}
