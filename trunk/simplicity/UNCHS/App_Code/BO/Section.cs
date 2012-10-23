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
/// Summary description for Section
/// </summary>
public class Section
{
	public Section()
	{
        heading = null;
        type = null;
        sectionId = null;
        text = null;
        details = new List<SectionDetail>();
	}

    private int repeatColumns;
    public int RepeatColumns
    {
        get { return repeatColumns; }
        set { repeatColumns = value; }
    }

    private string heading;
    public string Heading
    {
        get { return heading; }
        set { heading = value; }
    }

    private string type;
    public string Type
    {
        get { return type; }
        set { type = value; }
    }

    private Nullable<int> sectionId;
    public Nullable<int> SectionId
    {
        get { return sectionId; }
        set { sectionId = value; }
    }

    private string text;
    public string Text
    {
        get { return text; }
        set { text = value; }
    }

    private List<SectionDetail> details;
    public List<SectionDetail> Details
    {
        get { return details; }
        set { details = value; }
    }
}
public class SectionDetail
{
    public SectionDetail()
    {
        sectionDetailId = null;
        text = null;
        selected = false;
    }

    public SectionDetail(int sectionDetailId,string text, bool selected)
    {
        this.sectionDetailId = sectionDetailId;
        this.text = text;
        this.selected = selected;
    }

    private Nullable<int> sectionDetailId;
    public Nullable<int> SectionDetailId
    {
        get { return sectionDetailId; }
        set { sectionDetailId = value; }
    }

    private string text;
    public string Text
    {
        get { return text; }
        set { text = value; }
    }

    private bool selected;
    public bool Selected
    {
        get { return selected; }
        set { selected = value; }
    }
}