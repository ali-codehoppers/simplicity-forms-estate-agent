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
public partial class Register_UploadPeople : GenericPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void UploadButton_Click(object sender, EventArgs e)
    {
        if (FileUploader.HasFile)
        {
            try
            {
                using (CsvReader csv = new CsvReader(new StreamReader(FileUploader.FileContent), true))
                {
                    int count = 0;
                    while (csv.ReadNextRecord())
                    {
                        DepartmentPersonTableAdapters.un_ref_co_dept_peopleTableAdapter personTA = new DepartmentPersonTableAdapters.un_ref_co_dept_peopleTableAdapter();
                        personTA.Insert((int)Session[WebConstants.Session.REG_DEPT_ID], (int)Session[WebConstants.Session.REG_CO_ID],csv[0],
                            (int)Session[WebConstants.Session.REG_USER_ID], ParseBoolean(csv[1]), ParseBoolean(csv[2]), ParseBoolean(csv[3]));
                        count++;
                    }
                    SetInfoMessage(count + " people added to the system.");
                }
            }
            catch(Exception ex)
            {
                SetErrorMessage("Error processing the file. Please check its contents. File should be CSV and in the format shown below");
            }
        }   
        else
        {
            SetErrorMessage("No file specified");
        }
    }
    protected void btnContinue_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/UserHome.aspx");
    }

    private bool ParseBoolean(string value)
    {
        return (value.ToLower().Equals("true") || value.ToLower().Equals("yes") || value.ToLower().Equals("1"));
    }
}
