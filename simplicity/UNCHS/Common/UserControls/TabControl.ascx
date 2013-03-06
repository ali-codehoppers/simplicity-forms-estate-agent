<%@ Control Language="C#" AutoEventWireup="true" CodeFile="TabControl.ascx.cs" Inherits="Common_TabControl" %>
<div>
    <div style="float: left;width:90%">
        <div class="shadetabs">
            <ul>
                <%=LiList%>
            </ul>
        </div>
    </div>
    <div style="float: left;width:8%">
    <asp:Panel ID="hlAddRoomPannel" runat="server" Visible="false">
        <div style="float: right;width:100px;">
            <div style="float: left">
                <img src="<%=this.ResolveClientUrl("~/images/bc_left_NB.gif")%>" alt="" width="8" height="31" /></div>
            <div class="breadcrum_mid" style="height: 23px; padding-top: 8px; float: left; width: 76%">
                <asp:HyperLink ID="linkAddRoom" runat="server" style="color:White">Add Room</asp:HyperLink>
            </div>
            <div style="float: left">
                <img src="<%=this.ResolveClientUrl("~/images/bc_right_NB.gif")%>" alt="" width="8" height="31" />
            </div>
            <div style="clear: both">
        </div>
    </asp:Panel>
    </div>
    <div style="clear: both">
    </div>
</div>
