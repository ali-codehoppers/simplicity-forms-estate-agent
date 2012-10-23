<%@ Page Language="C#" MasterPageFile="~/Common/Main.master" AutoEventWireup="true" CodeFile="TransferAspects.aspx.cs" Inherits="Admin_TransferAspects" Title="Simplicity4Business" %>

<%@ Register src="../Common/UserControls/TransferSuggestions.ascx" tagname="TransferSuggestions" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContentPlaceHolder" Runat="Server">
    <style type="text/css">
        .ddl_field span{width:75px;display:inline-block;}    
        .ddl_field select {width:300px;}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TabPlaceHolder" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="HeadingPlaceHolder" Runat="Server">
    Transfer Aspects 
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder" Runat="Server">
    
    <uc1:TransferSuggestions ID="TransferSuggestions1" runat="server" EntityName="Key Aspects" SuggestionType="A" />
    
</asp:Content>

