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

/// <summary>
/// Summary description for WebConstants
/// </summary>
public static class WebConstants
{
    public static class Session
    {
        public static string USER_ID = "USER_ID";
        public static string USER_CO_ID = "USER_CO_ID";
        public static string DEPT_ID = "DEPT_ID";
        public static string USER_ROLE = "USER_ROLE";
        public static string COMPANY_NAME = "COMPANY_NAME";
        public static string HAS_AGREED = "HAS_AGREED";
        public static string REG_CO_ID = "REG_CO_ID";
        public static string REG_DEPT_ID = "REG_DEPT_ID";
        public static string REG_USER_ID = "REG_USER_ID";
        public static string WIZARD_STEP = "WIZARD_STEP";
        public static string REGISTERING_FOR_TRIAL = "REGISTERING_FOR_TRIAL";
        public static string SIMPLICITY_COMPANY_ID = "SIMPLICITY_COMPANY_ID";
        public static string SIMPLICITY_USER_ID = "SIMPLICITY_USER_ID";
        public static string RETURN_URL = "RETURN_URL";
    }

    public static class ToSplit
    {
        public static string ROOM_TAB_SPLIT = "_@";
    }

    public static class DocumentTypes
    {
        public static string RISK_ASSESSMENTS = "Risk Assessments";
        public static string COSHH_DOCUMENTS = "COSHH Documents";
    }
    public static class SectionTypes
    {
        public static string FREE_TEXT = "FREE_TEXT";
        public static string MULTIPLE_SELECT_LIST = "MULTIPLE_SELECT_LIST";
        public static string NOT_APPLICABLE = "NOT_APPLICABLE";
        private static Dictionary<string, ListItem[]> docTypeSections = GetDocTypeSections();
        private static Dictionary<string, ListItem[]> GetDocTypeSections()
        {
            Dictionary<string, ListItem[]> sections = new Dictionary<string, ListItem[]>();

            sections.Add(DocumentTypes.RISK_ASSESSMENTS,new ListItem[1]);
            sections[DocumentTypes.RISK_ASSESSMENTS][0] = new ListItem("Free Text",FREE_TEXT);

            sections.Add(DocumentTypes.COSHH_DOCUMENTS, new ListItem[2]);
            sections[DocumentTypes.COSHH_DOCUMENTS][0] = new ListItem("Free Text", FREE_TEXT);
            sections[DocumentTypes.COSHH_DOCUMENTS][1] = new ListItem("Multiple Select List", MULTIPLE_SELECT_LIST);

            return sections;
        }
        public static ListItem[] GetSections(string documentType)
        {
            if (docTypeSections.ContainsKey(documentType))
            {
                return docTypeSections[documentType];
            }
            ListItem[] listItems = new ListItem[1];
            listItems[0] = new ListItem("[-- N/A --]", NOT_APPLICABLE);
            return listItems;
        }
    }
    public static class DocumentTypeCategories
    {
        public static string COSHH = "COSHH";
        public static string METHOD_STATEMENT = "Method Statement";
        public static string SIGNAGE = "Signage";
    }
    public static class Default
    {
        public static string NOT_SET = "[Not Set]";
    }
    public static class Messages
    {
        public static class Information
        {
            public static string RECORD_SAVED = "Record(s) saved successfully.";
            //public static string RECORD_UPDATED = "Record(s) updated successfully.";
            public static string RECORD_DELETED = "Record(s) deleted successfully.";
            public static string ORDER_CANCELLED = "Order cancelled successfully.";
            public static string ORDER_UNCANCELLED = "Order Uncancelled successfully.";
        }
        public static class Error
        {
            public static string CANNOT_LOGIN = "Invalid User Name / Password";
            public static string SESSION_EXPIRED = "Session Expired. Please login again.";
            public static string INVALID_ID = "Select record is not present.";
            public static string ALREAD_EXISTS = "Record with this name already exists.";
            public static string CONNECTION_ERROR = "Connection error try again.";
            public static string NEXT_WARNING_ENTERRECORD = "Please enter a record to continue.";
            public static string NEXT_WARNING_COMPANYAUTOSAVE = "Autosave is not enabled for the company you belong to.";
            public static string SUPERVISOR_SELECTION_ERROR = "Only one supervisor is allowed for an order.";
            public static string SELECT_ATLEAST_ONE_DOCTYPE = "Atleast one Document Type must be selected.";
            public static string DOC_NOT_GENERATED = "Document could not be generated.";
            public static string NO_DEPT_DEFINED = "No department defined in the system. Atleast one department must be defined.";
            public static string NO_CATEGORY_DEFINED = "No category defined in the system. Atleast one category must be defined.";
            public static string INVALID_CACHE = "You have been logged out because you logged in from another machine";
            public static string PASSWORDS_DONOT_MATCH = "The passwords that you have entered do not match";
        }
    }
    public static class Request
    {
        public static string NEED_LOGIN = "NEED_LOGIN";
        public static string FROM_PAGE = "fromPage";
        public static string SESSION_EXPIRED = "sessionExpired";
        public static string DEPT_PERSON_ID = "deptPersonId";
        public static string ACTION = "action";
        public static string DEPT_ID = "depId";
        public static string CATEGORY_ID = "categoryId";
        public static string ERROR_MSG = "errorMsg";
        public static string INFO_MSG = "infoMsg";
        public static string PROPERTY_ORDER_ID = "propertyId";
        public static string Room_ID = "roomId";
        public static string DEPT_ORDER_ID = "deptOrderId";
        public static string NO_DEPT = "noDept";
        public static string NO_CATEGORY = "noCategory";
        public static string SEC_ID = "secId";
        public static string DOC_ID = "docId";
        public static string DOC_TYPE_ID = "docTypeId";
        public static string CO_ID = "coId";
        public static string USER_ID = "userId";
        public static string SCREEN_ID = "screenId";
        public static string DELETE = "delete";
        public static string INVALID_CACHE = "invalidCache";
        public static string ERROR = "error";
    }
    public static class RequestValues
    {
        public static string ACTION_EDIT = "edit";
        public static string ACTION_DELETE = "delete";
    }
    public static class Configuration
    {
        public static string PHYSICAL_PATH = "PhysicalPath";
        public static int CACHE_TIMEOUT = 10;
    }

    public static class Roles
    {
        public static string Admin = "Admin";
        public static string User = "User";
    }
}
