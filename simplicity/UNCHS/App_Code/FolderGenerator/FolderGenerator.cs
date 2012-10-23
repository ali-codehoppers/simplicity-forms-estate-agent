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
using System.Reflection;
using System.IO;
using System.Text;

using iTextSharp.text;
using iTextSharp.text.pdf;
/// <summary>
/// Summary description for FolderGenerator
/// </summary>
/// 

public class FolderGenerator
{
    
    List<DocumentType> docTypes = null;
    public string fileName = "";
    string filePath;
    Document doc = null;
    PdfWriter writer = null;
	public FolderGenerator(List<DocumentType> docTypes)
	{
        this.docTypes = docTypes;
	}

    private Document GetDocument(DocumentType docType)
    {
        if (doc == null)
        {
            if(docType.IsLandScape == true)
                doc = new Document(PageSize.A4.Rotate());
            else
                doc = new Document();

            filePath = System.Configuration.ConfigurationManager.AppSettings[WebConstants.Configuration.PHYSICAL_PATH];
            filePath += @"\Folders\";
            Random random = new Random();
            fileName = random.Next(1, int.MaxValue).ToString();
            fileName += ".pdf";
            //filePath += fileName;
            writer = PdfWriter.GetInstance(doc, new FileStream(filePath + fileName, FileMode.Create));

            // Open the document
            doc.Open();
        }
        return doc;
    }

    public bool Generate()
    {
        try
        {
            if (GenerateDocument())
            {
                Company.un_co_detailsRow company = DatabaseUtility.GetCompany((int)HttpContext.Current.Session[WebConstants.Session.USER_CO_ID]);
                if(company != null && company.Isflg_trialNull() == false && company.flg_trial)
                {
                    AddWaterMark();
                }
                return true;
            }
        }
        catch
        {
        }
        return false;
    }

