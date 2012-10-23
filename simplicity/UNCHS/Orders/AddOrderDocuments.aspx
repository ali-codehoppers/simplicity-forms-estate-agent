<%@ Page Language="C#" MasterPageFile="~/Common/Main.master" AutoEventWireup="true"
    CodeFile="AddOrderDocuments.aspx.cs" Inherits="Orders_AddOrderDocuments" Title="Simplicity4Business" %>

<%@ Register Assembly="eWorld.UI" Namespace="eWorld.UI" TagPrefix="ew" %>
<%@ Register Src="../Common/UserControls/TabControl.ascx" TagName="TabControl" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContentPlaceHolder" runat="Server">
    <link rel="stylesheet" type="text/css" href="<%=this.ResolveClientUrl("~/Common/StyleSheets/Tab.css")%>" />
    <link rel="stylesheet" type="text/css" href="<%=this.ResolveClientUrl("~/Includes/yui/build/container/assets/skins/sam/container.css")%>" />
    <script type="text/javascript" src="<%=this.ResolveClientUrl("~/Includes/yui/build/container/container-min.js")%>"></script>
    <style type="text/css">
        .field span
        {
            margin-left: 10px;
            width: 110px;
            display: inline-block;
        }
    </style>
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
    <uc1:TabControl ID="TabControl1" runat="server" Selected="Docs"></uc1:TabControl>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder" runat="Server">
    <div style="background-color: White; padding: 15px 10px 25px 10px; min-height: 200px;
        float: left; width: 97.65%">
        <div id="loadingDiv">
        </div>
        <script type="text/javascript">
            function showLoading() {
                var loadingDialog = new YAHOO.widget.Panel("loadingDiv",
                                                        { width: "240px",
                                                            fixedcenter: true,
                                                            close: false,
                                                            draggable: false,
                                                            zindex: 4,
                                                            modal: true,
                                                            visible: false
                                                        }
                                                    );

                loadingDialog.setHeader("Generating folder, please wait...");
                loadingDialog.setBody("<img src='../Images/loading.gif' />");
                loadingDialog.render();
                loadingDialog.show();
            }
    
        </script>
        <div class="field">
            <div style="padding: 5px">
                <div style="float: left">
                    <asp:Image ID="Image4" runat="server" Visible="false" ImageUrl="~/Images/btn_submit.jpg" />
                </div>
                <div style="float: left; height: 23px; padding-top: 8px; background-image: url('<%=this.ResolveClientUrl("~/images/btn_submit_mid.jpg")%>')">
                    <asp:HyperLink ID="hlDoc" CssClass="txt_white" runat="server" Visible="false" Target="_blank">Link to the Document</asp:HyperLink>
                </div>
                <asp:Image ID="Image5" runat="server" ImageUrl="~/Images/btn_submit_right.jpg" Visible="false" />
            </div>
        </div>
        <div style="clear: both">
        </div>
        <div class="field" style="float:left;width:50%;">
            <strong>
                <asp:Repeater ID="rptDocTypes" runat="server" DataSourceID="odsDocTypes">
                    <ItemTemplate>
                        <div class="field" style='<%#DataBinder.Eval(Container.DataItem, "style")%>; 
                            width:100%;display:block;'>
                            <asp:HiddenField ID="hfRequired" runat="server" Value='<%#DataBinder.Eval(Container.DataItem, "required")%>' />
                            <asp:HiddenField ID="hfCoId" runat="server" Value='<%#DataBinder.Eval(Container.DataItem, "co_id")%>' />
                            <asp:HiddenField ID="hfDeptId" runat="server" Value='<%#DataBinder.Eval(Container.DataItem, "dept_id")%>' />
                            <asp:HiddenField ID="hfId" runat="server" Value='<%#DataBinder.Eval(Container.DataItem, "doc_data_type_id")%>' />
                            <asp:HiddenField ID="hfFieldType" runat="server" Value='<%#DataBinder.Eval(Container.DataItem, "field_type")%>' />
                            <asp:HiddenField ID="hfGeneratorClass" runat="server" Value='<%#DataBinder.Eval(Container.DataItem, "generator_class")%>' />
                            <asp:HiddenField ID="hfIsLandScape" runat="server" Value='<%#DataBinder.Eval(Container.DataItem, "flg_landscape")%>' />
                            <div style="float: left;width:42%">
                                <asp:CheckBox ID="cbDocType" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "doc_data_type_desc")%>'
                                    Checked='<%#DataBinder.Eval(Container.DataItem, "flg_checked")%>'></asp:CheckBox>
                            </div>
                            <div>
                                <asp:Label runat="server" ID="Label123" Visible='<%# AreEqual(DataBinder.Eval(Container.DataItem,"field_type"),"int") %>'
                                    Text="#" width="15px"></asp:Label>
                                <ew:NumericBox Text="1" ID="nbNumOfPrints" runat="server" Visible='<%# AreEqual(DataBinder.Eval(Container.DataItem,"field_type"),"int") %>'
                                    Width="20px" MaxLength="2"></ew:NumericBox>
                            </div>
                        </div>
                        <div style="clear:both;padding-top: 7px;padding-bottom: 7px"></div>
                    </ItemTemplate>
                </asp:Repeater>
            </strong>
        </div>
        <div style="width:49%;float:left">
            <div class="field"  style="padding-top: 7px;padding-bottom: 7px;width:100%">
                <strong>
                    <asp:CheckBox ID="cbBlankPage" runat="server" Text='Include a blank paper after every copy'
                        Checked='true'></asp:CheckBox></strong></div>

            <div class="field"  style="padding-top: 7px;padding-bottom: 7px;width:100%">
                <strong>
                    <asp:CheckBox ID="cbRegister" runat="server" Text="Client provided a copy of asbestos register" /></strong>
            </div>
            <div class="field"  style="padding-top: 7px;padding-bottom: 7px;width:100%">
                <strong>
                    <asp:CheckBox ID="cbClosed" runat="server" Text="Health & Saftey Closed" /></strong>
            </div>
            <div class="field" style="padding-top: 7px;padding-bottom: 7px;width:100%">
                <div style="float: left; width:51%; padding-top: 7px">
                    <strong>Date Sent to Client:</strong>
                </div>
                <asp:TextBox runat="server" ID="dtClient" CssClass="field_txt_small"></asp:TextBox>
            </div>
            <div class="field" style="padding-top: 7px;padding-bottom: 7px;width:100%">
               <div class="button_bar">
                <div class="button_right" style="padding-right: 20px; float: left">
                    <div style="float: left">
                        <asp:Image ID="Image3" runat="server" ImageUrl="~/Images/btn_submit.jpg" />
                    </div>
                    <div style="float: left; height: 23px; padding-top: 8px; background-image: url('<%=this.ResolveClientUrl("~/images/btn_submit_mid.jpg")%>')">
                        <asp:LinkButton CssClass="txt_white" ID="btnCreate" runat="server" OnClick="btnCreate_Click"
                            OnClientClick="showLoading();" Style="margin-right: 10px; margin-left: 5px">Create Folder</asp:LinkButton>
                    </div>
                    <asp:Image ID="Image6" runat="server" ImageUrl="~/Images/btn_submit_right.jpg" />
                </div>
                <div class="button_right">
                    <div style="float: left">
                        <asp:Image ID="Image7" runat="server" ImageUrl="~/Images/btn_submit.jpg" />
                    </div>
                    <div style="float: left; height: 23px; padding-top: 8px; background-image: url('<%=this.ResolveClientUrl("~/images/btn_submit_mid.jpg")%>')">
                        <a href="" class="txt_white" onclick="window.opener='x';window.close();return false;">
                            Cancel</a>
                    </div>
                    <asp:Image ID="Image8" runat="server" ImageUrl="~/Images/btn_submit_right.jpg" />
                </div>
            </div>
            </div>
        </div>
        
        <asp:ObjectDataSource ID="odsDocTypes" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetDocTypeByDeptIdAndCategory" TypeName="DepartmentOrderDocTableAdapters.DocumentTypeTableAdapter">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="0" Name="dept_id" SessionField="DEPT_ID" Type="Int32" />
                <asp:SessionParameter DefaultValue="0" Name="co_id" SessionField="USER_CO_ID" Type="Int32" />
                <asp:Parameter DefaultValue="Method Statement" Name="category" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <div style="clear: both">
        </div>
        <hr />
        <div style="padding-top:15px;">
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
                            <HeaderStyle />
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
    <script type="text/javascript">
        $(function () {
            $('#<%=dtClient.ClientID%>').datepicker({ dateFormat: 'dd/mm/yy' });
        });
    </script>
</asp:Content>
