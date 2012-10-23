using System;
using System.Data;
using System.Configuration;
using System.Text;
using iTextSharp.text;
using iTextSharp.text.pdf;
using System.Collections.Generic;
using System.Collections;

/// <summary>
/// Summary description for GenericGenerator
/// </summary>
public abstract class GenericGenerator
{
    private static float LINE_HEIGHT = 10;
    private static float CHAR_WIDTH = 1;
    private PdfPTable overflowTable;
    private Font overflowTextFont = null;
    private Font overflowHeadingFont = null;
    private List<DocumentType> docTypes = null;
    
	public GenericGenerator()
	{
        overflowTextFont = FontFactory.GetFont("Arial", 9);
        overflowHeadingFont = FontFactory.GetFont("Arial", 10, Font.BOLD);
	}
    protected Image AddCheckBox()
    {
        // Create a bitmap image object
        System.Drawing.Bitmap pic = new System.Drawing.Bitmap(7, 7);
        // Create a graphics object from bitmap image through which we will draw a rectangle which makes the shape of checkbox
        System.Drawing.Graphics graphics = System.Drawing.Graphics.FromImage(pic);
        graphics.FillRectangle(new System.Drawing.SolidBrush(System.Drawing.Color.White), 1, 1, 5, 5);
        // Here we get the iTextSharp.text.Image object from our System.Drawing.Image 
        Image imgChkBox = Image.GetInstance(pic, System.Drawing.Imaging.ImageFormat.Bmp);
        pic.Dispose();
        return imgChkBox;
    }

    protected Image AddCheckedCheckBox()
    {
        // Create a bitmap image object
        System.Drawing.Bitmap pic = new System.Drawing.Bitmap(7, 7);
        // Create a graphics object from bitmap image through which we will draw a rectangle which makes the shape of checkbox
        System.Drawing.Graphics graphics = System.Drawing.Graphics.FromImage(pic);
        graphics.FillRectangle(new System.Drawing.SolidBrush(System.Drawing.Color.Black), 1, 1, 5, 5);
        // Here we get the iTextSharp.text.Image object from our System.Drawing.Image 
        Image imgChkBox = Image.GetInstance(pic, System.Drawing.Imaging.ImageFormat.Bmp);
        pic.Dispose();
        return imgChkBox;
    }

    public void Generate(Document doc, DocumentType docType, string addSheet,PdfWriter writer)
    {
        GenerateDocument(doc, docType, addSheet,writer);
        /* Temporary moving this code to Method Statement as Continuation sheet needs to be printed on the 
         * back of main sheet before the additional notes. After a proper solution we will try 
         * to put it back or otherwise.
        if (overflowTable != null)
        {
            doc.NewPage();
            doc.Add(overflowTable);
        }
         * */
    }

    protected DocumentType GetDocumentType(String name)
    {
        foreach (DocumentType docType in docTypes)
        {
            if (docType.Name.Equals(name))
            {
                return docType;
            }
        }
        return null;
    }

    protected abstract void GenerateDocument(Document doc, DocumentType docType, string addSheet,PdfWriter writer);
    public void SetData(DocumentType docType,List<DocumentType> docTypes)
    {
        this.docTypes = docTypes;
        SetDocumentData(docType);
    }

    protected abstract void SetDocumentData(DocumentType docType);

    protected void AddOverflowText(Document doc, PdfPTable table, string text,string itemNumber, int totalColsToUse)
    {
        char[] seperator = new char[1];
        seperator[0] = '\n';
        int numOfLines = int.Parse(Math.Floor(table.DefaultCell.FixedHeight / LINE_HEIGHT).ToString()) * totalColsToUse;
        int numOfChars = int.Parse(Math.Floor((table.WidthPercentage * table.DefaultCell.Colspan) / (table.NumberOfColumns * CHAR_WIDTH)).ToString());
        string actualText = GetActualText(numOfLines, numOfChars, text);
        for (int count = 1; count <= totalColsToUse; count++)
        {
            if (text != null && text.Length > 0)
            {
                string textToPrint = actualText;
                if (count == totalColsToUse)
                {
                    if (actualText.Length < text.Length)
                    {
                        
                        if (textToPrint.LastIndexOf('\n') > 0)
                        {
                            textToPrint = textToPrint.Remove(textToPrint.LastIndexOf('\n'));
                        }
                        textToPrint = textToPrint + " ...Cont to Next Sheet...";
                        string overFlowText = text.Substring(actualText.Length, text.Length - actualText.Length);
                        if (overflowTable == null)
                        {
                            overflowTable = new PdfPTable(1);
                            overflowTable.WidthPercentage = 100;
                            overflowTable.DefaultCell.Border = Rectangle.NO_BORDER;
                            overflowTable.DefaultCell.FixedHeight = 35.0f;
                            overflowTable.DefaultCell.HorizontalAlignment = Element.ALIGN_CENTER;
                            overflowTable.AddCell(new Phrase("Continuation Sheet", FontFactory.GetFont("Times New Roman", 18, Font.BOLD)));
                        }
                        PdfPCell cell = new PdfPCell();
                        cell.AddElement(new Phrase("Continued from Item Number " + itemNumber + " overleaf:", overflowHeadingFont));
                        cell.AddElement(new Phrase(overFlowText, overflowTextFont));
                        overflowTable.AddCell(cell);
                    }
                }
                string[] textLines = textToPrint.Split(seperator);
                StringBuilder cellText = new StringBuilder();
                int counter = 1;
                foreach (string textLine in textLines)
                {
                    if (totalColsToUse == 1)
                    {
                        cellText.Append(textLine + "\n");
                    }
                    else
                    {
                        if (count == 1 && counter % 2 == 1)
                        {
                            cellText.Append(textLine + "\n");
                        }
                        else if (count == 2 && counter % 2 == 0)
                        {
                            cellText.Append(textLine + "\n");
                        }
                    }
                    counter++;
                }
                float borderWidth = table.DefaultCell.BorderWidthLeft;
                if (count == 1 && totalColsToUse > 1)
                {
                    table.DefaultCell.BorderWidthRight = 0.0f;
                }
                else if (totalColsToUse > 1)
                {
                    table.DefaultCell.BorderWidthLeft = 0.0f;
                }
                table.AddCell(new Phrase(cellText.ToString(), overflowTextFont));
                table.DefaultCell.BorderWidthRight = borderWidth;
                table.DefaultCell.BorderWidthLeft = borderWidth;
            }
            else
            {
                table.AddCell("");
            }
        }
    }

    private string GetActualText(int numOfLines,int numOfChars,string text)
    {
        StringBuilder actualText = new StringBuilder();
        int currentNumOfLines = 0;
        char[] seperator = new char[1];
        seperator[0] = '\n';
        string[] textLines = text.Split(seperator);

        foreach (string textLine in textLines)
        {
            string currentTextLine = textLine;
            while (currentTextLine.Length > 0)
            {
                int currentLength = int.Parse(Math.Min(numOfChars, currentTextLine.Length).ToString());
                actualText.Append(currentTextLine.Substring(0, currentLength));                
                currentTextLine = currentTextLine.Substring(currentLength, currentTextLine.Length - currentLength);
                if (currentTextLine.Length == 0)
                {
                    actualText.Append("\n");
                }
                currentNumOfLines++;
                if (currentNumOfLines == numOfLines)
                {
                    return actualText.ToString();
                }
            }
        }
        return actualText.ToString();
    }

    public bool PrintOverFlowTable(Document doc)
    {
        if (overflowTable != null)
        {
            doc.NewPage();
            doc.Add(overflowTable);
        }
        return (overflowTable != null);
    }
}
