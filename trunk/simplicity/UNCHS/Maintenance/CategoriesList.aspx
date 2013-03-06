<%@ Page Language="C#" MasterPageFile="~/Common/Main.master" AutoEventWireup="true" EnableEventValidation="false"
     CodeFile="CategoriesList.aspx.cs" Inherits="Maintenance_CategoriesList" Title="Categories List" %>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadContentPlaceHolder" runat="server">
    <script type="text/javascript">
        function deleteCategory(categId) {
            if (confirm("Are you sure you want to delete this Category?")) {
                $("#categoryId").val(categId);
                return true;
            }
            return false;
        }
    </script>

</asp:Content>

<asp:Content ContentPlaceHolderID="HeadingPlaceHolder" ID="HeadingContent" runat="server">
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
    <div style="background-color: White; border-top: 1px solid white">
        <div style="margin: auto; width: 98%">
            <div style="float: left">
                <img src="<%=this.ResolveClientUrl("~/images/bc_left.jpg")%>" alt="" width="8" height="31" /></div>
            <div class="breadcrum_mid" style="height: 23px; padding-top: 8px; float: left; width: 96%">
                Categories List
            </div>
            <img src="<%=this.ResolveClientUrl("~/images/bc_right.jpg")%>" alt="" width="8" height="31" />
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" runat="Server">
    <div style="background-color: White; padding: 15px 10px 25px 10px; min-height: 350px;">

        <div class="field" style="padding-bottom: 5px;">
            <asp:HiddenField ID="hfCoId" runat="server" />
            <div style="float: left">
                <asp:Image ID="Image3" runat="server" ImageUrl="~/Images/btn_submit.jpg" />
            </div>
            <div style="float: left; height: 23px; padding-top: 8px; background-image: url('<%=this.ResolveClientUrl("~/images/btn_submit_mid.jpg")%>')">
                <asp:HyperLink ID="HyperLink1" CssClass="txt_white" runat="server" NavigateUrl="~/Maintenance/AddCategories.aspx">Add a New Category</asp:HyperLink>
            </div>
            <asp:Image ID="Image4" runat="server" ImageUrl="~/Images/btn_submit_right.jpg" />
        </div>

        <div class="ddl_field">
            <asp:Label ID="lblCompany" runat="server" Text="Company"></asp:Label>
            <asp:DropDownList ID="ddlCompanies" runat="server" DataTextField="Name"
                DataValueField="CompanyID" AutoPostBack="True" OnSelectedIndexChanged="ddlCompanies_SelectedIndexChanged"
                CssClass="dropdown_txt">
            </asp:DropDownList>
        </div>
        <asp:HiddenField runat="server" ID="categoryId" ClientIDMode="Static" />
        <div class="grid">
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True"
                AutoGenerateColumns="False" CssClass="table_header_result" DataKeyNames="Sequence"
                PageSize="50" Style="width: 100%">
                <Columns>
                    <asp:TemplateField HeaderText="Edit" InsertVisible="False" SortExpression="Sequence">
                        <ItemTemplate>
                            <center>
                                <a href='AddCategories.aspx?categoryId=<%# Eval("Sequence") %>' style="border: none; text-decoration: none;">
                                    <img src="../Images/icon_edit.png" alt="Edit" class="noborder" style="border: none;" /></a>
                            </center>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Delete" InsertVisible="False" SortExpression="Sequence">
                        <ItemTemplate>
                            <center>
                                <asp:ImageButton ID="ImageButton1" CssClass="noborder" runat="server" ImageUrl="~/Images/icon_cancel.png"
                                    CommandName="Delete" OnClick="ImageButton1_Click" OnClientClick='<%#GetDeleteButton(Eval("Sequence"))%>' />
                            </center>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="CategoryDesc" HeaderText="Category Description" SortExpression="CategoryDesc">
                        <HeaderStyle Width="40%" />
                    </asp:BoundField>
                </Columns>
                <PagerStyle CssClass="grid_pager" />
                <FooterStyle CssClass="grid_footer" />
                <SelectedRowStyle CssClass="grid_selected_row" />
                <HeaderStyle CssClass="table_header" />
                <AlternatingRowStyle CssClass="grid_alternating_row" />
                <RowStyle CssClass="grid_row" />
            </asp:GridView>
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
