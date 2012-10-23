<%@ Page Language="C#" MasterPageFile="~/Common/Main.master" AutoEventWireup="true"
    CodeFile="AddOrderHazard.aspx.cs" Inherits="Orders_AddOrderHazard" Title="Simplicity4Business" %>

<%@ Register Src="../Common/UserControls/TabControl.ascx" TagName="TabControl" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContentPlaceHolder" runat="Server">
    <link rel="stylesheet" type="text/css" href="<%=this.ResolveClientUrl("~/Common/StyleSheets/Tab.css")%>" />
    <link rel="stylesheet" type="text/css" href="<%=this.ResolveClientUrl("~/Includes/yui/build/button/assets/skins/sam/button.css")%>" />
    <link rel="stylesheet" type="text/css" href="<%=this.ResolveClientUrl("~/Includes/yui/build/container/assets/skins/sam/container.css")%>" />
    <script type="text/javascript" src="<%=this.ResolveClientUrl("~/Includes/yui/build/container/container-min.js")%>"></script>
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
                    Add/Amend H&amp;S Folder - Key Hazards
                </div>
                <img src="<%=this.ResolveClientUrl("~/images/bc_right.jpg")%>" alt="" width="8" height="31" />
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="TabPlaceHolder" runat="Server">
    <uc1:TabControl ID="TabControl1" runat="server" Selected="Key Hazards" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder" runat="Server">
    <script type="text/javascript">
        var hazardDialog;
    </script>
    <div style="background-color: White; padding: 15px 10px 25px 10px; min-height: 240px;
        float: left; width: 97.65%">
        <div class="warning_text" style="padding-top: 10px; padding-bottom: 10px;">
            <strong>Data may go to continuation sheet if it exceeds the number of records.</strong></div>
        <div id="hazardDialog" style="display: none">
            <div class="hd">
                Select Hazards to Add:</div>
            <div class="bd" style="overflow: auto; height: 400px;">
                <div class="field">
                    <asp:Repeater ID="rptHazards" runat="server" OnItemDataBound="rptHazards_ItemDataBound">
                        <ItemTemplate>
                            <asp:HiddenField ID="hfCategoryName" runat="server" Value='<%# Container.DataItem %>' />
                            <fieldset>
                                <legend><b>
                                    <%# Container.DataItem %></b></legend>
                                <asp:CheckBoxList ID="cbHazards" runat="server" RepeatColumns="3" Width="100%">
                                </asp:CheckBoxList>
                            </fieldset>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
            <div class="ft">
                <div style="float: left; padding-left: 10px;">
                    <asp:Image ID="Image9" runat="server" ImageUrl="~/Images/btn_submit.jpg" />
                </div>
                <div style="float: left; height: 23px; padding-top: 8px; background-image: url('<%=this.ResolveClientUrl("~/images/btn_submit_mid.jpg")%>')">
                    <asp:LinkButton ID="btnAddHazards" runat="server" OnClick="btnAddHazards_Click" CssClass="txt_white">Add Hazard</asp:LinkButton>
                </div>
                <div style="float: left">
                    <asp:Image ID="Image10" runat="server" ImageUrl="~/Images/btn_submit_right.jpg" />
                </div>
                <div style="clear: both">
                </div>
            </div>
        </div>
        <div class="field">
            <span class="heading"><strong>Key Hazard:</strong></span>
        </div>
        <div class="text_field">
            <asp:TextBox ID="tbHazard" runat="server" Rows="5" TextMode="MultiLine" Width="98%"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ValidationGroup="Hazard"
                ErrorMessage="*" ControlToValidate="tbHazard"></asp:RequiredFieldValidator>
        </div>
        <!--<div class="grid_area">-->
        <div class="grid">
            <asp:GridView ID="gvHazard" runat="server" DataSourceID="odsOrderHazard" OnRowDeleting="gvHazard_RowDeleting"
                OnRowUpdating="gvHazard_RowUpdating" DataKeyNames="sequence" AutoGenerateColumns="False"
                AllowSorting="True" AllowPaging="True" PageSize="50" CssClass="table_header_result"
                Width="100%">
                <Columns>
                    <asp:TemplateField HeaderText="Edit">
                        <EditItemTemplate>
                            <center>
                                <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="True" CommandName="Update"
                                    ImageUrl="~/Images/icon_edit.png" AlternateText="Update"></asp:ImageButton>
                            </center>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <center>
                                <asp:ImageButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit"
                                    ImageUrl="~/Images/icon_edit.png" AlternateText="Edit"></asp:ImageButton>
                            </center>
                        </ItemTemplate>
                        <HeaderStyle Width="45px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Delete">
                        <EditItemTemplate>
                            <center>
                                <asp:ImageButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel"
                                    ImageUrl="~/Images/icon_cancel.png" AlternateText="Cancel"></asp:ImageButton>
                            </center>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <center>
                                <asp:ImageButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete"
                                    ImageUrl="~/Images/icon_cancel.png" AlternateText="Delete" OnClientClick="return confirm('Are you sure you want to delete this record?');">
                                </asp:ImageButton>
                            </center>
                        </ItemTemplate>
                        <HeaderStyle Width="45px" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="hazard_desc" HeaderText="Hazard" SortExpression="hazard_desc">
                    </asp:BoundField>
                </Columns>
                <PagerStyle CssClass="grid_pager" />
                <FooterStyle CssClass="grid_footer" />
                <HeaderStyle CssClass="table_header" />
                <SelectedRowStyle CssClass="grid_selected_row" />
                <AlternatingRowStyle CssClass="grid_alternating_row" />
                <RowStyle CssClass="grid_row" />
            </asp:GridView>
        </div>
        <!--</div>-->
        <div class="float-none">
        </div>
        <asp:ObjectDataSource ID="odsOrderHazard" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetAllHazards" TypeName="DepartmentOrderDetailTableAdapters.DepartmentOrderHazardTableAdapter"
            DeleteMethod="Delete" InsertMethod="Insert" UpdateMethod="Update">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="0" Name="dept_id" SessionField="DEPT_ID" Type="Int32" />
                <asp:SessionParameter DefaultValue="0" Name="co_id" SessionField="USER_CO_ID" Type="Int32" />
                <asp:QueryStringParameter DefaultValue="0" Name="order_seq" QueryStringField="deptOrderId"
                    Type="Int32" />
            </SelectParameters>
            <DeleteParameters>
                <asp:Parameter Name="user_id" Type="Int32" />
                <asp:Parameter Name="sequence" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="hazard_desc" Type="String" />
                <asp:Parameter Name="user_id" Type="Int32" />
                <asp:Parameter Name="sequence" Type="Int32" />
                <asp:Parameter Name="original_sequence" Type="Int32" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="dept_id" Type="Int32" />
                <asp:Parameter Name="co_id" Type="Int32" />
                <asp:Parameter Name="order_seq" Type="Int32" />
                <asp:Parameter Name="hazard_desc" Type="String" />
                <asp:Parameter Name="user_id" Type="Int32" />
            </InsertParameters>
        </asp:ObjectDataSource>
        <div class="button_bar">
            <div class="button_right" style="padding-left: 340px;">
                <div style="float: left">
                    <asp:Image ID="Image3" runat="server" ImageUrl="~/Images/btn_submit.jpg" />
                </div>
                <div style="float: left; height: 23px; padding-top: 8px; background-image: url('<%=this.ResolveClientUrl("~/images/btn_submit_mid.jpg")%>')">
                    <asp:LinkButton ID="btnAddHazard" runat="server" OnClick="btnAddHazard_Click" ValidationGroup="Hazard"
                        Style="margin-right: 10px; margin-left: 5px" CssClass="txt_white">Add Hazard</asp:LinkButton>
                </div>
                <div style="float: left">
                    <asp:Image ID="Image4" runat="server" ImageUrl="~/Images/btn_submit_right.jpg" />
                </div>
                <div style="float: left; padding-left: 15px;">
                    <asp:Image ID="Image5" runat="server" ImageUrl="~/Images/btn_submit.jpg" />
                </div>
                <div style="float: left; height: 23px; padding-top: 8px; background-image: url('<%=this.ResolveClientUrl("~/images/btn_submit_mid.jpg")%>')">
                    <a class="txt_white" onclick="document.getElementById('hazardDialog').style.display='block';hazardDialog.show();return false;"
                        href="">Key Hazards List</a>
                </div>
                <asp:Image ID="Image6" runat="server" ImageUrl="~/Images/btn_submit_right.jpg" />
            </div>
        </div>
        <div class="button_right" style="float: left; padding-left: 340px; padding-top: 20px">
            <asp:ImageButton ID="btnBack" runat="server" OnClick="btnBack_Click" ImageUrl="~/Images/btn_pre.jpg" />
        </div>
        <div class="button_right" style="padding-top: 20px">
            <asp:ImageButton ID="btnNext" runat="server" OnClick="btnNext_Click" ImageUrl="~/Images/btn_next.jpg" />
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
        // Instantiate the Dialog
        hazardDialog = new YAHOO.widget.Dialog("hazardDialog",
							{ width: "980px",
							    fixedcenter: true,
							    close: true,
							    zindex: 3,
							    modal: true,
							    visible: false,
							    constraintoviewport: false,
							    draggable: true
							});
        hazardDialog.render();

    </script>
</asp:Content>
