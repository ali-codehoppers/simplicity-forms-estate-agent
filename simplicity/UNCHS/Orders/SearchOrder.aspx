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
                Search H&amp;S Folder
            </div>
            <img src="<%=this.ResolveClientUrl("~/images/bc_right.jpg")%>" alt="" width="8" height="31" />
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder" runat="Server">
    <div style="background-color: White; padding: 15px 10px 25px 10px; min-height: 240px">
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
        <div class="field" style="padding-bottom: 5px;">
            <div style="width: 200px; float: left; font-weight: bold">
                <asp:Label ID="lblDepartment" CssClass="label" runat="server" Text="Department:">
                </asp:Label>
            </div>
            <asp:DropDownList ID="ddlDepartments" runat="server" AppendDataBoundItems="True"
                DataSourceID="odsDepartments" DataTextField="co_name_short" DataValueField="dept_id"
                OnDataBound="ddlDepartments_DataBound" CssClass="dropdown_txt">
            </asp:DropDownList>
        </div>
        <div style="clear:both">
        </div>
        <div class="field">
            <div style="width: 200px; float: left">
                <span class="label" style="width: 110px;"><strong>Reference:</strong></span>
            </div>
            <div style="padding-bottom: 5px;">
                <asp:TextBox ID="tbOrderRef" runat="server" CssClass="field_txt"></asp:TextBox>
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
                <span class="label" style="width: 110px;"><strong>Site Address:</strong></span>
            </div>
            <div style="padding-bottom: 5px;">
                <asp:TextBox ID="tbSiteAddress" runat="server" CssClass="field_txt"></asp:TextBox></div>
        </div>
        <div>
            <div style="width: 200px; float: left">
                <span style="width: 100px;"><strong>Order Date:</strong></span>
            </div>
            <div style="float: left;">
                <span class="label" style="width: 40px; padding-right: 10px; padding-top: 5px; float: left">
                    From:</span>
                <asp:TextBox runat="server" ID="tbDateFrom" CssClass="field_txt_small"></asp:TextBox>
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
        </div>
        <asp:ObjectDataSource ID="odsDepartments" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetDepartmentsByCoId" TypeName="DepartmentTableAdapters.DepartmentSelectCommandTableAdapter">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="0" Name="co_id" SessionField="USER_CO_ID" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="odsDeptOrder" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetSearchResults" TypeName="DepartmentOrderTableAdapters.DepartmentOrderSearchCommandTableAdapter">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlDepartments" DefaultValue="0" Name="dept_id"
                    PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="tbSiteAddress" DefaultValue="" Name="site_add" PropertyName="Text"
                    Type="String" />
                <asp:ControlParameter ControlID="tbOrderRef" Name="ord_ref" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="tbClientRef" Name="client_ref" PropertyName="Text"
                    Type="String" DefaultValue="" />
                <asp:ControlParameter ControlID="tbDateFrom" DefaultValue="" Name="from_date" PropertyName="Text" />
                <asp:ControlParameter ControlID="tbToDate" Name="to_date" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="tbPostCode" Name="postal_code" PropertyName="Text"
                    Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <div class="grid" style="margin-right: 15px;">
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True"
                CssClass="table_header_result" Style="width: 100%;" AutoGenerateColumns="False"
                DataKeyNames="sequence" OnRowDeleting="GridView1_RowDeleting" DataSourceID="odsDeptOrder"
                PageSize="50" OnRowCommand="GridView1_RowCommand">
                <Columns>
                    <asp:TemplateField HeaderText="Edit">
                        <ItemTemplate>
                            <center>
                                <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" ImageUrl="~/Images/icon_edit.png"
                                    CommandName="EditOrder" CommandArgument='<%# Eval("sequence") %>' AlternateText="Edit" />
                            </center>
                        </ItemTemplate>
                        <HeaderStyle Width="45px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Cancel">
                        <ItemTemplate>
                            <center>
                                <asp:ImageButton ID="ImageButton4" runat="server" CausesValidation="False" ImageUrl="~/Images/icon_cancel.png"
                                    Visible='<%#!Convert.ToBoolean(Eval("flg_cancelled"))%>' CommandName="CancelOrder"
                                    CommandArgument='<%# Eval("sequence") %>' AlternateText="Cancel" OnClientClick="return confirm('Are you sure you want to Cancel this order?');" />
                                <asp:ImageButton ID="ImageButton5" runat="server" CausesValidation="False" ImageUrl="~/Images/un_cancel_order.png"
                                    Visible='<%#Convert.ToBoolean(Eval("flg_cancelled"))%>' CommandName="UncancelOrder"
                                    CommandArgument='<%# Eval("sequence") %>' AlternateText="Uncancel" OnClientClick="return confirm('Are you sure you want to Uncancel this order?');" />
                            </center>
                        </ItemTemplate>
                        <HeaderStyle Width="45px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Clone">
                        <ItemTemplate>
                            <center>
                                <img alt="Clone" src="../Images/icon_clone.png" onclick='showCopyDialog(<%# Eval("sequence")%>)'
                                    style="cursor: pointer" />
                            </center>
                        </ItemTemplate>
                        <HeaderStyle Width="45px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Print">
                        <ItemTemplate>
                            <center>
                                <asp:HyperLink NavigateUrl='<%#"~/Orders/OrderLog.aspx?deptOrderId=" +  Eval("sequence") %>'
                                    runat="server" Style="text-decoration: none">
                        <img alt="Print" src="../Images/icon_print.png" style="border:0px;" />
                                </asp:HyperLink>
                            </center>
                        </ItemTemplate>
                        <HeaderStyle Width="45px" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="order_sms" HeaderText="SMS Reference" SortExpression="order_sms">
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="Address" SortExpression="address_post_code">
                        <ItemTemplate>
                            <div id="addressText<%# Eval("sequence") %>" onmouseover='showCompleteAddress(<%# Eval("sequence") %>);'
                                onmouseout='hideCompleteAddress(<%# Eval("sequence") %>);'>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("address_no") %> '></asp:Label>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("address_line1") %> '></asp:Label>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("address_post_code") %>'></asp:Label>
                            </div>
                            <div id="addressDetail<%# Eval("sequence") %>" class="addressArea" style="position: absolute;
                                display: none; background-color: White; border: solid 1px #000; color: Black;
                                width: 400px">
                                <div style="text-align: center; margin-top: 5px; margin-bottom: 5px;">
                                    <b>Brief Description of Works</b>
                                </div>
                                <div>
                                    <%# Eval("desc_of_work")%>
                                </div>
                                <hr />
                                <div style="text-align: center; margin-top: 5px; margin-bottom: 5px;">
                                    <b>Address</b>
                                </div>
                                <div>
                                    <span>House/Flat No:</span><%# Eval("address_no") %></div>
                                <div>
                                    <span>Address: </span>
                                    <%# Eval("address_line1")%>
                                </div>
                                <div>
                                    <span></span>
                                    <%# Eval("address_line2")%>
                                </div>
                                <div>
                                    <span></span>
                                    <%# Eval("address_line3")%>
                                </div>
                                <div>
                                    <span></span>
                                    <%# Eval("address_line4")%>
                                </div>
                                <div>
                                    <span></span>
                                    <%# Eval("address_line5")%>
                                </div>
                                <div>
                                    <span>Postal Code:</span><%# Eval("address_post_code")%></div>
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="date_order_created" HeaderText="Date Created" SortExpression="date_order_created"
                        DataFormatString="{0:dd/MM/yyyy}"></asp:BoundField>
                    <asp:BoundField DataField="date_order_review" HeaderText="Review Date" SortExpression="date_order_review"
                        DataFormatString="{0:dd/MM/yyyy}"></asp:BoundField>
                    <asp:TemplateField HeaderText="Risk Assessments" SortExpression="num_of_risk_assessments">
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("num_of_risk_assessments") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
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
            $('#<%=tbDateFrom.ClientID%>').datepicker({ dateFormat: 'dd/mm/yy' });
            $('#<%=tbToDate.ClientID%>').datepicker({ dateFormat: 'dd/mm/yy' });
        });
    </script>
</asp:Content>
