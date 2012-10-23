<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddDocumentItems.aspx.cs" Inherits="TestPages_AddDocumentItems" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        
    
        <asp:Label ID="lblCoId" runat="server" Text="Label"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="lblDeptId" runat="server" Text="Label"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="lblSectionId" runat="server" Text="Label"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="lblDocTypeId" runat="server" Text="Label"></asp:Label>
        <br />
        <asp:Label ID="lbl" runat="server" Text="Doc Name"></asp:Label>
        <asp:TextBox ID="tbDocName" runat="server" AutoPostBack="True" 
            ontextchanged="tbDocCode_TextChanged"></asp:TextBox>
        <asp:Label ID="lblDocId" runat="server" Text="Label"></asp:Label>
        <br />
        <asp:CheckBoxList ID="CheckBoxList1" runat="server">
            <asp:ListItem>PPE Assessment   Details/Ref:</asp:ListItem>
            <asp:ListItem>COSHH Assessment   Details/Ref:</asp:ListItem>
            <asp:ListItem>Work Authorisation   Details/Ref:</asp:ListItem>
            <asp:ListItem>Method Statement   Details/Ref:</asp:ListItem>
            <asp:ListItem>Manual Handling RA   Details/Ref:</asp:ListItem>
            <asp:ListItem>Permit to Work   Details/Ref:</asp:ListItem>
        </asp:CheckBoxList>
        
    
        <br />
        <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Save" />
        
    
    </div>
    </form>
</body>
</html>
