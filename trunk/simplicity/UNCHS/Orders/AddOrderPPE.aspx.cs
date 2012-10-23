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

public partial class Orders_AddOrderPPE : RoomDetailPage
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
        DepartmentPPETableAdapters.DepartmentPPESelectCommandTableAdapter ta = new DepartmentPPETableAdapters.DepartmentPPESelectCommandTableAdapter();
        IEnumerator iEnum = ta.GetDepartmentPPERemainingSelect(propertyId, loggedInUserCoId, int.Parse(Request[WebConstants.Request.DEPT_ORDER_ID])).GetEnumerator();
        while (iEnum.MoveNext())
        {
            DepartmentPPE.DepartmentPPESelectCommandRow dataRow = (DepartmentPPE.DepartmentPPESelectCommandRow)iEnum.Current;
            if (categories.ContainsKey(dataRow.category_name) == false)
            {
                categories.Add(dataRow.category_name, new List<KeyValuePair<int, string>>());
            }
            List<KeyValuePair<int, string>> ppes = categories[dataRow.category_name];
            ppes.Add(new KeyValuePair<int, string>(dataRow.index_seq, dataRow.name_desc));
        }
        rptPPE.DataSource = categories.Keys;
        rptPPE.DataBind();
    }


    #region PPE
    private bool isValidPPE(string nameDesc)
    {
        bool isValid = true;
        DepartmentOrderDetailTableAdapters.DepartmentOrderPPETableAdapter tableAdapter = new DepartmentOrderDetailTableAdapters.DepartmentOrderPPETableAdapter();
        if (tableAdapter.GetPPEByName(propertyId, loggedInUserCoId, int.Parse(Request[WebConstants.Request.DEPT_ORDER_ID]), nameDesc).GetEnumerator().MoveNext())
        {
            isValid = false;
            SetErrorMessage(WebConstants.Messages.Error.ALREAD_EXISTS);
        }
        return isValid;
    }


    protected void btnAddPPE_Click(object sender, EventArgs e)
    {
        if (isValidPPE(tbPPE.Text))
        {
            DepartmentOrderDetailTableAdapters.DepartmentOrderPPETableAdapter tableAdapter = new DepartmentOrderDetailTableAdapters.DepartmentOrderPPETableAdapter();
            tableAdapter.Insert(propertyId, loggedInUserCoId, int.Parse(Request[WebConstants.Request.DEPT_ORDER_ID]), tbPPE.Text, loggedInUserId);
            gvPPE.DataBind();
            tbPPE.Text = "";
            BindRepeater();
        }
    }
    protected void gvPPE_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        e.Cancel = true;
        int sequence = (int)e.Keys["sequence"];
        DepartmentOrderDetailTableAdapters.DepartmentOrderPPETableAdapter tableAdapter = new DepartmentOrderDetailTableAdapters.DepartmentOrderPPETableAdapter();
        tableAdapter.Delete(loggedInUserId, sequence);
        gvPPE.DataBind();
        BindRepeater();
    }
    protected void gvPPE_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        e.Cancel = true;
        string nameDesc = (string)e.NewValues["ppe_desc"];
        int sequence = (int)e.Keys["sequence"];
        if (isValidPPE(nameDesc))
        {
            DepartmentOrderDetailTableAdapters.DepartmentOrderPPETableAdapter tableAdapter = new DepartmentOrderDetailTableAdapters.DepartmentOrderPPETableAdapter();
            tableAdapter.Update(nameDesc, loggedInUserId, sequence, sequence);
            gvPPE.EditIndex = -1;
            gvPPE.DataBind();
            BindRepeater();
        }
    }
    protected void btnAddPPEs_Click(object sender, EventArgs e)
    {
        DepartmentOrderDetailTableAdapters.DepartmentOrderPPETableAdapter tableAdapter = new DepartmentOrderDetailTableAdapters.DepartmentOrderPPETableAdapter();
       foreach (RepeaterItem repeaterItem in rptPPE.Items)
        {
            CheckBoxList cbPPE = repeaterItem.FindControl("cbPPE") as CheckBoxList;
            foreach (ListItem listItem in cbPPE.Items)
            {
                if (listItem.Selected)
                {
                    tableAdapter.Insert(propertyId, loggedInUserCoId, int.Parse(Request[WebConstants.Request.DEPT_ORDER_ID]), listItem.Text, loggedInUserId);
                }
            }
        }
        gvPPE.DataBind();
        BindRepeater();
    }
    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Orders/AddOrderTool.aspx?" + WebConstants.Request.DEPT_ORDER_ID + "=" + Request[WebConstants.Request.DEPT_ORDER_ID]);
    }
    protected void btnNext_Click(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(this.tbPPE.Text))
        {
            Company.un_co_detailsRow dr = null;//GetCompany();
            if (dr != null && dr.Isflg_autosaveNull() == false && dr.flg_autosave)
            {
                if (isValidPPE(tbPPE.Text))
                {
                    DepartmentOrderDetailTableAdapters.DepartmentOrderPPETableAdapter tableAdapter = new DepartmentOrderDetailTableAdapters.DepartmentOrderPPETableAdapter();
                    tableAdapter.Insert(propertyId, loggedInUserCoId, int.Parse(Request[WebConstants.Request.DEPT_ORDER_ID]), tbPPE.Text, loggedInUserId);
                    Response.Redirect("~/Orders/AddOrderEmergencyExits.aspx?" + WebConstants.Request.DEPT_ORDER_ID + "=" + Request[WebConstants.Request.DEPT_ORDER_ID]);
                }
            }
            else
                SetErrorMessage(WebConstants.Messages.Error.NEXT_WARNING_COMPANYAUTOSAVE);

        }
        else if (this.gvPPE.Rows.Count > 0)
        {
            Response.Redirect("~/Orders/AddOrderEmergencyExits.aspx?" + WebConstants.Request.DEPT_ORDER_ID + "=" + Request[WebConstants.Request.DEPT_ORDER_ID]);
        }
        else
            SetErrorMessage(WebConstants.Messages.Error.NEXT_WARNING_ENTERRECORD);
    }
    protected void rptPPE_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        CheckBoxList cbPPE = e.Item.FindControl("cbPPE") as CheckBoxList;
        cbPPE.Items.Clear();
        HiddenField categoryName = e.Item.FindControl("hfCategoryName") as HiddenField;
        if (categories.ContainsKey(categoryName.Value))
        {
            foreach (KeyValuePair<int, string> kvPair in categories[categoryName.Value])
            {
                cbPPE.Items.Add(new ListItem(kvPair.Value, kvPair.Key.ToString()));
            }
        }
    }

}
    #endregion}
