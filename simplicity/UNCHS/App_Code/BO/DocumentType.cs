using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Collections.Generic;

/// <summary>
/// Summary description for DocumentType
/// </summary>
public class DocumentType
{
	public DocumentType()
	{
	}

    private string name;
    public string Name
    {
        get { return name; }
        set { name = value; }
    }

    private string generatorClass;
    public string GeneratorClass
    {
        get { return generatorClass; }
        set { generatorClass = value; }
    }


    private int id;
    public int Id
    {
        get { return id; }
        set { id = value; }
    }

    private string type;
    public string Type
    {
        get { return type; }
        set { type = value; }
    }

    private Nullable<int> number;
    public Nullable<int> Number
    {
        get { return number; }
        set { number = value; }
    }

    private Dictionary<int, string> docList = new Dictionary<int, string>();
    public Dictionary<int, string> DocList
    {
        get { return docList; }
    }

    private int coId;
    public int CoId
    {
        get { return coId; }
        set { coId = value; }
    }

    private int deptId;
    public int DeptId
    {
        get { return deptId; }
        set { deptId = value; }
    }

    private int deptOrderId;
    public int DeptOrderId
    {
        get { return deptOrderId; }
        set { deptOrderId = value; }
    }

    private int docId;
    public int DocId
    {
        get { return docId; }
        set { docId = value; }
    }

    private bool includeBlankPage;
    public bool IncludeBlankPage
    {
        get { return includeBlankPage; }
        set { includeBlankPage = value; }
    }

    private bool isLandScape;
    public bool IsLandScape
    {
        get { return isLandScape; }
        set { isLandScape = value; }
    }

}
