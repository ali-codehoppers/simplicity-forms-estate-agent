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
public partial class Common_UserControls_OrderDocControl : System.Web.UI.UserControl
{
    Dictionary<string, List<KeyValuePair<int, string>>> categories = new Dictionary<string, List<KeyValuePair<int, string>>>();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack == false)
        {
            BindRepeater();
            btnAdd.Text = "Add " + DocTypeName + "(s)";
        }
    }
    public string DocTypeName
    {
        get { return hfDocTypeName.Value; }
        set { hfDocTypeName.Value = value; }
    }
    public string ImageName
    {
        get
        {
            return hfDocTypeName.Value.Replace(" ", "_")+"_List";
        }
    }
    private void BindRepeater()
    {
        if (Session[WebConstants.Session.USER_CO_ID] != null && Session[WebConstants.Session.DEPT_ID] != null)
        {
            int loggedInUserCoId = (int)Session[WebConstants.Session.USER_CO_ID];
            int deptId = (int)Session[WebConstants.Session.DEPT_ID];


            DepartmentOrderDocTableAdapters.DocumentTableAdapter ta = new DepartmentOrderDocTableAdapters.DocumentTableAdapter();
            IEnumerator iEnum = ta.GetRemainingDocsByTypeName(loggedInUserCoId, deptId, DocTypeName, int.Parse(Request[WebConstants.Request.DEPT_ORDER_ID])).GetEnumerator();
            while (iEnum.MoveNext())
            {
                DepartmentOrderDoc.DocumentEntityRow dataRow = (DepartmentOrderDoc.DocumentEntityRow)iEnum.Current;
                if (categories.ContainsKey(dataRow.category_name) == false)
                {
                    categories.Add(dataRow.category_name, new List<KeyValuePair<int, string>>());
                }
                List<KeyValuePair<int, string>> docs = categories[dataRow.category_name];
                docs.Add(new KeyValuePair<int, string>(dataRow.doc_id, dataRow.doc_name));
            }
            rptDocs.DataSource = categories.Keys;
            rptDocs.DataBind();
        }
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        if (Session[WebConstants.Session.USER_CO_ID] != null && Session[WebConstants.Session.DEPT_ID] != null)
        {
            int loggedInUserCoId = (int)Session[WebConstants.Session.USER_CO_ID];
            int deptId = (int)Session[WebConstants.Session.DEPT_ID];

            DepartmentOrderDocTableAdapters.DepartmentOrderDocTableAdapter tableAdapter = new DepartmentOrderDocTableAdapters.DepartmentOrderDocTableAdapter();
            foreach (RepeaterItem repeaterItem in rptDocs.Items)
            {
                CheckBoxList cbDocs = repeaterItem.FindControl("cbDocs") as CheckBoxList;
                foreach (ListItem listItem in cbDocs.Items)
                {
                    if (listItem.Selected)
                    {
                        tableAdapter.Insert(int.Parse(Request[WebConstants.Request.DEPT_ORDER_ID]), int.Parse(listItem.Value), deptId, loggedInUserCoId, false);
                    }
                }
            }
            gvDocs.DataBind();
            BindRepeater();
        }
    }
    protected void gvDocs_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {
        BindRepeater();
    }

    protected void rptDocs_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        CheckBoxList cbDocs = e.Item.FindControl("cbDocs") as CheckBoxList;
        cbDocs.Items.Clear();
        HiddenField categoryName = e.Item.FindControl("hfCategoryName") as HiddenField;
        if (categories.ContainsKey(categoryName.Value))
        {
            foreach (KeyValuePair<int, string> kvPair in categories[categoryName.Value])
            {
                cbDocs.Items.Add(new ListItem(kvPair.Value, kvPair.Key.ToString()));
            }
        }
    }

}
