<%@ Page Language="C#" AutoEventWireup="true" CodeFile="InsertItem.aspx.cs" Inherits="TestPages_InsertItem" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Simplicity4Business</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:CheckBox ID="cbDef" runat="server" Text="Default Values" /><br />
            Document: <asp:DropDownList ID="ddlDocs" runat="server" DataSourceID="odsDocs" DataTextField="doc_name"
            DataValueField="doc_id"  CssClass="dropdown_txt">
        </asp:DropDownList><br />
        Section: <asp:DropDownList ID="ddlSections" runat="server" DataSourceID="odsSections" DataTextField="section_desc"
            DataValueField="section_id"  CssClass="dropdown_txt">
        </asp:DropDownList><br />

        <asp:TextBox ID="TextBox1" runat="server" Rows="10" TextMode="MultiLine" Width="800px"></asp:TextBox>
        <asp:ObjectDataSource ID="odsSections" runat="server" DeleteMethod="Delete" InsertMethod="Insert"
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetAllSections" TypeName="DocumentTemplateTableAdapters.DocumentSectionTableAdapter"
            UpdateMethod="Update">
            <DeleteParameters>
                <asp:Parameter Name="Original_section_id" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="flg_delete" Type="Boolean" />
                <asp:Parameter Name="co_id" Type="Int32" />
                <asp:Parameter Name="dept_id" Type="Int32" />
                <asp:Parameter Name="section_index" Type="Int32" />
                <asp:Parameter Name="section_desc" Type="String" />
                <asp:Parameter Name="Original_section_id" Type="Int32" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="flg_delete" Type="Boolean" />
                <asp:Parameter Name="co_id" Type="Int32" />
                <asp:Parameter Name="dept_id" Type="Int32" />
                <asp:Parameter Name="section_index" Type="Int32" />
                <asp:Parameter Name="section_desc" Type="String" />
            </InsertParameters>
        </asp:ObjectDataSource>
        
    </div>
        <asp:ObjectDataSource ID="odsDocs" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetAllDocs" TypeName="DepartmentOrderDocTableAdapters.DocumentTableAdapter">
        </asp:ObjectDataSource>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Save" />
    </form>
</body>
</html>
