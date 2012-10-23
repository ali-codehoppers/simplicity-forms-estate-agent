using System;
using System.Data;
using System.Configuration;
using iTextSharp.text;
using iTextSharp.text.pdf;
/// <summary>
/// Summary description for COSHHGenerator
/// </summary>
public class COSHHGenerator : DetailDocumentTypeGenerator
{
    Font normalFontSmall = FontFactory.GetFont("Arial", 10);
    Font normalFontSmallWhite = FontFactory.GetFont("Arial", 10, new Color(204, 211, 220));
    Font boldFontSmall = FontFactory.GetFont("Arial", 10, Font.BOLD);
    Font boldUnderlineFontSmall = FontFactory.GetFont("Arial", 10, Font.BOLD | Font.UNDERLINE);

    string deptNameLong;
    string deptNameShort;
    string docName;
    string assessorName;
	public COSHHGenerator()
	{
        deptNameLong = "";
        deptNameShort = "";
        docName = "";
        assessorName = "";
	}
    protected override void SetRemainingData(DocumentType docType)
    {
        Department.DepartmentSelectCommandRow deptDataRow = DatabaseUtility.GetDepartment(docType.DeptId);
        deptNameShort = deptDataRow.co_name_short;
        deptNameLong = deptDataRow.co_name_long;
        DepartmentOrderDoc.DocumentEntityRow documentDataRow = DatabaseUtility.GetDocument(docType.DocId);
        docName = documentDataRow.doc_desc;
    }
    protected override void GenerateDocument(Document doc, DocumentType docType, string addSheet,PdfWriter writer)
    {
        PdfPTable table = new PdfPTable(2);
        table.WidthPercentage = 100;
        table.DefaultCell.Colspan = 2;
        table.DefaultCell.Border = Rectangle.NO_BORDER;
        
        table.AddCell(new Phrase(deptNameShort, FontFactory.GetFont("Arial Black", 30, Font.BOLD, new Color(60, 87, 167))));
        table.AddCell(new Phrase(deptNameLong, FontFactory.GetFont("Arial", 20, Font.BOLD, new Color(86, 137, 113))));


        table.DefaultCell.PaddingLeft = 40f;
        Paragraph paragraph = new Paragraph();
        paragraph.Add(new Chunk("COSHH Risk Assessment     ", FontFactory.GetFont("Arial Black", 20, Font.BOLD)));
        paragraph.Add(new Chunk("Assessment No: " + docName, boldFontSmall));
        table.AddCell(paragraph);


        table.DefaultCell.PaddingLeft = 0.0f;
        /**************SUBSTANCE INFORMATION***********************/
        table.DefaultCell.HorizontalAlignment = Element.ALIGN_CENTER;
        table.DefaultCell.BackgroundColor = Color.BLACK;
        table.AddCell(new Phrase("SUBSTANCE INFORMATION", normalFontSmallWhite));

        //Reset DefaultCell
        table.DefaultCell.BackgroundColor = Color.WHITE;
        table.DefaultCell.HorizontalAlignment = Element.ALIGN_LEFT;
        table.DefaultCell.Colspan = 1;
        paragraph = new Paragraph();
        paragraph.Add(new Chunk(GetNextSectionHeading() + GetNextSectionText(), boldFontSmall));
        table.AddCell(paragraph);

        paragraph = new Paragraph();
        paragraph.Add(new Chunk(GetNextSectionHeading() + GetNextSectionText(), boldFontSmall));
        table.AddCell(paragraph);

        table.DefaultCell.Colspan = 2;
        table.DefaultCell.Border = Rectangle.TOP_BORDER;
        paragraph = new Paragraph();
        paragraph.Add(new Chunk(GetNextSectionHeading() + GetNextSectionText(), boldFontSmall));
        table.AddCell(paragraph);

        table.DefaultCell.Border = Rectangle.TOP_BORDER;
        paragraph = new Paragraph();
        paragraph.Add(new Chunk(GetNextSectionHeading(), boldFontSmall));
        table.AddCell(paragraph);

        table.DefaultCell.Border = Rectangle.NO_BORDER;
        paragraph = new Paragraph();
        paragraph.Add(new Chunk(GetNextSectionText(), normalFontSmall));
        table.AddCell(paragraph);

        table.DefaultCell.Border = Rectangle.TOP_BORDER;
        paragraph = new Paragraph();
        paragraph.Add(new Chunk(GetNextSectionHeading(), boldFontSmall));
        PdfPTable nestedTable = new PdfPTable(new float[] { 70f, 30f });
        nestedTable.WidthPercentage = 100;
        nestedTable.DefaultCell.Border = Rectangle.NO_BORDER;
        
        nestedTable.AddCell(paragraph);
        nestedTable.AddCell(CreateSectionDetail());
        table.AddCell(nestedTable);
        
        table.DefaultCell.Border = Rectangle.NO_BORDER;
        paragraph = new Paragraph();
        paragraph.Add(new Chunk(GetNextSectionHeading() , boldFontSmall));
        paragraph.Add(new Chunk(GetNextSectionText(), FontFactory.GetFont("Arial", 10, Font.BOLD, new Color(67, 75, 160))));
        table.AddCell(paragraph);

        paragraph = new Paragraph();
        paragraph.Add(new Chunk(GetNextSectionHeading(), boldFontSmall));
        paragraph.Add(new Chunk(GetNextSectionText(),normalFontSmall));
        table.AddCell(paragraph);


        table.DefaultCell.Border = Rectangle.TOP_BORDER;
        paragraph = new Paragraph();
        paragraph.Add(new Chunk(GetNextSectionHeading(), boldFontSmall));
        //paragraph.Add(new Chunk(GetNextSectionHeading(), normalFontSmall));
        table.AddCell(paragraph);

        nestedTable = CreateSectionDetail();
        nestedTable.SpacingAfter = 10f;
        table.AddCell(nestedTable);

        table.DefaultCell.Border = Rectangle.TOP_BORDER;
        paragraph = new Paragraph();
        paragraph.Add(new Chunk(GetNextSectionHeading(), boldFontSmall));
        table.AddCell(paragraph);

        table.DefaultCell.Border = Rectangle.NO_BORDER;
        table.AddCell(CreateSectionDetail());

        /*********USE OF SUBSTANCE*************/

        table.DefaultCell.Border = Rectangle.NO_BORDER;
        table.DefaultCell.HorizontalAlignment = Element.ALIGN_CENTER;
        table.DefaultCell.BackgroundColor = Color.BLACK;
        table.AddCell(new Phrase("USE OF SUBSTANCE", normalFontSmallWhite));

        //Reset DefaultCell
        table.DefaultCell.BackgroundColor = Color.WHITE;
        table.DefaultCell.HorizontalAlignment = Element.ALIGN_LEFT;

        paragraph = new Paragraph();
        paragraph.Add(new Chunk(GetNextSectionHeading() + " ", boldFontSmall));
        paragraph.Add(new Chunk(GetNextSectionText(), normalFontSmall));
        table.AddCell(paragraph);

        table.DefaultCell.Border = Rectangle.TOP_BORDER;
        paragraph = new Paragraph();
        paragraph.Add(new Chunk(GetNextSectionHeading() + " " , boldFontSmall));
        paragraph.Add(new Chunk(GetNextSectionText(), normalFontSmall));
        table.AddCell(paragraph);

        table.DefaultCell.Border = Rectangle.TOP_BORDER;
        paragraph = new Paragraph();
        paragraph.Add(new Chunk(GetNextSectionHeading() + " ", boldFontSmall));
        paragraph.Add(new Chunk(GetNextSectionText(), normalFontSmall));
        table.AddCell(paragraph);


        table.DefaultCell.Border = Rectangle.TOP_BORDER;
        paragraph = new Paragraph();
        paragraph.Add(new Chunk(GetNextSectionHeading() + " " + GetNextSectionText(), boldFontSmall));
        table.AddCell(paragraph);


        /*********CONTROL MEASURES************/
        table.DefaultCell.Border = Rectangle.NO_BORDER;
        table.DefaultCell.HorizontalAlignment = Element.ALIGN_CENTER;
        table.DefaultCell.BackgroundColor = Color.BLACK;
        table.AddCell(new Phrase("CONTROL MEASURES", normalFontSmallWhite));

        //Reset DefaultCell
        table.DefaultCell.BackgroundColor = Color.WHITE;
        table.DefaultCell.HorizontalAlignment = Element.ALIGN_LEFT;

        nestedTable = new PdfPTable(new float[] { 60f, 40f });
        nestedTable.DefaultCell.Border = Rectangle.NO_BORDER;
        //table.AddCell(CreateInlineSectionDetail());
        paragraph = new Paragraph();
        paragraph.Add(new Chunk(GetNextSectionHeading() + " ", boldFontSmall));
        nestedTable.AddCell(paragraph);
        nestedTable.AddCell(CreateSectionDetail());
        table.AddCell(nestedTable);


        table.DefaultCell.Border = Rectangle.TOP_BORDER;
        paragraph = new Paragraph();
        paragraph.Add(new Chunk(GetNextSectionHeading() + " ", boldFontSmall));
        table.AddCell(paragraph);


        table.DefaultCell.Border = Rectangle.NO_BORDER;
        paragraph = new Paragraph();
        paragraph.Add(new Chunk(GetNextSectionText(), normalFontSmall));
        table.AddCell(paragraph);

        table.DefaultCell.Border = Rectangle.TOP_BORDER;
        paragraph = new Paragraph();
        paragraph.Add(new Chunk(GetNextSectionHeading(), boldFontSmall));
        table.AddCell(paragraph);

        table.DefaultCell.Border = Rectangle.NO_BORDER;
        table.AddCell(CreateSectionDetail());
        
        table.DefaultCell.Colspan = 2;
        table.DefaultCell.Border = Rectangle.TOP_BORDER;
        paragraph = new Paragraph();
        paragraph.Add(new Chunk(GetNextSectionHeading(), boldFontSmall));
        paragraph.Add(new Chunk(GetNextSectionText(), normalFontSmall));
        table.AddCell(paragraph);

        table.DefaultCell.Colspan = 1;
        table.DefaultCell.Border = Rectangle.TOP_BORDER;
        paragraph = new Paragraph();
        paragraph.Add(new Chunk(GetNextSectionHeading(), boldFontSmall));
        table.AddCell(paragraph);
        table.AddCell(CreateSectionDetail());

        table.DefaultCell.Border = Rectangle.NO_BORDER;
        table.DefaultCell.Colspan = 2;
        table.DefaultCell.HorizontalAlignment = Element.ALIGN_CENTER;
        table.DefaultCell.BackgroundColor = Color.BLACK;
        table.AddCell(new Phrase("OTHER PRECAUTIONS AND EMERGENCY PROCEDURES", normalFontSmallWhite));

        //Reset DefaultCell
        table.DefaultCell.BackgroundColor = Color.WHITE;
        table.DefaultCell.HorizontalAlignment = Element.ALIGN_LEFT;

        paragraph = new Paragraph();
        paragraph.Add(new Chunk(GetNextSectionHeading(), boldFontSmall));
        paragraph.Add(new Chunk(GetNextSectionText(), normalFontSmall));
        table.AddCell(paragraph);

        table.DefaultCell.Border = Rectangle.TOP_BORDER;
        paragraph = new Paragraph();
        paragraph.Add(new Chunk("First aid: ", boldFontSmall));
        paragraph.Add(new Chunk("What actions should be taken if the substance is:", normalFontSmall));
        table.AddCell(paragraph);


        table.DefaultCell.Colspan = 1;
        table.DefaultCell.PaddingLeft = 5f;
        table.DefaultCell.FixedHeight = 50f;
        table.DefaultCell.Border = Rectangle.NO_BORDER;
        table.DefaultCell.Border = Rectangle.RIGHT_BORDER;
        paragraph = new Paragraph();
        paragraph.Add(new Chunk(GetNextSectionHeading(), boldFontSmall));
        paragraph.Add(new Chunk(GetNextSectionText(), normalFontSmall));
        table.AddCell(paragraph);

        table.DefaultCell.Border = Rectangle.NO_BORDER;
        paragraph = new Paragraph();
        paragraph.Add(new Chunk(GetNextSectionHeading(), boldFontSmall));
        paragraph.Add(new Chunk(GetNextSectionText(), normalFontSmall));
        table.AddCell(paragraph);

        table.DefaultCell.Border = Rectangle.NO_BORDER;
        table.DefaultCell.Border = Rectangle.TOP_BORDER | Rectangle.RIGHT_BORDER | Rectangle.BOTTOM_BORDER;
        paragraph = new Paragraph();
        paragraph.Add(new Chunk(GetNextSectionHeading(), boldFontSmall));
        paragraph.Add(new Chunk(GetNextSectionText(), normalFontSmall));
        table.AddCell(paragraph);

        table.DefaultCell.Border = Rectangle.NO_BORDER;
        table.DefaultCell.Border = Rectangle.TOP_BORDER | Rectangle.BOTTOM_BORDER;
        paragraph = new Paragraph();
        paragraph.Add(new Chunk(GetNextSectionHeading(), boldFontSmall));
        paragraph.Add(new Chunk(GetNextSectionText(), normalFontSmall));
        table.AddCell(paragraph);

        table.DefaultCell.Colspan = 2;
        table.DefaultCell.FixedHeight = 0.0f;
        table.DefaultCell.Border = Rectangle.NO_BORDER;
        paragraph = new Paragraph();
        paragraph.Add(new Chunk(GetNextSectionHeading(), boldFontSmall));
        paragraph.Add(new Chunk(GetNextSectionText(), normalFontSmall));
        table.AddCell(paragraph);

        table.DefaultCell.Border = Rectangle.TOP_BORDER;
        table.DefaultCell.PaddingLeft = 0.0f;
        paragraph = new Paragraph();
        paragraph.Add(new Chunk(GetNextSectionHeading(), boldFontSmall));
        paragraph.Add(new Chunk(GetNextSectionText(), normalFontSmall));
        table.AddCell(paragraph);

        table.DefaultCell.Border = Rectangle.TOP_BORDER;
        paragraph = new Paragraph();
        paragraph.Add(new Chunk(GetNextSectionHeading(), boldFontSmall));
        paragraph.Add(new Chunk(GetNextSectionText(), normalFontSmall));
        table.AddCell(paragraph);

        table.DefaultCell.Border = Rectangle.TOP_BORDER;
        paragraph = new Paragraph();
        paragraph.Add(new Chunk(GetNextSectionHeading(), boldFontSmall));
        paragraph.Add(new Chunk(GetNextSectionText(), normalFontSmall));
        table.AddCell(paragraph);


        table.DefaultCell.Border = Rectangle.TOP_BORDER;
        nestedTable = new PdfPTable(new float[] { 60f, 40f });
        nestedTable.DefaultCell.Border = Rectangle.NO_BORDER;
        paragraph = new Paragraph();
        paragraph.Add(new Chunk(GetNextSectionHeading(), boldFontSmall));
        string healthText = GetNextSectionText();
        paragraph.Add(new Chunk(GetNextSectionHeading(), normalFontSmall));
        nestedTable.AddCell(paragraph);
        nestedTable.AddCell(CreateSectionDetail());
        table.AddCell(nestedTable);


        table.DefaultCell.Border = Rectangle.NO_BORDER;
        paragraph = new Paragraph();
        paragraph.Add(new Chunk(healthText, normalFontSmall));
        table.AddCell(paragraph);

        /*****************ASSESSMENT OF RISK***********************/

        table.DefaultCell.Colspan = 2;
        table.DefaultCell.Border = Rectangle.NO_BORDER;
        table.DefaultCell.HorizontalAlignment = Element.ALIGN_CENTER;
        table.DefaultCell.BackgroundColor = Color.BLACK;
        table.AddCell(new Phrase("ASSESSMENT OF RISK", normalFontSmallWhite));

        //Reset DefaultCell
        table.DefaultCell.BackgroundColor = Color.WHITE;
        table.DefaultCell.HorizontalAlignment = Element.ALIGN_LEFT;

        table.DefaultCell.Border = Rectangle.NO_BORDER;
        nestedTable = new PdfPTable(new float[] { 60f,40f });
        nestedTable.DefaultCell.Border = Rectangle.NO_BORDER;
        paragraph = new Paragraph();
        paragraph.Add(new Chunk(GetNextSectionHeading(), boldFontSmall));
        nestedTable.AddCell(paragraph);
        nestedTable.AddCell(CreateSectionDetail());
        table.AddCell(nestedTable);

        table.DefaultCell.Border = Rectangle.TOP_BORDER;
        paragraph = new Paragraph();
        paragraph.Add(new Chunk("If these controls are not in place or additional controls are required, state action to be taken.", boldFontSmall));
        table.AddCell(paragraph);

        table.DefaultCell.Border = Rectangle.NO_BORDER;
        paragraph = new Paragraph();
        paragraph.Add(new Chunk("Note - ", boldFontSmall));
        paragraph.Add(new Chunk("COSHH substances must NOT be used if adequate control measures are not in place.", normalFontSmall));
        table.AddCell(paragraph);

        nestedTable = new PdfPTable(new float[] { 80f, 20f });
        nestedTable.WidthPercentage = 100;
        nestedTable.AddCell(new Phrase(GetNextSectionHeading(), boldFontSmall));
        nestedTable.AddCell(new Phrase("Date for completion", boldFontSmall));
        nestedTable.AddCell(new Phrase(GetNextSectionText(), normalFontSmall));
        nestedTable.AddCell(new Phrase(""));
        table.AddCell(nestedTable);

        table.DefaultCell.Border = Rectangle.BOTTOM_BORDER;
        table.DefaultCell.BorderWidthBottom = 2;
        table.DefaultCell.FixedHeight = 20f;
        nestedTable = new PdfPTable(2);
        paragraph = new Paragraph();
        paragraph.Add(new Chunk(GetNextSectionHeading(), boldFontSmall));
        nestedTable.AddCell(paragraph);
        nestedTable.AddCell(CreateSectionDetail());
        table.AddCell(nestedTable);

        table.DefaultCell.FixedHeight = 0.0f;
        table.DefaultCell.Border = Rectangle.NO_BORDER;
        nestedTable = new PdfPTable(new float[] { 40f, 40f, 20f });
        nestedTable.WidthPercentage = 100;
        nestedTable.AddCell(new Phrase("Assessor(s) name: " + assessorName, boldFontSmall));
        nestedTable.AddCell(new Phrase("Assessor(s) signature:", boldFontSmall));
        nestedTable.AddCell(new Phrase("Date:", boldFontSmall));

        nestedTable.DefaultCell.Colspan = 3;
        nestedTable.AddCell(new Phrase("The Supervisors should sign below to show that the assessment is a correct and reasonable reflection of the hazards and of the control measures and actions required.", normalFontSmall));

        nestedTable.DefaultCell.Colspan = 1;
        nestedTable.DefaultCell.FixedHeight = 30f;
        nestedTable.AddCell(new Phrase("Supervisors name:", boldFontSmall));
        nestedTable.AddCell(new Phrase("Supervisors signature:", boldFontSmall));
        nestedTable.AddCell(new Phrase("Date:", boldFontSmall));

        nestedTable.DefaultCell.FixedHeight = 40f;
        nestedTable.AddCell(new Phrase("Remedial actions complete: (Date)", boldFontSmall));
        nestedTable.AddCell(new Phrase("Supervisors signature:", boldFontSmall));
        nestedTable.AddCell(new Phrase("Reviewed on: (Date)", boldFontSmall));
        table.AddCell(nestedTable);

        table.DefaultCell.HorizontalAlignment = Rectangle.ALIGN_CENTER;
        table.AddCell(new Phrase("A copy of the product safety data sheet must be attached this assessment.", boldFontSmall));
        doc.Add(table);        
    }

}
