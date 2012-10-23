using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Collections;

/// <summary>
/// Summary description for DatabaseUtility
/// </summary>
public static class DatabaseUtility
{

    public static DocumentTemplate.DocumentSectionEntityRow GetSection(int coId,int deptId, int secId)
    {
        DocumentTemplateTableAdapters.DocumentSectionTableAdapter ta = new DocumentTemplateTableAdapters.DocumentSectionTableAdapter();
        IEnumerator ie = ta.GetById(coId,deptId,secId).GetEnumerator();
        if(ie.MoveNext())
        {
            return (DocumentTemplate.DocumentSectionEntityRow)ie.Current;
        }
        return null;
    }
    
    public static Company.un_co_detailsRow GetCompany(int coId)
    {
        Company.un_co_detailsRow dataRow = null;
        CompanyTableAdapters.un_co_detailsTableAdapter tableAdapter = new CompanyTableAdapters.un_co_detailsTableAdapter();
        IEnumerator iEnumerator = tableAdapter.GetCompanyById(coId).GetEnumerator();
        if (iEnumerator.MoveNext())
        {
            dataRow = (Company.un_co_detailsRow)iEnumerator.Current;
        }
        return dataRow;
    }

    public static DepartmentOrder.DepartmentOrderRowRow GetDepartmentOrder(int deptOrderId)
    {
        DepartmentOrder.DepartmentOrderRowRow dataRow = null;
        DepartmentOrderTableAdapters.DepartmentOrderRowTableAdapter da = new DepartmentOrderTableAdapters.DepartmentOrderRowTableAdapter();
        IEnumerator iEnumerator = da.GetDepartmentOrderById(deptOrderId).GetEnumerator();
        if (iEnumerator.MoveNext())
        {
            dataRow = (DepartmentOrder.DepartmentOrderRowRow)iEnumerator.Current;
        }
        return dataRow;
    }

    public static Department.DepartmentSelectCommandRow GetDepartment(int deptId)
    {
        Department.DepartmentSelectCommandRow dataRow = null;
        DepartmentTableAdapters.DepartmentSelectCommandTableAdapter da = new DepartmentTableAdapters.DepartmentSelectCommandTableAdapter();
        IEnumerator iEnumerator = da.GetDepartmentByDeptId(deptId).GetEnumerator();
        if (iEnumerator.MoveNext())
        {
            dataRow = (Department.DepartmentSelectCommandRow)iEnumerator.Current;
        }
        return dataRow;
    }
    
    public static DepartmentOrderDoc.DocumentEntityRow GetDocument(int docId)
    {
        DepartmentOrderDoc.DocumentEntityRow dataRow = null;
        DepartmentOrderDocTableAdapters.DocumentTableAdapter da = new DepartmentOrderDocTableAdapters.DocumentTableAdapter();
        IEnumerator iEnumerator = da.GetDocById(docId).GetEnumerator();
        if (iEnumerator.MoveNext())
        {
            dataRow = (DepartmentOrderDoc.DocumentEntityRow)iEnumerator.Current;
        }
        return dataRow;
    }

    public static DepartmentOrderDoc.DocumentTypeEntityRow GetDocumentType(int coId,int deptId,int docTypeId)
    {
        DepartmentOrderDoc.DocumentTypeEntityRow docType = null;
        DepartmentOrderDocTableAdapters.DocumentTypeTableAdapter ta = new DepartmentOrderDocTableAdapters.DocumentTypeTableAdapter();
        IEnumerator ie = ta.GetDocTypeById(deptId, coId, docTypeId).GetEnumerator();
        if (ie.MoveNext())
        {
            docType = (DepartmentOrderDoc.DocumentTypeEntityRow)ie.Current;
        }
        return docType;
    }
    public static DepartmentOrderDoc.DocumentTypeEntityRow GetDocumentType(int coId, int deptId, string docTypeName)
    {
        DepartmentOrderDoc.DocumentTypeEntityRow docType = null;
        DepartmentOrderDocTableAdapters.DocumentTypeTableAdapter ta = new DepartmentOrderDocTableAdapters.DocumentTypeTableAdapter();
        IEnumerator ie = ta.GetDocumentTypeByName(deptId, coId, docTypeName).GetEnumerator();
        if (ie.MoveNext())
        {
            docType = (DepartmentOrderDoc.DocumentTypeEntityRow)ie.Current;
        }
        return docType;
    }

