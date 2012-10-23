<%@ Page Language="C#" MasterPageFile="~/Common/Main.master" AutoEventWireup="true"
    CodeFile="SectionDetailList.aspx.cs" Inherits="Maintenance_SectionDetailList"
    Title="Simplicity4Business" %>

<%@ Register Assembly="eWorld.UI" Namespace="eWorld.UI" TagPrefix="ew" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContentPlaceHolder" runat="Server">
    <style type="text/css">
        .text_field span
        {
            width: 340px;
            height: 100%;
            display: inline-block;
            padding-bottom: 8px;
            font-weight: bold;
            font-size: 12px;
        }
        .field span
        {
            width: 340px;
            display: inline-block;
            padding-bottom: 10px;
            font-weight: bold;
        }
        .ddl_field span
        {
            width: 340px;
            display: inline-block;
            padding-bottom: 10px;
            font-weight: bold;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadingPlaceHolder" runat="Server">
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
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder" runat="Server">
    <div style="background-color: White; padding: 15px 10px 25px 10px">
        <div class="field">
            <div style="float: left; width: 200px;">
                <span>Department:</span>
            </div>
            <asp:Label ID="lblDept" runat="server" Text="[Department]" Width="500px"></asp:Label>
        </div>
        <div class="text_field">
            <div style="float: left; width: 200px;">
                <span>Section:</span>
            </div>
            <asp:Label ID="lblSection" runat="server" Text="[Section]" Width="500px"></asp:Label>
        </div>
        <div class="text_field">
            <div style="float: left; width: 200px;">
                <span>Section Detail:</span>
            </div>
            <asp:TextBox ID="tbSecDetail" runat="server" CssClass="field_txt"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*"
                ValidationGroup="Add" ControlToValidate="tbSecDetail"></asp:RequiredFieldValidator>
        </div>
        <div class="text_field">
            <div style="float: left; width: 200px;">
                <span>Detail Index:</span>
            </div>
            <ew:NumericBox ID="tbIndex" runat="server" CssClass="field_txt"></ew:NumericBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*"
                ValidationGroup="Add" ControlToValidate="tbIndex"></asp:RequiredFieldValidator>
        </div>
        <div class="button_bar">
            <div style="float: left">
                <asp:Image ID="Image3" runat="server" ImageUrl="~/Images/btn_submit.jpg" />
            </div>
            <div style="float: left; height: 23px; padding-top: 8px; background-image: url('<%=this.ResolveClientUrl("~/images/btn_submit_mid.jpg")%>')">
                <asp:LinkButton ID="btnAdd" runat="server" Text="Add Section Detail" OnClick="btnAdd_Click"
                    ValidationGroup="Add" CssClass="txt_white"></asp:LinkButton>
            </div>
            <div style="float: left">
                <asp:Image ID="Image4" runat="server" ImageUrl="~/Images/btn_submit_right.jpg" />
            </div>
            <div style="float: left; padding-left: 10px;">
                <asp:Image ID="Image5" runat="server" ImageUrl="~/Images/btn_submit.jpg" />
            </div>
            <div style="float: left; height: 23px; padding-top: 8px; background-image: url('<%=this.ResolveClientUrl("~/images/btn_submit_mid.jpg")%>')">
                <asp:LinkButton ID="btnBack" runat="server" Text="Back" OnClick="btnBack_Click" CssClass="txt_white"></asp:LinkButton>
            </div>
            <asp:Image ID="Image6" runat="server" ImageUrl="~/Images/btn_submit_right.jpg" />
        </div>
        <div class="grid">
            <asp:GridView ID="gvSecDetails" runat="server" AutoGenerateColumns="False" CssClass="table_header_result"
                DataKeyNames="section_detail_id" DataSourceID="odsSecDetails" PageSize="50" AllowPaging="True"
                AllowSorting="True" OnRowUpdating="gvSecDetails_RowUpdating" Style="width: 100%">
                <PagerStyle CssClass="grid_pager" />
                <FooterStyle CssClass="grid_footer" />
                <SelectedRowStyle CssClass="grid_selected_row" />
                <HeaderStyle CssClass="table_header" />
                <AlternatingRowStyle CssClass="grid_alternating_row" />
                <RowStyle CssClass="grid_row" />
                <Columns>
                    <asp:TemplateField HeaderText="Edit">
                        <HeaderStyle Width="50px" />
                        <ItemTemplate>
                            <asp:ImageButton ID="LinkButton12" runat="server" CausesValidation="False" CommandName="Edit"
                                ImageUrl="~/Images/icon_edit.png" AlternateText="Edit"></asp:ImageButton>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:ImageButton ID="LinkButton12" runat="server" CausesValidation="False" CommandName="Update"
                                ImageUrl="~/Images/icon_edit.png" AlternateText="Update" ValidationGroup="Update">
                            </asp:ImageButton>
                        </EditItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Delete">
                        <HeaderStyle Width="50px" />
                        <EditItemTemplate>
                            <asp:ImageButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel"
                                ImageUrl="~/Images/Icon_cancel.png" AlternateText="Cancel"></asp:ImageButton>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:ImageButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete"
                                ImageUrl="~/Images/icon_cancel.png" AlternateText="Delete" OnClientClick="return confirm('Are you sure you want to delete this record?');">
                            </asp:ImageButton>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Section Detail Index" SortExpression="section_detail_index">
                        <HeaderStyle Width="150px" />
                        <EditItemTemplate>
                            <ew:NumericBox ID="TextBox1" runat="server" Text='<%# Bind("section_detail_index") %>'></ew:NumericBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*"
                                ValidationGroup="Update" ControlToValidate="TextBox1"></asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <center>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("section_detail_index") %>'></asp:Label>
                            </center>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Section Detail" SortExpression="section_detail_desc">
                        <EditItemTemplate>
                            <div class="text_field">
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("section_detail_desc") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ErrorMessage="*"
                                    ValidationGroup="Update" ControlToValidate="TextBox2"></asp:RequiredFieldValidator>
                            </div>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("section_detail_desc") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:ObjectDataSource ID="odsSecDetails" runat="server" DeleteMethod="Delete" InsertMethod="Insert"
                OldValuesParameterFormatString="original_{0}" SelectMethod="GetBySecId" TypeName="DocumentTemplateTableAdapters.DocumentSectionDetailsTableAdapter"
                UpdateMethod="Update">
                <DeleteParameters>
                    <asp:Parameter Name="Original_section_detail_id" Type="Int32" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="section_detail_index" Type="Int32" />
                    <asp:Parameter Name="section_detail_desc" Type="String" />
                    <asp:Parameter Name="Original_section_detail_id" Type="Int32" />
                </UpdateParameters>
                <SelectParameters>
                    <asp:SessionParameter DefaultValue="0" Name="co_id" SessionField="USER_CO_ID" Type="Int32" />
                    <asp:QueryStringParameter DefaultValue="0" Name="dept_id" QueryStringField="depId"
                        Type="Int32" />
                    <asp:QueryStringParameter DefaultValue="0" Name="section_id" QueryStringField="secId"
                        Type="Int32" />
                </SelectParameters>
                <InsertParameters>
                    <asp:Parameter Name="section_id" Type="Int32" />
                    <asp:Parameter Name="co_id" Type="Int32" />
                    <asp:Parameter Name="dept_id" Type="Int32" />
                    <asp:Parameter Name="section_detail_index" Type="Int32" />
                    <asp:Parameter Name="section_detail_desc" Type="String" />
                </InsertParameters>
            </asp:ObjectDataSource>
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
