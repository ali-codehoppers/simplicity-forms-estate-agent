using System;
using System.Data;
using System.Configuration;
using System.Collections;

using iTextSharp.text;
using iTextSharp.text.pdf;
/// <summary>
/// Summary description for HotWorksGenerator
/// </summary>
public class HotWorksGenerator : GenericGenerator
{
    string companyName = "";
    public HotWorksGenerator()
	{        
	}

    protected override void SetDocumentData(DocumentType docType)
    {
        try
        {
            Department.DepartmentSelectCommandRow dataRow = DatabaseUtility.GetDepartment(docType.DeptId);
            if (dataRow != null)
            {
                companyName = dataRow.co_name_short;
            }
        }
        catch (Exception ex)
        {
            companyName = "";
        }
    }
    protected override void GenerateDocument(Document doc, DocumentType docType, string addSheet, PdfWriter writer)
    {

        Font normalFontSmall = FontFactory.GetFont("Arial", 10, Font.NORMAL);
        Font normalFontLarge = FontFactory.GetFont("Arial", 11, Font.NORMAL);
        Font boldFontSmall = FontFactory.GetFont("Arial", 10, Font.BOLD);
        Font boldFontLarge = FontFactory.GetFont("Arial", 11, Font.BOLD);

        // Create a table with 3 columns
        PdfPTable table = new PdfPTable(3);
        table.WidthPercentage = 100;
        // Define the table header
        table.DefaultCell.Colspan = 3;
        table.DefaultCell.Border = Rectangle.NO_BORDER;
        table.DefaultCell.HorizontalAlignment = Element.ALIGN_CENTER;
        table.AddCell(new Phrase("PERMIT TO WORK – HOT WORKS", FontFactory.GetFont("Arial", 18)));

        // First Row to draw
        // -----------------------------------------------------------------------------------------
        // |Applicable to:                                                                          |
        // |HOT WORK: All operations involving flame , spark or heat sufficient to start a fire     |
        // -----------------------------------------------------------------------------------------
        table.DefaultCell.Border = Rectangle.BOX;
        table.DefaultCell.HorizontalAlignment = Element.ALIGN_LEFT;
        Paragraph paragraph = new Paragraph();
        ArrayList arrayList = new ArrayList();

        arrayList.Add(new Phrase("Applicable to:\n", boldFontSmall));
        arrayList.Add(new Phrase("HOT WORK:", boldFontSmall));
        arrayList.Add(new Phrase(" All operations involving flame , spark or heat sufficient to start a fire", normalFontSmall));

        paragraph.AddAll(arrayList);
        table.AddCell(paragraph);

        // -----------------------------------------------------------------------------------------------------------------------------------
        // |N.B Work specified  in the Permit is conditional on all contractors/workers having signed and understood the West Gate Maintenance| 
        // |Health & Safety                                                                                                                   |
        // |Contractor Guidelines and duly completed the company competence questionnaire                                                     | 
        // -----------------------------------------------------------------------------------------------------------------------------------

        table.AddCell(new Paragraph("N.B Work specified  in the Permit is conditional on all contractors/workers having signed and understood the West Gate Maintenance \n" +
                      "Health & Safety\n" +
                      "Contractor Guidelines and duly completed the company competence questionnaire", normalFontSmall));


        // |-------------------------------------------------------------------------|
        // |SECTION 1 -  TO BE COMPLETED BY THE WEST GATE MAINTENANCE LTD SUPERVISOR |
        // |-------------------------------------------------------------------------|
        table.DefaultCell.VerticalAlignment = Element.ALIGN_MIDDLE;
        table.AddCell(new Paragraph("SECTION 1 -  TO BE COMPLETED BY THE " + companyName + " SUPERVISOR", boldFontLarge));

        // |-------------------------------------------------------------------------|            
        // Details of Work and Personnel                              Date:          |
        // |-------------------------------------------------------------------------|
        table.DefaultCell.FixedHeight = 25;
        table.DefaultCell.VerticalAlignment = Element.ALIGN_TOP;
        table.DefaultCell.Colspan = 2;
        table.DefaultCell.Border = Rectangle.LEFT_BORDER;
        table.AddCell(new Paragraph("Details of Work and Personnel", normalFontSmall));
        table.DefaultCell.Border = Rectangle.RIGHT_BORDER;
        table.AddCell(new Paragraph("Date:", normalFontSmall));

        // |-------------------------------------------------------------------------|            
        // Authorised Person (Print Name)                                            |
        // |-------------------------------------------------------------------------|
        table.DefaultCell.Border = Rectangle.BOX;
        table.DefaultCell.Colspan = 3;
        table.DefaultCell.FixedHeight = 0;
        table.AddCell(new Paragraph("Authorised Person (Print Name)", boldFontLarge));
        // |-------------------------------------------------------------------------|            
        // |Timescale: P.T.W. Issued	            |From:	                |To:     |
        // |-------------------------------------------------------------------------|
        table.DefaultCell.Colspan = 1;
        table.DefaultCell.FixedHeight = 0;
        table.DefaultCell.VerticalAlignment = Element.ALIGN_MIDDLE;
        table.AddCell(new Paragraph("Timescale: P.T.W. Issued", normalFontSmall)); table.AddCell(new Paragraph("From:", normalFontSmall)); table.AddCell(new Paragraph("To:", normalFontSmall));

        // |-------------------------------------------------------------------------|            
        // |Work Method:                                                             |
        // |-------------------------------------------------------------------------|
        table.DefaultCell.Colspan = 3;
        table.DefaultCell.FixedHeight = 25;
        table.DefaultCell.VerticalAlignment = Element.ALIGN_TOP;
        table.AddCell(new Paragraph("Work Method:", normalFontLarge));

        // Two Empty rows
        table.AddCell(""); table.AddCell("");

        // |-------------------------------------------------------------------------|            
        // |Mandatory Safety Requirements:                                           |
        // |-------------------------------------------------------------------------|

        PdfPCell cell = new PdfPCell(new Paragraph("Mandatory Safety Requirements:", normalFontLarge));
        cell.BorderWidthTop = 1f;
        cell.Colspan = 3;
        table.AddCell(cell);

        // |----------------------------------------------------------------------------------------------------------------|            
        // |1.	All areas to be checked and combustibles removed or protected before commencement of work.                  |
        // |2.	All areas to be screened, protected and warning notices displayed before commencement of work               |
        // |3.	Hand held extinguishers (appropriate to the task) within easy reach and operative be competent in their use.|
        // |4.	Area to be inspected for combustion on completion of work and 60 minutes after.                             |
        // |5.	Site specific safety method statement and appropriated risk assessment to be completed.                     |
        // |----------------------------------------------------------------------------------------------------------------|
        table.DefaultCell.FixedHeight = 0;
        table.AddCell(new Paragraph("1.	All areas to be checked and combustibles removed or protected before commencement of work.\n" +
            "2.	All areas to be screened, protected and warning notices displayed before commencement of work.\n" +
            "3.	Hand held extinguishers (appropriate to the task) within easy reach and operative be competent in their use.\n" +
            "4.	Area to be inspected for combustion on completion of work and 60 minutes after.\n" +
            "5.	Site specific safety method statement and appropriated risk assessment to be completed.", boldFontSmall));

        // |-------------------------------------------------------------------------|            
        // |Name of Applicant in Charge of Works (print name):                       |
        // |-------------------------------------------------------------------------|
        table.AddCell(new Paragraph("Name of Applicant in Charge of Works (print name):", normalFontSmall));

        // |-------------------------------------------------------------------------|            
        // |Applicant’s Company (print name):                                        |
        // |-------------------------------------------------------------------------|
        table.AddCell(new Paragraph("Applicant's Company (print name):", normalFontLarge));

        // |-------------------------------------------------------------------------|            
        // |Other Personnel Engaged in Works (print names):                          |
        // |-------------------------------------------------------------------------|
        table.AddCell(new Paragraph("Other Personnel Engaged in Works (print names):", normalFontLarge));

        // |-------------------------------------------------------------------------|            
        // |1.                                  | 2.                                 |
        // |3.                                  | 4.                                 |
        // |5.                                  | 6.                                 |
        // |-------------------------------------------------------------------------|                        

        PdfPTable nestedTable = new PdfPTable(2);
        for (int i = 1; i <= 6; i++)
        {
            nestedTable.AddCell(new Paragraph(string.Concat(i.ToString(), "."), normalFontLarge));
        }
        table.DefaultCell.Padding = 0;
        table.AddCell(nestedTable);
        table.DefaultCell.Padding = 2;
        // |--------------------------------------------------------------------------|            
        // |AUTHORISATION                                                             |
        // |I have verified the above information and authorise the works to commence.|
        // |--------------------------------------------------------------------------|
        paragraph = new Paragraph();
        paragraph.Add(new Phrase("AUTHORISATION\n", boldFontLarge));
        paragraph.Add(new Phrase("I have verified the above information and authorise the works to commence.", normalFontSmall));
        table.AddCell(paragraph);

        // |--------------------------------------------------------------------------|                        
        // |Authorised persons                     | Time:             | Date:        |
        // |Signature:	                           | (Print Name)      |              |
        // |--------------------------------------------------------------------------|
        table.DefaultCell.Colspan = 1;
        table.DefaultCell.Rowspan = 2;
        table.AddCell(new Paragraph("Authorised persons\nSignature:", normalFontLarge));
        table.DefaultCell.Rowspan = 1;
        table.AddCell(new Paragraph("Time:", normalFontLarge));
        table.AddCell(new Paragraph("Date:", normalFontLarge));
        table.DefaultCell.Colspan = 2;
        table.AddCell(new Paragraph("(Print Name)", normalFontLarge));

        // |--------------------------------------------------------------------------|                        
        // |SECTION 2  -TO BE COMPLETED BY THE OPERATIVE IN CHARGE                    |
        // |--------------------------------------------------------------------------|

        table.DefaultCell.Colspan = 3;
        cell = new PdfPCell(new Paragraph("SECTION 2  -TO BE COMPLETED BY THE OPERATIVE IN CHARGE", boldFontLarge));
        cell.Colspan = 3;
        cell.BorderWidthTop = 0.8f;
        cell.BorderWidthBottom = 0.0f;
        table.AddCell(cell);

        // |----------------------------------------------------------------------------------------------------------------------|                        
        // |ACCEPTANCE                                                                                                            |
        // |I will accept responsibility for the work/personnel stated and agree to implement safe working procedures and confirm |
        // |that all personnel are adequately trained and will only work on the job/equipment specified.                          |
        // |----------------------------------------------------------------------------------------------------------------------|
        paragraph = new Paragraph();
        paragraph.Add(new Phrase("ACCEPTANCE\n\n", FontFactory.GetFont("Arial", 8, Font.UNDERLINE | Font.BOLD)));
        paragraph.Add(new Phrase("I will accept responsibility for the work/personnel stated and agree to implement safe working procedures and confirm that all personnel are adequately trained and will only work on the job/equipment specified.", normalFontSmall));
        table.AddCell(paragraph);

        // |--------------------------------------------------------------------------|                        
        // |Applicant in charge                    | Time:             | Date:        |
        // |Signature:	                           | 	               |              |
        // |--------------------------------------------------------------------------|
        table.DefaultCell.Colspan = 1;
        table.AddCell(new Paragraph("Applicant in charge\nSignature:", normalFontLarge));
        table.AddCell(new Paragraph("Time:", normalFontLarge));
        table.AddCell(new Paragraph("Date:", normalFontLarge));

        // |--------------------------------------------------------------------------|                                    
        // |SECTION 3 - TO BE COMPLETED BY OPERATIVE IN CHARGE                        |
        // |--------------------------------------------------------------------------|
        table.DefaultCell.Colspan = 3;
        table.AddCell(new Paragraph("SECTION 3 - TO BE COMPLETED BY OPERATIVE IN CHARGE", boldFontLarge));

        // |----------------------------------------------------------------------------------------------------------------------|                        
        // |CLEARANCE                                                                                                             |
        // |I confirm that personnel and equipment have been withdrawn. The work has/has not been completed and that              |
        // |uncompleted work will not be restarted until a new Permit is issued. (*Delete which is not applicable)                |            
        // |----------------------------------------------------------------------------------------------------------------------|            
        paragraph = new Paragraph();
        paragraph.Add(new Phrase("CLEARANCE\n\n", FontFactory.GetFont("Arial", 8, Font.UNDERLINE | Font.BOLD)));
        paragraph.Add(new Phrase("I confirm that personnel and equipment have been withdrawn. The work has/has not been completed and that uncompleted work will not be restarted until a new Permit is issued. (*Delete which is not applicable)", normalFontSmall));
        table.AddCell(paragraph);

        // |--------------------------------------------------------------------------|                        
        // |Applicant in charge                    | Time:             | Date:        |
        // |Signature:	                           | 	               |              |
        // |--------------------------------------------------------------------------|
        table.DefaultCell.Colspan = 1;
        table.AddCell(new Paragraph("Applicant in charge\nSignature:", normalFontLarge));
        table.AddCell(new Paragraph("Time:", normalFontLarge));
        table.AddCell(new Paragraph("Date:", normalFontLarge));

        // |--------------------------------------------------------------------------|                                    
        // |SECTION 4 – TO BE COMPLETED BY THE SUPERVISOR                             |
        // |--------------------------------------------------------------------------|
        table.DefaultCell.Colspan = 3;
        table.AddCell(new Paragraph("SECTION 4 – TO BE COMPLETED BY THE SUPERVISOR", boldFontLarge));


        // |--------------------------------------|                        
        // |CANCELLATION                          |                                                                                |            
        // |This permit is cancelled and invalid  |            
        // |--------------------------------------|            
        paragraph = new Paragraph();
        paragraph.Add(new Phrase("CANCELLATION\n\n", FontFactory.GetFont("Arial", 8, Font.UNDERLINE | Font.BOLD)));
        paragraph.Add(new Phrase("This permit is cancelled and invalid", normalFontSmall));
        table.AddCell(paragraph);

        // |--------------------------------------------------------------------------|                        
        // |Authorised Persons                     | Time:             | Date:        |
        // |Signature:	                           | 	               |              |
        // |--------------------------------------------------------------------------|
        table.DefaultCell.Colspan = 1;
        table.SetWidths(new float[] { 50, 20, 30 });
        table.AddCell(new Paragraph("Authorised Persons\nSignature:", normalFontLarge));
        table.AddCell(new Paragraph("Time:", normalFontLarge));
        table.AddCell(new Paragraph("Date:", normalFontLarge));

        doc.Add(table);
    }
}
