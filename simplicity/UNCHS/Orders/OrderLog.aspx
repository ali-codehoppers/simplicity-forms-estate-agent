<%@ Page Language="C#" MasterPageFile="~/Common/Main.master" AutoEventWireup="true"
    CodeFile="OrderLog.aspx.cs" Inherits="Orders_OrderLog" Title="Simplicity4Business" %>

<%@ Register Src="../Common/UserControls/TabControl.ascx" TagName="TabControl" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContentPlaceHolder" runat="Server">
    <link rel="stylesheet" type="text/css" href="<%=this.ResolveClientUrl("~/Common/StyleSheets/Tab.css")%>" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadingPlaceHolder" runat="Server">
    <div style="float: left; width: 100%;">
        <div class="topLeft">
            <img src="<%=this.ResolveClientUrl("~/images/big_pnl_left.jpg")%>" alt="" height="20" />
        </div>
        <div class="topMid">
            <img src="<%=this.ResolveClientUrl("~/Images/big_pnl_mid.jpg")%>" alt="" style="width: 100%"
                height="20" />
        </div>
        <div class="topRight">
            <img src="<%=this.ResolveClientUrl("~/images/big_pnl_right.jpg")%>" alt="" height="20" />
        </div>
    </div>
    <div style="float: left; width: 99.99%">
        <div style="background-color: White; border-top: 1px solid white;">
            <div style="margin: auto; width: 97.6%;">
                <div style="float: left">
                    <img src="<%=this.ResolveClientUrl("~/images/bc_left.jpg")%>" alt="" width="8" height="31" /></div>
                <div class="breadcrum_mid" style="height: 23px; padding-top: 8px; float: left; width: 96%">
                    Add/Amend H&amp;S Folder
                </div>
                <img src="<%=this.ResolveClientUrl("~/images/bc_right.jpg")%>" alt="" width="8" height="31" />
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="TabPlaceHolder" runat="Server">
    <uc1:TabControl ID="TabControl1" runat="server" Selected="Log" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder" runat="Server">
    <div style="background-color: White; padding: 15px 10px 25px 10px; min-height: 255px;
        float: left; width: 97.65%">
        <div class="grid">
            <asp:GridView ID="gvLogs" runat="server" AutoGenerateColumns="False" DataKeyNames="log_id"
                DataSourceID="odsLog" PageSize="50" Width="100%" CssClass="table_header_result">
                <Columns>
                    <asp:TemplateField HeaderText="Delete">
                        <ItemTemplate>
                            <center>
                                <asp:ImageButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete"
                                    ImageUrl="~/Images/icon_cancel.png" AlternateText="Delete"></asp:ImageButton>
                            </center>
                        </ItemTemplate>
                        <HeaderStyle Width="45px" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="user_name" HeaderText="Created By" SortExpression="user_name">
                        <HeaderStyle Width="70px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="creation_time" HeaderText="Creation Time" SortExpression="creation_time">
                        <ItemStyle Width="30%" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="Folder" SortExpression="file_path">
                        <EditItemTemplate>
                            <asp:HyperLink ID="HyperLink1" runat="server" Target="_blank" NavigateUrl='<%# Bind("file_path") %>'>Folder</asp:HyperLink>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:HyperLink ID="HyperLink1" runat="server" Target="_blank" NavigateUrl='<%# Bind("file_path") %>'>Folder</asp:HyperLink>
                        </ItemTemplate>
                        <ItemStyle Width="30%" />
                    </asp:TemplateField>
                </Columns>
                <PagerStyle CssClass="grid_pager" />
                <FooterStyle CssClass="grid_footer" />
                <SelectedRowStyle CssClass="grid_selected_row" />
                <HeaderStyle CssClass="table_header" />
                <AlternatingRowStyle CssClass="grid_alternating_row" />
                <RowStyle CssClass="grid_row" />
            </asp:GridView>
        </div>
        <asp:ObjectDataSource ID="odsLog" runat="server" DeleteMethod="Delete" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetLogByOrderId" TypeName="DepartmentOrderDetailTableAdapters.DepartmentOrderLogTableAdapter">
            <DeleteParameters>
                <asp:Parameter Name="Original_log_id" Type="Int32" />
            </DeleteParameters>
            <SelectParameters>
                <asp:SessionParameter DefaultValue="0" Name="co_id" SessionField="USER_CO_ID" Type="Int32" />
                <asp:SessionParameter DefaultValue="0" Name="dept_id" SessionField="DEPT_ID" Type="Int32" />
                <asp:QueryStringParameter DefaultValue="0" Name="order_id" QueryStringField="deptOrderId"
                    Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <div class="button_bar">
            <div class="button_right" style="padding-left: 340px;">
                <div style="float: left">
                    <asp:Image ID="Image3" runat="server" ImageUrl="~/Images/btn_submit.jpg" />
                </div>
                <div style="float: left; height: 23px; padding-top: 8px; background-image: url('<%=this.ResolveClientUrl("~/images/btn_submit_mid.jpg")%>')">
                    <a href="" class="txt_white" onclick="window.opener='x';window.close();return false;">
                        Cancel</a>
                </div>
                <asp:Image ID="Image6" runat="server" ImageUrl="~/Images/btn_submit_right.jpg" />
            </div>
        </div>
    </div>
    <div style="float: left; width: 100%">
        <div style="float: left">
            <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/left_bottom.gif" alt=""
                Width="15" Height="14" /></div>
        <div class="bottonMid">
        </div>
        <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/right_bottom.gif" alt=""
            Width="15" Height="14" />
    </div>
</asp:Content>
