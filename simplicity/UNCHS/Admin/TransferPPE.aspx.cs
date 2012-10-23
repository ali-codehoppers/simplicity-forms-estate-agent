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

public partial class Admin_TransferPPE : AdminPage
{
    protected override void AdminPageHandling(object sender, EventArgs e)
    {
    }


    private void HideTransferButtons()
    {
        int hiddenCount = 0;
        foreach (GridViewRow grPPE1 in gvPPE1.Rows)
        {
            foreach (GridViewRow grPPE2 in gvPPE2.Rows)
            {
                Label lblPPE1 = (Label)grPPE1.FindControl("lblPPE1");
                Label lblPPE2 = (Label)grPPE2.FindControl("lblPPE2");
                if (lblPPE1.Text.Equals(lblPPE2.Text))
                {
                    Button btnTransfer1 = (Button)grPPE1.FindControl("btnTransfer1");
                    Button btnTransfer2 = (Button)grPPE2.FindControl("btnTransfer2");
                    btnTransfer1.Visible = false;
                    btnTransfer2.Visible = false;
                    hiddenCount++;
                }
            }
        }
        btnTransferAll1.Visible = !(hiddenCount == gvPPE1.Rows.Count);
        btnTransferAll2.Visible = !(hiddenCount == gvPPE2.Rows.Count);
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
            DepartmentPPETableAdapters.DepartmentPPESelectCommandTableAdapter ta = new DepartmentPPETableAdapters.DepartmentPPESelectCommandTableAdapter();
            gvPPE1.DataSource = ta.GetDepartmentPPEByDeptId(int.Parse(ddlDepartment1.SelectedValue), int.Parse(ddlCompany1.SelectedValue));
            gvPPE1.DataBind();
            gvPPE2.DataSource = ta.GetDepartmentPPEByDeptId(int.Parse(ddlDepartment2.SelectedValue), int.Parse(ddlCompany2.SelectedValue));
            gvPPE2.DataBind();
            HideTransferButtons();
        }
        catch
        {
            //this is needed as some time the ddls are not set. 
        }
    }
    protected void gvPPE2_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName.Equals("Transfer"))
        {
            try
            {
                int id = int.Parse(e.CommandArgument.ToString());
                TransferTableAdapters.TransferTableAdapter transferTA = new TransferTableAdapters.TransferTableAdapter();
                transferTA.TransferPPE(id, int.Parse(ddlCompany1.Text), int.Parse(ddlDepartment1.Text), loggedInUserId);
            }
            catch { }
        }
    }
    protected void btnTransferAll1_Click(object sender, EventArgs e)
    {
        foreach (GridViewRow gr in gvPPE1.Rows)
        {
            try
            {
                HiddenField hfPPEId = (HiddenField)gr.FindControl("hfPPEId1");
                TransferTableAdapters.TransferTableAdapter ta = new TransferTableAdapters.TransferTableAdapter();
                ta.TransferPPE(int.Parse(hfPPEId.Value), int.Parse(ddlCompany2.SelectedValue), int.Parse(ddlDepartment2.SelectedValue), loggedInUserId);
            }
            catch { }
        }
    }
    protected void btnTransferAll2_Click(object sender, EventArgs e)
    {
        foreach (GridViewRow gr in gvPPE2.Rows)
        {
            try
            {
                HiddenField hfPPEId = (HiddenField)gr.FindControl("hfPPEId2");
                TransferTableAdapters.TransferTableAdapter ta = new TransferTableAdapters.TransferTableAdapter();
                ta.TransferPPE(int.Parse(hfPPEId.Value), int.Parse(ddlCompany1.SelectedValue), int.Parse(ddlDepartment1.SelectedValue), loggedInUserId);
            }
            catch { }
        }
    }
    protected void gvPPE1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName.Equals("Transfer"))
        {
            try
            {
                int id = int.Parse(e.CommandArgument.ToString());
                TransferTableAdapters.TransferTableAdapter transferTA = new TransferTableAdapters.TransferTableAdapter();
                transferTA.TransferPPE(id, int.Parse(ddlCompany2.Text), int.Parse(ddlDepartment2.Text), loggedInUserId);
            }
            catch { }
        }
    }

}
