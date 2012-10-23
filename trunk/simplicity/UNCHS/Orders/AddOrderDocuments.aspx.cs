using System;   
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Collections.Generic;

using eWorld.UI;
public partial class Orders_AddOrderDocuments : RoomDetailPage
{
    public override void Order_Detail_Handling(object sender, EventArgs e, int deptId)
    {
        if (Request[WebConstants.Request.DEPT_ORDER_ID] != null)
        {
            if (IsPostBack == false)
            {
                DepartmentOrder.DepartmentOrderRowRow order = DatabaseUtility.GetDepartmentOrder(int.Parse(Request[WebConstants.Request.DEPT_ORDER_ID]));
                if (order != null)
                {

                    if (!order.Isdate_sent_to_clientNull())
                    {
                        dtClient.Text = order.date_sent_to_client.ToShortDateString();
                    }
                    else
                    {
                        dtClient.Text = DateTime.Now.ToShortDateString();
                    }
                    if (!order.Isflg_asbestos_registerNull())
                    {
                        cbRegister.Checked = order.flg_asbestos_register;
                    }
                    if (!order.Isflg_health_safety_closedNull())
                    {
                        cbClosed.Checked = order.flg_health_safety_closed;
                    }
                }
            }
        }
    }
    protected bool AreEqual(object data,string val)
    {
        return (!System.DBNull.Value.Equals(data) && val.Equals((string)data));
    }
    protected void rptDocDetails_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        try
        {            
            DepartmentOrderDoc.DocumentTypeEntityRow dataRow = (DepartmentOrderDoc.DocumentTypeEntityRow)((System.Data.DataRowView)e.Item.DataItem).Row;
            if (AreEqual(dataRow.field_type, "detail"))
            {
                CheckBoxList cbList = ((CheckBoxList)e.Item.FindControl("cbList"));
                DepartmentOrderDocTableAdapters.DocumentTableAdapter ta = new DepartmentOrderDocTableAdapters.DocumentTableAdapter();
                cbList.DataSource = ta.GetDocsByTypeId(loggedInUserCoId, (int)Session[WebConstants.Session.DEPT_ID], dataRow.doc_data_type_id);
                cbList.DataTextField = "doc_name";
                cbList.DataValueField = "doc_id";
                cbList.DataBind();
            }
        }
        catch (StrongTypingException ex)
        {
            //do mothing
        }
    }
    protected void btnCreate_Click(object sender, EventArgs e)
    {
        GenerateFolder();
    }
    private void GenerateFolder()
    {
        hlDoc.Visible = false;
        Image4.Visible = false;
        Image5.Visible = false;
        List<DocumentType> docTypes = new List<DocumentType>();
        for (int i=0;i<rptDocTypes.Items.Count;i++)
        {
            RepeaterItem item = rptDocTypes.Items[i];
            CheckBox cb = (CheckBox)item.FindControl("cbDocType");
            if (cb.Checked == true)
            {
                DocumentType docType = new DocumentType();
                docType.DeptOrderId = int.Parse(Request[WebConstants.Request.DEPT_ORDER_ID]);
                docType.Id = int.Parse(((HiddenField)item.FindControl("hfId")).Value);
                docType.Name = cb.Text;
                docType.Type = ((HiddenField)item.FindControl("hfFieldType")).Value;
                docType.GeneratorClass = ((HiddenField)item.FindControl("hfGeneratorClass")).Value;
                docType.CoId = int.Parse(((HiddenField)item.FindControl("hfCoId")).Value);
                docType.DeptId = int.Parse(((HiddenField)item.FindControl("hfDeptId")).Value);
                docType.IncludeBlankPage = cbBlankPage.Checked;
                HiddenField hfIsLandScape = (HiddenField)item.FindControl("hfIsLandScape");

                if (hfIsLandScape.Value.Length > 0 && bool.Parse(hfIsLandScape.Value) == true)
                    docType.IsLandScape = true;
                else
                    docType.IsLandScape = false;

                docType.Number = null;
                if (docType.Type.Equals("int"))
                {
                    NumericBox nb = (NumericBox)item.FindControl("nbNumOfPrints");
                    if (nb.Text.Length == 0)
                    {
                        SetErrorMessage("Number of Copies for " + docType.Name + " must be specified");
                        return;
                    }
                    else
                    {
                        docType.Number = int.Parse(nb.Text);
                    }
                }
                else if (docType.Type.Equals("detail"))
                {
                    DepartmentOrderDocTableAdapters.DepartmentOrderDocTableAdapter ta = new DepartmentOrderDocTableAdapters.DepartmentOrderDocTableAdapter();
                    IEnumerator ie = ta.GetDocsByType(loggedInUserCoId, (int)Session[WebConstants.Session.DEPT_ID], int.Parse(Request[WebConstants.Request.DEPT_ORDER_ID]), docType.Id).GetEnumerator();
                    bool hasData = false;
                    while (ie.MoveNext())
                    {
                        DepartmentOrderDoc.DepartmentOrderDocEntityRow dr = (DepartmentOrderDoc.DepartmentOrderDocEntityRow)ie.Current;
                        docType.DocList.Add(dr.doc_id, dr.doc_name);
                        hasData = true;
                    }
                    if (hasData == false)
                    {
                        SetErrorMessage("Atleast one document against document type " + docType.Name + " must be selected");
                        return;
                    }
                }
                docTypes.Add(docType);
            }
            else
            {
                bool required = bool.Parse(((HiddenField)item.FindControl("hfRequired")).Value);
                if (required)
                {
                    SetErrorMessage("Document type " + cb.Text + " must be selected");
                    return;
                }
            }
        }
        if (docTypes.Count == 0)
        {
            SetErrorMessage(WebConstants.Messages.Error.SELECT_ATLEAST_ONE_DOCTYPE);
        }
        else
        {
            DepartmentOrderTableAdapters.DepartmentOrderRowTableAdapter ta = new DepartmentOrderTableAdapters.DepartmentOrderRowTableAdapter();
            ta.UpdateOrderDetails(null, DateTime.Parse(dtClient.Text), cbRegister.Checked, cbClosed.Checked, null, loggedInUserId, int.Parse(Request[WebConstants.Request.DEPT_ORDER_ID]));
            FolderGenerator folderGenerator = new FolderGenerator(docTypes);
            if (folderGenerator.Generate())
            {
                string completePath = "~/Folders/" + folderGenerator.fileName;            
                DepartmentOrderDetailTableAdapters.DepartmentOrderLogTableAdapter logTA = new DepartmentOrderDetailTableAdapters.DepartmentOrderLogTableAdapter();
                logTA.Insert(int.Parse(Request[WebConstants.Request.DEPT_ORDER_ID]), loggedInUserCoId, (int)Session[WebConstants.Session.DEPT_ID], loggedInUserId, DateTime.Now, completePath, false);
                ClientScript.RegisterStartupScript(this.GetType(), "redirect", "window.open(\"../Folders/" + folderGenerator.fileName + "\");",true);
                hlDoc.Visible = true;
                Image4.Visible = true;
                Image5.Visible = true;
                hlDoc.NavigateUrl = completePath;
            }
            else
            {
                SetErrorMessage(WebConstants.Messages.Error.DOC_NOT_GENERATED);
            }
        }
    }
}
