<%@ Page Language="C#" MasterPageFile="~/Common/Main.master" AutoEventWireup="true"
    CodeFile="DepartmentHazardList.aspx.cs" Inherits="Maintenance_DepartmentHazardList"
    Title="Simplicity4Business" %>

<asp:Content ID="Content2" ContentPlaceHolderID="HeadContentPlaceHolder" runat="server">
    <link rel="stylesheet" type="text/css" href="<%=this.ResolveClientUrl("~/Includes/yui/build/fonts/fonts-min.css")%>" />
    <script type="text/javascript" src="<%=this.ResolveClientUrl("~/Includes/yui/build/animation/animation-min.js")%>"></script>
    <script type="text/javascript" src="<%=this.ResolveClientUrl("~/Includes/yui/build/dragdrop/dragdrop-min.js")%>"></script>
    <link rel="stylesheet" type="text/css" href="<%=this.ResolveClientUrl("~/Common/StyleSheets/DDStyle.css")%>" />
    <script type="text/javascript" src="<%=this.ResolveClientUrl("~/Includes/unchs/DragDrop.js")%>"></script>
</asp:Content>
<asp:Content ContentPlaceHolderID="HeadingPlaceHolder" ID="ContenPlaceHolder2" runat="server">
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
                Default Key Hazard List
            </div>
            <img src="<%=this.ResolveClientUrl("~/images/bc_right.jpg")%>" alt="" width="8" height="31" />
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" runat="Server">
    <div style="background-color: White; padding: 15px 10px 25px 10px; min-height: 590px;">
        <div class="ddl_field" style="padding-bottom: 5px;">
            <div style="float: left; width: 200px">
                <span style="font-weight: bold">Department:</span>
            </div>
            <asp:DropDownList ID="ddlDepartment" runat="server" CssClass="dropdown_txt" DataSourceID="odsDepartment"
                DataTextField="co_name_short" DataValueField="dept_id" AutoPostBack="true">
            </asp:DropDownList>
        </div>
        <div class="ddl_field" style="padding-bottom: 5px;">
            <div style="float: left; width: 200px">
                <span style="font-weight: bold">Category:</span>
            </div>
            <asp:DropDownList ID="ddlCategory" runat="server" CssClass="dropdown_txt" DataSourceID="odsCategories"
                DataTextField="category_name" DataValueField="category_id">
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*"
                CssClass="error" ControlToValidate="ddlCategory" ValidationGroup="Top"></asp:RequiredFieldValidator>
        </div>
        <div class="text_field" style="padding-bottom: 5px;">
            <div style="float: left; width: 200px">
                <span style="font-weight: bold">Hazard:</span>
            </div>
            <asp:TextBox ID="tbName" runat="server" Rows="3" CssClass="text_area" TextMode="MultiLine"></asp:TextBox><asp:RequiredFieldValidator
                ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" CssClass="error"
                ControlToValidate="tbName" ValidationGroup="Top"></asp:RequiredFieldValidator>
        </div>
        <div class="field" style="padding-bottom: 5px;">
            <div style="float: left; width: 200px">
                <span style="font-weight: bold">Default:</span>
            </div>
            <asp:CheckBox ID="cbDefault" runat="server" />
        </div>
        <div class="button_bar">
            <div style="float: left">
                <asp:Image ID="Image3" runat="server" ImageUrl="~/Images/btn_submit.jpg" />
            </div>
            <div style="float: left; height: 23px; padding-top: 8px; background-image: url('<%=this.ResolveClientUrl("~/images/btn_submit_mid.jpg")%>')">
                <asp:LinkButton ID="btnAdd" runat="server" CssClass="txt_white" OnClick="btnAdd_Click"
                    ValidationGroup="Top">Add Hazard</asp:LinkButton>
                <asp:LinkButton ID="btnUpate" runat="server" OnClick="btnUpate_Click" Text="Update Hazard"
                    Visible="False" ValidationGroup="Top" CssClass="txt_white"></asp:LinkButton>
            </div>
            <div style="float: left">
                <asp:Image ID="Image4" runat="server" ImageUrl="~/Images/btn_submit_right.jpg" />
            </div>
            <div style="float: left; padding-left: 10px;">
                <asp:Image ID="Image5" runat="server" ImageUrl="~/Images/btn_submit.jpg" />
            </div>
            <div style="float: left; height: 23px; padding-top: 8px; background-image: url('<%=this.ResolveClientUrl("~/images/btn_submit_mid.jpg")%>')">
                <asp:LinkButton ID="btnCancel" runat="server" CssClass="txt_white" OnClick="btnCancel_Click">Cancel</asp:LinkButton>
            </div>
            <asp:Image ID="Image6" runat="server" ImageUrl="~/Images/btn_submit_right.jpg" />
            <asp:HiddenField ID="hfDeptPersonId" runat="server" />
        </div>
        <hr />
        <input type="hidden" name="idOrdering" id="idOrdering" />
        <div class="button_bar">
            <div style="float: left">
                <asp:Image ID="Image7" runat="server" ImageUrl="~/Images/btn_submit.jpg" />
            </div>
            <div style="float: left; height: 23px; padding-top: 8px; background-image: url('<%=this.ResolveClientUrl("~/images/btn_submit_mid.jpg")%>')">
                <asp:LinkButton ID="btnSave" runat="server" CssClass="txt_white" OnClick="btnSave_Click"
                    OnClientClick="return saveReorderedList();">Save Ordering</asp:LinkButton>
            </div>
            <asp:Image ID="Image8" runat="server" ImageUrl="~/Images/btn_submit_right.jpg" />
        </div>
        <div class="workArea">
            <asp:Repeater ID="repeater" runat="server" DataSourceID="odsDepartmentHazard" OnItemCommand="repeater_ItemCommand">
                <HeaderTemplate>
                    <div class="table_header">
                        <asp:Label ID="Label1" runat="server" Style="margin-left: 50px;">Category Name</asp:Label>
                        <asp:Label ID="Label3" runat="server" Style="margin-left: 50px;">Default</asp:Label>
                        <asp:Label ID="Label2" runat="server" Style="margin-left: 40px;">Hazard</asp:Label>
                    </div>
                    <ul id="dragDropUL" class="draglist">
                </HeaderTemplate>
                <ItemTemplate>
                    <li class="table_header_result" style="height: 30px" id="li_<%#DataBinder.Eval(Container.DataItem, "sequence")%>">
                        <!--<div class="liData">-->
                        <asp:ImageButton ID="btnEdit" runat="server" ImageUrl="~/Images/icon_edit.png" AlternateText="Edit"
                            CommandName="Edit" CommandArgument='<%#DataBinder.Eval(Container.DataItem, "sequence")%>' />
                        <!--</div>-->
                        <!--<div class="liData">-->
                        <asp:ImageButton ID="btnDelete" runat="server" ImageUrl="~/Images/icon_cancel.png"
                            AlternateText="Delete" CommandName="Delete" CommandArgument='<%#DataBinder.Eval(Container.DataItem, "sequence")%>'
                            OnClientClick="return confirm('Are you sure you want to delete this record?');" />
                        <!--</div>-->
                        <!--<div class="liData">-->
                        <span style="display: inline-block; width: 160px">
                            <%#DataBinder.Eval(Container.DataItem, "category_name")%></span>
                        <asp:CheckBox ID="cbDefault" runat="server" Style="margin-right: 50px;" Checked='<%#DataBinder.Eval(Container.DataItem, "flg_default")%>'
                            Enabled="false" />
                        <%#DataBinder.Eval(Container.DataItem, "name_desc")%>
                        <!--</div>-->
                    </li>
                </ItemTemplate>
                <FooterTemplate>
                    </ul>
                </FooterTemplate>
            </asp:Repeater>
        </div>
        <asp:ObjectDataSource ID="odsDepartment" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetDepartmentsByCoId" TypeName="DepartmentTableAdapters.DepartmentSelectCommandTableAdapter">
            <SelectParameters>
                <asp:SessionParameter Name="co_id" SessionField="USER_CO_ID" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="odsDepartmentHazard" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetDepartmentHazardByDeptId" TypeName="DepartmentHazardTableAdapters.DepartmentHazardSelectCommandTableAdapter"
            DeleteMethod="Delete">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlDepartment" Name="dept_id" PropertyName="SelectedValue"
                    Type="Int32" DefaultValue="0" />
                <asp:SessionParameter Name="co_id" SessionField="USER_CO_ID" Type="Int32" DefaultValue="0" />
            </SelectParameters>
            <DeleteParameters>
                <asp:Parameter Name="Original_sequence" Type="Int32" />
                <asp:Parameter Name="user_id" Type="Int32" />
            </DeleteParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="odsCategories" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetCategoriesByType" TypeName="CategoriesTableAdapters.CategoryTableAdapter">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlDepartment" DefaultValue="0" Name="dept_id" PropertyName="SelectedValue"
                    Type="Int32" />
                <asp:SessionParameter DefaultValue="0" Name="co_id" SessionField="USER_CO_ID" Type="Int32" />
                <asp:Parameter DefaultValue="H" Name="category_type" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
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
