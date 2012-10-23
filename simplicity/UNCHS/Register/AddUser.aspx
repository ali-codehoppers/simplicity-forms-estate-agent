<%@ Page Language="C#" MasterPageFile="~/Common/Register.master" AutoEventWireup="true" CodeFile="AddUser.aspx.cs" Inherits="Register_AddUser" Title="Simplicity4Business" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>
<asp:Content ID="content4" ContentPlaceHolderID="MenuContentPlaceHolder" runat="server">
  <div class="selectcontainer"></div>
  <div class="schedule" ></div>
  <div class="checkoutselected" ></div>
  <div class="userbilling" ></div>
  <div class="verification" ></div>
</asp:Content>
<asp:Content ID="conttent3" ContentPlaceHolderID="HeadingContentPlaceHolder" runat="server">User Details</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" Runat="Server">
    
    <div class="text_field">
        <span>Full Name:</span><asp:TextBox ID="tbUserName" runat="server" CssClass="field_txt"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*"
         ControlToValidate="tbUserName" ValidationGroup="Add"></asp:RequiredFieldValidator>
    </div>
    <div class="text_field">
        <span>User Id:</span><asp:TextBox ID="tbUserLogon" runat="server" CssClass="field_txt" Enabled="false"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" 
        ControlToValidate="tbUserLogon" ValidationGroup="Add"></asp:RequiredFieldValidator>
    </div>
    <div class="text_field" <%=DivDisplay()%>>
        <span>Password:</span><asp:TextBox ID="tbUserEnable" runat="server" CssClass="field_txt" TextMode="Password" Visible="false"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" 
        ControlToValidate="tbUserEnable" ValidationGroup="Add"></asp:RequiredFieldValidator>
    </div>
    <div class="text_field" <%=DivDisplay()%>>
        <span>Confirm Password:</span><asp:TextBox ID="tbConfirmUserEnable" runat="server" CssClass="field_txt" TextMode="Password" Visible="false"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*" 
        ControlToValidate="tbConfirmUserEnable" ValidationGroup="Add"></asp:RequiredFieldValidator>
    </div>
    
    <div class="text_field" <%=DivDisplay()%>>
        <span>Password Reminder:</span><asp:TextBox ID="tbUserEnableReminder" runat="server" CssClass="field_txt" Visible="false"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" 
        ControlToValidate="tbUserEnableReminder" ValidationGroup="Add"></asp:RequiredFieldValidator>
    </div>
    <div class="text_field">
        <span>Telephone:</span><asp:TextBox ID="tbTelephone" runat="server" CssClass="field_txt"></asp:TextBox>
    </div>
    <div class="text_field">
        <span>Telephone(Ext):</span><asp:TextBox ID="tbTelExt" runat="server" CssClass="field_txt"></asp:TextBox>
    </div>
    <div class="text_field">
        <span>Mobile:</span><asp:TextBox ID="tbMobile" runat="server" CssClass="field_txt"></asp:TextBox>
    </div>
    <div class="text_field">
        <span>Email:</span><asp:TextBox ID="tbEmail" runat="server" CssClass="field_txt"></asp:TextBox>
    </div>
    <div class="text_field">
        <span>Department:</span><asp:TextBox ID="tbDepartment" runat="server" CssClass="field_txt"></asp:TextBox>
    </div>
    <div class="text_field">
        <span>Location:</span><asp:TextBox ID="tbLocation" runat="server" CssClass="field_txt"></asp:TextBox>
    </div>
    <div class="button_bar">
        <asp:Button ID="btnSave" runat="server" Text="Save & Continue" onclick="btnSave_Click" Visible="true" style="font: normal 12px Arial, Verdana, Helvetica, sans-serif;color: #333;height:30px;width:200px;background-image: url(../Images/filed_gradient.jpg);background-repeat: repeat-x;border: 1px solid #cccccc;" ValidationGroup="Add"/>
        <asp:Button ID="btnUpdate" runat="server" Text="Save & Continue" style="font: normal 12px Arial, Verdana, Helvetica, sans-serif;color: #333;height:30px;width:200px;background-image: url(../Images/filed_gradient.jpg);background-repeat: repeat-x;border: 1px solid #cccccc;"
            onclick="btnUpdate_Click" Visible="false" ValidationGroup="Add"/> 
    </div>    

</asp:Content>

