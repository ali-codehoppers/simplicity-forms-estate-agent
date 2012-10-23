<%@ Page Language="C#" MasterPageFile="~/Common/Register.master" AutoEventWireup="true" CodeFile="CSVHelp.aspx.cs" Inherits="Register_CSVHelp" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MenuContentPlaceHolder" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="HeadingContentPlaceHolder" Runat="Server">CSV Help
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder" Runat="Server">
    <div><asp:HyperLink ID="hlBack" runat="server"><< Go Back</asp:HyperLink></div>
    <h1>Step # 1 - Start Excel</h1>
    <div>Start excel from windows Start Menu</div>
    <h1>Step # 2 - Make Changes</h1>
    <div>Make the changes as shown the in the image. Do follow the format specified</div>
    <h1>Step # 3 - Save As</h1>
    <div>Please save the file as a DOS format CSV file.</div>
    <div>Follow the following steps</div>
    <div><asp:Image ID="Image1" runat="server" ImageUrl="~/Images/csv_1.png"/></div>    
    <div><asp:Image ID="Image2" runat="server" ImageUrl="~/Images/csv_2.png"/></div>
    <div><asp:Image ID="Image3" runat="server" ImageUrl="~/Images/csv_3.png"/></div>
    <div><asp:Image ID="Image4" runat="server" ImageUrl="~/Images/csv_4.png"/></div>
    <div><asp:Image ID="Image5" runat="server" ImageUrl="~/Images/csv_5.png"/></div>
</asp:Content>

