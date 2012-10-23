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
using System.Collections;

using iTextSharp.text;
using iTextSharp.text.pdf;

/// <summary>
/// Summary description for MethodStatementGenerator
/// </summary>
public class MethodStatementGenerator : GenericGenerator
{
    string employer;
    string site;
    string durationOfWork;
    string numOfOperatives;
    string supervisor;
    string firstAider;
    string fireWardens;
    string smsRefNo;
    string dateReview;
    string dateCreated;
    string register;
    string descOfWorks;
    string keyHazards;
    string seqOfWorks;
    string plantAndEquipment;
    string ppe;
    string riskAssessments;
    string emergencyProcs;
    string clientRequirements;
    string keyAspects;
    string notes;
    string riskTaking;
    bool abestosRegister;


	public MethodStatementGenerator()
	{
        employer = "";
        site = "";
        durationOfWork = "";
        numOfOperatives = "";
        supervisor = "";
        firstAider = "";
        fireWardens = "";
        smsRefNo = "";
        dateReview = "";
        dateCreated = "";
        register = "";
        descOfWorks = "";
        keyHazards = "";
        seqOfWorks = "";
        plantAndEquipment = "";
        ppe = "";
        riskAssessments = "";
        emergencyProcs = "";
        clientRequirements = "";
        keyAspects = "";
        notes = "";
        riskTaking = "";
        abestosRegister = false;
    }
    protected override void SetDocumentData(DocumentType docType)
    {
        Department.DepartmentSelectCommandRow department = DatabaseUtility.GetDepartment(docType.DeptId);
        DepartmentOrder.DepartmentOrderRowRow departmentOrder = DatabaseUtility.GetDepartmentOrder(docType.DeptOrderId);
        if(department != null && departmentOrder != null)
        {
            employer = department.co_name_long;
            if (departmentOrder.Isaddress_fullNull() == false) site = departmentOrder.address_full;
            if (departmentOrder.Isorder_est_of_worksNull() == false) durationOfWork = departmentOrder.order_est_of_works.ToString();
            smsRefNo = departmentOrder.order_sms;
            if (departmentOrder.Isdate_order_reviewNull() == false) dateReview = departmentOrder.date_order_review.ToShortDateString();
            if (departmentOrder.Isdate_createdNull() == false) dateCreated = departmentOrder.date_created.ToShortDateString();
            if (departmentOrder.Isflg_asbestos_registerNull() == false)
                register = (departmentOrder.flg_asbestos_register) ? "Yes" : "No";
            else
                register = "No";
            if(departmentOrder.Isdesc_of_workNull() == false) descOfWorks = departmentOrder.desc_of_work;
            if (departmentOrder.Isorder_descNull() == false) notes = departmentOrder.order_desc;
            if (departmentOrder.Isest_num_of_operativesNull() == false) numOfOperatives = departmentOrder.est_num_of_operatives.ToString();
            if (departmentOrder.Isrisk_takingNull() == false) riskTaking = departmentOrder.risk_taking;
            if (departmentOrder.Isflg_asbestos_registerNull() == false) abestosRegister = departmentOrder.flg_asbestos_register;
            SetRiskAssessments();
            SetPersonData(docType);
            SetKeyHazards(docType);
            SetSeqOfWorks(docType);
            SetPlantAndEquipment(docType);
            SetPPE(docType);           
            SetEmeregencyProcs(docType);
            SetClientRequirements(docType);
            SetKeyAspects(docType);
        }
    }
    private void SetRiskAssessments()
    {
        DocumentType raDocType = GetDocumentType("Risk Assessments");
        if (raDocType != null)
        {
            foreach (string docName in raDocType.DocList.Values)
            {
                riskAssessments += docName + "\n";
            }
            riskAssessments = riskAssessments.Substring(0, riskAssessments.Length - 1);
        }        
    }
    private void SetKeyAspects(DocumentType docType)
    {
        int count = 1;
        DepartmentOrderDetailTableAdapters.DepartmentOrderKeyAspectsTableAdapter ta = new DepartmentOrderDetailTableAdapters.DepartmentOrderKeyAspectsTableAdapter();
        IEnumerator ie = ta.GetAllKeyAspects(docType.DeptId, docType.CoId, docType.DeptOrderId).GetEnumerator();
        while (ie.MoveNext())
        {
            DepartmentOrderDetail.DepartmentOrderKeyAspectsRow dr = (DepartmentOrderDetail.DepartmentOrderKeyAspectsRow)ie.Current;
            if (count > 1)
            {
                keyAspects += "\n";
            }
            keyAspects += count.ToString("00") + ".   " + dr.key_aspect_header;
            count++;
        }
    }

