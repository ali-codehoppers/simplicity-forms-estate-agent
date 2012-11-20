<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="nLogin" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Login</title>
    <link id="Link1" runat="server" rel="shortcut icon" href="favicon.ico" type="image/x-icon" />
    <link id="Link2" runat="server" rel="icon" href="favicon.ico" type="image/ico" />
    <%--<link rel="stylesheet" type="text/css" href="~/Common/StyleSheets/newstylesheet.css" />--%>
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
    <style type="text/css">
        .logo-positioning{
		    position:absolute;
		    left:120px;
		    top:130px;
		    z-index:1;
	    }
	    .back_ground_gradient{
		    background: #C3D4E4; /* for non-css3 browsers */
		    filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#DDE7F0', endColorstr='#C3D4E4'); /* for IE */
		    background: -webkit-gradient(linear, left top, left bottom, from(#DDE7F0), to(#C3D4E4)); /* for webkit browsers */
		    background: -moz-linear-gradient(top,  #DDE7F0,  #C3D4E4); /* for firefox 3.6+ */
	    }
	    .fields-panel-positioning{
		    position:relative;
		    left:850px;
		    top: 75px;
		    width:354px;
            height:370px;
	    }
	    .get-in-touch-positioning{
		    position:relative;
		    float:right;
		    right:20px;
		    top:-330px;
	    }
	    .fields-box{
		    position:relative;
		    left:20px;
		    top:-320px;
		    font-size:18px;
	    }
        .txtbox
        {
            border-top-left-radius: 5px;
		    border-top-right-radius: 5px;
		    border-bottom-left-radius: 5px;
		    border-bottom-right-radius: 5px;
		    background-color: white;
		    border: 1px solid #CCC;
		    height:23px;
		    padding:4px;
		    line-height:22px;
		    width:86%;
        }
	    body{
		    background-color:#DBE0E4;
		    font-family:Arial, Helvetica, sans-serif;
            margin:0;
	    }
    </style>
</head>
<body style="height:100%;">
    <form id="form1" runat="server">
    <div id="maindiv">
        <%--<div id="leftdiv">
            <div class="logodiv">
                <img src="Images/newlogo.jpg" alt="" />
            </div>--%>
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
        <div class="back_ground_gradient" style="height:440px;">
            <div style="position:relative;top:120px;width:100%;">
			    <img src="Images_Estate/blue_bg.jpg" height="110" alt="blue_strip_bg" style="width:100%;" />
            </div>
            <div class="logo-positioning">
        	    <img src="Images_Estate/logo.png" width="413" height="382" alt="logo"/>
            </div>
            <div class="fields-panel-positioning">
                <div>
                    <img src="Images_Estate/panel.png" width="354" height="294" alt="username and password" />
                    <div style="display:inline-block;width:175px; float:left;">
                        <asp:ImageButton runat="server" Width="175" Height="58" ImageUrl="Images_Estate/forgot_psswdd.png" ID="ForgotPasswordButton" OnClick="btnForgot_Password_Click" AlternateText="Forgot Password" />
                        <%--<img src="Images_Estate/forgot_psswdd.png" width="175" height="58" alt="forgot password" />--%>
                    </div>
                    <div style="display:inline-block;width:175px; float:left;">
                        <asp:ImageButton runat="server" Width="175" Height="58" ImageUrl="Images_Estate/sign_up.png" ID="SignUpButton" OnClick="btnSign_Up_Click" AlternateText="Sign Up Here" />
                        <%--<img src="Images_Estate/sign_up.png" width="175" height="58" alt="Sign Up" style="display:inline;" />--%>
                    </div>
                </div>
                <div class="get-in-touch-positioning">
                    <img src="Images_Estate/get_touch.png" width="124" height="18" alt="get in touch" />
                </div>
                <div style="clear:both;"></div>
                <div class="fields-box">
                    <div>
                        <asp:Label runat="server" ID="errorBox" Visible="false" style="color:red;font-size:16px;">Incorrect username or password</asp:Label>
            	    </div>
                    <div style="display:inline-block;margin-bottom:5px;">
	            	    Username:
                    </div>
                    <div>
                        <asp:TextBox ID="tbUserName" runat="server" CssClass="txtbox" style="margin-bottom:10px;"></asp:TextBox>
                    </div>
                    <div style="display:inline-block;margin-bottom:5px;">
	            	    password:
                    </div>
                    <div>
                        <asp:TextBox ID="tbPassword" runat="server" TextMode="Password" CssClass="txtbox"></asp:TextBox>
                    </div>
                    <div style="margin-top:10px;">
                        <asp:ImageButton runat="server" Width="147" Height="59" ImageUrl="Images_Estate/login_btn.png" ID="btnLogin" OnClick="btnLogin_Click" AlternateText="Login" />
                    </div>
                </div>
    	    </div>
        </div>

                    <%--<div class="row" style="height: 62px; padding-top: 29px;">
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
                    <a href="<%= ConfigurationManager.AppSettings["SCurl"]%>/Products/HS/HSPrice.aspx?productId=7"
                        class="txt_blue" style="color: #333">SIGN UP HERE</a>
                </div>
            </div>
            <div style="clear: both;">
            </div>
            <div class="footer_sub">
                Copyright (c) Ultranova Coding Securities Ltd
            </div>
        </div>
    </div>--%>
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
