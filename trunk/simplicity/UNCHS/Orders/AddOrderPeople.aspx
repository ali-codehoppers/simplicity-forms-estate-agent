<%@ Page Language="C#" MasterPageFile="~/Common/Main.master" AutoEventWireup="true"
    CodeFile="AddOrderPeople.aspx.cs" Inherits="Orders_AddOrderPeople" Title="Simplicity4Business" %>

<%@ Register Src="../Common/UserControls/TabControl.ascx" TagName="TabControl" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContentPlaceHolder" runat="Server">
    <link rel="stylesheet" type="text/css" href="<%=this.ResolveClientUrl("~/Common/StyleSheets/Tab.css")%>" />
    <link rel="stylesheet" type="text/css" href="<%=this.ResolveClientUrl("~/Includes/yui/build/button/assets/skins/sam/button.css")%>" />
    <link rel="stylesheet" type="text/css" href="<%=this.ResolveClientUrl("~/Includes/yui/build/container/assets/skins/sam/container.css")%>" />
    <script type="text/javascript" src="<%=this.ResolveClientUrl("~/Includes/yui/build/container/container-min.js")%>"></script>

    <script type="text/javascript">
        var buttonId = null;
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
                        var idNum = buttonId;
                        $("#RoomsList_RoomLengthInMeters_" + idNum).attr("value", $("#LengthInMTextBox").val());
                        $("#RoomsList_RoomLengthInFeet_" + idNum).attr("value", $("#LengthInFeetTextBox").val());
                        $("#RoomsList_RoomLengthInInches_" + idNum).attr("value", $("#LengthInInchesTextBox").val());
                        $("#RoomsList_RoomLengthText_" + idNum).attr("value", $("#LengthTextTextBox").val());

                        $("#RoomsList_RoomWidthInMeters_" + idNum).attr("value", $("#WidthInMTextBox").val());
                        $("#RoomsList_RoomWidthInFeet_" + idNum).attr("value", $("#WidthInFeetTextBox").val());
                        $("#RoomsList_RoomWidthInInches_" + idNum).attr("value", $("#WidthInInchesTextBox").val());
                        $("#RoomsList_RoomWidthText_" + idNum).attr("value", $("#WidthTextTextBox").val());

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
            var id = element.id;
            var idNum = id.split('_')[2];
            buttonId = idNum;
            $("#LengthInMTextBox").attr("value", $("#RoomsList_RoomLengthInMeters_" + idNum).val());
            $("#LengthInFeetTextBox").attr("value", $("#RoomsList_RoomLengthInFeet_" + idNum).val());
            $("#LengthInInchesTextBox").attr("value", $("#RoomsList_RoomLengthInInches_" + idNum).val());
            $("#LengthTextTextBox").attr("value", $("#RoomsList_RoomLengthText_" + idNum).val());

            $("#WidthInMTextBox").attr("value", $("#RoomsList_RoomWidthInMeters_" + idNum).val());
            $("#WidthInFeetTextBox").attr("value", $("#RoomsList_RoomWidthInFeet_" + idNum).val());
            $("#WidthInInchesTextBox").attr("value", $("#RoomsList_RoomWidthInInches_" + idNum).val());
            $("#WidthTextTextBox").attr("value", $("#RoomsList_RoomWidthText_" + idNum).val());

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
				            <div>
					            <span>No.</span>
				            </div>
				            <div>
                                <asp:TextBox ID="RoomNoTextBox" style="width:100%;" runat="server" Text='<%# Eval("RoomNo") %>' Enabled="false"></asp:TextBox>
				            </div>
				            <br/>
				            <div>
                                <asp:Button CssClass="DimensionButton" runat="server" ID="DimensionButton" OnClientClick="return showDimensionDialog(this);" />
				            </div>
			            </div>
			
			            <div class="column2">
				            <div>
					            <span>Heading</span>
				            </div>
				            <div>
                                <asp:TextBox ID="HeadingTextBox" runat="server" Text='<%# Eval("RoomHeading") %>' style="width:100%;"></asp:TextBox>
				            </div>
				            <div>
					            <span>Dimensions</span>
				            </div>
				            <div>
                                <asp:TextBox ID="DimensionsTextBox" style="width:100%;" Text='<%# Eval("RoomLengthM")+"m("+Eval("RoomLengthFt")+"&#39;"+Eval("RoomLengthIn")+"\") X " + Eval("RoomWidthM")+"m("+Eval("RoomWidthFt")+"&#39;"+Eval("RoomWidthIn")+"\")"  %>' Enabled="false" runat="server"></asp:TextBox>
				            </div>
				            <div>
					            <span>Aspect</span>
				            </div>
				            <div>
                                <asp:TextBox style="width:100%;" ID="AspectTextBox" Text='<%# Eval("RoomAspect") %>' runat="server"></asp:TextBox>
				            </div>
			            </div>
			            <div class="column3">
				            <div>
					            <span>Paragraph Text</span>
				            </div>
				            <div>
                                <asp:TextBox ID="ParagraphTextBox" Text='<%# Eval("RoomText") %>' Rows="5" runat="server" style="width:100%; height:100px;" TextMode="MultiLine"></asp:TextBox>
				            </div>
			            </div>

                        <%--<asp:TextBox ID="RoomNoTextBox" runat="server" Text='<%# Eval("RoomNo") %>' CssClass="grid1" Enabled="false" ></asp:TextBox>
                        <asp:TextBox ID="HeadingTextBox" runat="server" Text='<%# Eval("RoomHeading") %>' CssClass="grid2"></asp:TextBox>

                        <asp:TextBox ID="ParagraphTextBox" runat="server" Text='<%# Eval("RoomText") %>' Height="110px" TextMode="MultiLine" CssClass="grid3"></asp:TextBox>

                        <div class="DimensionAndAspectPositioning">
                            
                            <h3 style="margin-top:0;margin-bottom:0"><asp:Label ID="DimensionsLabel" runat="server" CssClass="grid2 MiddleGridAllign" Text="Dimensions"></asp:Label></h3>
                            <asp:Button CssClass="DimensionButton grid1" runat="server" ID="DimensionButton" OnClientClick="return showDimensionDialog(this);" />
                            
                            <asp:TextBox ID="DimensionsTextBox" CssClass="grid2" Text='<%# Eval("RoomLengthInM")+"m("+Eval("RoomLengthInFt")+"&#39;"+Eval("RoomLengthInInch")+"\") X " + Eval("RoomWidthInM")+"m("+Eval("RoomWidthInFt")+"&#39;"+Eval("RoomWidthInInch")+"\")"  %>' Enabled="false" runat="server"></asp:TextBox>
                            <br />
                            
                            <h3 style="margin-top:0.4%;margin-bottom:0"><asp:Label ID="AspectLabel" runat="server" CssClass="grid2 MiddleGridAllign" Text="Aspect"></asp:Label></h3>
                            
                            <asp:TextBox CssClass="grid2 MiddleGridAllign" style="float:none;" ID="AspectTextBox" Text='<%# Eval("RoomAspect") %>' runat="server"></asp:TextBox>
                         </div>--%>

                     </div>
                    <div style="clear:both"><br /><hr /></div>
                 </ItemTemplate>
             </asp:Repeater>
            &nbsp;
        </div>
        <div class="button_bar">
            <div class="button_right" style="padding-left: 340px;">
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
       
        <%--<div class="button_right" style="float: left; padding-left: 340px; padding-top: 20px">
            <asp:ImageButton ID="btnBack" runat="server" OnClick="btnBack_Click" ImageUrl="~/Images/btn_pre.jpg" />
        </div>
        <div class="button_right" style="padding-top: 20px">
            <asp:ImageButton ID="btnNext" runat="server" OnClick="btnNext_Click" ImageUrl="~/Images/btn_next.jpg" />
        </div>--%>
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
