using System;


using iTextSharp.text;
using iTextSharp.text.pdf;
/// <summary>
/// Summary description for RiskAssessmentProcedureGenerator
/// </summary>
public class RiskAssessmentProcedureGenerator : GenericGenerator
{
	public RiskAssessmentProcedureGenerator()
	{
	}
    protected override void GenerateDocument(Document doc, DocumentType docType, string addSheet, PdfWriter writer)
    {
        Font boldFontSmall = FontFactory.GetFont("Arial", 9, Font.BOLD);
        Font boldFontLarge = FontFactory.GetFont("Arial", 10, Font.BOLD);
        Font normalFontSmall = FontFactory.GetFont("Arial", 9, Font.NORMAL);

        Paragraph paragraph = new Paragraph("Health and Safety  -  General Risk Assessment", FontFactory.GetFont("Arial", 14, Font.BOLD));
        paragraph.Alignment = Element.ALIGN_CENTER;
        paragraph.SpacingAfter = 5;
        doc.Add(paragraph);

        paragraph = new Paragraph();
        paragraph.Add(new Phrase("Legal Requirement : ", boldFontSmall));
        paragraph.Add(new Phrase("Regulation 3 (1)  of  The Management of Health and safety Regulations 1999  requires that :", normalFontSmall));
        doc.Add(paragraph);
        paragraph = new Paragraph("\"Every employer shall make a suitable and sufficient assessment of  - ", FontFactory.GetFont("Arial", 9, Font.ITALIC));
        paragraph.IndentationLeft = 20;
        paragraph.SpacingBefore = 10;
        doc.Add(paragraph);
        paragraph = new Paragraph("(a) the risks to the health and safety of his employees to which they are exposed whilst at work; and", FontFactory.GetFont("Arial", 9, Font.ITALIC));
        paragraph.IndentationLeft = 60;
        doc.Add(paragraph);
        paragraph = new Paragraph("(b) the risks to the health and safety of persons not in his employment arising out of, or in connection with, the conduct by him of his undertaking.", FontFactory.GetFont("Arial", 9, Font.ITALIC));
        paragraph.IndentationLeft = 60;
        doc.Add(paragraph);

        paragraph = new Paragraph("Risk Assessment procedure :", boldFontSmall);
        paragraph.SpacingAfter = 10;
        doc.Add(paragraph);

        paragraph = new Paragraph("Identify the area of assessment. List the tasks on the Summary sheet. Plan target dates for assessment.\n\nIs the task unique to this area or does it apply to all, or several, areas (generic) ?  Allocate generic tasks to nominated assessors to avoid duplication.", normalFontSmall);
        doc.Add(paragraph);
        paragraph = new Paragraph("For each task :", normalFontSmall);
        paragraph.SpacingBefore = 10;
        doc.Add(paragraph);

        paragraph = new Paragraph("Identify the Hazards. Identify the people at risk (groups, numbers, special needs)\n\nEstablish the existing control measures relating to each hazard. Obtain any supporting information, e.g. inspection sheets, test records, training records, other assessment records (Manual Handling, COSHH etc.), Safe Working Practices.\n\n" +
            "Decide, at this stage, whether a more detailed assessment needs to be done for a specific hazard, e.g. noise, COSHH, Manual Handling, and  record this as a recommendation.\n\n" +
            "Evaluate the risk ( from likelihood and severity, number of people exposed and control measures in place.)\n\n" +
            "Decide suitable control measures to remove or reduce risk ( use hierarchy). Discuss proposed control measures with the Supervisor, Safety Representative and employee to ensure they are practical and will control the hazard.\n\n" +
            "Make recommendations of additional control measures to further reduce risk. Provide sufficient detail with the recommendations to clearly indicate what is required, giving rough estimates of cost if possible.\n\n" +
            "Record each task assessment on a separate sheet; sign and date all records, keep on file, arrange date for review.", normalFontSmall);
        paragraph.IndentationLeft = 20;
        doc.Add(paragraph);

        paragraph = new Paragraph("Assessment Check Lists for Guidance", boldFontLarge);
        paragraph.SpacingBefore = 10; paragraph.SpacingAfter = 20;
        doc.Add(paragraph);

        PdfPTable table = new PdfPTable(4);

        float[] columnWidhts ={ 19, 17, 45, 19 };
        table.SetWidths(columnWidhts);
        table.WidthPercentage = 100;
        table.AddCell(new Phrase("Identify all tasks to be assessed", boldFontLarge));
        table.AddCell(new Phrase("Identify how task is done", boldFontLarge));
        table.AddCell(new Phrase("Health and Safety Hazards", boldFontLarge));
        table.AddCell(new Phrase("Control Measures", boldFontLarge));

        // Column - Identify all tasks to be assessed
        table.AddCell(new Phrase("Identify boundaries of area under assessment. Include any ‘off-site’ locations.\n\n" +
            "Agree with neighbouring assessor. Ensure no gaps.\n\n" +
            "List all tasks to be assessed. using unique logical reference number for each.\n\n" +
            "Break larger jobs down into manageable tasks.\n\n" +
            "Ensure all jobs are covered, e.g. those done twice a year, routine out of normal hours, if a machine fails, in an emergency  etc.\n\n" +
            "Include any cleaning (end of shift or ‘clean as you go’) tasks or any repair work carried out ;\n\n" +
            "who disposes of waste ?\n\n" +
            "Include any off-site work – driving, delivery, work on customer’s premises.\n\n" +
            "Re-check final list with Manager / Supervisor.", normalFontSmall));

        // Column - Identify how task is done
        table.AddCell(new Phrase("Involve employee(s) and Supervisor, question any differences. Is it a generic task ?\n\n" +
            "Progress logically through task, ask for demonstration.\n\n" +
            "Note details of machinery, tools, substances used. Is there a written Operating Procedure?\n\n" +
            "How many people carry out this task ?  How often is it done ?  How long does it last on each occasion. When is it done (normal hours, weekends, night, day, ‘rush hour’) ?\n\n" +
            "Are there any restrictions on operators ?  Skills / qualifications required ? Authorisation required ? Restrictions on when done, or for how long ?\n\n", normalFontSmall));

        // Coumn - Health and Safety Hazards 
        string[] heading ={ "Machinery - ", "Electricity - ", "Chemicals - ", "Handling - ", "Vehicles - ", "Working at height - ", "Confined Spaces - ", "Welding - ", "Public Places - ", "Underfoot Conditions - ", "Lighting - ", "Temperature - ", "Ventilation - ", "Noise - ", "Vulnerable persons - " };
        string[] content ={ "Moving parts, sharp edges, stored energy (movement after power disconnected)\n", "Electric shock, burns, fires, secondary accidents (through being startled – e.g. falls from ladders)\n",
            "Toxic, corrosive, harmful; flammable; skin or eye contact with chemical, inhaling vapour/dust, swallowing. (Has a COSHH assessment been carried out?)\n","Manually handling loads, stacking, loading, rapid repeated hand / arm movements. Have Manual Handling assessments been done ?\n",
            "Fork Lifts, cranes, mobile platforms.\n","falls, integrity of scaffolds / ladders, falling objects, windy/wet conditions.\n","toxic or suffocating gases, inrush of liquid or solid, temperature / humidity, availability of assistance, retrieving injured person.\n",
            "Fumes, burns, 'arc eye', fire, explosion.","Violence, distraction, interference with equipment,  dogs, disregard of signs.\n","Slippy or damaged floors, obstacles or protruding items, other trip hazards, e.g. trailing cables, edges of mats. Deep steps, steep slopes.\n",
            "Poorly lit areas, e.g. stairs, yards, stores. Poor  lighting maintenance/repair service, rapid changes in  lighting levels for truck drivers, bright lighting obscuring  vision.\n","Effects of temperature extremes.\n","preventing build up of fumes / gases, condensation.\n","do people have to communicate in raised voices ?  Are any machines / tools particularly noisy ? Have noise surveys been done ?\n","special needs catered for ?, e.g. pregnant women, young persons, disabled persons."};

        paragraph = new Paragraph();
        if (heading.Length == content.Length)
        {
            for (int i = 0; i < heading.Length; i++)
            {
                paragraph.Add(new Phrase(heading[i], boldFontSmall));
                paragraph.Add(new Phrase(content[i], normalFontSmall));
            }
            table.AddCell(paragraph);
        }

        // Column - Control Measures
        heading = new string[] { "Elimination - ", "Substitution - ", "Enclosure / Isolation / Extraction - ", "Personal Protection - ",
            "Training - ","Other considerations : "};
        content = new string[] {"does the task have to be done? Can it be contracted out?\n","can a safermethod / substance beused ?\n",
                "can hazard be screened off, guard / trip / alarm fitted ? Can persons be separated from hazard or reduce duration exposure ? (job rotation). Is extraction or flushing required to remove harmful agents ?\n",
            "always as a last resort. What type is needed ? What grade is needed ? Assess with advice from suppliers.\n",
            "is special training required. Do signs need to be posted?\n","Welfare facilities, First Aid facilitiesEmergency Procedures\n"};

        paragraph = new Paragraph();
        if (heading.Length == content.Length)
        {
            for (int i = 0; i < heading.Length; i++)
            {
                paragraph.Add(new Phrase(heading[i], boldFontSmall));
                paragraph.Add(new Phrase(content[i], normalFontSmall));
            }
            paragraph.Add(new Phrase("Is a more detailed assessment required ? e.g. COSHH, Noise", boldFontSmall));
            table.AddCell(paragraph);
        }


        table.DefaultCell.HorizontalAlignment = Element.ALIGN_CENTER;
        table.DefaultCell.Colspan = 4;
        table.DefaultCell.Border = Rectangle.NO_BORDER;
        table.AddCell(new Phrase("The above check lists are not exhaustive and should only be used as a guide", FontFactory.GetFont("Arial", 9, Font.ITALIC)));
        table.SplitLate = false;
        doc.Add(table);

        // Add another table named Risk Rating
        PdfPTable tableRiskRating = new PdfPTable(8);
        tableRiskRating.SpacingBefore = 10;
        columnWidhts = new float[] { 5, 20, 5, 20, 5, 20, 5, 20 };
        tableRiskRating.SetWidths(columnWidhts);
        tableRiskRating.WidthPercentage = 100;
        tableRiskRating.DefaultCell.Border = Rectangle.NO_BORDER;

        tableRiskRating.DefaultCell.Colspan = 8;
        tableRiskRating.AddCell(new Phrase("Risk Rating  Procedure", boldFontLarge));

        tableRiskRating.DefaultCell.Colspan = 4;
        tableRiskRating.DefaultCell.HorizontalAlignment = Element.ALIGN_CENTER;
        tableRiskRating.AddCell(new Phrase("Likelihood of Incident Occurring (L)", boldFontSmall));
        tableRiskRating.AddCell(new Phrase("Severity of Incident (S)", boldFontSmall));

        tableRiskRating.DefaultCell.Colspan = 2;
        string[] columnHeadings ={ "Likelihood", "Example Timescale", "Severity", "Example Injury" };
        for (int i = 0; i < columnHeadings.Length; i++)
        {
            tableRiskRating.AddCell(new Phrase(columnHeadings[i], FontFactory.GetFont("Arial", 9, Font.UNDERLINE)));
        }

        tableRiskRating.DefaultCell.HorizontalAlignment = Element.ALIGN_LEFT;

        tableRiskRating.DefaultCell.Colspan = 1;
        string[] colLikelihood ={ "Inevitable", "Almost Certain", "Very probable", "Probable", "More than even chance", "Even chance", "Less than even chance", "Improbable", "Very improbable", "Almost impossible" };
        string[] colTimescale ={ "Every shift", "Once a week", "Twice a month", "Once a month", "Once a quarter", "Twice a year", "Once a year", "Once in two years", "Once in five years", "Once in ten years" };
        string[] colSeverity ={ "Multiple Fatalities", "Permanent / total\nincapacity / fatality", "Permanent, severe incapacity", "Permanent slight incapacity", "Off work for more than 3 weeks with subsequent recurring incapacity", "Off work for more than 3 weeks with subsequent complete recovery", "Off work more than 3 days, less than 3 weeks with subsequent complete recovery", "Off work for less than 3 days with complete recovery", "Minor injury, no lost time", "No significant injury" };
        string[] colInjury ={ "Fatalities", "Brain damage/ total disability/death", "Loss of limb or eye / part disability", "Permanent limp/ back injury", "Limp / repetitive strain injuries","Broken bone / trap injuries / respiratory problems",
            "Head injury / concussion / sprains / pulled muscles / serious burns / dermatitis / eye contamination",
            "Minor burns / stitches needed / exposure to fumes / foreign bodies in eyes / skin irritation","Bruise / small cut / blister grazes / bump","Very minor cut / graze, shaken"};
        if ((colLikelihood.Length == colTimescale.Length) &&
            (colLikelihood.Length == colSeverity.Length) &&
            (colLikelihood.Length == colInjury.Length))
        {
            for (int i = 0; i < colLikelihood.Length; i++)
            {
                tableRiskRating.AddCell(new Phrase(Convert.ToString(colLikelihood.Length - i), normalFontSmall));
                tableRiskRating.AddCell(new Phrase(colLikelihood[i], normalFontSmall));
                tableRiskRating.AddCell(new Phrase(Convert.ToString(colLikelihood.Length - i), normalFontSmall));
                tableRiskRating.AddCell(new Phrase(colTimescale[i], normalFontSmall));
                tableRiskRating.AddCell(new Phrase(Convert.ToString(colLikelihood.Length - i), normalFontSmall));
                tableRiskRating.AddCell(new Phrase(colSeverity[i], normalFontSmall));
                tableRiskRating.AddCell(new Phrase(Convert.ToString(colLikelihood.Length - i), normalFontSmall));
                tableRiskRating.AddCell(new Phrase(colInjury[i], normalFontSmall));
            }

        }
        tableRiskRating.DefaultCell.Colspan = 8;
        tableRiskRating.AddCell(new Phrase("Population at Risk (at any one time) Weighting :", boldFontSmall));

        paragraph = new Paragraph();
        paragraph.Add(new Phrase("(add weighting to Severity Rating)        ", normalFontSmall));
        paragraph.Add(new Phrase("1 – 5 people ", normalFontSmall));
        paragraph.Add(new Phrase("1.0,", boldFontSmall));
        paragraph.Add(new Phrase(" 6-10 people ", normalFontSmall));
        paragraph.Add(new Phrase("1.25, ", boldFontSmall));
        paragraph.Add(new Phrase(" 11-20 people ", normalFontSmall));
        paragraph.Add(new Phrase("1.5, ", boldFontSmall));
        paragraph.Add(new Phrase(" 21-50 people ", normalFontSmall));
        paragraph.Add(new Phrase("1.75, ", boldFontSmall));
        paragraph.Add(new Phrase(" >51 people ", normalFontSmall));
        paragraph.Add(new Phrase("2.0 ", boldFontSmall));
        tableRiskRating.AddCell(paragraph);

        doc.Add(tableRiskRating);

        paragraph = new Paragraph("Risk Assessment Rating Procedure - Level Calculation Matrix", boldFontLarge);
        paragraph.Alignment = Element.ALIGN_CENTER;
        paragraph.SpacingBefore = 10;
        doc.Add(paragraph);
        string rootPath = System.Configuration.ConfigurationManager.AppSettings[WebConstants.Configuration.PHYSICAL_PATH];
        Image chart = Image.GetInstance(Image.GetInstance(rootPath + @"\Images\chart.bmp"));
        chart.ScaleToFit(700, 450);
        chart.Alignment = Element.ALIGN_CENTER;
        doc.Add(chart);
        paragraph = new Paragraph("Plot value of Severity + Population  from assessment against value of Likelihood from assessment.\nThe point of intersection of these two values gives the Risk Level.", normalFontSmall);
        paragraph.SpacingBefore = 20;
        paragraph.IndentationLeft = 30;
        doc.Add(paragraph);
        if (Convert.ToBoolean(addSheet))
        {
            Font blankFont = FontFactory.GetFont("Arial", 7, Color.WHITE);
            doc.NewPage();
            doc.Add(new Paragraph("[Blank Page]", blankFont));
        }

    }
    protected override void SetDocumentData(DocumentType docType)
    {
        //Static page, no data to set. 
    }

}
