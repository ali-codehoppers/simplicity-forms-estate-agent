<%@ Page Language="C#" MasterPageFile="~/Common/Main.master" AutoEventWireup="true"
    CodeFile="SearchOrder.aspx.cs" Inherits="Orders_SearchOrder" Title="Simplicity4Business"
    EnableEventValidation="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContentPlaceHolder" runat="Server">
    <style type="text/css">
        .text_field span
        {
            width: 340px;
            padding-bottom: 8px;
            font-weight: bold;
            font-size: 12px;
        }
        .text_field_dialog
        {
            padding-bottom: 8px;
            font-weight: bold;
            font-size: 12px;
        }
        .ddl_margin
        {
            width: 340px;
            padding-bottom: 10px;
            font-weight: bold;
        }
    </style>
    <script type="text/javascript">
        var copyDialog;
        function showCopyDialog(sourceOrderId) {
            document.getElementById('<%=hfSourceOrderId.ClientID%>').value = sourceOrderId;
            document.getElementById('copyDialog').style.display = 'block';
            copyDialog.show();
        }
        function renderDialog() {
            copyDialog = new YAHOO.widget.Dialog("copyDialog",
							    { width: "650px",
							        fixedcenter: true,
							        close: true,
							        zindex: 3,
							        modal: true,
							        visible: false,
							        constraintoviewport: false,
							        draggable: true
							    });
            copyDialog.render();

        }
        YAHOO.util.Event.onDOMReady(renderDialog);
    </script>
    <script type="text/javascript">
        function showCompleteAddress(id) {
            $('div#addressDetail' + id).show();
        }
        function hideCompleteAddress(id) {
            $('div#addressDetail' + id).hide();
        }
    </script>
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
    <div style="background-color: White; border-top: 1px solid white;">
        <div style="margin: auto; width: 98%;">
            <div style="float: left">
                <img src="<%=this.ResolveClientUrl("~/images/bc_left.jpg")%>" alt="" width="8" height="31" /></div>
            <div class="breadcrum_mid" style="height: 23px; padding-top: 8px; float: left; width: 96%">
                Search E&amp;A Property
            </div>
            <img src="<%=this.ResolveClientUrl("~/images/bc_right.jpg")%>" alt="" width="8" height="31" />
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder" runat="Server">
    <div style="background-color: White; padding: 15px 10px 70px 10px; min-height: 240px">
        <div id="copyDialog" style="display: none">
            <div class="hd">
                Enter the Address for new folder:</div>
            <div class="bd">
                <div class="text_field_dialog">
                    <asp:HiddenField ID="hfSourceOrderId" runat="server" />
                    <div style="float: left; width: 300px;">
                        <span>House/Flat No:</span>
                    </div>
                    <asp:TextBox ID="tbAddressNo" runat="server" CssClass="field_txt"></asp:TextBox>
                </div>
                <div class="text_field_dialog">
                    <div style="float: left; width: 300px;">
                        <span>Address:</span>
                    </div>
                    <asp:TextBox ID="tbAddress1" runat="server" CssClass="field_txt"></asp:TextBox>
                </div>
                <div class="text_field_dialog">
                    <div style="float: left; width: 300px;">
                        &nbsp;
                    </div>
                    <asp:TextBox ID="tbAddress2" runat="server" CssClass="field_txt"></asp:TextBox>
                </div>
                <div class="text_field_dialog">
                    <div style="float: left; width: 300px;">
                        &nbsp;
                    </div>
                    <asp:TextBox ID="tbAddress3" runat="server" CssClass="field_txt"></asp:TextBox>
                </div>
                <div class="text_field_dialog">
                    <div style="float: left; width: 300px;">
                        &nbsp;
                    </div>
                    <asp:TextBox ID="tbAddress4" runat="server" CssClass="field_txt"></asp:TextBox></div>
                <div class="text_field_dialog">
                    <div style="float: left; width: 300px;">
                        &nbsp;
                    </div>
                    <asp:TextBox ID="tbAddress5" runat="server" CssClass="field_txt"></asp:TextBox>
                </div>
                <div class="text_field_dialog">
                    <div style="float: left; width: 300px;">
                        <span>Postal Code:</span>
                    </div>
                    <asp:TextBox ID="tbPostalCode" runat="server" CssClass="field_txt"></asp:TextBox>
                </div>
            </div>
            <div class="ft" style="text-align: center">
                <div style="float: left; padding-left: 10px;">
                    <asp:Image ID="Image3" runat="server" ImageUrl="~/Images/btn_submit.jpg" />
                </div>
                <div style="float: left; height: 23px; padding-top: 8px; background-image: url('<%=this.ResolveClientUrl("~/images/btn_submit_mid.jpg")%>')">
                    <asp:LinkButton ID="btnCopy" runat="server" OnClick="btnCopy_Click" CssClass="txt_white">Copy</asp:LinkButton>
                </div>
                <div style="float: left">
                    <asp:Image ID="Image4" runat="server" ImageUrl="~/Images/btn_submit_right.jpg" />
                </div>
                <div style="clear: both">
                </div>
            </div>
        </div>
        <div class="info_message" style="padding-top: 10px; padding-bottom: 10px;">
            <div class="error_msg_search">
                <div style="float: left; padding: 8px;">
                    <asp:Image ID="Image7" ImageUrl="~/Images/success.png" runat="server" />
                </div>
                <div>
                    You can use % as a wildcard next to other characters to improve your search results.
                    For example, %ad% or ad% returns all records with a word in one of the searched
                    fields that begins with "ad".
                </div>
            </div>
        </div>
        <%--<div class="field">
            <div style="width: 200px; float: left">
                <span class="label" style="width: 110px;"><strong>Valuation Code:</strong></span>
            </div>
            <div style="padding-bottom: 5px;">
                <asp:TextBox ID="tbValuationCode" runat="server" CssClass="field_txt"></asp:TextBox>
            </div>            
        </div>
        <div class="field">
            <div style="width: 200px; float: left">
                <span class="label" style="width: 110px;"><strong>Post Code:</strong></span>
            </div>
            <div style="padding-bottom: 5px;">
                <asp:TextBox ID="tbPostCode" runat="server" CssClass="field_txt"></asp:TextBox></div>
        </div>
        <div class="field">
            <div style="width: 200px; float: left">
                <span class="label" style="width: 110px;"><strong>Address:</strong></span>
            </div>
            <div style="padding-bottom: 5px;">
                <asp:TextBox ID="tbAddress" runat="server" CssClass="field_txt"></asp:TextBox></div>
        </div>
        <div>
            <div style="width: 200px; float: left">
                <span style="width: 100px;"><strong>Date:</strong></span>
            </div>
            <div style="float: left;">
                <span class="label" style="width: 40px; padding-right: 10px; padding-top: 5px; float: left">
                    From:</span>
                <asp:TextBox runat="server" ID="tbFromDate" CssClass="field_txt_small"></asp:TextBox>
            </div>
            <div>
                <span class="label" style="width: 25px; padding-right: 10px; padding-left: 10px;
                    padding-top: 5px; float: left">To:</span>
                <asp:TextBox runat="server" ID="tbToDate" CssClass="field_txt_small"></asp:TextBox>
            </div>
        </div>
        <div class="field" style="display: none;">
            <div style="width: 200px; float: left">
                <span class="label">Client Reference:</span>
            </div>
            <asp:TextBox ID="tbClientRef" runat="server"></asp:TextBox>
        </div>
        <div class="button_bar">
            <div style="float: left; width: 200px; display: block">
                &nbsp;
            </div>
            <div style="float: left;">
                <asp:Image ID="Image5" runat="server" ImageUrl="~/Images/btn_submit.jpg" />
            </div>
            <div style="float: left; height: 23px; padding-top: 8px; background-image: url('<%=this.ResolveClientUrl("~/images/btn_submit_mid.jpg")%>')">
                <asp:LinkButton ID="btnSearch" runat="server" OnClick="btnSearch_Click" CssClass="txt_white">Search</asp:LinkButton>
            </div>
            <asp:Image ID="Image6" runat="server" ImageUrl="~/Images/btn_submit_right.jpg" />
        </div>--%>

        <div class="field" style="height:70px; width:98%;">
            <div style="width: 110px; height:50px; padding-bottom:5px; display:inline-block; float:left;">
                <div style="height:25px; padding-bottom:5px;padding-top:4px;">
                    <span class="label" style="height:24px;">Valuation Code:</span>
                </div>
                <div style="height:25px;padding-top:4px;">
                    <span class="label" style="height:24px;">Address:</span>
                </div>
            </div>
            <div style="height:50px; width:270px; padding-bottom:5px; display:inline-block; float:left;">
                <div style="height:25px; padding-bottom:5px;">
                    <asp:TextBox ID="tbValuationCode" runat="server" CssClass="field_txt" style="width:260px;"></asp:TextBox>
                </div>
                <div style="height:25px;">
                    <asp:TextBox ID="tbAddress" runat="server" CssClass="field_txt" style="width:260px;"></asp:TextBox>
                </div>
            </div>

            <div style="width: 80px; height:50px; padding-bottom:5px; display:inline-block; float:left; padding-left:70px;">
                <div style="height:25px; padding-bottom:5px;padding-top:4px;">
                    <span class="label" style="width: 40px; padding-right: 10px; padding-top: 5px;">Date:</span>
                    <span class="label" style="width: 40px; padding-right: 10px; padding-top: 5px;">From:</span>
                </div>
                <div style="height:25px;padding-top:4px;">
                    <span class="label" style="width: 110px;">Post Code:</span>
                </div>
            </div>

            <div style="width: 110px; height:50px; padding-bottom:5px; display:inline-block; float:left;">
                <div style="height:25px; padding-bottom:5px;">
                    <asp:TextBox runat="server" ID="tbFromDate" CssClass="field_txt_small"></asp:TextBox>
                </div>
                <div style="height:25px; padding-bottom:5px;">
                    <asp:TextBox ID="tbPostCode" runat="server" CssClass="field_txt_small"></asp:TextBox>
                </div>
            </div>

            <div style="width: 50px; height:50px; padding-bottom:5px; display:inline-block; float:left;">
                <div style="height:25px; float:right;padding-top:4px;">
                    <span class="label" style="width: 25px; padding-left: 10px;">To:</span>
                </div>
            </div>

            <div style="width: 110px; height:50px; padding-bottom:5px; display:inline-block; float:right;">
                <div style="height:25px; float:right; padding-bottom:5px;">
                    <asp:TextBox runat="server" ID="tbToDate" CssClass="field_txt_small"></asp:TextBox>
                </div>
                <div style="height:25px; float:right;">
                    <div style="float: left;">
                        <asp:Image ID="Image5" runat="server" ImageUrl="~/Images/btn_submit.jpg" />
                    </div>
                    <div style="float: left; height: 23px; padding-top: 8px; background-image: url('<%=this.ResolveClientUrl("~/images/btn_submit_mid.jpg")%>')">
                        <asp:LinkButton ID="btnSearch" runat="server" OnClick="btnSearch_Click" CssClass="txt_white">Search</asp:LinkButton>
                    </div>
                    <asp:Image ID="Image6" runat="server" ImageUrl="~/Images/btn_submit_right.jpg" />
                </div>
            </div>
            <div style="clear:both;"></div>
        </div>

        <div class="grid" style="margin-right: 15px;">
            <asp:EntityDataSource ID="edsProperties" runat="server" ConnectionString="name=SimplicityWebEstateAgentEntities" DefaultContainerName="SimplicityWebEstateAgentEntities" EnableFlattening="False" EntitySetName="PropertyDetails" EntityTypeFilter="PropertyDetail">
            </asp:EntityDataSource>
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True"
                CssClass="table_header_result" Style="width: 100%;" AutoGenerateColumns="False"
                DataKeyNames="sequence" OnRowDeleting="GridView1_RowDeleting"
                PageSize="50" OnRowCommand="GridView1_RowCommand" DataSourceID="edsProperties">
                <Columns>
                    <asp:TemplateField HeaderText="Edit">
                        <ItemTemplate>
                            <center>
                                <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" ImageUrl="~/Images/icon_edit.png"
                                    CommandName="EditOrder" CommandArgument='<%# Eval("Sequence") %>' AlternateText="Edit" />
                            </center>
                        </ItemTemplate>
                        <HeaderStyle Width="45px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="(Delete)">
                        <ItemTemplate>
                            <center>
                                <asp:ImageButton ID="ImageButton4" runat="server" CausesValidation="False" ImageUrl="~/Images/icon_cancel.png"
                                    Visible='<%#!Convert.ToBoolean(Eval("FlgDeleted"))%>' CommandName="CancelOrder"
                                    CommandArgument='<%# Eval("Sequence") %>' AlternateText="Cancel" OnClientClick="return confirm('Are you sure you want to Cancel this order?');" />
                                <asp:ImageButton ID="ImageButton5" runat="server" CausesValidation="False" ImageUrl="~/Images/un_cancel_order.png"
                                    Visible='<%#Convert.ToBoolean(Eval("FlgDeleted"))%>' CommandName="UncancelOrder"
                                    CommandArgument='<%# Eval("Sequence") %>' AlternateText="Uncancel" OnClientClick="return confirm('Are you sure you want to Uncancel this order?');" />
                            </center>
                        </ItemTemplate>
                        <HeaderStyle Width="45px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Clone">
                        <ItemTemplate>
                            <center>
                                <img alt="Clone" src="../Images/icon_clone.png" onclick='showCopyDialog(<%# Eval("Sequence")%>)'
                                    style="cursor: pointer" />
                            </center>
                        </ItemTemplate>
                        <HeaderStyle Width="45px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Print">
                        <ItemTemplate>
                            <center>
                                <asp:HyperLink NavigateUrl='<%#"~/Orders/Print.aspx?propertyId=" +  Eval("Sequence") %>'
                                    runat="server" Style="text-decoration: none">
                        <img alt="Print" src="../Images/icon_print.png" style="border:0px;" />
                                </asp:HyperLink>
                            </center>
                        </ItemTemplate>
                        <HeaderStyle Width="45px" />
                    </asp:TemplateField>

                    <asp:BoundField DataField="ValuationCode" HeaderText="Valuation Code"> </asp:BoundField>

                    <asp:TemplateField HeaderText="Address" SortExpression="AdressPostCode">
                        <ItemTemplate>
                            <div id="addressText<%# Eval("Sequence") %>" onmouseover='showCompleteAddress(<%# Eval("Sequence") %>);'
                                onmouseout='hideCompleteAddress(<%# Eval("Sequence") %>);'>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("AddressNo") %> '></asp:Label>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("AddressLine1") %> '></asp:Label>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("AddressPostCode") %>'></asp:Label>
                            </div>
                            <div id="addressDetail<%# Eval("Sequence") %>" class="addressArea" style="position: absolute;
                                display: none; background-color: White; border: solid 1px #000; color: Black;
                                width: 400px">
                                <div style="text-align: center; margin-top: 5px; margin-bottom: 5px;">
                                    <b>Property Summary</b>
                                </div>
                                <div>
                                    <%# Eval("PropSummary")%>
                                </div>
                                <hr />
                                <div style="text-align: center; margin-top: 5px; margin-bottom: 5px;">
                                    <b>Address</b>
                                </div>
                                <div>
                                    <span>House/Flat No:</span><%# Eval("AddressNo") %></div>
                                <div>
                                    <span>Address: </span>
                                    <%# Eval("AddressLine1")%>
                                </div>
                                <div>
                                    <span></span>
                                    <%# Eval("AddressLine2")%>
                                </div>
                                <div>
                                    <span></span>
                                    <%# Eval("AddressLine3")%>
                                </div>
                                <div>
                                    <span></span>
                                    <%# Eval("AddressLine4")%>
                                </div>
                                <div>
                                    <span></span>
                                    <%# Eval("AddressLine5")%>
                                </div>
                                <div>
                                    <span>Postal Code:</span><%# Eval("AddressPostCode")%></div>
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="DateCreated" HeaderText="Date Created" SortExpression="DateCreated"
                        DataFormatString="{0:dd/MM/yyyy}"></asp:BoundField>
                </Columns>
                <PagerStyle CssClass="grid_pager" />
                <FooterStyle CssClass="grid_footer" />
                <SelectedRowStyle CssClass="grid_selected_row" />
                <HeaderStyle CssClass="table_header_search" />
                <AlternatingRowStyle CssClass="grid_alternating_row" />
                <RowStyle CssClass="grid_row" />
                <PagerSettings PageButtonCount="100" />
            </asp:GridView>
        </div>
        <div class="button_bar">
            <div style="float: left; display: block">
                &nbsp;
            </div>
            <div style="float: left;">
                <asp:Image ID="Image8" runat="server" ImageUrl="~/Images/btn_submit.jpg" />
            </div>
            <div style="float: left; height: 23px; padding-top: 8px; background-image: url('<%=this.ResolveClientUrl("~/images/btn_submit_mid.jpg")%>')">
                <asp:LinkButton ID="CreateNewPropertyButton" runat="server" OnClick="btnCreate_Click" CssClass="txt_white">Create</asp:LinkButton>
            </div>
            <asp:Image ID="Image9" runat="server" ImageUrl="~/Images/btn_submit_right.jpg" />
        </div>
    </div>
    <div style="float: left; width: 100%;">
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
            $('#<%=tbFromDate.ClientID%>').datepicker({ dateFormat: 'dd/mm/yy' });
            $('#<%=tbToDate.ClientID%>').datepicker({ dateFormat: 'dd/mm/yy' });
        });
    </script>
</asp:Content>
