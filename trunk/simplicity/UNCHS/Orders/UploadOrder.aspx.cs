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
using System.Data.SqlClient;
using System.IO;

using LumenWorks.Framework.IO.Csv;

public partial class Orders_UploadOrder : DepartmentPage
{
   
    protected override void Department_Page_Handling(object sender, EventArgs e)
    {
    }
    protected void ddlDepartments_DataBound(object sender, EventArgs e)
    {
        if (ddlDepartments.Items.Count <= 1)
        {
            ddlDepartments.Visible = false;
            lblDepartment.Visible = false;
        }
        else
        {
            ddlDepartments.Visible = true;
            lblDepartment.Visible = true;
        }
    }
    
    protected void btnUpload_Click(object sender, EventArgs e)
    {
        using (CsvReader csv = new CsvReader(new StreamReader(fileUpload.FileContent), true))
        {
            int count = 0;
            DepartmentOrderTableAdapters.DepartmentOrderRowTableAdapter orderTA = new DepartmentOrderTableAdapters.DepartmentOrderRowTableAdapter();
            int fieldCount = csv.FieldCount;
            string[] headers = csv.GetFieldHeaders();

            while (csv.ReadNextRecord())
            {
                string fullAddress = csv["address_line1"] + " " + csv["address_line2"] + csv["address_line3"] + csv["address_line4"] + csv["address_line5"] + csv["address_post_code"];
                IEnumerator iEnumerator = orderTA.InsertAndReturn(false, int.Parse(ddlDepartments.SelectedValue), loggedInUserCoId, WebConstants.Default.NOT_SET, WebConstants.Default.NOT_SET,
                    WebConstants.Default.NOT_SET, DateTime.Now, 0, DateTime.Now.AddYears(1), false, "", csv["address_line1"], csv["address_line2"], csv["address_line3"],
                    csv["address_line4"], csv["address_line5"], csv["address_post_code"], fullAddress, "", false,false, false, null,null,null,null,loggedInUserId, DateTime.Now, loggedInUserId, DateTime.Now).GetEnumerator();
                if (iEnumerator.MoveNext())
                {
                    count++;
                }                
            }

            SetInfoMessage(count + " folders added to the system.");
        }
    }

    private string getOrderSMS(string orderSMS)
    {
        string smsOrder = orderSMS.ToString();
        while (smsOrder.Length < 6)
        {
            smsOrder = smsOrder.Insert(0, "0");
        }
        return smsOrder;
    }
}