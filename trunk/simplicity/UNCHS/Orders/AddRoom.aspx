<%@ Page Language="C#" MasterPageFile="~/Common/Main.master" AutoEventWireup="true"
    CodeFile="AddRoom.aspx.cs" Inherits="Order_AddRoom" Title="Simplicity4Business" %>

<%@ Register Src="../Common/UserControls/TabControl.ascx" TagName="TabControl" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContentPlaceHolder" runat="Server">
    <link rel="stylesheet" type="text/css" href="<%=this.ResolveClientUrl("~/Common/StyleSheets/Tab.css")%>" />
    <link rel="stylesheet" type="text/css" href="<%=this.ResolveClientUrl("~/Includes/yui/build/button/assets/skins/sam/button.css")%>" />
    <link rel="stylesheet" type="text/css" href="<%=this.ResolveClientUrl("~/Includes/yui/build/container/assets/skins/sam/container.css")%>" />
    <script type="text/javascript" src="<%=this.ResolveClientUrl("~/Includes/yui/build/container/container-min.js")%>"></script>
    
    <script type="text/javascript" src="<%=this.ResolveClientUrl("~/jquery-1.8.23-custom/jquery-1.8.0.min.js")%>"></script>
	<script type="text/javascript" src="<%=this.ResolveClientUrl("~/jquery-1.8.23-custom/jquery-ui-1.8.23.custom.min.js")%>"></script>
    <link rel="stylesheet" type="text/css" href="<%=this.ResolveClientUrl("~/jquery-1.8.23-custom/css/ui-lightness/jquery-ui-1.8.23.custom.css")%>" />

    <script type="text/javascript">
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
                        
                        $("#RoomLengthInMeters").attr("value", $("#LengthInMTextBox").val());
                        $("#RoomLengthInFeet").attr("value", $("#LengthInFeetTextBox").val());
                        $("#RoomLengthInInches").attr("value", $("#LengthInInchesTextBox").val());
                        $("#RoomLengthText").attr("value", $("#LengthTextTextBox").val());

                        $("#RoomWidthInMeters").attr("value", $("#WidthInMTextBox").val());
                        $("#RoomWidthInFeet").attr("value", $("#WidthInFeetTextBox").val());
                        $("#RoomWidthInInches").attr("value", $("#WidthInInchesTextBox").val());
                        $("#RoomWidthText").attr("value", $("#WidthTextTextBox").val());

                        $(this).dialog('close');
                    }
                }
            };

            $("#DimensionDialogId").dialog(dialogOpts);    //end dialog

            meterToFeet = function () {
                var meter = $("#LengthInMTextBox").val()
                var feet = null;
                var inches = null;
                if (meter != "") {
                    feet = meter * 3.281;
                    feet = parseInt(feet);
                    inches = meter % 3.281;
                }
                $("#LengthInFeetTextBox").attr("value", Math.round(feet).toFixed(2));
                $("#LengthInInchesTextBox").attr("value", Math.round(inches).toFixed(2));
            }

            feetToMeter = function () {
                var meter = 0;
                if ($("#LengthInFeetTextBox").val() != "" || $("#LengthInInchesTextBox").val() != "") {
                    var feet = parseInt($("#LengthInFeetTextBox").val());
                    var inches = parseInt($("#LengthInInchesTextBox").val());

                    if (feet != "") {
                        if (inches != "")
                            feet = feet + (inches / 12);
                        meter = feet / 3.281;
                        $("#LengthInMTextBox").attr("value", Math.round(meter).toFixed(2));
                    }
                    else if (inches != "" && feet == "")
                        $("#LengthInMTextBox").attr("value", Math.round(inches / 12).toFixed(2));
                }
            }

            meterToFeetInWidth = function () {
                var meter = $("#WidthInMTextBox").val()
                var feet = null;
                var inches = null;
                if (meter != "") {
                    feet = meter * 3.281;
                    feet = parseInt(feet);
                    inches = meter % 3.281;
                }
                $("#WidthInFeetTextBox").attr("value", Math.round(feet).toFixed(2));
                $("#WidthInInchesTextBox").attr("value", Math.round(inches).toFixed(2));
            }

            feetToMeterInWidth = function () {
                var meter = 0;
                if ($("#WidthInFeetTextBox").val() != "" || $("#WidthInInchesTextBox").val() != "") {
                    var feet = parseInt($("#WidthInFeetTextBox").val());
                    var inches = parseInt($("#WidthInInchesTextBox").val());

                    if (feet != "") {
                        if (inches != "")
                            feet = feet + (inches / 12);
                        meter = feet / 3.281;
                        $("#WidthInMTextBox").attr("value", Math.round(meter).toFixed(2));
                    }
                    else if (inches != "" && feet == "")
                        $("#WidthInMTextBox").attr("value", Math.round(inches / 12).toFixed(2));
                }
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
            
            $("#DimensionDialogId").dialog("open");
            return false;
        }
        
        $(document).ready(function () {
            if (/chrom(e|ium)/.test(navigator.userAgent.toLowerCase())) {
                $("#ParagraphTextBox").height("110");
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
			margin:0 5px
		}
		.column2
		{
			display:inline-block;
			float:left;
			width:100px;
			margin-left:5px;
		}
		.column3
		{
			display:inline-block;
			float:left;
			width:400px;
			margin-left:10px;
		}
		.RoomPanel{
			clear:both;
			margin: 10px 0;
		}
        #DimensionDialogId h3
        {
	        display:inline;
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
    <uc1:TabControl ID="TabControl1" runat="server" Selected="People" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder" runat="Server">
    <div style="background-color: White; padding: 15px 10px 25px 10px; min-height: 255px;
        float: left; width: 97.65%">
        <div class="RoomPanel">

                <input type="hidden" id="RoomLengthInMeters" runat="server" />
                <input type="hidden" id="RoomLengthInFeet" runat="server" />
                <input type="hidden" id="RoomLengthInInches" runat="server" />
                <input type="hidden" id="RoomLengthText" runat="server" />

                <input type="hidden" id="RoomWidthInMeters" runat="server" />
                <input type="hidden" id="RoomWidthInFeet" runat="server" />
                <input type="hidden" id="RoomWidthInInches" runat="server" />
                <input type="hidden" id="RoomWidthText" runat="server" />

                <div class="column1">
				    <div>
					    <span>No.</span>
				    </div>
				    <div>
                        <asp:TextBox ID="RoomNoTextBox" style="width:100%;" runat="server" Enabled="false"></asp:TextBox>
				    </div>
				    <br/>
				    <div>
                        <asp:Button CssClass="DimensionButton" runat="server" ID="DimensionButton" OnClientClick="return showDimensionDialog();" />
				    </div>
			    </div>
			
			    <div class="column2">
				    <div>
					    <span>Heading</span>
				    </div>
				    <div>
                        <asp:TextBox ID="HeadingTextBox" runat="server" style="width:100%;"></asp:TextBox>
				    </div>
				    <div>
					    <span>Dimensions</span>
				    </div>
				    <div>
                        <asp:TextBox ID="DimensionsTextBox" style="width:100%;" Enabled="false" runat="server"></asp:TextBox>
				    </div>
				    <div>
					    <span>Aspect</span>
				    </div>
				    <div>
                        <asp:TextBox style="width:100%;" ID="AspectTextBox" runat="server"></asp:TextBox>
				    </div>
			    </div>
			    <div class="column3">
				    <div>
					    <span>Paragraph Text</span>
				    </div>
				    <div>
                        <asp:TextBox ID="ParagraphTextBox" Rows="5" runat="server" style="width:100%; height:100px;" TextMode="MultiLine"></asp:TextBox>
				    </div>
			    </div>
            </div>
            &nbsp;
        </div>
        <div class="button_bar">
            <div class="button_right" style="padding-left: 340px;">
                <div style="float: left">
                    <asp:Image runat="server" ImageUrl="~/Images/btn_submit.jpg" />
                </div>
                <div style="float: left; height: 23px; padding-top: 8px; background-image: url('<%=this.ResolveClientUrl("~/images/btn_submit_mid.jpg")%>')">
                    <asp:LinkButton ID="SaveRoomButton" runat="server" OnClick="SaveNewRoomDetails" CssClass="txt_white">Save</asp:LinkButton>
                </div>
                <asp:Image ID="Image3" runat="server" ImageUrl="~/Images/btn_submit_right.jpg" />
            </div>
        </div>
       
        <div class="button_right" style="float: left; padding-left: 340px; padding-top: 20px">
            <asp:ImageButton ID="btnBack" runat="server" OnClick="btnBack_Click" ImageUrl="~/Images/btn_pre.jpg" />
        </div>
        <div class="button_right" style="padding-top: 20px">
            <asp:ImageButton ID="btnNext" runat="server" OnClick="btnNext_Click" ImageUrl="~/Images/btn_next.jpg" />
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

    <div id="DimensionDialogId" style="background-color:#D3E2FF">
        <center><h1>Room Dimensions</h1></center>

        <h3>Length </h3><input type="text" id="LengthInMTextBox" style="width:50px;" />
        <h3>m</h3><h3 style="margin:0 40px">or</h3><input type="text" id="LengthInFeetTextBox" style="width:50px;" /><h3 style="margin-right:10px">ft</h3>
        <input type="text" id="LengthInInchesTextBox" style="width:50px;" /><h3>in.</h3><h3 style="margin-left:40px">Text</h3><input type="text" id="LengthTextTextBox"  />

        <h3 style="margin-right:9px">Width </h3><input type="text" id="WidthInMTextBox" style="width:50px;" />
        <h3>m</h3><h3 style="margin:0 40px">or</h3><input type="text" id="WidthInFeetTextBox" style="width:50px;" /><h3 style="margin-right:10px">ft</h3>
        <input type="text" id="WidthInInchesTextBox" style="width:50px;" /><h3>in.</h3><h3 style="margin-left:40px">Text</h3><input type="text" id="WidthTextTextBox"  />
    </div>

</asp:Content>