    private void SetClientRequirements(DocumentType docType)
    {
        int count = 1;
        DepartmentOrderDetailTableAdapters.DepartmentOrderRequirementTableAdapter ta = new DepartmentOrderDetailTableAdapters.DepartmentOrderRequirementTableAdapter();
        IEnumerator ie = ta.GetAllRequirements(docType.DeptId, docType.CoId, docType.DeptOrderId).GetEnumerator();
        while (ie.MoveNext())
        {
            DepartmentOrderDetail.DepartmentOrderRequirementRow dr = (DepartmentOrderDetail.DepartmentOrderRequirementRow)ie.Current;
            if (count > 1)
            {
                clientRequirements += "\n";
            }
            clientRequirements += count.ToString("00") + ".   " + dr.requirement_header;
            count++;
        }
    }
    private void SetEmeregencyProcs(DocumentType docType)
    {
        int count = 1;
        DepartmentOrderDetailTableAdapters.DepartmentOrderEmergencyExitTableAdapter ta = new DepartmentOrderDetailTableAdapters.DepartmentOrderEmergencyExitTableAdapter();
        IEnumerator ie = ta.GetAllEmergencyExits(docType.DeptId, docType.CoId, docType.DeptOrderId).GetEnumerator();
        while (ie.MoveNext())
        {           
            DepartmentOrderDetail.DepartmentOrderEmergencyExitRow dr = (DepartmentOrderDetail.DepartmentOrderEmergencyExitRow) ie.Current;
            if (count > 1)
            {
                emergencyProcs += "\n";
            }
            emergencyProcs += count.ToString("00") + ".   " + dr.emer_exit_title;
            count++;
        }
    }

    private void SetPPE(DocumentType docType)
    {
        int count = 1;
        DepartmentOrderDetailTableAdapters.DepartmentOrderPPETableAdapter ta = new DepartmentOrderDetailTableAdapters.DepartmentOrderPPETableAdapter();
        IEnumerator ie = ta.GetAllPPE(docType.DeptId, docType.CoId, docType.DeptOrderId).GetEnumerator();
        while (ie.MoveNext())
        {
            DepartmentOrderDetail.DepartmentOrderPPERow dr = (DepartmentOrderDetail.DepartmentOrderPPERow)ie.Current;
            if (count > 1)
            {
                ppe += "\n";
            }
            ppe += count.ToString("00") + ".   " + dr.ppe_desc;
            count++;
        }
    }
    private void SetPlantAndEquipment(DocumentType docType)
    {
        int count = 1;
        DepartmentOrderDetailTableAdapters.DepartmentOrderToolTableAdapter ta = new DepartmentOrderDetailTableAdapters.DepartmentOrderToolTableAdapter();
        IEnumerator ie = ta.GetAllDepartmentTool(docType.DeptId, docType.CoId, docType.DeptOrderId).GetEnumerator();
        while (ie.MoveNext())
        {
            DepartmentOrderDetail.DepartmentOrderToolRow dr = (DepartmentOrderDetail.DepartmentOrderToolRow)ie.Current;
            if (count > 1)
            {
                plantAndEquipment += "\n";
            }
            plantAndEquipment += count.ToString("00") + ".   " + dr.tool_desc;
            count++;
        }        
    }
    private void SetKeyHazards(DocumentType docType)
    {
        int count = 1;
        DepartmentOrderDetailTableAdapters.DepartmentOrderHazardTableAdapter ta = new DepartmentOrderDetailTableAdapters.DepartmentOrderHazardTableAdapter();
        IEnumerator ie = ta.GetAllHazards(docType.DeptId, docType.CoId, docType.DeptOrderId).GetEnumerator();
        while (ie.MoveNext())
        {
            DepartmentOrderDetail.DepartmentOrderHazardRow dr = (DepartmentOrderDetail.DepartmentOrderHazardRow)ie.Current;
            if (count > 1)
            {
                keyHazards += "\n";
            }
            keyHazards += count.ToString("00") + ".   " + dr.hazard_desc;
            count++;
        }
    }

