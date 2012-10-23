using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Collections.Generic;
using System.Collections;
using iTextSharp.text;
using iTextSharp.text.pdf;

/// <summary>
/// Summary description for DetailDocumentTypeGenerator
/// </summary>
public abstract class DetailDocumentTypeGenerator : GenericGenerator
{
    private List<Section> sectionList  = new List<Section>();
    private int headingCount = 0;
    private int textCount = 0;

    protected abstract void SetRemainingData(DocumentType docType);


    protected PdfPTable CreateSectionDetail()
    {
        Section section = GetCurrentSection();
        PdfPTable nestedTable = null;


        if (section.Type == WebConstants.SectionTypes.MULTIPLE_SELECT_LIST)
        {
            textCount++;
            nestedTable = new PdfPTable(section.RepeatColumns);
            nestedTable.DefaultCell.Border = Rectangle.NO_BORDER;
            nestedTable.WidthPercentage = 100;
            
            int index = 0;
            int limit = section.Details.Count/section.RepeatColumns;
            if(section.Details.Count%section.RepeatColumns != 0)
            {
                limit++;
            }
            for (int i = 0; i < section.RepeatColumns ; i++)
            {
                Phrase phrase = new Phrase();
                for(int j=0; j < limit && index < section.Details.Count;j++)
                {
                    if (j > 0)
                    {
                        phrase.Add(new Chunk("\n"));
                    }                    
                    if (section.Details[index].Selected)
                    {
                        phrase.Add(new Chunk(AddCheckedCheckBox(),0,0));
                    }
                    else
                    {
                        phrase.Add(new Chunk(AddCheckBox(), 0, 0));
                    }
                    //phrase.Add(new Chunk(" " + section.Details[index].Text));
					phrase.Add(new Chunk(" " + section.Details[index].Text, FontFactory.GetFont("Arial", 9)));
                    index++;
                }
                nestedTable.AddCell(phrase);
            }
        }
        else
        {
            nestedTable = new PdfPTable(1);
        }
        return nestedTable;
    }

	public DetailDocumentTypeGenerator()
	{

	}
    protected override void SetDocumentData(DocumentType docType)
    {
        SetSectionData(docType);
        SetRemainingData(docType);
    }
    private void SetSectionData(DocumentType docType)
    {
        DocumentTemplateTableAdapters.DocumentSectionTableAdapter sectionTA = new DocumentTemplateTableAdapters.DocumentSectionTableAdapter();
        DocumentTemplateTableAdapters.DocumentItemEntityTableAdapter itemTA = new DocumentTemplateTableAdapters.DocumentItemEntityTableAdapter();
        DocumentTemplateTableAdapters.DocumentSectionDetailsTableAdapter secDetailTA = new DocumentTemplateTableAdapters.DocumentSectionDetailsTableAdapter();
        IEnumerator ieSection = sectionTA.GetByDocType(docType.CoId, docType.DeptId, docType.Id).GetEnumerator();
        while (ieSection.MoveNext())
        {
            DocumentTemplate.DocumentSectionEntityRow sectionDataRow = (DocumentTemplate.DocumentSectionEntityRow)ieSection.Current;
            
            Section section = new Section();
            section.Heading = sectionDataRow.section_desc;
            section.Type = sectionDataRow.section_type;
            section.SectionId = sectionDataRow.section_id;
            if (sectionDataRow.Isrepeat_columnsNull() == false)
            {
                section.RepeatColumns = sectionDataRow.repeat_columns;
            }

            DataTable dtItems = itemTA.GetBySecId(docType.CoId, docType.DeptId, docType.DocId, section.SectionId);
            if (section.Type == WebConstants.SectionTypes.MULTIPLE_SELECT_LIST)
            {
                IEnumerator ieSecDetail = secDetailTA.GetBySecId(docType.CoId, docType.DeptId, section.SectionId).GetEnumerator();
                while (ieSecDetail.MoveNext())
                {
                    DocumentTemplate.DocumentSectionDetailsEntityRow secDetailDataRow = (DocumentTemplate.DocumentSectionDetailsEntityRow)ieSecDetail.Current;
                    SectionDetail sectionDetail = new SectionDetail(secDetailDataRow.section_detail_id, secDetailDataRow.section_detail_desc, false);
                    foreach (DataRow itemRow in dtItems.Rows)
                    {
                        if (secDetailDataRow.section_detail_id == (int)itemRow["section_detail_id"])
                        {
                            sectionDetail.Selected = true;
                            break;
                        }
                    }
                    section.Details.Add(sectionDetail);
                }
            }
            if (section.Type == WebConstants.SectionTypes.FREE_TEXT)
            {
                foreach(DataRow itemRow in dtItems.Rows)
                {
                    section.Text += (string)itemRow["item_name"] + "\n";
                }
            }
            sectionList.Add(section);
        }
    }

    protected string GetNextSectionHeading()
    {
        if (sectionList != null && headingCount < sectionList.Count)            
        {
            return sectionList[headingCount++].Heading;
        }
        return "";
    }
    protected Section GetCurrentSection()
    {
        if (sectionList != null && headingCount <= sectionList.Count) //beause heading count moves one ahead
        {            
            return sectionList[headingCount - 1];
        }
        return null;
    }

    protected Section GetNextSection()
    {
        if (sectionList != null && headingCount < sectionList.Count) 
        {
            return sectionList[headingCount++];
        }
        return null;
    }


    protected string GetPrevTextHeading()
    {
        if (sectionList != null && headingCount < sectionList.Count)            
        {
            return sectionList[headingCount - 1].Heading;
        }
        return "";
    }

    protected string GetNextSectionText()
    {
        if (sectionList != null && textCount < sectionList.Count)            
        {
            return sectionList[textCount++].Text;
        }
        return "";
    }
}