    public static Screens.ScreenEntityRow GetScreen(int screenId)
    {
        ScreensTableAdapters.ScreenTableAdapter screenTA = new ScreensTableAdapters.ScreenTableAdapter();
        Screens.ScreenEntityRow screen = null;
        IEnumerator iEnum = screenTA.GetScreenById(screenId).GetEnumerator();
        if (iEnum.MoveNext())
        {
            screen = (Screens.ScreenEntityRow)iEnum.Current;
        }
        return screen;
    }

    public static Categories.CategoryEntityRow GetCategory(int coId, int deptId, string categoryType, string categoryName)
    {
        CategoriesTableAdapters.CategoryTableAdapter ta = new CategoriesTableAdapters.CategoryTableAdapter();
        IEnumerator ie = ta.GetCategoryByName(deptId, coId, categoryType, categoryName, null).GetEnumerator();
        if (ie.MoveNext())
        {
            return (Categories.CategoryEntityRow)ie.Current;
        }
        return null;
    }

    public static Categories.CategoryEntityRow GetCategory(int categoryId)
    {
        CategoriesTableAdapters.CategoryTableAdapter ta = new CategoriesTableAdapters.CategoryTableAdapter();
        IEnumerator ie = ta.GetCategoryById(categoryId).GetEnumerator();
        if (ie.MoveNext())
        {
            return (Categories.CategoryEntityRow)ie.Current;
        }
        return null;
    }

    public static DocumentTemplate.DocumentSectionEntityRow GetSection(int coId, int deptId, string sectionName)
    {
        DocumentTemplate.DocumentSectionEntityRow section = null;
        DocumentTemplateTableAdapters.DocumentSectionTableAdapter sectionTA = new DocumentTemplateTableAdapters.DocumentSectionTableAdapter();
        IEnumerator ie = sectionTA.GetSectionByName(coId, deptId, sectionName).GetEnumerator();
        if (ie.MoveNext())
        {
            section = (DocumentTemplate.DocumentSectionEntityRow)ie.Current;
        }
        return section;
    }

    public static DocumentTemplate.DocumentSectionDetailsEntityRow GetSectionDetail(int coId, int deptId,int sectionId, string sectionDetailName)
    {
        DocumentTemplate.DocumentSectionDetailsEntityRow sectionDetail = null;
        DocumentTemplateTableAdapters.DocumentSectionDetailsTableAdapter sectionDetailsTA = new DocumentTemplateTableAdapters.DocumentSectionDetailsTableAdapter();
        IEnumerator ie = sectionDetailsTA.GetSectionDetailByName(coId, deptId, sectionId, sectionDetailName).GetEnumerator();
        if (ie.MoveNext())
        {
            sectionDetail = (DocumentTemplate.DocumentSectionDetailsEntityRow)ie.Current;
        }
        return sectionDetail;
    }

    public static DepartmentOrderDoc.DocumentEntityRow GetDocument(int coId, int deptId, int docTypeId, string docName)
    {
        DepartmentOrderDoc.DocumentEntityRow document = null;
        DepartmentOrderDocTableAdapters.DocumentTableAdapter ta = new DepartmentOrderDocTableAdapters.DocumentTableAdapter();
        IEnumerator ie = ta.GetDocumentByName(coId, deptId, docTypeId, docName).GetEnumerator();
        if (ie.MoveNext())
        {
            document = (DepartmentOrderDoc.DocumentEntityRow)ie.Current;
        }
        return document;
    }

}