    private void SetSeqOfWorks(DocumentType docType)
    {
        int count = 1;
        DepartmentOrderDetailTableAdapters.DepartmentOrderWorkTableAdapter ta = new DepartmentOrderDetailTableAdapters.DepartmentOrderWorkTableAdapter();
        IEnumerator ie = ta.GetAllWorks(docType.DeptId, docType.CoId, docType.DeptOrderId).GetEnumerator();
        while (ie.MoveNext())
        {
            DepartmentOrderDetail.DepartmentOrderWorkRow dr = (DepartmentOrderDetail.DepartmentOrderWorkRow)ie.Current;
            if (count > 1)
            {
                seqOfWorks += "\n";
            }
            seqOfWorks += count.ToString("00") + ".   " + dr.work_desc;
            count++;
        }
    }

    private void SetPersonData(DocumentType docType)
    {
        DepartmentOrderPersonTableAdapters.DepartmentOrderPersonEntityTableAdapter orderPersonTA = new DepartmentOrderPersonTableAdapters.DepartmentOrderPersonEntityTableAdapter();
        IEnumerator iEnum = orderPersonTA.GetAllOrderPersonsByOrderId(docType.DeptId, docType.CoId, docType.DeptOrderId).GetEnumerator();            
        while (iEnum.MoveNext())
        {
            DepartmentOrderPerson.DepartmentOrderPersonEntityRow dataRow = (DepartmentOrderPerson.DepartmentOrderPersonEntityRow)iEnum.Current;
            if (dataRow.Issuperrvisor_checkNull() == false && dataRow.superrvisor_check == 1)
            {
                //there can only be one supervisor 
                supervisor = dataRow.name_desc;
            }
            if (dataRow.Isfirstaiderr_checkNull() == false && dataRow.firstaiderr_check == 1)
            {
                firstAider += dataRow.name_desc + ",";
            }
            if (dataRow.Isfirewardenn_checkNull() == false && dataRow.firewardenn_check == 1)
            {
                fireWardens += dataRow.name_desc + ",";
            }
        }
    }

