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
using System.IO;

using LumenWorks.Framework.IO.Csv;
public partial class Register_UploadOrders : GenericPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session[WebConstants.Session.WIZARD_STEP] == null ||
    (int)Session[WebConstants.Session.WIZARD_STEP] < 4)
        {
            Response.Redirect("~/Register/AddUser.aspx");
        }

    }
    protected void btnUpload_Click(object sender, EventArgs e)
    {
        try
        {
            using (CsvReader csv = new CsvReader(new StreamReader(fileUpload.FileContent), true))
            {
                int count = 0;
                DepartmentOrderTableAdapters.DepartmentOrderRowTableAdapter orderTA = new DepartmentOrderTableAdapters.DepartmentOrderRowTableAdapter();

                while (csv.ReadNextRecord())
                {
                    string fullAddress = csv[0] + csv[1] + csv[2] + csv[3] + csv[4] + csv[5];
                    IEnumerator iEnumerator = orderTA.InsertAndReturn(false, (int)Session[WebConstants.Session.REG_DEPT_ID], (int)Session[WebConstants.Session.REG_CO_ID], WebConstants.Default.NOT_SET, WebConstants.Default.NOT_SET,
                        WebConstants.Default.NOT_SET, DateTime.Now, 0, DateTime.Now.AddYears(1), false, "", csv[0], csv[1], csv[2],
                        csv[3], csv[4], csv[5], fullAddress, "", false, false, false, null, null, null, null, (int)Session[WebConstants.Session.REG_USER_ID], DateTime.Now, (int)Session[WebConstants.Session.REG_USER_ID], DateTime.Now).GetEnumerator();
                    if (iEnumerator.MoveNext())
                    {
                        count++;
                    }
                }

                SetInfoMessage(count + " folders added to the system.");
            }
        }
        catch
        {
            SetErrorMessage("Error processing the file. Please check its contents. File should be CSV and in the format shown below");
        }
    }

    protected void btnContinue_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Register/UploadPeople.aspx");
    }
}
