<%@ Control Language="C#" AutoEventWireup="true" CodeFile="TabControl.ascx.cs" Inherits="Common_TabControl" %>
<div>
    <div style="float:left">
        <div class="shadetabs">
            <ul>
                <%=LiList%>
            </ul>
        </div>
    </div>
    <div style="float:right">
        <asp:HyperLink ID="hlAddRoom" runat="server" Visible="false">Add Room</asp:HyperLink>
    </div>
    <div style="clear:both"></div>
</div>