    protected override void GenerateDocument(Document doc, DocumentType docType, string addSheet, PdfWriter writer)
    {
        Font normalFontSmall = FontFactory.GetFont("Arial", 9);
        Font boldFontSmall = FontFactory.GetFont("Arial", 10, Font.BOLD);
        Font boldUnderlineFontSmall = FontFactory.GetFont("Arial", 10, Font.BOLD | Font.UNDERLINE);



        // Create a table with 3 columns
        PdfPTable table = new PdfPTable(2);
        table.WidthPercentage = 100;

        table.DefaultCell.Colspan = 2;
        table.DefaultCell.Border = Rectangle.NO_BORDER;
        table.DefaultCell.FixedHeight = 40.0f;
        table.DefaultCell.HorizontalAlignment = Element.ALIGN_CENTER;
        table.AddCell(new Phrase("Safety Method Statement", FontFactory.GetFont("Times New Roman", 20, Font.BOLD)));

        table.DefaultCell.Colspan = 1;
        table.DefaultCell.FixedHeight = 20.0f;
        table.DefaultCell.Border = Rectangle.BOX;
        table.DefaultCell.HorizontalAlignment = Element.ALIGN_LEFT;
        table.AddCell(new Phrase("Employer: " +  employer, boldUnderlineFontSmall));
        table.AddCell(new Phrase("Site: " + site, boldUnderlineFontSmall));

        PdfPCell cell = new PdfPCell();

        cell.AddElement(new Paragraph("Estimated duration of works (in days): " + durationOfWork, boldFontSmall));
        cell.AddElement(new Paragraph("Estimated Number of operatives involved: " + numOfOperatives, boldFontSmall));
        cell.AddElement(new Paragraph("Site Supervisor: " + supervisor, boldFontSmall));
        cell.AddElement(new Paragraph("First Aider: " + firstAider, boldFontSmall));
        cell.AddElement(new Paragraph("Fire Wardens: " + fireWardens, boldFontSmall));
        table.AddCell(cell);


        cell = new PdfPCell();
        cell.AddElement(new Paragraph("SMS Ref No: " + smsRefNo, boldFontSmall));
        cell.AddElement(new Paragraph("Formal Review Date: " + dateReview, boldFontSmall));
        cell.AddElement(new Paragraph("Date Created: " + dateCreated, boldFontSmall));
        Phrase abestosRegisterPhrase = new Phrase();
        abestosRegisterPhrase.Add(new Chunk("Client provided a copy of asbestos register: ",boldFontSmall));
        if(abestosRegister == true)
        {
            abestosRegisterPhrase.Add(new Chunk(AddCheckedCheckBox(),0,0));
        }
        else
        {
            abestosRegisterPhrase.Add(new Chunk(AddCheckBox(),0,0));
        }
        cell.AddElement(abestosRegisterPhrase);
        cell.AddElement(new Paragraph("Risk Rating: " + riskTaking, boldFontSmall));
        table.AddCell(cell);
        table.SpacingAfter = 10;
        doc.Add(table);

        PdfPTable tableDesc = new PdfPTable(4);
        tableDesc.WidthPercentage = 100;
        tableDesc.DefaultCell.Colspan = 4;

        tableDesc.AddCell(new Phrase("Brief description of works", boldFontSmall));
        tableDesc.DefaultCell.FixedHeight = 40f;
        AddOverflowText(doc, tableDesc, descOfWorks, "Brief description of works", 1);

        tableDesc.DefaultCell.Colspan = 4;
        tableDesc.DefaultCell.FixedHeight = 0.0f;
        tableDesc.AddCell(new Phrase("Key Hazards", boldFontSmall));
        tableDesc.DefaultCell.FixedHeight = 110f;
        AddOverflowText(doc, tableDesc, keyHazards, "Key Hazards", 1);
        tableDesc.DefaultCell.FixedHeight = 0.0f;
        tableDesc.AddCell(new Phrase("Sequence of works", boldFontSmall));
        tableDesc.DefaultCell.FixedHeight = 100f;
        AddOverflowText(doc, tableDesc, seqOfWorks, "Sequence of Works", 1);

        tableDesc.DefaultCell.Colspan = 2;
        tableDesc.DefaultCell.FixedHeight = 0.0f;
        tableDesc.AddCell(new Phrase("Plant & Equipment", boldFontSmall));
        tableDesc.AddCell(new Phrase("PPE Requirements", boldFontSmall));
        tableDesc.DefaultCell.Colspan = 1;
        tableDesc.DefaultCell.FixedHeight = 105f;
        AddOverflowText(doc, tableDesc, plantAndEquipment, "Plant & Equipment", 2);
        AddOverflowText(doc, tableDesc, ppe, "PPE Requirements", 2);

        tableDesc.DefaultCell.Colspan = 2;
        tableDesc.DefaultCell.FixedHeight = 0.0f;
        tableDesc.AddCell(new Phrase("Related Risk Assessments", boldFontSmall));
        tableDesc.AddCell(new Phrase("Emergency Procedures", boldFontSmall));
        tableDesc.DefaultCell.FixedHeight = 160f;
        tableDesc.DefaultCell.Colspan = 1;
        AddOverflowText(doc, tableDesc, riskAssessments, "Risk Assessments", 2);
        tableDesc.DefaultCell.Colspan = 2;
        AddOverflowText(doc, tableDesc, emergencyProcs, "Emergency Procedures", 1);

        doc.Add(tableDesc);
        doc.NewPage();

        tableDesc = new PdfPTable(1);
        tableDesc.DefaultCell.Colspan = 1;
        tableDesc.DefaultCell.FixedHeight = 0.0f;
        tableDesc.AddCell(new Phrase("Site/Client Specific Requirements", boldFontSmall));
        tableDesc.DefaultCell.FixedHeight = 60f;
        AddOverflowText(doc, tableDesc, clientRequirements, "Site/Client Specific Requirements", 1);

        tableDesc.DefaultCell.FixedHeight = 0.0f;
        tableDesc.AddCell(new Phrase("Key Aspects of Induction", boldFontSmall));
        AddOverflowText(doc, tableDesc, keyAspects, "Key Aspects of Induction", 1);
        tableDesc.DefaultCell.FixedHeight = 0.0f;
        tableDesc.WidthPercentage = 100;
        table.DefaultCell.Colspan = 1;
        table.DefaultCell.Border = Rectangle.NO_BORDER;
        tableDesc.AddCell(new Phrase("Additional Notes", boldFontSmall));
        tableDesc.DefaultCell.FixedHeight = 220f;
        tableDesc.AddCell(new Phrase(notes, normalFontSmall));
        tableDesc.DefaultCell.Border = Rectangle.NO_BORDER;
        tableDesc.DefaultCell.FixedHeight = 10f;
        tableDesc.AddCell("");
        doc.Add(tableDesc);
        PdfPTable tableSigning = new PdfPTable(3);
        tableSigning.WidthPercentage = 100;
        tableSigning.DefaultCell.Colspan = 3;
        tableSigning.AddCell(new Phrase("By Signing Below You Have Read & Understood The Above Points", boldFontSmall));
        tableSigning.DefaultCell.Colspan = 1;
        tableSigning.AddCell(new Phrase("Name", normalFontSmall));
        tableSigning.AddCell(new Phrase("Signature", normalFontSmall));
        tableSigning.AddCell(new Phrase("Date", normalFontSmall));
        tableSigning.DefaultCell.FixedHeight = 20f;
        for (int i = 0; i < 13; i++)
        {
            tableSigning.AddCell("");
            tableSigning.AddCell("");
            tableSigning.AddCell("");
        }
        tableSigning.DefaultCell.Border = Rectangle.NO_BORDER;
        tableSigning.DefaultCell.Colspan = 3;
        tableSigning.AddCell("");
        tableSigning.DefaultCell.Border = Rectangle.BOX;
        tableSigning.DefaultCell.Colspan = 1;
        tableSigning.AddCell(new Phrase("Author Name", boldFontSmall));
        tableSigning.AddCell(new Phrase("Author Signature", boldFontSmall));
        tableSigning.AddCell(new Phrase("Date", boldFontSmall));
        tableSigning.DefaultCell.FixedHeight = 20f;
        tableSigning.AddCell("");
        tableSigning.AddCell("");
        tableSigning.AddCell("");
        doc.Add(tableSigning);

        bool continuationsheetadded = PrintOverFlowTable(doc);
        if (Convert.ToBoolean(addSheet) && continuationsheetadded)
        {
            Font blankFont = FontFactory.GetFont("Arial", 7, Color.WHITE);
            doc.NewPage();
            doc.Add(new Paragraph("[Blank Page]", blankFont));
        }
    }
}