    private bool GenerateDocument() 
    {
        if (docTypes == null || docTypes.Count == 0)
        {
            return false;
        }
        
        bool isGenerated = false;
        try
        {
            // We create a writer that listens to the document
            bool doAddPage = false;
            foreach (DocumentType docType in docTypes)
            {
                if (docType.IsLandScape)
                    GetDocument(docType).SetPageSize(PageSize.A4.Rotate());
                else
                    GetDocument(docType).SetPageSize(PageSize.A4);

                if (doAddPage == true)
                {
                    doc.NewPage();
                }
                if (docType.GeneratorClass != null && docType.GeneratorClass.Length > 0)
                {
                    Type genaratorClass = Type.GetType(docType.GeneratorClass);
                    if (genaratorClass != null)//did not find the class
                    {
                        object[] arguments = new object[4];
                        arguments[0] = GetDocument(docType);
                        arguments[1] = docType;
                        arguments[2] = docType.IncludeBlankPage.ToString();
                        arguments[3] = writer;

                        object[] setDataArgs = new object[2];
                        setDataArgs[0] = docType;
                        setDataArgs[1] = docTypes;

                        if (docType.Type.Equals("int"))
                        {
                            object generatorObject = Activator.CreateInstance(genaratorClass);
                            genaratorClass.InvokeMember("SetData", BindingFlags.InvokeMethod, null, generatorObject, setDataArgs);
                            for (int i = 0; i < docType.Number; i++)
                            {
                                if (doAddPage == true)
                                {
                                    GetDocument(docType).NewPage();
                                }
                                genaratorClass.InvokeMember("Generate", BindingFlags.InvokeMethod, null, generatorObject, arguments);
                                doAddPage = true;
                                if (docType.IncludeBlankPage)
                                {
                                    Font blankFont = FontFactory.GetFont("Arial", 7, Color.WHITE);
                                    GetDocument(docType).NewPage();
                                    GetDocument(docType).Add(new Paragraph("[Blank Page]", blankFont));
                                }                                
                            }
                        }
                        else if (docType.Type.Equals("detail"))
                        {
                            foreach (int docId in docType.DocList.Keys)
                            {
                                int startPageNumber = writer.PageNumber;
                                object generatorObject = Activator.CreateInstance(genaratorClass);
                                docType.DocId = docId;
                                if (doAddPage == true)
                                {
                                    GetDocument(docType).NewPage();
                                }
                                genaratorClass.InvokeMember("SetData", BindingFlags.InvokeMethod, null, generatorObject, setDataArgs);
                                genaratorClass.InvokeMember("Generate", BindingFlags.InvokeMethod, null, generatorObject, arguments);
                                doAddPage = true;
                                int pageCount = writer.PageNumber - startPageNumber;
                                if (pageCount % 2 == 1 && docType.IncludeBlankPage == false)
                                {
                                    //add a blank page as we want the new to not be printed at the back.
                                    Font blankFont = FontFactory.GetFont("Arial", 7, Color.WHITE);
                                    GetDocument(docType).NewPage();
                                    GetDocument(docType).Add(new Paragraph("[Blank Page]", blankFont));
                                }
                            }
                        }
                        else if (docType.Type.Equals("contents"))
                        {

                        }
                        else
                        {
                            object generatorObject = Activator.CreateInstance(genaratorClass);
                            genaratorClass.InvokeMember("SetData", BindingFlags.InvokeMethod, null, generatorObject, setDataArgs);
                            genaratorClass.InvokeMember("Generate", BindingFlags.InvokeMethod, null, generatorObject, arguments);
                            doAddPage = true;
                        }
                    }
                }
            }
            isGenerated = true;           
        }
        catch (Exception ex)
        {
            isGenerated = false;
        }
        finally
        {
            if (doc != null) { try { doc.Close(); } catch (IOException ex) { } }
        }
        return isGenerated;
    }
    private string GetRandomFileName()
    {
        Random random = new Random();
        return random.Next(1, int.MaxValue).ToString() + ".pdf";
    }
    private bool AddWaterMark()
    {
        PdfReader reader = new PdfReader(filePath + fileName);

        string waterMarkedFileName = GetRandomFileName();

        using (FileStream fileStream = new FileStream(filePath + waterMarkedFileName,FileMode.Create))
        {
            PdfStamper pdfStamper = new PdfStamper(reader, fileStream);
            for (int i = 1; i <= reader.NumberOfPages; i++) // Must start at 1 because 0 is not an actual page.
            {
                //
                // If you ask for the page size with the method getPageSize(), you always get a
                // Rectangle object without rotation (rot. 0 degrees)—in other words, the paper size
                // without orientation. That’s fine if that’s what you’re expecting; but if you reuse
                // the page, you need to know its orientation. You can ask for it separately with
                // getPageRotation(), or you can use getPageSizeWithRotation(). - (Manning Java iText Book)
                //   
                //
                Rectangle pageSize = reader.GetPageSizeWithRotation(i);

                //
                // Gets the content ABOVE the PDF, Another option is GetUnderContent(...)  
                // which will place the text below the PDF content. 
                //
                PdfContentByte pdfPageContents = pdfStamper.GetUnderContent(i);
                pdfPageContents.BeginText(); // Start working with text.

                //
                // Create a font to work with 
                //
                BaseFont baseFont = BaseFont.CreateFont(BaseFont.HELVETICA_BOLD, Encoding.ASCII.EncodingName, false);
                pdfPageContents.SetFontAndSize(baseFont, 120); // 80 point font
                pdfPageContents.SetRGBColorFill(180, 180, 180); // Sets the color of the font, RED in this instance


                //
                // Angle of the text. This will give us the angle so we can angle the text diagonally 
                // from the bottom left corner to the top right corner through the use of simple trigonometry. 
                //
                float textAngle = GetHypotenuseAngleInDegreesFrom(pageSize.Height, pageSize.Width);

                //
                // Note: The x,y of the Pdf Matrix is from bottom left corner. 
                // This command tells iTextSharp to write the text at a certain location with a certain angle.
                // Again, this will angle the text from bottom left corner to top right corner and it will 
                // place the text in the middle of the page. 
                //
                pdfPageContents.ShowTextAligned(PdfContentByte.ALIGN_CENTER, "Trial Version",
                                        pageSize.Width / 2,
                                        pageSize.Height / 2,
                                        textAngle);

                pdfPageContents.EndText(); // Done working with text
            }
            pdfStamper.FormFlattening = true; // enable this if you want the PDF flattened. 
            
            pdfStamper.Close(); // Always close the stamper or you'll have a 0 byte stream. 
            fileStream.Close();
            File.Delete(filePath + fileName);
            fileName = waterMarkedFileName;
            //return memoryStream.ToArray();
        }
        return true;
    }
    private float GetHypotenuseAngleInDegreesFrom(double opposite, double adjacent)
	{
		double radians = Math.Atan2(opposite, adjacent); // Get Radians for Atan2
		double angle = radians*(180/Math.PI); // Change back to degrees
		return (float)angle;
	}

}
