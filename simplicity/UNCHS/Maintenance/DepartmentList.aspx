<%@ Page EnableEventValidation="false" Language="C#" MasterPageFile="~/Common/Main.master" AutoEventWireup="true"
    CodeFile="DepartmentList.aspx.cs" Inherits="Maintenance_DepartmentList" Title="Department List" %>
<asp:Content ContentPlaceHolderID="HeadContentPlaceHolder" runat="server">
    <script type="text/javascript">
        function deleteDepartment(deptId) {
            if (confirm("Are you sure you want to delete this Department?")) {
                $("#deptId").val(deptId);
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
                Departments List
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
                <asp:HyperLink ID="HyperLink1" CssClass="txt_white" runat="server" NavigateUrl="~/Maintenance/AddDepartment.aspx">Add a New Department</asp:HyperLink>
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
        <asp:HiddenField runat="server" ID="deptId" ClientIDMode="Static" />
        <div class="grid">
           <asp:GridView ID ="GridView1" runat="server" AutoGenerateColumns="false" style="width: 100%">
               <Columns>
                    <asp:TemplateField HeaderText="Edit" InsertVisible="False" SortExpression="Sequence">
                        <ItemTemplate>
                            <center>
                                <a href='AddDepartment.aspx?depId=<%# Eval("Sequence") %>' style="border: none; text-decoration: none;">
                                    <img src="../Images/icon_edit.png" alt="Edit" class="noborder" style="border: none;" /></a>
                            </center>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Delete" InsertVisible="False" SortExpression="Sequence">
                        <ItemTemplate>
                            <center>
                                <asp:ImageButton ID="ImageButton1" CausesValidation="False" CssClass="noborder" runat="server" ImageUrl="~/Images/icon_cancel.png"
                                    CommandName="DeleteDepartment" CommandArgument='<%# Eval("Sequence") %>' OnClick="ImageButton1_Click" OnClientClick='<%#GetDeleteButton(Eval("Sequence"))%>' />
                            </center>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="DepartmentDesc" HeaderText="Department Description" SortExpression="DepartmentDesc">
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