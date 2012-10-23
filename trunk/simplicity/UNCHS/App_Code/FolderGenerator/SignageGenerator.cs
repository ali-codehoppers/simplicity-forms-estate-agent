using System;
using System.Collections.Generic;
using System.Web;
using System.Collections;

using iTextSharp.text;
using iTextSharp.text.pdf;
/// <summary>
/// Summary description for SignageGenerator
/// </summary>
public class SignageGenerator : GenericGenerator
{
	public SignageGenerator()
	{

	}
    protected override void SetDocumentData(DocumentType docType)
    {
        //We do not need to set any data as such. 
        int a = 1;
    }
    protected override void GenerateDocument(Document doc, DocumentType docType, string addSheet, PdfWriter writer)
    {
        DepartmentOrderDocTableAdapters.DocumentContentTableAdapter ta = new DepartmentOrderDocTableAdapters.DocumentContentTableAdapter();
        IEnumerator iEnum = ta.GetDocumentContentById(docType.DocId, docType.CoId, docType.DeptId).GetEnumerator();
        if (iEnum.MoveNext())
        {
            DepartmentOrderDoc.DocumentContentEntityRow docContent = (DepartmentOrderDoc.DocumentContentEntityRow)iEnum.Current;
            if (docContent.file_contents != null && docContent.file_contents.Length > 0)
            {
                PdfContentByte pdfContentByte = writer.DirectContent;
                PdfReader reader = new PdfReader(docContent.file_contents);
                for (int page = 1; page <= reader.NumberOfPages; page++)
                {
                    doc.NewPage();
                    PdfImportedPage importedPage = writer.GetImportedPage(reader, page);
                    pdfContentByte.AddTemplate(importedPage, 0, 0);
                }
            }
        }
    }
}
