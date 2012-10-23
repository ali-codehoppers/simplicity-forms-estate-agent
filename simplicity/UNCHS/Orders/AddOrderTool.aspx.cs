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

public partial class Orders_AddOrderTool : RoomDetailPage
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
        DepartmentToolTableAdapters.DepartmentToolSelectCommandTableAdapter ta = new DepartmentToolTableAdapters.DepartmentToolSelectCommandTableAdapter();
        IEnumerator iEnum = ta.GetRemainingToolForOrder(propertyId, loggedInUserCoId, int.Parse(Request[WebConstants.Request.DEPT_ORDER_ID])).GetEnumerator();
        while (iEnum.MoveNext())
        {
            DepartmentTool.DepartmentToolSelectCommandRow dataRow = (DepartmentTool.DepartmentToolSelectCommandRow)iEnum.Current;
            if (categories.ContainsKey(dataRow.category_name) == false)
            {
                categories.Add(dataRow.category_name, new List<KeyValuePair<int, string>>());
            }
            List<KeyValuePair<int, string>> tools = categories[dataRow.category_name];
            tools.Add(new KeyValuePair<int, string>(dataRow.index_seq, dataRow.name_desc));
        }
        rptTools.DataSource = categories.Keys;
        rptTools.DataBind();
    }


    #region TOOL
    private bool isValidTool(string nameDesc)
    {
        bool isValid = true;
        DepartmentOrderDetailTableAdapters.DepartmentOrderToolTableAdapter tableAdapter = new DepartmentOrderDetailTableAdapters.DepartmentOrderToolTableAdapter();
        if (tableAdapter.GetToolByName(propertyId, loggedInUserCoId, int.Parse(Request[WebConstants.Request.DEPT_ORDER_ID]), nameDesc).GetEnumerator().MoveNext())
        {
            isValid = false;
            SetErrorMessage(WebConstants.Messages.Error.ALREAD_EXISTS);
        }
        return isValid;
    }


    protected void btnAddTool_Click(object sender, EventArgs e)
    {
        if (isValidTool(tbTool.Text))
        {
            DepartmentOrderDetailTableAdapters.DepartmentOrderToolTableAdapter tableAdapter = new DepartmentOrderDetailTableAdapters.DepartmentOrderToolTableAdapter();
            tableAdapter.Insert(propertyId, loggedInUserCoId, int.Parse(Request[WebConstants.Request.DEPT_ORDER_ID]), tbTool.Text, loggedInUserId);
            gvTool.DataBind();
            BindRepeater();
            tbTool.Text = "";
        }
    }
    protected void gvTool_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        e.Cancel = true;
        int sequence = (int)e.Keys["sequence"];
        DepartmentOrderDetailTableAdapters.DepartmentOrderToolTableAdapter tableAdapter = new DepartmentOrderDetailTableAdapters.DepartmentOrderToolTableAdapter();
        tableAdapter.Delete(loggedInUserId, sequence);
        gvTool.DataBind();
        BindRepeater();
    }
    protected void gvTool_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        e.Cancel = true;
        string nameDesc = (string)e.NewValues["tool_desc"];
        int sequence = (int)e.Keys["sequence"];
        if (isValidTool(nameDesc))
        {
            DepartmentOrderDetailTableAdapters.DepartmentOrderToolTableAdapter tableAdapter = new DepartmentOrderDetailTableAdapters.DepartmentOrderToolTableAdapter();
            tableAdapter.Update(nameDesc, loggedInUserId, sequence, sequence);
            gvTool.EditIndex = -1;
            gvTool.DataBind();
            BindRepeater();
        }
    }
    #endregion
    protected void btnAddTools_Click(object sender, EventArgs e)
    {
        DepartmentOrderDetailTableAdapters.DepartmentOrderToolTableAdapter tableAdapter = new DepartmentOrderDetailTableAdapters.DepartmentOrderToolTableAdapter();
        foreach (RepeaterItem repeaterItem in rptTools.Items)
        {
            CheckBoxList cbHazards = repeaterItem.FindControl("cbTools") as CheckBoxList;
            foreach (ListItem listItem in cbHazards.Items)
            {
                if (listItem.Selected)
                {
                    tableAdapter.Insert(propertyId, loggedInUserCoId, int.Parse(Request[WebConstants.Request.DEPT_ORDER_ID]), listItem.Text, loggedInUserId);
                }
            }
        }
        gvTool.DataBind();
        BindRepeater();
    }
    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Orders/AddOrderSeqOfWoks.aspx?" + WebConstants.Request.DEPT_ORDER_ID + "=" + Request[WebConstants.Request.DEPT_ORDER_ID]);

    }
    protected void btnNext_Click(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(this.tbTool.Text))
        {
            Company.un_co_detailsRow dr = null;//GetCompany();
            if (dr != null && dr.Isflg_autosaveNull() == false && dr.flg_autosave)
            {
                if (isValidTool(tbTool.Text))
                {
                    DepartmentOrderDetailTableAdapters.DepartmentOrderToolTableAdapter tableAdapter = new DepartmentOrderDetailTableAdapters.DepartmentOrderToolTableAdapter();
                    tableAdapter.Insert(propertyId, loggedInUserCoId, int.Parse(Request[WebConstants.Request.DEPT_ORDER_ID]), tbTool.Text, loggedInUserId);
                    Response.Redirect("~/Orders/AddOrderPPE.aspx?" + WebConstants.Request.DEPT_ORDER_ID + "=" + Request[WebConstants.Request.DEPT_ORDER_ID]);
                }
            }
            else
                SetErrorMessage(WebConstants.Messages.Error.NEXT_WARNING_COMPANYAUTOSAVE);

        }
        else if (this.gvTool.Rows.Count > 0)
        {
            Response.Redirect("~/Orders/AddOrderPPE.aspx?" + WebConstants.Request.DEPT_ORDER_ID + "=" + Request[WebConstants.Request.DEPT_ORDER_ID]);
        }
        else
            SetErrorMessage(WebConstants.Messages.Error.NEXT_WARNING_ENTERRECORD);
    }
    protected void rptTools_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        CheckBoxList cbTools = e.Item.FindControl("cbTools") as CheckBoxList;
        cbTools.Items.Clear();
        HiddenField categoryName = e.Item.FindControl("hfCategoryName") as HiddenField;
        if (categories.ContainsKey(categoryName.Value))
        {
            foreach (KeyValuePair<int, string> kvPair in categories[categoryName.Value])
            {
                cbTools.Items.Add(new ListItem(kvPair.Value, kvPair.Key.ToString()));
            }
        }
    }

}
