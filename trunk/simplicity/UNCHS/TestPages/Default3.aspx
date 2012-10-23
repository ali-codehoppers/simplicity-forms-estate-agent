<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default3.aspx.cs" Inherits="TestPages_Default3" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Simplicity4Business</title>
</head>
<body>
    <form id="form1" runat="server">
        
    <div>
    <asp:DataList ID="DataList1" runat="server" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" DataKeyField="doc_id" DataSourceID="ObjectDataSource1" GridLines="Horizontal" RepeatColumns="4" RepeatDirection="Horizontal">
        <FooterStyle BackColor="White" ForeColor="#333333" />
        <ItemStyle BackColor="White" ForeColor="#333333" />
        <SelectedItemStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
        <ItemTemplate>
            doc_id:
            <asp:Label ID="doc_idLabel" runat="server" Text='<%# Eval("doc_id") %>'></asp:Label><br />
            co_id:
            <asp:Label ID="co_idLabel" runat="server" Text='<%# Eval("co_id") %>'></asp:Label><br />
            dept_id:
            <asp:Label ID="dept_idLabel" runat="server" Text='<%# Eval("dept_id") %>'></asp:Label><br />
            doc_type_id:
            <asp:Label ID="doc_type_idLabel" runat="server" Text='<%# Eval("doc_type_id") %>'>
            </asp:Label><br />
            doc_name:
            <asp:Label ID="doc_nameLabel" runat="server" Text='<%# Eval("doc_name") %>'></asp:Label><br />
            doc_desc:
            <asp:Label ID="doc_descLabel" runat="server" Text='<%# Eval("doc_desc") %>'></asp:Label><br />
            doc_code:
            <asp:Label ID="doc_codeLabel" runat="server" Text='<%# Eval("doc_code") %>'></asp:Label><br />
            <br />
        </ItemTemplate>
        </asp:DataList><asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetAllDocs" TypeName="DepartmentOrderDocTableAdapters.DocumentTableAdapter"></asp:ObjectDataSource>
    </div>
    </form>
</body>
</html>
