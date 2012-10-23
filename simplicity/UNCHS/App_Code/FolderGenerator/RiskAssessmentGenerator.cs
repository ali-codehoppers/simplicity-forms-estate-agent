using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Collections.Generic;

using iTextSharp.text;
using iTextSharp.text.pdf;
/// <summary>
/// Summary description for RiskAssessmentGenerator
/// </summary>
public class RiskAssessmentGenerator : DetailDocumentTypeGenerator
{
    string employer;
    string siteAddress;
    string assessorName;
    string deptSerial;
    string docSerial;
    string relatedRiskAssessments;
    string documentName;
    
    string reviewDate;
    
    protected override void  SetRemainingData(DocumentType docType)
    {
        Department.DepartmentSelectCommandRow department = DatabaseUtility.GetDepartment(docType.DeptId);
        if (department != null)
        {
            employer = department.co_name_long;
            deptSerial = department.co_name_short;
        }
        SetRelatedRiskAssesssments(docType);

        DepartmentOrder.DepartmentOrderRowRow departmentOrder = DatabaseUtility.GetDepartmentOrder(docType.DeptOrderId);
        if (departmentOrder != null)
        {
            if(departmentOrder.Isaddress_fullNull() == false) siteAddress = departmentOrder.address_full;
            if (departmentOrder.Isdate_order_reviewNull() == false) reviewDate = departmentOrder.date_order_review.ToShortDateString();
        }
        SetAssessor(docType);        
    }
    private void SetAssessor(DocumentType docType)
    {
        
        DepartmentOrderPersonTableAdapters.DepartmentOrderPersonEntityTableAdapter ta = new DepartmentOrderPersonTableAdapters.DepartmentOrderPersonEntityTableAdapter();
        IEnumerator iEnum = ta.GetAllOrderPersonsByOrderId(docType.DeptId, docType.CoId, docType.DeptOrderId).GetEnumerator();
        while (iEnum.MoveNext())
        {
            DepartmentOrderPerson.DepartmentOrderPersonEntityRow person = (DepartmentOrderPerson.DepartmentOrderPersonEntityRow) iEnum.Current;
            if (person.Issuperrvisor_checkNull() == false && person.superrvisor_check == 1)
            {
                assessorName = person.name_desc;
                break;
            }
        }        
    }
    private void SetRelatedRiskAssesssments(DocumentType docType)
    {
        DepartmentOrderDoc.DocumentEntityRow document = DatabaseUtility.GetDocument(docType.DocId);
        if (document != null )
        {
            if (document.Isrelated_doc_codesNull() == false)
            {
                relatedRiskAssessments = document.related_doc_codes;
            }     
            docSerial = document.doc_code;
            documentName = document.doc_name;
        }        
    }

	public RiskAssessmentGenerator()
	{
        employer = "";
        siteAddress = "";
        assessorName = "";
        deptSerial = "";
        docSerial = "";
        relatedRiskAssessments = "";
        reviewDate = "";
        documentName = "";
    }

    protected void AddHeader(Document doc)
    {
        Font headerFont = FontFactory.GetFont("Arial", 16, Color.GRAY);
        PdfPTable table = new PdfPTable(2);
        table.SetWidths(new float[] { 15f, 85f });
        table.WidthPercentage = 100;
        table.DefaultCell.Border = Rectangle.BOX;
        table.DefaultCell.BorderColor = Color.GRAY;
        table.DefaultCell.HorizontalAlignment = Table.ALIGN_CENTER;
        table.DefaultCell.VerticalAlignment = Table.ALIGN_MIDDLE;
        table.SpacingAfter = 10f;
        //table.DefaultCell. = 20;
        table.AddCell(new Phrase(docSerial, headerFont));
        table.DefaultCell.Border = Rectangle.NO_BORDER;
        table.AddCell(new Phrase(documentName.ToUpper() + "\n(GENERIC RISK ASSESSMENT)",headerFont));        
        doc.Add(table);
    }
    private PdfPCell GetRiskAssessmentCell(Font boldFontSmall,Font normalFontSmall)
    {
        PdfPCell cell = new PdfPCell();
        cell.AddElement(new Phrase(GetNextSectionHeading(), boldFontSmall));
        cell.AddElement(new Phrase(GetNextSectionText(), normalFontSmall));
        return cell;
    }
    private PdfPCell GetRiskAssessmentDetailCell(Font normalFontSmall,string heading,string content)
    {
        Font underLineFont = FontFactory.GetFont("Arial", 10, Font.UNDERLINE);
        PdfPCell cell = new PdfPCell();
        cell.AddElement(new Phrase(heading,underLineFont));
        cell.AddElement(new Phrase(content,normalFontSmall));
        return cell;
    }

