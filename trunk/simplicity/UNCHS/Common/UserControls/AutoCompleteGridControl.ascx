<%@ Control Language="C#" AutoEventWireup="true" CodeFile="AutoCompleteGridControl.ascx.cs" Inherits="Common_AutoCompleteGridControl" %>
<script language="javascript" type="text/javascript">
YAHOO.namespace("UNCHS.AutoCompleteGrid.<%=ID%>");
var <%=ID%> = new YAHOO.UNCHS.AutoCompleteGrid( 
[
<asp:Repeater ID="rptrAutoComplete" runat="server">
    <ItemTemplate>
    {name: 'Hello', id: 123},
    </ItemTemplate>
</asp:Repeater>
],
[
    {name: "ABC Company", id: 57367,type: 'N' },
    {name: "Acme Supply Company", id: 84377,type: 'N'},
    {name: "Avery Widgets", id: 73678,type: 'N'},
    {name: "AAA International", id: 73675,type: 'N'},
    {name: "Atlantic Brothers, Inc", id: 83757,type: 'N'},
    {name: "Ace Products", id: 48588,type: 'N'},
    {name: "Above Average, Ltd", id: 75968,type: 'N'}
],
"<%=ID%>_nameField",
"<%=ID%>_nameContainer",
"<%=ID%>_btnDrop",
"<%=ID%>_btnAdd",
"<%=ID%>_errorField",
"<%=ID%>_Table"
);
</script>
<asp:Repeater ID="rptrGrid" runat="server"></asp:Repeater>
<div id="bAutoComplete">
    <div id="<%=ID%>_errorField" class="error-text"></div>
    <input id="<%=ID%>_nameField" type="text" /> <span id="<%=ID%>_btnDrop"></span>
	<div id="<%=ID%>_nameContainer"></div>
	<input type="button" id="<%=ID%>_btnAdd" name="btnAdd" value="Add"/> 
</div>
<div id="<%=ID%>_Table">
</div>
<script type="text/javascript">
    <%=ID%>.init();
</script>