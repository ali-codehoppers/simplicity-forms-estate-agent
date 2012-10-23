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

public partial class Admin_TransferHazards : AdminPage
{

    protected override void AdminPageHandling(object sender, EventArgs e)
    {
    }


    private void HideTransferButtons()
    {
        int hiddenCount = 0;
        foreach (GridViewRow grHazard1 in gvHazards1.Rows)
        {
            foreach (GridViewRow grHazard2 in gvHazards2.Rows)
            {
                Label lblHazard1 = (Label)grHazard1.FindControl("lblHazard1");
                Label lblHazard2 = (Label)grHazard2.FindControl("lblHazard2");
                if (lblHazard1.Text.Equals(lblHazard2.Text))
                {
                    Button btnTransfer1 = (Button)grHazard1.FindControl("btnTransfer1");
                    Button btnTransfer2 = (Button)grHazard2.FindControl("btnTransfer2");
                    btnTransfer1.Visible = false;
                    btnTransfer2.Visible = false;
                    hiddenCount++;
                }
            }
        }
        btnTransferAll1.Visible = !(hiddenCount == gvHazards1.Rows.Count);
        btnTransferAll2.Visible = !(hiddenCount == gvHazards2.Rows.Count);
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
            DepartmentHazardTableAdapters.DepartmentHazardSelectCommandTableAdapter hazardTA = new DepartmentHazardTableAdapters.DepartmentHazardSelectCommandTableAdapter();
            gvHazards1.DataSource = hazardTA.GetDepartmentHazardByDeptId(int.Parse(ddlDepartment1.SelectedValue), int.Parse(ddlCompany1.SelectedValue));
            gvHazards1.DataBind();
            gvHazards2.DataSource = hazardTA.GetDepartmentHazardByDeptId(int.Parse(ddlDepartment2.SelectedValue), int.Parse(ddlCompany2.SelectedValue));
            gvHazards2.DataBind();
            HideTransferButtons();
        }
        catch 
        {
            //this is needed as some time the ddls are not set. 
        }
    }
    protected void gvHazards2_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName.Equals("Transfer"))
        {
            try
            {
                int id = int.Parse(e.CommandArgument.ToString());
                TransferTableAdapters.TransferTableAdapter transferTA = new TransferTableAdapters.TransferTableAdapter();
                transferTA.TransferHazard(id, int.Parse(ddlCompany1.Text), int.Parse(ddlDepartment1.Text), loggedInUserId);
            }
            catch { }
        }
    }
    protected void btnTransferAll1_Click(object sender, EventArgs e)
    {
        foreach (GridViewRow gr in gvHazards1.Rows)
        {
            try
            {
                HiddenField hfHazardId = (HiddenField)gr.FindControl("hfHazardId1");
                TransferTableAdapters.TransferTableAdapter ta = new TransferTableAdapters.TransferTableAdapter();
                ta.TransferHazard(int.Parse(hfHazardId.Value), int.Parse(ddlCompany2.SelectedValue), int.Parse(ddlDepartment2.SelectedValue), loggedInUserId);
            }
            catch { }
        }
    }
    protected void btnTransferAll2_Click(object sender, EventArgs e)
    {
        foreach (GridViewRow gr in gvHazards2.Rows)
        {
            try
            {
                HiddenField hfHazardId = (HiddenField)gr.FindControl("hfHazardId2");
                TransferTableAdapters.TransferTableAdapter ta = new TransferTableAdapters.TransferTableAdapter();
                ta.TransferHazard(int.Parse(hfHazardId.Value), int.Parse(ddlCompany1.SelectedValue), int.Parse(ddlDepartment1.SelectedValue), loggedInUserId);
            }
            catch { }
        }
    }
    protected void gvHazards1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName.Equals("Transfer"))
        {
            try
            {
                int id = int.Parse(e.CommandArgument.ToString());
                TransferTableAdapters.TransferTableAdapter transferTA = new TransferTableAdapters.TransferTableAdapter();
                transferTA.TransferHazard(id, int.Parse(ddlCompany2.Text), int.Parse(ddlDepartment2.Text), loggedInUserId);
            }
            catch { }
        }
    }
}
