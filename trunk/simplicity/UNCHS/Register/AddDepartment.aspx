<%@ Page Language="C#" MasterPageFile="~/Common/Register.master" AutoEventWireup="true" CodeFile="AddDepartment.aspx.cs" Inherits="Register_AddDepartment" Title="Simplicity4Business" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="content4" ContentPlaceHolderID="MenuContentPlaceHolder" runat="server">
  <div class="selectcontainer"></div>
  <div class="scheduleselected" ></div>
  <div class="checkout" ></div>
  <div class="userbilling" ></div>
  <div class="verification" ></div>
</asp:Content>
<asp:Content ID="conttent3" ContentPlaceHolderID="HeadingContentPlaceHolder" runat="server">Deparment Details</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" Runat="Server">
     <div class="text_field"><span>Department Name Short:</span><asp:TextBox ID="txtCompanyShortName" runat="server" CssClass="field_txt"></asp:TextBox>
     <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtCompanyShortName"
             ErrorMessage="*Short Name Required">     </asp:RequiredFieldValidator></div>
     <div class="text_field"><span >Department Name Long:</span><asp:TextBox ID="txtCompanyLongName" runat="server" CssClass="field_txt"></asp:TextBox>
         <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtCompanyLongName"
             ErrorMessage="*Long Name Required"></asp:RequiredFieldValidator></div>
     <div class="text_field"><span >Contact Title:</span><asp:TextBox ID="txtContactTitle" runat="server" CssClass="field_txt"></asp:TextBox></div>
     <div class="text_field"><span >Contact Initials:</span><asp:TextBox ID="txtContactInitial" runat="server" CssClass="field_txt"></asp:TextBox></div>
     <div class="text_field"><span >Contact Forename:</span><asp:TextBox ID="txtForename" runat="server" CssClass="field_txt"></asp:TextBox></div>
     <div class="text_field"><span >Contact Surname:</span><asp:TextBox ID="txtSurname" runat="server" CssClass="field_txt"></asp:TextBox></div>
     <div class="text_field"><span >Address No:</span><asp:TextBox ID="txtAddressNo" runat="server" CssClass="field_txt"></asp:TextBox></div>
     <div class="text_field"><span >Address:</span><asp:TextBox ID="txtAddress1" runat="server" CssClass="field_txt"></asp:TextBox></div>
     <div class="text_field"><span ></span><asp:TextBox ID="txtAddress2" runat="server" CssClass="field_txt"></asp:TextBox></div>
     <div class="text_field"><span ></span><asp:TextBox ID="txtAddress3" runat="server" CssClass="field_txt"></asp:TextBox></div>
     <div class="text_field"><span ></span><asp:TextBox ID="txtAddress4" runat="server" CssClass="field_txt"></asp:TextBox></div>
     <div class="text_field"><span ></span><asp:TextBox ID="txtAddress5" runat="server" CssClass="field_txt"></asp:TextBox></div>
     <div class="text_field"><span >Postal Code:</span><asp:TextBox ID="txtPostalCode" runat="server" CssClass="field_txt"></asp:TextBox>
     <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtPostalCode"
             ErrorMessage="*Postal code Required"></asp:RequiredFieldValidator></div>
     
     <div class="text_field"><span >Phone 1:</span><asp:TextBox ID="txtTele1" runat="server" CssClass="field_txt"></asp:TextBox></div>
     <div class="text_field"><span >Phone 2:</span><asp:TextBox ID="txtTele" runat="server" CssClass="field_txt"></asp:TextBox></div>
     <div class="text_field"><span >Fax:</span><asp:TextBox ID="txtFax" runat="server" CssClass="field_txt"></asp:TextBox></div>
     <div class="text_field"><span >Email:</span><asp:TextBox ID="txtEmail" runat="server" CssClass="field_txt"></asp:TextBox>
         <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtEmail"
             ErrorMessage="*Enter a valid email address." ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
     </div>
     <div class="text_field">
        <table border="0" cellpadding="0" cellspacing="0"><tr><td style="vertical-align:middle;"><span >Notes:</span></td><td><asp:TextBox ID="txtCoNotes" runat="server" Rows="5"
            TextMode="MultiLine"  CssClass="textarea_txt"></asp:TextBox></td>
        </tr>
        </table>
     </div>
     <div class="button_bar">
        <asp:Button ID="btnSave" runat="server" Text="Save & Continue" OnClick="btnSave_Click" style="font: normal 12px Arial, Verdana, Helvetica, sans-serif;color: #333;height:30px;width:200px;background-image: url(../Images/filed_gradient.jpg);background-repeat: repeat-x;border: 1px solid #cccccc;"/>
         <asp:Button ID="btnUpdate" runat="server" OnClick="btnUpdate_Click" Text="Save & Continue" Visible="false" style="font: normal 12px Arial, Verdana, Helvetica, sans-serif;color: #333;height:30px;width:200px;background-image: url(../Images/filed_gradient.jpg);background-repeat: repeat-x;border: 1px solid #cccccc;"/>
         
    </div>

</asp:Content>

