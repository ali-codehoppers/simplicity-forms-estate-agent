<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SuggestionsControl.ascx.cs"
    Inherits="Common_UserControls_SuggestionsControl" %>
<div class="ddl_field" style="padding-bottom:10px;">
    <div style="float:left; width:200px; font-weight:bold">
    <asp:Label ID="lblDepartment" runat="server" Text="Department:"></asp:Label>
    </div>
    <asp:DropDownList CssClass="dropdown_txt"
        ID="ddlDepartment" runat="server" AutoPostBack="true" OnDataBound="ddlDepartment_DataBound"
        OnSelectedIndexChanged="ddlDepartment_SelectedIndexChanged">
    </asp:DropDownList>
    <asp:HiddenField ID="hfSuggestionId" runat="server" />
</div>
<div style="clear:both"></div>
<div class="ddl_field">
    <div style="width: 200px; float: left">
        <span style="font-weight: bold">Category:</span>
    </div>
    <div>
        <asp:DropDownList ID="ddlCategory" runat="server" CssClass="dropdown_txt">
        </asp:DropDownList>
    </div>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*"
        CssClass="error" ControlToValidate="ddlCategory" ValidationGroup="Top"></asp:RequiredFieldValidator>
</div>
<div class="text_field">
    <div style="width: 200px; float: left">
        <span style="font-weight: bold">
            <%=EntityName%></span>
    </div>
    <div>
        <asp:TextBox ID="tbName" runat="server" CssClass="field_txt">
        </asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*"
            CssClass="error" ControlToValidate="tbName" ValidationGroup="Top"></asp:RequiredFieldValidator>
    </div>
</div>
<div class="field" style="padding-top: 10px;">
    <div style="width: 200px; float: left">
        <span style="font-weight: bold">Default:</span>
    </div>
    <div>
        <asp:CheckBox ID="cbDefault" runat="server" />
    </div>
</div>
<div class="button_bar">
    <div style="float: left">
        <asp:Image ID="Image3" runat="server" ImageUrl="~/Images/btn_submit.jpg" />
    </div>
    <div style="float: left; height: 23px; padding-top: 8px; background-image: url('<%=this.ResolveClientUrl("~/images/btn_submit_mid.jpg")%>')">
        <asp:LinkButton ID="btnAdd" runat="server" OnClick="btnAdd_Click" CssClass="txt_white"
            ValidationGroup="Top">Add</asp:LinkButton>
        <asp:LinkButton ID="btnUpate" runat="server" OnClick="btnUpate_Click" Text="Update" Visible="False" CssClass="txt_white"
        ValidationGroup="Top" ></asp:LinkButton>
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
    
</div>
<hr />
<input type="hidden" name="idOrdering" id="idOrdering" />
<div class="button_bar">
    <div style="float: left">
        <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/btn_submit.jpg" />
    </div>
    <div style="float: left; height: 23px; padding-top: 8px; background-image: url('<%=this.ResolveClientUrl("~/images/btn_submit_mid.jpg")%>')">
        <asp:LinkButton ID="btnSave" runat="server" CssClass="txt_white" OnClick="btnSave_Click"
            OnClientClick="return saveReorderedList();">Save Ordering</asp:LinkButton>
    </div>
    <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/btn_submit_right.jpg" />
</div>
<div class="workArea">
    <asp:Repeater ID="repeater" runat="server" OnItemCommand="repeater_ItemCommand">
        <HeaderTemplate>
            <div class="table_header">
                <asp:Label ID="Label1" runat="server" Style="margin-left: 50px;">Category Name</asp:Label>
                <asp:Label ID="Label3" runat="server" Style="margin-left: 50px;">Default</asp:Label>
                <asp:Label ID="Label2" runat="server" Style="margin-left: 40px;">Hazard</asp:Label>
            </div>
            <ul id="dragDropUL" class="draglist">
        </HeaderTemplate>
        <ItemTemplate>
            <li class="table_header_result" style="height:30px" id="li_<%#DataBinder.Eval(Container.DataItem, "suggestion_id")%>">
                <!--<div class="liData">-->
                <asp:ImageButton ID="btnEdit" runat="server" ImageUrl="~/Images/icon_edit.png" AlternateText="Edit"
                    CommandName="Edit" CommandArgument='<%#DataBinder.Eval(Container.DataItem, "suggestion_id")%>' />
                <!--</div>-->
                <!--<div class="liData">-->
                <asp:ImageButton ID="btnDelete" runat="server" ImageUrl="~/Images/icon_cancel.png" AlternateText="Delete"
                    CommandName="Delete" CommandArgument='<%#DataBinder.Eval(Container.DataItem, "suggestion_id")%>'
                    OnClientClick="return confirm('Are you sure you want to delete this record?');" />
                <!--</div>-->
                <!--<div class="liData">-->
                <span style="display: inline-block; width: 160px">
                    <%#DataBinder.Eval(Container.DataItem, "category_name")%></span>
                <asp:CheckBox ID="cbDefault" runat="server" Style="margin-right: 50px;" Checked='<%#DataBinder.Eval(Container.DataItem, "flg_default")%>'
                    Enabled="false" />
                <%#DataBinder.Eval(Container.DataItem, "suggestion_text")%>
                <!--</div>-->
            </li>
        </ItemTemplate>
        <FooterTemplate>
            </ul>
        </FooterTemplate>
    </asp:Repeater>
    </ul>
</div>
