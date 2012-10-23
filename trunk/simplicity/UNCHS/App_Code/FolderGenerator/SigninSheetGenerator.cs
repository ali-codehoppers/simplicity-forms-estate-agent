using System.IO;
using System;

using iTextSharp.text;
using iTextSharp.text.pdf;

/// <summary>
/// Summary description for SigninSheetGenerator
/// </summary>
public class SigninSheetGenerator : GenericGenerator
{
    string siteAddress = "";
    int dataRows = 30;
	public SigninSheetGenerator()
	{        
	}

    protected override void SetDocumentData(DocumentType docType)
    {
        try
        {
            DepartmentOrder.DepartmentOrderRowRow dataRow = DatabaseUtility.GetDepartmentOrder(docType.DeptOrderId);
            if (dataRow != null)
            {
                siteAddress = dataRow.address_full;
            }
        }
        catch (Exception ex)
        {
            siteAddress = "";
        }
    }

    protected override void GenerateDocument(Document doc, DocumentType docType, string addSheet, PdfWriter writer)
    {
        // Create a table with 10 columns
        PdfPTable table = new PdfPTable(10);
        // Define the header columns widths
        float[] headerwidths = { 7, 15, 20, 20, 18, 15, 15, 15, 15, 25 }; // percentage
        table.SetWidths(headerwidths);
        table.WidthPercentage = 100;

        // Set the Site Address header
        table.DefaultCell.Colspan = 10;
        table.DefaultCell.FixedHeight = 20;
        table.DefaultCell.VerticalAlignment = Element.ALIGN_BOTTOM;
        table.AddCell(new Phrase(string.Concat("SITE ADDRESS: ", siteAddress), FontFactory.GetFont("Arial", 8)));

        // Add an empty row
        // Reset the FixedHeight to 0
        table.DefaultCell.FixedHeight = 10;
        table.DefaultCell.Border = Rectangle.NO_BORDER;
        table.AddCell(string.Empty);

        // Add the Table Header
        table.DefaultCell.Colspan = 1;
        table.DefaultCell.Border = Rectangle.BOX;
        table.DefaultCell.BackgroundColor = new Color(192, 192, 192);
        table.DefaultCell.HorizontalAlignment = Element.ALIGN_CENTER;
        table.DefaultCell.VerticalAlignment = Element.ALIGN_MIDDLE;
        table.DefaultCell.Padding = 0;
        table.DefaultCell.FixedHeight = 20;
        // Add the header row
        string[] columnsHeadeing = { "#", "DATE", "COMPANY", "NAME", "CONTACT NO", "VRN", "TIME IN", "TIME OUT", "HOT WORKS", "SIGNATURE FOR HOT WORKS" };
        for (int i = 0; i < columnsHeadeing.Length; i++)
        {
            table.AddCell(new Phrase(columnsHeadeing[i], FontFactory.GetFont("Arial", 8)));
        }

        // Add another row with No Border
        table.DefaultCell.Border = Rectangle.NO_BORDER;
        table.DefaultCell.BackgroundColor = Color.WHITE;
        table.DefaultCell.FixedHeight = 10;

        columnsHeadeing = new string[] { string.Empty, string.Empty, "PLEASE PRINT", "PLEASE PRINT", string.Empty, "VEHICLE REG NO.", string.Empty, string.Empty, string.Empty, "SUPERVISOR" };
        for (int i = 0; i < columnsHeadeing.Length; i++)
        {
            table.AddCell(new Phrase(columnsHeadeing[i], FontFactory.GetFont("Arial", 6)));
        }

        PdfPCell cellSerialNo, cellHotWorks = null;
        
        for (int j = 0; j < dataRows; j++)
        {
            cellSerialNo = new PdfPCell(new Phrase((j + 1).ToString(), FontFactory.GetFont("Arial", 11f)));
            cellHotWorks = new PdfPCell(new Phrase("YES/NO", FontFactory.GetFont("Arial", 11f)));
            cellHotWorks.HorizontalAlignment = cellSerialNo.HorizontalAlignment = Element.ALIGN_CENTER;
            table.AddCell(cellSerialNo);            
            table.AddCell(new PdfPCell());
            table.AddCell(new PdfPCell());
            table.AddCell(new PdfPCell());
            table.AddCell(new PdfPCell());
            table.AddCell(new PdfPCell());
            table.AddCell(new PdfPCell());
            table.AddCell(new PdfPCell());
            table.AddCell(cellHotWorks);
            table.AddCell(new PdfPCell());        
            //table.Rows.Add(new PdfPRow(new PdfPCell[10] { cellSerialNo, new PdfPCell(), new PdfPCell(), new PdfPCell(), new PdfPCell(), new PdfPCell(), new PdfPCell(), new PdfPCell(), cellHotWorks, new PdfPCell() }));
            
        }

        doc.Add(table);
    }
}
