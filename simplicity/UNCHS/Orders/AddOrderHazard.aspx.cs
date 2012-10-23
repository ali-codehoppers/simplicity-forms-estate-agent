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
using System.Collections.Generic;

public partial class Orders_AddOrderHazard : RoomDetailPage
{
    Dictionary<string, List<KeyValuePair<int, string>>> categories = new Dictionary<string, List<KeyValuePair<int, string>>>();
    public override void Order_Detail_Handling(object sender, EventArgs e, int deptId)
    {
        if (IsPostBack == false)
        {
            BindRepeater();
        }
    }
    private void BindRepeater()
    {
        DepartmentHazardTableAdapters.DepartmentHazardSelectCommandTableAdapter ta = new DepartmentHazardTableAdapters.DepartmentHazardSelectCommandTableAdapter();
        IEnumerator iEnum = ta.GetRemainingHazardForOrder(propertyId, loggedInUserCoId, int.Parse(Request[WebConstants.Request.DEPT_ORDER_ID])).GetEnumerator();
        while (iEnum.MoveNext())
        {
            DepartmentHazard.DepartmentHazardSelectCommandRow dataRow = (DepartmentHazard.DepartmentHazardSelectCommandRow)iEnum.Current;
            if (categories.ContainsKey(dataRow.category_name) == false)
            {
                categories.Add(dataRow.category_name, new List<KeyValuePair<int, string>>());
            }
            List<KeyValuePair<int, string>> hazards = categories[dataRow.category_name];
            hazards.Add(new KeyValuePair<int, string>(dataRow.index_seq, dataRow.name_desc));
        }
        rptHazards.DataSource = categories.Keys;
        rptHazards.DataBind();
    }
    protected void btnAddHazards_Click(object sender, EventArgs e)
    {
        DepartmentOrderDetailTableAdapters.DepartmentOrderHazardTableAdapter tableAdapter = new DepartmentOrderDetailTableAdapters.DepartmentOrderHazardTableAdapter();
        foreach (RepeaterItem repeaterItem in rptHazards.Items)
        {
            CheckBoxList cbHazards = repeaterItem.FindControl("cbHazards") as CheckBoxList;
            foreach (ListItem listItem in cbHazards.Items)
            {
                if (listItem.Selected)
                {
                    tableAdapter.Insert(propertyId, loggedInUserCoId, int.Parse(Request[WebConstants.Request.DEPT_ORDER_ID]), listItem.Text, loggedInUserId);
                }
            }
        }
        gvHazard.DataBind();
        BindRepeater();
    }
    private bool isValidHazard(string nameDesc)
    {
        bool isValid = true;
        DepartmentOrderDetailTableAdapters.DepartmentOrderHazardTableAdapter tableAdapter = new DepartmentOrderDetailTableAdapters.DepartmentOrderHazardTableAdapter();
        if (tableAdapter.GetHazardByName(propertyId, loggedInUserCoId, int.Parse(Request[WebConstants.Request.DEPT_ORDER_ID]), nameDesc).GetEnumerator().MoveNext())
        {
            isValid = false;
            SetErrorMessage(WebConstants.Messages.Error.ALREAD_EXISTS);
        }
        return isValid;
    }
    protected void btnAddHazard_Click(object sender, EventArgs e)
    {
        if (isValidHazard(tbHazard.Text))
        {
            DepartmentOrderDetailTableAdapters.DepartmentOrderHazardTableAdapter tableAdapter = new DepartmentOrderDetailTableAdapters.DepartmentOrderHazardTableAdapter();
            tableAdapter.Insert(propertyId, loggedInUserCoId, int.Parse(Request[WebConstants.Request.DEPT_ORDER_ID]), tbHazard.Text, loggedInUserId);
            gvHazard.DataBind();
            BindRepeater();
            tbHazard.Text = "";
        }
    }
    protected void gvHazard_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        e.Cancel = true;
        int sequence = (int)e.Keys["sequence"];
        DepartmentOrderDetailTableAdapters.DepartmentOrderHazardTableAdapter tableAdapter = new DepartmentOrderDetailTableAdapters.DepartmentOrderHazardTableAdapter();
        tableAdapter.Delete(loggedInUserId, sequence);
        gvHazard.DataBind();
        BindRepeater();
    }
    protected void gvHazard_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        e.Cancel = true;
        string nameDesc = (string)e.NewValues["hazard_desc"];
        int sequence = (int)e.Keys["sequence"];
        if (isValidHazard(nameDesc))
        {
            DepartmentOrderDetailTableAdapters.DepartmentOrderHazardTableAdapter tableAdapter = new DepartmentOrderDetailTableAdapters.DepartmentOrderHazardTableAdapter();
            tableAdapter.Update(nameDesc, loggedInUserId, sequence, sequence);
            gvHazard.EditIndex = -1;
            gvHazard.DataBind();
            BindRepeater();
        }
    }
    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Orders/AddOrderPeople.aspx?" + WebConstants.Request.DEPT_ORDER_ID + "=" + Request[WebConstants.Request.DEPT_ORDER_ID]);
    }
    protected void btnNext_Click(object sender, EventArgs e)
    {

        if (!string.IsNullOrEmpty(this.tbHazard.Text))
        {
            Company.un_co_detailsRow dr = null;//GetCompany();
            if (dr != null && dr.Isflg_autosaveNull() == false && dr.flg_autosave)
            {
                if (isValidHazard(tbHazard.Text))
                {
                    DepartmentOrderDetailTableAdapters.DepartmentOrderHazardTableAdapter tableAdapter = new DepartmentOrderDetailTableAdapters.DepartmentOrderHazardTableAdapter();
                    tableAdapter.Insert(propertyId, loggedInUserCoId, int.Parse(Request[WebConstants.Request.DEPT_ORDER_ID]), tbHazard.Text, loggedInUserId);
                    Response.Redirect("~/Orders/AddOrderSeqOfWoks.aspx?" + WebConstants.Request.DEPT_ORDER_ID + "=" + Request[WebConstants.Request.DEPT_ORDER_ID]);
                }
            }
            else
                SetErrorMessage(WebConstants.Messages.Error.NEXT_WARNING_COMPANYAUTOSAVE);


        }
        else if (this.gvHazard.Rows.Count > 0)
        {
            Response.Redirect("~/Orders/AddOrderSeqOfWoks.aspx?" + WebConstants.Request.DEPT_ORDER_ID + "=" + Request[WebConstants.Request.DEPT_ORDER_ID]);
        }
        else
            SetErrorMessage(WebConstants.Messages.Error.NEXT_WARNING_ENTERRECORD);

    }
    protected void rptHazards_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        CheckBoxList cbHazards = e.Item.FindControl("cbHazards") as CheckBoxList;
        cbHazards.Items.Clear();
        HiddenField categoryName  = e.Item.FindControl("hfCategoryName") as HiddenField;
        if (categories.ContainsKey(categoryName.Value))
        {
            foreach (KeyValuePair<int, string> kvPair in categories[categoryName.Value])
            {
                cbHazards.Items.Add(new ListItem(kvPair.Value,kvPair.Key.ToString()));
            }
        }
    }
}
