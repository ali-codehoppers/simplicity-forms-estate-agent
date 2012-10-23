<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="nLogin" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Login</title>
    <link id="Link1" runat="server" rel="shortcut icon" href="favicon.ico" type="image/x-icon" />
    <link id="Link2" runat="server" rel="icon" href="favicon.ico" type="image/ico" />
    <link rel="stylesheet" type="text/css" href="~/Common/StyleSheets/newstylesheet.css" />
    <link rel="stylesheet" type="text/css" href="Includes/yui/build/fonts/fonts-min.css" />
    <link rel="stylesheet" type="text/css" href="Includes/yui/build/container/assets/skins/sam/container.css" />
    <script type="text/javascript" src="Includes/yui/build/yahoo-dom-event/yahoo-dom-event.js"></script>
    <script type="text/javascript" src="Includes/yui/build/container/container_core.js"></script>
    <script type="text/javascript" src="Includes/yui/build/yahoo/yahoo-min.js"></script>
    <script type="text/javascript" src="Includes/yui/build/event/event-min.js"></script>
    <script type="text/javascript" src="Includes/yui/build/container/container-min.js"></script>
    <script type="text/javascript">
        var confirmationDialog;
        function showConfirmationDialog() {
            document.getElementById("confirmationDialog").style.display = 'block';
            confirmationDialog.show();
        }
    </script>
</head>
<body style="background: #48a5bf url(Images/bg_r.jpg) repeat-x;">
    <form id="form1" runat="server">
    <div id="maindiv">
        <div id="leftdiv">
            <div class="logodiv">
                <img src="Images/newlogo.jpg" alt="" />
            </div>
            <asp:Panel runat="server" ID="errorPanel" Visible="false">
                <div class="login_error">
                    <div class="msg">
                        <asp:Label ID="lblError" runat="server" Text="" Visible="false" CssClass="error"></asp:Label>
                        <asp:Label ID="lblInfo" runat="server" Text="" Visible="false"></asp:Label>
                        <asp:Panel ID="pnlTrialError" runat="server" Visible="false">
                            <asp:Label ID="Label1" runat="server" Text="Your trial period has expired." CssClass="error"></asp:Label><br />
                            <asp:Label ID="Label2" runat="server" Text="Please click " CssClass="error"></asp:Label>
                            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="http://simplicity4business-shop.co.uk">here</asp:HyperLink>
                            <asp:Label ID="Label3" runat="server" Text="to purchase your license." CssClass="error"></asp:Label>
                        </asp:Panel>
                    </div>
                    <div id="confirmationDialog" style="display: none">
                        <div class="hd">
                            Already Logged In</div>
                        <div class="error_thin">
                            You are already logged in from IP
                            <asp:Label ID="lblIP" runat="server" Text=""></asp:Label>.<br />
                            Press <b>Continue</b> to continue login. This will invalidate your other session.
                            <br />
                            Press <b>Cancel</b> to abort the login process from this machine.
                        </div>
                        <div class="ft" style="text-align: right">
                        </div>
                    </div>
                </div>
            </asp:Panel>
        </div>
        <div class="floatLeft">
            <div class="login_body">
                <div id="formdiv">
                    <div class="row">
                        <div class="col">
                            Username:
                        </div>
                        <div>
                            <asp:TextBox ID="tbUserName" runat="server" class="login_field"></asp:TextBox>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            Password:
                        </div>
                        <div>
                            <asp:TextBox ID="tbPassword" runat="server" TextMode="Password" class="login_field"></asp:TextBox>
                        </div>
                    </div>
                    <div class="row" style="height: 62px; padding-top: 29px;">
                        <div class="login_btn">
                            <div class="linkdiv">
                                <asp:LinkButton CssClass="btnText" runat="server" ID="btnLogin" OnClick="btnLogin_Click"
                                    NavigateUrl="index.html">LOGIN</asp:LinkButton>

                            </div>
                        </div>
                    </div>
                </div>
                <div style="clear: both;">
                </div>
                <div style="padding-left: 150px;">
                    <a href="<%= ConfigurationManager.AppSettings["SCurl"]%>/Products/HS/HSPrice.aspx?productId=2"
                        class="txt_blue" style="color: #333">SIGN UP HERE</a>
                </div>
            </div>
            <div style="clear: both;">
            </div>
            <div class="footer_sub">
                Copyright (c) Ultranova Coding Securities Ltd
            </div>
        </div>
    </div>
    <script type="text/javascript">
        // Instantiate the Dialog
        confirmationDialog = new YAHOO.widget.Dialog("confirmationDialog",
						        { width: "600px",
						            fixedcenter: true,
						            close: false,
						            zindex: 3,
						            modal: true,
						            visible: false,
						            constraintoviewport: false,
						            draggable: true
						        });
        confirmationDialog.render();

    </script>
    </form>
</body>
</html>
