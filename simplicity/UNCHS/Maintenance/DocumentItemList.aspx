<%@ Page Language="C#" MasterPageFile="~/Common/Main.master" AutoEventWireup="true"
    CodeFile="DocumentItemList.aspx.cs" Inherits="Maintenance_DocumentItemList" Title="Simplicity4Business" %>

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
        <div>
            <div style="float: left">
                <asp:Image ID="Image3" runat="server" ImageUrl="~/Images/btn_submit.jpg" />
            </div>
            <div style="float: left; height: 23px; padding-top: 8px; background-image: url('<%=this.ResolveClientUrl("~/images/btn_submit_mid.jpg")%>')">
                <asp:HyperLink NavigateUrl="~/Maintenance/SectionList.aspx" CssClass="txt_white"
                    Text="Define Sections" runat="server" ID="hl1"></asp:HyperLink>
            </div>
            <asp:Image ID="Image4" runat="server" ImageUrl="~/Images/btn_submit_right.jpg" />
        </div>
        <div class="field" style="padding-top: 10px;">
            <div style="float: left; width: 200px">
                <span>Department:</span>
            </div>
            <asp:Label ID="lblDepartment" runat="server" Text="[Department]" Width="500px"></asp:Label>
        </div>
        <div class="field" style="padding-top: 10px;">
            <div style="float: left; width: 200px">
                <span>Document Name:</span>
            </div>
            <asp:Label ID="lblDocName" runat="server" Text="[Document Name]" Width="500px"></asp:Label>
        </div>
        <div class="button_bar">
            <div style="float: left">
                <asp:Image ID="Image5" runat="server" ImageUrl="~/Images/btn_submit.jpg" />
            </div>
            <div style="float: left; height: 23px; padding-top: 8px; background-image: url('<%=this.ResolveClientUrl("~/images/btn_submit_mid.jpg")%>')">
                <asp:LinkButton ID="btnSave" runat="server" Text="Save Details" OnClick="btnSave_Click"
                    CssClass="txt_white"></asp:LinkButton>
            </div>
            <div style="float: left">
                <asp:Image ID="Image6" runat="server" ImageUrl="~/Images/btn_submit_right.jpg" />
            </div>
            <div style="float: left; padding-left: 10px;">
                <asp:Image ID="Image7" runat="server" ImageUrl="~/Images/btn_submit.jpg" />
            </div>
            <div style="float: left; height: 23px; padding-top: 8px; background-image: url('<%=this.ResolveClientUrl("~/images/btn_submit_mid.jpg")%>')">
                <asp:LinkButton ID="btnBack" runat="server" Text="Back" OnClick="btnBack_Click" CssClass="txt_white"></asp:LinkButton>
            </div>
            <asp:Image ID="Image8" runat="server" ImageUrl="~/Images/btn_submit_right.jpg" />
        </div>
        <div class="error_msg" style="padding-bottom: 10px;">
            <h3>
                IMPORTANT INFORMATION</h3>
            <div>
                This section should only be used by an Administrator, making changes can affect
                your Health & Safety documents, and can cause them to be invalid, adding Risk to
                employees.
            </div>
        </div>
        <asp:Repeater ID="rptSections" runat="server" DataSourceID="odsSections" OnItemDataBound="rptSections_ItemDataBound">
            <ItemTemplate>
                <div class="field" style="padding-top: 5px; padding-bottom: 5px; font-weight: bold">
                    <%#DataBinder.Eval(Container.DataItem, "section_desc")%>
                    <asp:HiddenField ID="hfSectionId" runat="server" Value='<%#DataBinder.Eval(Container.DataItem, "section_id")%>' />
                </div>
                <div class="field">
                    <asp:CheckBoxList ID="cbItem" runat="server" RepeatColumns="4" Visible='<%#CompareType(DataBinder.Eval(Container.DataItem, "section_type"),WebConstants.SectionTypes.MULTIPLE_SELECT_LIST) %>'
                        DataSource='<%#DataSource(DataBinder.Eval(Container.DataItem, "section_id")) %>'
                        DataTextField="section_detail_desc" DataValueField="section_detail_id">
                    </asp:CheckBoxList>
                </div>
                <div class="text_field">
                    <asp:TextBox ID="tbItem" runat="server" TextMode="MultiLine" Rows="10" Width="500px"
                        Visible='<%#CompareType(DataBinder.Eval(Container.DataItem, "section_type"),WebConstants.SectionTypes.FREE_TEXT) %>'></asp:TextBox>
                </div>
            </ItemTemplate>
        </asp:Repeater>
        <div class="button_bar">
            <div style="float: left">
                <asp:Image ID="Image9" runat="server" ImageUrl="~/Images/btn_submit.jpg" />
            </div>
            <div style="float: left; height: 23px; padding-top: 8px; background-image: url('<%=this.ResolveClientUrl("~/images/btn_submit_mid.jpg")%>')">
                <asp:LinkButton ID="btnSave1" runat="server" Text="Save Details" OnClick="btnSave_Click"
                    CssClass="txt_white"></asp:LinkButton>
            </div>
            <div style="float: left">
                <asp:Image ID="Image10" runat="server" ImageUrl="~/Images/btn_submit_right.jpg" />
            </div>
            <div style="float: left; padding-left: 10px;">
                <asp:Image ID="Image11" runat="server" ImageUrl="~/Images/btn_submit.jpg" />
            </div>
            <div style="float: left; height: 23px; padding-top: 8px; background-image: url('<%=this.ResolveClientUrl("~/images/btn_submit_mid.jpg")%>')">
                <asp:LinkButton ID="btnBack1" runat="server" Text="Back" OnClick="btnBack_Click"
                    CssClass="txt_white"></asp:LinkButton>
            </div>
            <asp:Image ID="Image12" runat="server" ImageUrl="~/Images/btn_submit_right.jpg" />
        </div>
        <asp:ObjectDataSource ID="odsSections" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetByDocType" TypeName="DocumentTemplateTableAdapters.DocumentSectionTableAdapter">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="0" Name="co_id" SessionField="USER_CO_ID" Type="Int32" />
                <asp:QueryStringParameter DefaultValue="0" Name="dept_id" QueryStringField="depId"
                    Type="Int32" />
                <asp:QueryStringParameter DefaultValue="0" Name="doc_type_id" QueryStringField="docTypeId"
                    Type="Int32" />
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