    protected override void GenerateDocument(Document doc, DocumentType docType, string addSheet, PdfWriter writer)
    {
        Font normalFontSmall = FontFactory.GetFont("Arial", 10);
        Font boldFontSmall = FontFactory.GetFont("Arial", 10, Font.BOLD);
        Font boldUnderlineFontSmall = FontFactory.GetFont("Arial", 10, Font.BOLD | Font.UNDERLINE);
        Font smallestFont = FontFactory.GetFont("Arial", 9f, Font.NORMAL);

        AddHeader(doc);

        // Create a table with 3 columns
        PdfPTable table = new PdfPTable(2);
        table.WidthPercentage = 100;


        table.DefaultCell.Colspan = 1;
        table.DefaultCell.FixedHeight = 0.0f;
        table.DefaultCell.Border = Rectangle.BOX;
        table.DefaultCell.FixedHeight = 20f;
        table.DefaultCell.HorizontalAlignment = Element.ALIGN_LEFT;
        table.AddCell(new Phrase("EMPLOYER: " + employer, boldUnderlineFontSmall));
        table.AddCell(new Phrase("SITE/PROJECT: " + siteAddress, boldUnderlineFontSmall));

        table.SpacingAfter = 15f;
        doc.Add(table);

        table = new PdfPTable(2);
        table.WidthPercentage = 100f;

        table.AddCell(new Phrase(GetNextSectionHeading(), boldFontSmall));
        table.AddCell(new Phrase(GetNextSectionHeading(), boldFontSmall));

        table.DefaultCell.VerticalAlignment = Element.ALIGN_MIDDLE;
        table.DefaultCell.FixedHeight = 60f;
        table.AddCell(new Phrase(GetNextSectionText(), smallestFont));
        table.AddCell(new Phrase(GetNextSectionText(), smallestFont));
        //AddOverflowText(doc, table, GetNextSectionText(), GetPrevTextHeading());
        //AddOverflowText(doc, table, GetNextSectionText(), GetPrevTextHeading());

        table.DefaultCell.FixedHeight = 0.0f;
        table.AddCell(new Phrase(GetNextSectionHeading(), boldFontSmall));
        table.AddCell(new Phrase(GetNextSectionHeading(), boldFontSmall));

        table.DefaultCell.Rowspan = 3;
        //table.DefaultCell.FixedHeight = 90f;
        table.AddCell(new Phrase(GetNextSectionText(), smallestFont));

        table.DefaultCell.Rowspan = 1;
        table.AddCell(new Phrase(GetNextSectionText(), smallestFont));
        table.AddCell(new Phrase(GetNextSectionHeading(), boldFontSmall));
        table.AddCell(new Phrase(GetNextSectionText(), smallestFont));

        table.DefaultCell.Colspan = 2;
        //table.DefaultCell.FixedHeight = 90f;
        table.AddCell(new Phrase(GetNextSectionHeading(), boldFontSmall));
        table.AddCell(new Phrase(GetNextSectionText(),smallestFont));
        //AddOverflowText(doc, table, GetNextSectionText(), GetPrevTextHeading());

        table.DefaultCell.Colspan = 2;
        table.AddCell(new Phrase("7. RISK ASSESMENT:", boldFontSmall));
        doc.Add(table);

        table = new PdfPTable(3);
        table.SetWidths(new float[] { 25f,25f, 50f });
        table.WidthPercentage = 100;

        table.DefaultCell.FixedHeight = 25f;
        table.DefaultCell.VerticalAlignment = Element.ALIGN_TOP;
        table.AddCell(GetRiskAssessmentCell(boldFontSmall,normalFontSmall));
        table.AddCell(GetRiskAssessmentCell(boldFontSmall, normalFontSmall));
        table.AddCell(GetRiskAssessmentCell(boldFontSmall, normalFontSmall));

        table.AddCell(GetRiskAssessmentDetailCell(normalFontSmall, "Severity:","Death = 4, Major Injury = 3,\nMinor Injury = 2, No Injury = 1"));
        table.AddCell(GetRiskAssessmentDetailCell(normalFontSmall, "Probability:", "Very Likely = 4, Likely = 3,\nUnlikely = 2, Extremely Unlikely = 1"));
        table.AddCell(GetRiskAssessmentDetailCell(normalFontSmall, "Risk:", "High = 9-16, Medium = 5-8, Low = 1-4\nIMMEDIATE ACTION MUST BE TAKEN FOR ALL HIGH RISK ACTIVITIES"));
        doc.Add(table);


        table = new PdfPTable(2);
        table.SetWidths(new float[] { 50f, 50f });
        table.WidthPercentage = 100;
        table.DefaultCell.VerticalAlignment = Element.ALIGN_MIDDLE;
        table.AddCell(new Phrase(GetNextSectionHeading(), boldFontSmall));
        table.AddCell(new Phrase(GetNextSectionHeading(), boldFontSmall));
        table.AddCell(new Phrase(GetNextSectionText(), smallestFont));        
        table.AddCell(new Phrase(GetNextSectionText(), boldFontSmall));

        table.AddCell(new Phrase("10. ASSESSOR’S NAME: " + assessorName, boldFontSmall));
        table.AddCell(new Phrase("ASSESSOR’S SIGNATURE: " , boldFontSmall));
        table.AddCell(new Phrase("11. ASSESSMENT DATE: ", boldFontSmall));
        table.AddCell(new Phrase("12. NEXT FORMAL REVIEW DATE: " + reviewDate, boldFontSmall));
        doc.Add(table);

        doc.NewPage();
        AddHeader(doc);

        table = new PdfPTable(1);
        table.WidthPercentage = 100;
        table.DefaultCell.HorizontalAlignment = Table.ALIGN_CENTER;
        table.DefaultCell.Border = Rectangle.NO_BORDER;
        table.SpacingAfter = 10.0f;
        table.AddCell(new Phrase("CONTINUATION / SITE-SPECIFIC INFORMATION (Assessment Serial Number: " + docSerial + ")", boldFontSmall));

        doc.Add(table);

        table = new PdfPTable(1);
        table.WidthPercentage = 100;
        table.DefaultCell.HorizontalAlignment = Table.ALIGN_LEFT;
        table.DefaultCell.Border = Rectangle.BOX;
        table.AddCell(new Phrase(GetNextSectionHeading(), boldFontSmall));
        table.AddCell(CreateSectionDetail());
        table.SpacingAfter = 10f;
        doc.Add(table);      
        

        table = new PdfPTable(1);
        table.WidthPercentage = 100;
        table.DefaultCell.HorizontalAlignment = Table.ALIGN_LEFT;
        table.DefaultCell.Border = Rectangle.BOX;
        table.AddCell(new Phrase("13. ADDITIONAL TASK/ SITE SPECIFIC INFORMATION:", boldFontSmall));
        doc.Add(table);

        table = new PdfPTable(2);
        table.WidthPercentage = 100;
        table.DefaultCell.FixedHeight = 25f;
        for (int i = 0; i < 6; i++)
        {
            table.AddCell("");
            table.AddCell("");
        }
        
        doc.Add(table);
        table = new PdfPTable(1);
        table.WidthPercentage = 100;
        table.DefaultCell.Border = Rectangle.NO_BORDER;
        table.AddCell(new Phrase("PERSONS UNDERTAKING THE TASK SHOULD SIGN AND DATE BELOW TO COMFIRM THAT THEY HAVE READ AND UNDERSTAND THE RISK ASSESSMENT",boldUnderlineFontSmall));
        table.SpacingAfter = 10.0f;
        table.SpacingBefore = 15.0f;
        doc.Add(table);

        table = new PdfPTable(3);
        table.WidthPercentage = 100;
        table.DefaultCell.FixedHeight = 25f;
        table.DefaultCell.HorizontalAlignment = Element.ALIGN_CENTER;
        table.AddCell(new Phrase("Name", boldFontSmall));
        table.AddCell(new Phrase("Signed", boldFontSmall));
        table.AddCell(new Phrase("Date", boldFontSmall));

        for (int i = 0; i < 7; i++)
        {
            table.AddCell(""); table.AddCell(""); table.AddCell("");
        }
        doc.Add(table);
        
        
        

    }
}
