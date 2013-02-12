<%@ Page Language="C#" MasterPageFile="~/Common/Main.master" AutoEventWireup="true"
    CodeFile="AddOrder.aspx.cs" Inherits="Orders_AddOrder" Title="Simplicity4Business" %>

<%@ Register Src="../Common/UserControls/TabControl.ascx" TagName="TabControl" TagPrefix="uc1" %>
<%@ Register Assembly="eWorld.UI" Namespace="eWorld.UI" TagPrefix="ew" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContentPlaceHolder" runat="Server">
    <link rel="stylesheet" type="text/css" href="<%=this.ResolveClientUrl("~/Common/StyleSheets/Tab.css")%>" />
    <style type="text/css">
        .text_area {
            padding:0px;
        }
        .text_field_dialog span
        {
            width: 300px;
            height: 100%;
            display: inline-block;
            padding-bottom: 8px;
            font-weight: bold;
            font-size: 12px;
        }
        .text_field span
        {
            width: 400px;
            display: inline-block;
            padding-bottom: 8px;
            font-weight: bold;
            font-size: 12px;
        }
        .field span
        {
            width: 400px;
            display: inline-block;
            padding-bottom: 10px;
            font-weight: bold;
        }
        .ddl_field span
        {
            width: 400px;
            display: inline-block;
            padding-bottom: 10px;
            font-weight: bold;
        }
        .PropertyDetailButtons
        {
            height:2.5em;
            width:7.5em;
            font-size:1.5em;
            background-color:#4479AF;
            border-radius:5px;
            font-weight:bolder;
            margin-top:5px;
        }
        a.txt_blue:link, a.txt_blue:visited {
            color:white;
        }
        #leftMenuDiv
        {
            height: 1180px;
        }
    </style>
    <script type="text/javascript">

        var copyDialog;
        function showCopyDialog() {

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
        function popupCalendar() {
            var dateField = document.getElementById('dateField');

            // toggle the div
            if (dateField.style.display == 'none')
                dateField.style.display = 'block';
            else
                dateField.style.display = 'none';
        }
</script>
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
                    Add/Amend Property Details
                </div>
                <img src="<%=this.ResolveClientUrl("~/images/bc_right.jpg")%>" alt="" width="8" height="31" />
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="TabPlaceHolder" runat="Server">
    <uc1:TabControl ID="TabControl1" runat="server" Selected="Main"></uc1:TabControl>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder" runat="Server">
    <div id="copyDialog" style="display: none;">
        <div class="hd">
            Enter the Address for new property:</div>
        <div class="bd">
            <div class="text_field_dialog">
                <asp:HiddenField ID="HiddenField1" runat="server" />
                <span>House/Flat No:</span><asp:TextBox ID="tbPopupFlat" runat="server" CssClass="field_txt"></asp:TextBox>
            </div>
            <div class="text_field_dialog">
                <span>Address:</span><asp:TextBox ID="tbPopupAddress1" runat="server" CssClass="field_txt"></asp:TextBox>
            </div>
            <div class="text_field_dialog" style="padding-left: 300px; padding-bottom: 5px;">
                <asp:TextBox ID="tbPopupAddress2" runat="server" CssClass="field_txt"></asp:TextBox>
            </div>
            <div class="text_field_dialog" style="padding-left: 300px; padding-bottom: 5px;">
                <asp:TextBox ID="tbPopupAddress3" runat="server" CssClass="field_txt"></asp:TextBox>
            </div>
            <div class="text_field_dialog" style="padding-left: 300px; padding-bottom: 5px;">
                <asp:TextBox ID="tbPopupAddress4" runat="server" CssClass="field_txt"></asp:TextBox></div>
            <div class="text_field_dialog" style="padding-left: 300px; padding-bottom: 5px;">
                <asp:TextBox ID="tbPopupAddress5" runat="server" CssClass="field_txt"></asp:TextBox>
            </div>
            <div class="text_field_dialog">
                <span>Postal Code:</span><asp:TextBox ID="tbPopupPostCode" runat="server" CssClass="field_txt"></asp:TextBox>
            </div>
        </div>
        <div class="ft" style="text-align: center">
            <div style="float: left">
                <asp:Image ID="Image3" runat="server" ImageUrl="~/Images/btn_submit.jpg" />
            </div>
            <div style="float: left; height: 23px; padding-top: 8px; background-image: url('<%=this.ResolveClientUrl("~/images/btn_submit_mid.jpg")%>')">
                <asp:LinkButton ID="btnCreate" runat="server" OnClick="btnCreate_Click" CssClass="txt_white"
                    Width="150px">Continue</asp:LinkButton>
            </div>
            <div style="float: left">
                <asp:Image ID="Image4" runat="server" ImageUrl="~/Images/btn_submit_right.jpg" />
            </div>
            <div style="float: left; padding-left: 10px;">
                <asp:Image ID="Image5" runat="server" ImageUrl="~/Images/btn_submit.jpg" />
            </div>
            <div style="float: left; height: 23px; padding-top: 8px; background-image: url('<%=this.ResolveClientUrl("~/images/btn_submit_mid.jpg")%>')">
                <asp:LinkButton PostBackUrl="~/Orders/SearchOrder.aspx" ID="cancel" runat="server" CssClass="txt_white"
                    Width="150px">Cancel</asp:LinkButton>
            </div>
            <div style="float: left">
                <asp:Image ID="Image6" runat="server" ImageUrl="~/Images/btn_submit_right.jpg" />
            </div>
            <div style="clear: both">
            </div>
        </div>
    </div>
    <div style="float: left; width: 97.65%; background-color: White; padding: 15px 10px 25px 10px;">
        <div class="text_field" style="height:27px;">
            <asp:HiddenField ID="hfSourceOrderId" runat="server" />
            <asp:Label ID="lblDepartment" runat="server" Text="Department:"></asp:Label><asp:DropDownList
                CssClass="dropdown_txt" ID="ddlDepartment" runat="server"
                DataTextField="DepartmentDesc" DataValueField="Sequence" OnDataBound="ddlDepartment_DataBound">
            </asp:DropDownList>
        </div>
        <div class="text_field" style="height:27px;">
            <asp:Label ID="lblCategory" runat="server" Text="Category:"></asp:Label><asp:DropDownList
                CssClass="dropdown_txt" ID="ddlCategory" runat="server"
                DataTextField="CategoryDesc" DataValueField="Sequence" OnDataBound="ddlCategory_DataBound">
            </asp:DropDownList>
        </div>
        <div class="text_field" style="padding-bottom:5px;height:27px;">
            <span>House/Flat No:</span><asp:TextBox ID="tbAddressNo" CssClass="field_txt" runat="server"></asp:TextBox></div>

        <div class="text_field" style="padding-bottom:5px;height:27px">
            <span>Address:</span><asp:TextBox ID="tbAddress1" CssClass="field_txt" runat="server"></asp:TextBox></div>
        <div class="text_field" style="padding-bottom: 5px; padding-left: 400px;height:27px;">
            <asp:TextBox ID="tbAddress2" CssClass="field_txt" runat="server"></asp:TextBox></div>
        <div class="text_field" style="padding-bottom: 5px; padding-left: 400px;height:27px;">
            <asp:TextBox ID="tbAddress3" CssClass="field_txt" runat="server"></asp:TextBox></div>
        <div class="text_field" style="padding-bottom: 5px; padding-left: 400px;height:27px;">
            <asp:TextBox ID="tbAddress4" CssClass="field_txt" runat="server"></asp:TextBox></div>
        <div class="text_field" style="padding-bottom: 5px; padding-left: 400px;height:27px;">
            <asp:TextBox ID="tbAddress5" CssClass="field_txt" runat="server"></asp:TextBox></div>
        <div class="text_field" style="padding-bottom:5px;height:27px">
            <span>Post Code:</span><asp:TextBox ID="tbPostalCode" CssClass="field_txt" runat="server"></asp:TextBox></div>
            
        <div class="text_field" style="padding-bottom:5px;height:27px;">
            <span>Date Visit</span><asp:TextBox ID="TextBoxDateVisit" CssClass="field_txt" runat="server"></asp:TextBox></div>
            
            
        <div class="text_field" style="padding:0 0 7px 0;">
            <table border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td style="vertical-align: middle;">
                        <span>Visit Details:</span>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBoxVisitDetails" runat="server" Rows="5" TextMode="MultiLine" CssClass="text_area"></asp:TextBox>
                    </td>
                </tr>
            </table>
        </div>

            <%--
            
            <div class="text_field" style="padding-bottom:5px;height:27px;">
                <span>Date Visit</span><!--<asp:TextBox ID="TextBoxDateVisit" CssClass="field_txt" runat="server"></asp:TextBox></div>-->
                <div id="dateField" style="display:none;">
                    <asp:Calendar id="calDate" OnSelectionChanged="calDate_SelectionChanged" Runat="server" />
                </div>
                <asp:TextBox id="txtDate" Runat="server" /> <img id="Img1" src="../Images/abc.jpg" onclick="popupCalendar()" runat="server" />
            </div>

            $( "#datepicker" ).datepicker();
                        
            <div class="text_field" style="padding:0 0 7px 0;">
            <table border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td style="vertical-align: middle;">
                        <div id="dateField" style="display:none;">
            <asp:Calendar id="calDate"
            OnSelectionChanged="calDate_SelectionChanged"
            Runat="server" />
            </div>
                    
                        <asp:TextBox id="txtDate" Runat="server" /> <img id="Img1" src="../Images/abc.jpg" onclick="popupCalendar()" runat="server" />
                    </td>
                </tr>
            </table>
            
          
        </div>
        --%>
            <div class="text_field" style="padding-bottom:5px;height:27px;">
            <span>Contact Name</span><asp:TextBox ID="TextBoxContactName" CssClass="field_txt" runat="server"></asp:TextBox></div>

            <div class="text_field" style="padding-bottom:5px;height:27px;">
            <span>Contact Telepone(home)</span><asp:TextBox ID="TextBoxContactTeleponeHome" CssClass="field_txt" runat="server"></asp:TextBox></div>

            <div class="text_field" style="padding-bottom:5px;height:27px;">
            <span>Contact Telepone(work)</span><asp:TextBox ID="TextBoxContactTeleponeWork" CssClass="field_txt" runat="server"></asp:TextBox></div>

            <div class="text_field" style="padding-bottom:5px;height:27px;">
            <span>Contact Telepone(work) Extension</span><asp:TextBox ID="TextBoxContactTeleponeWorkExtension" CssClass="field_txt" runat="server"></asp:TextBox></div>

            
             <div class="text_field" style="padding:0 0 7px 0;">
            <table border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td style="vertical-align: middle;">
                        <span>Contact Details:</span>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBoxContactDetails" runat="server" Rows="5" TextMode="MultiLine" CssClass="text_area"></asp:TextBox>
                    </td>
                </tr>
            </table>
        </div>


            <div class="text_field" style="padding-bottom:5px;height:27px;">
            <span>Upsize Ts</span>
            <asp:CheckBox ID="CheckBoxUpsizeTs" runat="server"></asp:CheckBox>
            </div>
            
            <!---->
        
        <div class="text_field" style="padding-bottom:5px;height:27px;" >
            <span>Valuation Code:</span><asp:TextBox ID="ValuationCodeTextBoxId" CssClass="field_txt" runat="server"></asp:TextBox></div>
        <div class="text_field" style="padding:0 0 7px 0;">
            <table border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td style="vertical-align: middle;">
                        <span>Heading:</span>
                    </td>
                    <td>
                        <asp:TextBox ID="PropertyHeadingTextBox" runat="server" Rows="5" TextMode="MultiLine" CssClass="text_area"></asp:TextBox>
                    </td>
                </tr>
            </table>
        </div>
        <div class="text_field" style="padding:0 0 7px 0;">
            <table border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td style="vertical-align: middle;">
                        <span>Detailed:</span>
                    </td>
                    <td>
                        <asp:TextBox ID="PropertyDetailTextBox" runat="server" Rows="5" TextMode="MultiLine" CssClass="text_area"></asp:TextBox>
                    </td>
                </tr>
            </table>
        </div>
        <div class="text_field" style="padding:0 0 7px 0;">
            <table border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td style="vertical-align: middle;">
                        <span>Summary:</span>
                    </td>
                    <td>
                        <asp:TextBox ID="PropertySummaryTextBox" runat="server" Rows="5" TextMode="MultiLine" CssClass="text_area"></asp:TextBox>
                    </td>
                </tr>
            </table>
        </div>
        <div>
            <span style="font-weight: bold;font-size: 12px;"><asp:Label ID="BulletPointsLabel" runat="server" Text="Bullet Points"></asp:Label></span>
        </div>
        <div style="margin-bottom:5px;">
            <span style="font-weight: bold;font-size: 12px;"><asp:Label ID="BulletPoint1Label" runat="server" Text="1"></asp:Label></span>
            <asp:TextBox ID="BulletPoint1TextBox" runat="server" Width="20%" ></asp:TextBox>
            <span style="font-weight: bold;font-size: 12px;"><asp:Label ID="BulletPoint2Label" runat="server" Text="2"></asp:Label></span>
            <asp:TextBox ID="BulletPoint2TextBox" runat="server" Width="20%" ></asp:TextBox>
            <span style="font-weight: bold;font-size: 12px;"><asp:Label ID="BulletPoint3Label" runat="server" Text="3"></asp:Label></span>
            <asp:TextBox ID="BulletPoint3TextBox" runat="server" Width="20%" ></asp:TextBox>
            <span style="font-weight: bold;font-size: 12px;"><asp:Label ID="BulletPoint4Label" runat="server" Text="4"></asp:Label></span>
            <asp:TextBox ID="BulletPoint4TextBox" runat="server" Width="20%" ></asp:TextBox>
        </div>
        <div style="margin-bottom:5px;">
            <span style="font-weight: bold;font-size: 12px;"><asp:Label ID="BulletPoint5Label" runat="server" Text="5"></asp:Label></span>
            <asp:TextBox ID="BulletPoint5TextBox" runat="server" Width="20%" ></asp:TextBox>
            <span style="font-weight: bold;font-size: 12px;"><asp:Label ID="BulletPoint6Label" runat="server" Text="6"></asp:Label></span>
            <asp:TextBox ID="BulletPoint6TextBox" runat="server" Width="20%" ></asp:TextBox>
            <span style="font-weight: bold;font-size: 12px;"><asp:Label ID="BulletPoint7Label" runat="server" Text="7"></asp:Label></span>
            <asp:TextBox ID="BulletPoint7TextBox" runat="server" Width="20%" ></asp:TextBox>
            <span style="font-weight: bold;font-size: 12px;"><asp:Label ID="BulletPoint8Label" runat="server" Text="8"></asp:Label></span>
            <asp:TextBox ID="BulletPoint8TextBox" runat="server" Width="20%" ></asp:TextBox>
        </div>
        <div style="clear:both"></div>
        <div>
            <div class="buttton_bar" style="display:inline;margin-top:5px;float:left;">
                <div style="float: left; display: block">
                    &nbsp;
                </div>
                <div style="float: left;">
                    <asp:Image ID="Image8" runat="server" ImageUrl="~/Images/btn_submit.jpg" />
                </div>
                <div style="float: left; height: 23px; padding-top: 8px; background-image: url('<%=this.ResolveClientUrl("~/images/btn_submit_mid.jpg")%>')">
                    <asp:LinkButton ID="ShowDetailsOrAddRoomButton" runat="server" OnClick="ShowRoomDetails" CssClass="txt_white">Room Details</asp:LinkButton>
                </div>
                <asp:Image ID="Image9" runat="server" ImageUrl="~/Images/btn_submit_right.jpg" />
            </div>
            <div class="buttton_bar" style="display:inline;margin-top:5px;float:left;">
                    <div style="float: left; display: block">
                        &nbsp;
                    </div>
                    <div style="float: left;">
                        <asp:Image ID="Image7" runat="server" ImageUrl="~/Images/btn_submit.jpg" />
                    </div>
                    <div style="float: left; height: 23px; padding-top: 8px; background-image: url('<%=this.ResolveClientUrl("~/images/btn_submit_mid.jpg")%>')">
                        <asp:LinkButton ID="SavePropertyDetailsButton" runat="server" OnClick="SavePropertyDetails" CssClass="txt_white">Save</asp:LinkButton>
                    </div>
                    <asp:Image ID="Image10" runat="server" ImageUrl="~/Images/btn_submit_right.jpg" />
            </div>
        </div>
        <div class="button_bar" style="display: none;">
            <asp:Button ID="btnSave" runat="server" Text="Save & Details" OnClick="btnSave_Click" /><asp:Button
                ID="btnUpdate" runat="server" Text="Update & Continue" OnClick="btnUpdate_Click"
                Visible="True" />
            <asp:Button ID="btnCancel" runat="server" OnClick="btnCancel_Click" Text="Cancel Order"
                Visible="False" />
            <asp:Button ID="btnUncancel" runat="server" OnClick="btnUncancel_Click" Text="Uncancel Order"
                Visible="False" />
            &nbsp;
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

            $("#<%=TextBoxDateVisit.ClientID%>").datetimepicker({ dateFormat: 'yy-mm-dd' });

        });
    </script>
    </div>
    </div>
</asp:Content>
