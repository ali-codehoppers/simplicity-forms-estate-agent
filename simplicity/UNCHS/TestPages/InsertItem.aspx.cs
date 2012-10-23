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

public partial class TestPages_InsertItem : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {   
        /*DocumentTemplateTableAdapters.DocumentItemTableAdapter ta = new DocumentTemplateTableAdapters.DocumentItemTableAdapter();        
        char [] seperator = new char[1];
        seperator[0] = '\n';
        string[] datas = TextBox1.Text.Split(seperator);
        byte count = 1;
        foreach (string data in datas)
        {
            if(data.Length>0)
                ta.InsertAndReturn(1, 1, int.Parse(ddlSections.SelectedValue), int.Parse(ddlDocs.SelectedValue), 1, data, "", count++);
        }*/
    }
}
