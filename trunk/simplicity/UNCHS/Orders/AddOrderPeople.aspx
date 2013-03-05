<%@ Page Language="C#" MasterPageFile="~/Common/Main.master" AutoEventWireup="true"
    CodeFile="AddOrderPeople.aspx.cs" Inherits="Orders_AddOrderPeople" Title="Simplicity4Business" %>

<%@ Register Src="../Common/UserControls/TabControl.ascx" TagName="TabControl" TagPrefix="uc1" %>
<%@ Register Assembly="eWorld.UI" Namespace="eWorld.UI" TagPrefix="ew" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContentPlaceHolder" runat="Server">
    <link rel="stylesheet" type="text/css" href="<%=this.ResolveClientUrl("~/Common/StyleSheets/Tab.css")%>" />
    <link rel="stylesheet" type="text/css" href="<%=this.ResolveClientUrl("~/Includes/yui/build/button/assets/skins/sam/button.css")%>" />
    <link rel="stylesheet" type="text/css" href="<%=this.ResolveClientUrl("~/Includes/yui/build/container/assets/skins/sam/container.css")%>" />
    <script type="text/javascript" src="<%=this.ResolveClientUrl("~/Includes/yui/build/container/container-min.js")%>"></script>


    <script type="text/javascript">
        var buttonContentId = null;
        var buttonListId = null;
        $(document).ready(function () {

            //define config object
            var dialogOpts = {
                title: "Room Dimensions",
                autoOpen: false,
                height: 300,
                width: 725,
                draggable: false,
                resizable: false,
                buttons: {
                    Cancel: function () {
                        $(this).dialog('close');
                    },
                    OK: function () {
                        $("#" + buttonContentId + "_ContentPlaceHolder_RoomsList_" + buttonListId + "_RoomLengthInMeters").attr("value", $("#LengthInMTextBox").val());
                        $("#" + buttonContentId + "_ContentPlaceHolder_RoomsList_" + buttonListId + "_RoomLengthInFeet").attr("value", $("#LengthInFeetTextBox").val());
                        $("#" + buttonContentId + "_ContentPlaceHolder_RoomsList_" + buttonListId + "_RoomLengthInInches").attr("value", $("#LengthInInchesTextBox").val());
                        $("#" + buttonContentId + "_ContentPlaceHolder_RoomsList_" + buttonListId + "_RoomLengthText").attr("value", $("#LengthTextTextBox").val());

                        $("#" + buttonContentId + "_ContentPlaceHolder_RoomsList_" + buttonListId + "_RoomWidthInMeters").attr("value", $("#WidthInMTextBox").val());
                        $("#" + buttonContentId + "_ContentPlaceHolder_RoomsList_" + buttonListId + "_RoomWidthInFeet").attr("value", $("#WidthInFeetTextBox").val());
                        $("#" + buttonContentId + "_ContentPlaceHolder_RoomsList_" + buttonListId + "_RoomWidthInInches").attr("value", $("#WidthInInchesTextBox").val());
                        $("#" + buttonContentId + "_ContentPlaceHolder_RoomsList_" + buttonListId + "_RoomWidthText").attr("value", $("#WidthTextTextBox").val());

                        var tempText = $("#LengthInMTextBox").val() + "m(" + $("#LengthInFeetTextBox").val() + "'" + $("#LengthInInchesTextBox").val() + "\") X " + $("#WidthInMTextBox").val() + "m(" + $("#WidthInFeetTextBox").val() + "'" + $("#WidthInInchesTextBox").val() + "\")";
                        $("#" + buttonContentId + "_ContentPlaceHolder_RoomsList_" + buttonListId + "_DimensionsTextBox").attr("value", tempText);

                        $(this).dialog('close');
                    }
                }
            };

            $("#DimensionDialogId").dialog(dialogOpts);    //end dialog

            meterToFeet = function () {
                var meter = $("#LengthInMTextBox").val()
                var feets = null;
                var feet = null;
                var inches = null;
                if (meter != "") {
                    feets = meter * 3.281;
                    feet = parseInt(feets);
                    inches = (feets - feet) * 12.0;
                    $("#LengthInFeetTextBox").attr("value", (feet).toFixed(2));
                    $("#LengthInInchesTextBox").attr("value", (inches).toFixed(2));
                }
                else {
                    $("#LengthInFeetTextBox").attr("value", "");
                    $("#LengthInInchesTextBox").attr("value", "");
                }
            }

            feetToMeter = function () {
                var meter = 0;
                if ($("#LengthInFeetTextBox").val() != "" || $("#LengthInInchesTextBox").val() != "") {
                    var feet = parseInt($("#LengthInFeetTextBox").val());
                    var inches = parseInt($("#LengthInInchesTextBox").val());

                    if (isNaN(feet) != true) {
                        if (isNaN(inches) != true)
                            feet = feet + (inches / 12.0);
                        meter = feet / 3.281;
                        $("#LengthInMTextBox").attr("value", (meter).toFixed(2));
                    }
                    else if (isNaN(inches) != true && isNaN(feet) == true)
                        $("#LengthInMTextBox").attr("value", (inches / 12.0).toFixed(2));
                }
                else { $("#LengthInMTextBox").attr("value", ""); }
            }

            meterToFeetInWidth = function () {
                var meter = $("#WidthInMTextBox").val()
                var feets = null;
                var feet = null;
                var inches = null;
                if (meter != "") {
                    feets = meter * 3.281;
                    feet = parseInt(feets);
                    inches = (feets - feet) * 12.0;
                    $("#WidthInFeetTextBox").attr("value", (feet).toFixed(2));
                    $("#WidthInInchesTextBox").attr("value", (inches).toFixed(2));
                }
                else {
                    $("#WidthInFeetTextBox").attr("value", "");
                    $("#WidthInInchesTextBox").attr("value", "");
                }
            }

            feetToMeterInWidth = function () {
                var meter = 0;
                if ($("#WidthInFeetTextBox").val() != "" || $("#WidthInInchesTextBox").val() != "") {
                    var feet = parseInt($("#WidthInFeetTextBox").val());
                    var inches = parseInt($("#WidthInInchesTextBox").val());

                    if (isNaN(feet) != true) {
                        if (isNaN(inches) != true)
                            feet = feet + (inches / 12.0);
                        meter = feet / 3.281;
                        $("#WidthInMTextBox").attr("value", (meter).toFixed(2));
                    }
                    else if (isNaN(inches) != true && isNaN(feet) == true)
                        $("#WidthInMTextBox").attr("value", (inches / 12.0).toFixed(2));
                }
                else { $("#WidthInMTextBox").attr("value", ""); }
            }

            $("#LengthInMTextBox").focusout(meterToFeet
            );

            $("#LengthInFeetTextBox").focusout(feetToMeter
            );

            $("#LengthInInchesTextBox").focusout(feetToMeter
            );


            $("#WidthInMTextBox").focusout(meterToFeetInWidth
            );

            $("#WidthInFeetTextBox").focusout(feetToMeterInWidth
            );

            $("#WidthInInchesTextBox").focusout(feetToMeterInWidth
            );

        });
        function showDimensionDialog(element) {
            var id = element.id;
            var elementIdSplit = id.split('_');
            buttonContentId = elementIdSplit[0];
            buttonListId = elementIdSplit[3];
            $("#LengthInMTextBox").attr("value", $("#"+elementIdSplit[0]+"_ContentPlaceHolder_RoomsList_"+elementIdSplit[3]+"_RoomLengthInMeters").val());
            $("#LengthInFeetTextBox").attr("value", $("#" + elementIdSplit[0] + "_ContentPlaceHolder_RoomsList_" + elementIdSplit[3] + "_RoomLengthInFeet").val());
            $("#LengthInInchesTextBox").attr("value", $("#" + elementIdSplit[0] + "_ContentPlaceHolder_RoomsList_" + elementIdSplit[3] + "_RoomLengthInInches").val());
            $("#LengthTextTextBox").attr("value", $("#" + elementIdSplit[0] + "_ContentPlaceHolder_RoomsList_" + elementIdSplit[3] + "_RoomLengthText").val());

            $("#WidthInMTextBox").attr("value", $("#" + elementIdSplit[0] + "_ContentPlaceHolder_RoomsList_" + elementIdSplit[3] + "_RoomWidthInMeters").val());
            $("#WidthInFeetTextBox").attr("value", $("#" + elementIdSplit[0] + "_ContentPlaceHolder_RoomsList_" + elementIdSplit[3] + "_RoomWidthInFeet").val());
            $("#WidthInInchesTextBox").attr("value", $("#" + elementIdSplit[0] + "_ContentPlaceHolder_RoomsList_" + elementIdSplit[3] + "_RoomWidthInInches").val());
            $("#WidthTextTextBox").attr("value", $("#" + elementIdSplit[0] + "_ContentPlaceHolder_RoomsList_" + elementIdSplit[3] + "_RoomWidthText").val());

            $("#DimensionDialogId").dialog("open");
            return false;
        }

        $(document).ready(function () {
            if ($.browser.msie) {
                $("textarea").height("125");
            }
            $('.numbersOnly').keyup(function () {
                this.value = this.value.replace(/[^0-9\.]/g, '');
            });
            var isiPad = navigator.userAgent.match(/iPad/i) != null;
            if (isiPad == true) {
                $(".column1 input[type='text']").css("width", "82%");
                $(".column2 input[type='text']").css("width", "95%");
            }
        });
    </script>

    <style type="text/css">
        .DimensionButton
		{
			background-image: url(/Images/button.PNG);
			width:27px;
			height:22px;
			margin-left:25px;
		}
		.column1
		{
			display:inline-block;
			width:50px;
			float:left;
			margin:0 5px;
            height:150px;
		}
		.column2
		{
			display:inline-block;
			float:left;
			width:170px;
			margin-left:5px;
            height:150px;
		}
		.column3
		{
			display:inline-block;
			float:left;
			width:450px;
			margin-left:10px;
            height:150px;
		}
		.RoomPanel{
			clear:both;
			margin: 10px 0;
		}
        input[type="text"]
        {
            height:20px;
        }
        .sameHeight {
            height:20px;
        }
        #DimensionDialogId h3
        {
	        display:inline;
        }
        #DimensionDialogId input[type="text"]
        {
            height:20px;
        }
        .ui-button-text {
            width:100px;
        }
        button {
            width:auto;
        }
        a.txt_blue:link, a.txt_blue:visited {
            color:white;
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
                    Add/Amend Room - Details
                </div>
                <img src="<%=this.ResolveClientUrl("~/images/bc_right.jpg")%>" alt="" width="8" height="31" />
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="TabPlaceHolder" runat="Server">
    <uc1:TabControl ID="TabControl1" runat="server" Selected="Main" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder" runat="Server">

    <div style="background-color: White; padding: 15px 10px 25px 10px; min-height: 255px;
        float: left; width: 97.65%">
        <div class="grid">
            <asp:Repeater ID="RoomsList" Runat="server">
                <ItemTemplate>
                    <div class="RoomPanel">
                        <input type="hidden" id="RoomSequenceNo" runat="server" value='<%# Eval("Sequence") %>' />
                        
                        <input type="hidden" id="RoomLengthInMeters" runat="server" value='<%# Eval("RoomLengthM") %>' />
                        <input type="hidden" id="RoomLengthInFeet" runat="server" value='<%# Eval("RoomLengthFt") %>' />
                        <input type="hidden" id="RoomLengthInInches" runat="server" value='<%# Eval("RoomLengthIn") %>' />
                        <input type="hidden" id="RoomLengthText" runat="server" value='<%# Eval("RoomLengthText") %>' />

                        <input type="hidden" id="RoomWidthInMeters" runat="server" value='<%# Eval("RoomWidthM") %>' />
                        <input type="hidden" id="RoomWidthInFeet" runat="server" value='<%# Eval("RoomWidthFt") %>' />
                        <input type="hidden" id="RoomWidthInInches" runat="server" value='<%# Eval("RoomWidthIn") %>' />
                        <input type="hidden" id="RoomWidthText" runat="server" value='<%# Eval("RoomWidthText") %>' />

                        <div class="column1">
				            <div class="sameHeight">
					            <span>No.</span>
				            </div>
				            <div style="margin-bottom:5px;">
                                <asp:TextBox ID="RoomNoTextBox" style="width:100%;" runat="server" Text='<%# Eval("RoomNo") %>' Enabled="false"></asp:TextBox>
				            </div>
				            <div class="sameHeight">
					            <span>&nbsp;</span>
				            </div>
				            <div>
                                <asp:Button CssClass="DimensionButton" runat="server" ID="DimensionButton" OnClientClick="return showDimensionDialog(this);" />
				            </div>
			            </div>
			
			            <div class="column2">
				            <div class="sameHeight">
					            <span>Heading</span>
				            </div>
				            <div style="margin-bottom:5px;">
                                <asp:TextBox ID="HeadingTextBox" runat="server" Text='<%# Eval("RoomHeading") %>' style="width:100%;"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="HeadingTextBox" Display="Dynamic"></asp:RequiredFieldValidator>
				            </div>
				            <div class="sameHeight">
					            <span>Dimensions</span>
				            </div>
				            <div style="margin-bottom:5px;">
                                <asp:TextBox ID="DimensionsTextBox" style="width:100%;" Text='<%# Eval("RoomLengthM")+"m("+Eval("RoomLengthFt")+"&#39;"+Eval("RoomLengthIn")+"\") X " + Eval("RoomWidthM")+"m("+Eval("RoomWidthFt")+"&#39;"+Eval("RoomWidthIn")+"\")"  %>' Enabled="false" runat="server"></asp:TextBox>
				            </div>
				            <div class="sameHeight">
					            <span>Aspect</span>
				            </div>
				            <div style="margin-bottom:5px;">
                                <asp:TextBox style="width:100%;" ID="AspectTextBox" Text='<%# Eval("RoomAspect") %>' runat="server"></asp:TextBox>
				            </div>
			            </div>
			            <div class="column3">
				            <div class="sameHeight">
					            <span>Paragraph Text</span>
				            </div>
				            <div>
                                <asp:TextBox ID="ParagraphTextBox" Text='<%# Eval("RoomText") %>' Rows="5" runat="server" style="width:100%; height:120px;" TextMode="MultiLine"></asp:TextBox>
				            </div>
			            </div>

                     </div>
                    <div style="clear:both"><br /><hr /></div>
                 </ItemTemplate>
             </asp:Repeater>
            &nbsp;
        </div>
        <div class="button_bar">
            <div class="button_right">
                <div style="float: left">
                    <asp:Image runat="server" ImageUrl="~/Images/btn_submit.jpg" />
                </div>
                <div style="float: left; height: 23px; padding-top: 8px; background-image: url('<%=this.ResolveClientUrl("~/images/btn_submit_mid.jpg")%>')">
                    <asp:LinkButton ID="SaveRoomDetailsButton" runat="server" OnClick="SaveRoomDetails" CssClass="txt_white">Save All</asp:LinkButton>
                </div>
                <asp:Image ID="Image3" runat="server" style="float:left" ImageUrl="~/Images/btn_submit_right.jpg" />
                
                <div style="float: left">
                    <asp:Image ID="Image4" runat="server" ImageUrl="~/Images/btn_submit.jpg" />
                </div>
                <div style="float: left; height: 23px; padding-top: 8px; background-image: url('<%=this.ResolveClientUrl("~/images/btn_submit_mid.jpg")%>')">
                    <asp:LinkButton ID="AddNewRoomButton" runat="server" OnClick="AddNewRoom" CssClass="txt_white">Add Room</asp:LinkButton>
                </div>
                <asp:Image ID="Image5" runat="server" ImageUrl="~/Images/btn_submit_right.jpg" />
            </div>
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


    <div id="DimensionDialogId">
        <center><h1>Room Dimensions</h1></center>
        <div style="height:40px;">
            <span style="width:60px; display:inline-block;font-weight: bold; font-size: 1.2em; height: 20px;">Length </span><input type="text" class="numbersOnly" id="LengthInMTextBox" style="width:50px;" />
            <h3>m</h3><h3 style="margin:0 40px">or</h3><input type="text" class="numbersOnly" id="LengthInFeetTextBox" style="width:50px;" /><h3 style="margin-right:10px">ft</h3>
            <input type="text" id="LengthInInchesTextBox" class="numbersOnly" style="width:50px;" /><h3>in.</h3><h3 style="margin-left:40px; margin-right:5px;">Text</h3><input type="text" style="width:180px;" id="LengthTextTextBox"  />
        </div>
        <div style="height:40px;">
            <span style="width:60px; display:inline-block;font-weight: bold; font-size: 1.2em; height: 20px;">Width </span><input type="text" class="numbersOnly" id="WidthInMTextBox" style="width:50px;" />
            <h3>m</h3><h3 style="margin:0 40px">or</h3><input type="text" class="numbersOnly" id="WidthInFeetTextBox" style="width:50px;" /><h3 style="margin-right:10px">ft</h3>
            <input type="text" class="numbersOnly" id="WidthInInchesTextBox" style="width:50px;" /><h3>in.</h3><h3 style="margin-left:40px; margin-right:5px;">Text</h3><input type="text" style="width:180px;" id="WidthTextTextBox"  />
        </div>
    </div>
</asp:Content>
