<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="TestPages_Default" %>

<%@ Register Src="../Common/UserControls/AutoCompleteGridControl.ascx" TagName="AutoCompleteGridControl"
    TagPrefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Simplicity4Business</title>
    <link rel="stylesheet" type="text/css" href="http://yui.yahooapis.com/2.7.0/build/fonts/fonts-min.css" />
<link rel="stylesheet" type="text/css" href="http://yui.yahooapis.com/2.7.0/build/button/assets/skins/sam/button.css" />
<link rel="stylesheet" type="text/css" href="http://yui.yahooapis.com/2.7.0/build/autocomplete/assets/skins/sam/autocomplete.css" />
<link rel="stylesheet" type="text/css" href="http://yui.yahooapis.com/2.7.0/build/datatable/assets/skins/sam/datatable.css" />

<script type="text/javascript" src="http://yui.yahooapis.com/2.7.0/build/yahoo-dom-event/yahoo-dom-event.js"></script>

<script type="text/javascript" src="http://yui.yahooapis.com/2.7.0/build/animation/animation-min.js"></script>
<script type="text/javascript" src="http://yui.yahooapis.com/2.7.0/build/element/element-min.js"></script>
<script type="text/javascript" src="http://yui.yahooapis.com/2.7.0/build/button/button-min.js"></script>
<script type="text/javascript" src="http://yui.yahooapis.com/2.7.0/build/datasource/datasource-min.js"></script>
<script type="text/javascript" src="http://yui.yahooapis.com/2.7.0/build/autocomplete/autocomplete-min.js"></script>
<script type="text/javascript" src="http://yui.yahooapis.com/2.7.0/build/datatable/datatable-min.js"></script>

<script type="text/javascript" src="../Includes/unchs/AutoCompleteGridControl.js"></script>
<link type="text/css" rel="stylesheet" href="../Common/AutoCompleteGrid.css" />
</head>
<body class="yui-skin-sam">
    <form id="form1" runat="server">
    <div>
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DeleteMethod="Delete"
            InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetAllDeparments"
            TypeName="DepartmentTableAdapters.DepartmentSelectCommandTableAdapter" UpdateMethod="Update">
            <DeleteParameters>
                <asp:Parameter Name="Original_dept_id" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="co_id" Type="Int32" />
                <asp:Parameter Name="flg_deleted" Type="Boolean" />
                <asp:Parameter Name="co_name_short" Type="String" />
                <asp:Parameter Name="co_name_long" Type="String" />
                <asp:Parameter Name="contact_title" Type="String" />
                <asp:Parameter Name="contact_initails" Type="String" />
                <asp:Parameter Name="contact_forename" Type="String" />
                <asp:Parameter Name="contact_surname" Type="String" />
                <asp:Parameter Name="address_no" Type="String" />
                <asp:Parameter Name="address_line1" Type="String" />
                <asp:Parameter Name="address_line2" Type="String" />
                <asp:Parameter Name="address_line3" Type="String" />
                <asp:Parameter Name="address_line4" Type="String" />
                <asp:Parameter Name="address_line5" Type="String" />
                <asp:Parameter Name="address_post_code" Type="String" />
                <asp:Parameter Name="address_full" Type="String" />
                <asp:Parameter Name="tel_1" Type="String" />
                <asp:Parameter Name="tel_2" Type="String" />
                <asp:Parameter Name="tel_fax" Type="String" />
                <asp:Parameter Name="email" Type="String" />
                <asp:Parameter Name="co_notes" Type="String" />
                <asp:Parameter Name="created_by" Type="Int32" />
                <asp:Parameter Name="date_created" Type="DateTime" />
                <asp:Parameter Name="last_amended_by" Type="Int32" />
                <asp:Parameter Name="date_last_amended" Type="DateTime" />
                <asp:Parameter Name="Original_dept_id" Type="Int32" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="co_id" Type="Int32" />
                <asp:Parameter Name="flg_deleted" Type="Boolean" />
                <asp:Parameter Name="co_name_short" Type="String" />
                <asp:Parameter Name="co_name_long" Type="String" />
                <asp:Parameter Name="contact_title" Type="String" />
                <asp:Parameter Name="contact_initails" Type="String" />
                <asp:Parameter Name="contact_forename" Type="String" />
                <asp:Parameter Name="contact_surname" Type="String" />
                <asp:Parameter Name="address_no" Type="String" />
                <asp:Parameter Name="address_line1" Type="String" />
                <asp:Parameter Name="address_line2" Type="String" />
                <asp:Parameter Name="address_line3" Type="String" />
                <asp:Parameter Name="address_line4" Type="String" />
                <asp:Parameter Name="address_line5" Type="String" />
                <asp:Parameter Name="address_post_code" Type="String" />
                <asp:Parameter Name="address_full" Type="String" />
                <asp:Parameter Name="tel_1" Type="String" />
                <asp:Parameter Name="tel_2" Type="String" />
                <asp:Parameter Name="tel_fax" Type="String" />
                <asp:Parameter Name="email" Type="String" />
                <asp:Parameter Name="co_notes" Type="String" />
                <asp:Parameter Name="created_by" Type="Int32" />
                <asp:Parameter Name="date_created" Type="DateTime" />
                <asp:Parameter Name="last_amended_by" Type="Int32" />
                <asp:Parameter Name="date_last_amended" Type="DateTime" />
            </InsertParameters>
        </asp:ObjectDataSource>
            
    </div>
        <uc1:AutoCompleteGridControl ID="AutoCompleteGridControl1" runat="server" />
    </form>
    
</body>
</html>
