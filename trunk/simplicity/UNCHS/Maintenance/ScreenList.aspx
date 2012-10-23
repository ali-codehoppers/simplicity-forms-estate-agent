<%@ Page Title="" Language="C#" MasterPageFile="~/Common/Main.master" AutoEventWireup="true"
    CodeFile="ScreenList.aspx.cs" Inherits="Maintenance_ScreenList" ValidateRequest="false"
    EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContentPlaceHolder" runat="Server">
    <style type="text/css">
        .text_field span
        {
            width: 150px;
        }
        .field span
        {
            width: 150px;
        }
        .ddl_field span
        {
            width: 150px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadingPlaceHolder" runat="Server">
    Screen List
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder" runat="Server">
    <div class="ddl_field">
        <asp:Label ID="lblCompany" runat="server" Text="Company:"></asp:Label><asp:DropDownList CssClass="dropdown_txt" 
            ID="ddlCompanies" runat="server" DataSourceID="odsCompanies" DataTextField="co_name_short"
            AutoPostBack="true" DataValueField="co_id" OnDataBound="ddlCompanies_DataBound"
            OnSelectedIndexChanged="ddlCompanies_SelectedIndexChanged">
        </asp:DropDownList>
        <asp:HiddenField ID="hfCoId" runat="server" />
        <asp:HiddenField ID="hfScreenId" runat="server" />
    </div>
    <div class="text_field">
        <span>Screen Name:</span><asp:TextBox ID="tbScreenName" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="Add"
            ErrorMessage="*" ControlToValidate="tbScreenName"></asp:RequiredFieldValidator>
    </div>
    <div class="text_field">
        <span>Screen URL:</span><asp:TextBox ID="tbScreenURL" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ValidationGroup="Add"
            ErrorMessage="*" ControlToValidate="tbScreenURL"></asp:RequiredFieldValidator>
    </div>
    <div class="text_field">
        <table border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td valign="middle">
                    <span>Help HTML:</span><br />
                    <span>Put in valid HTML</span>
                </td>
                <td>
                    <asp:TextBox ID="tbHelpHTML" runat="server" TextMode="MultiLine" Rows="15"></asp:TextBox><asp:RequiredFieldValidator
                        ID="RequiredFieldValidator3" runat="server" ValidationGroup="Add" ErrorMessage="*"
                        ControlToValidate="tbHelpHTML"></asp:RequiredFieldValidator>
                </td>
            </tr>
        </table>
    </div>
    <div class="button_bar">
        <asp:Button ID="btnAddScreen" runat="server" Text="Add Screen" OnClick="btnAddScreen_Click"
            ValidationGroup="Add" /><asp:Button ID="btnUpdateScreen" runat="server" Visible="false"
                Text="Update Screen" OnClick="btnUpdateScreen_Click" ValidationGroup="Add" /></div>
    <div class="grid">
        <asp:GridView ID="gvScreens" runat="server" AutoGenerateColumns="False" CssClass="grid_table"
            DataSourceID="odsScreens" PageSize="50" AllowPaging="True" AllowSorting="True"
            DataKeyNames="screen_id">
            <Columns>
                <asp:TemplateField HeaderText="Edit">
                    <ItemTemplate>
                        <a href='ScreenList.aspx?screenId=<%# Eval("screen_id") %>' style="border: none;
                            text-decoration: none;">
                            <img src="../Images/edit.png" alt="Edit" class="noborder" /></a>
                    </ItemTemplate>
                    <HeaderStyle Width="50px" HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Delete">
                    <ItemTemplate>
                        <a href='ScreenList.aspx?screenId=<%# Eval("screen_id") %>&delete=true' style="border: none;
                            text-decoration: none;">
                            <img src="../Images/delete.png" alt="Edit" class="noborder" /></a>
                    </ItemTemplate>
                    <HeaderStyle Width="50px" HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Screen Name" SortExpression="screenName">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("screen_name") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("screen_name") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Screen URL" SortExpression="screenURL">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("screen_url") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("screen_url") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Help HTML" SortExpression="helpHTML">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" TextMode="MultiLine" Rows="15" Text='<%# Bind("help_html") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("help_html") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <PagerStyle CssClass="grid_pager" />
            <FooterStyle CssClass="grid_footer" />
            <SelectedRowStyle CssClass="grid_selected_row" />
            <HeaderStyle CssClass="grid_header" />
            <AlternatingRowStyle CssClass="grid_alternating_row" />
            <RowStyle CssClass="grid_row" />
        </asp:GridView>
        <asp:ObjectDataSource ID="odsScreens" runat="server" DeleteMethod="Delete" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetScreensByCoId" TypeName="ScreensTableAdapters.ScreenTableAdapter">
            <DeleteParameters>
                <asp:Parameter Name="Original_screen_id" Type="Int32" />
            </DeleteParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="hfCoId" DefaultValue="0" Name="co_id" PropertyName="Value"
                    Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="odsCompanies" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetAllCompanies" TypeName="CompanyTableAdapters.un_co_detailsTableAdapter">
        </asp:ObjectDataSource>
    </div>
</asp:Content>
