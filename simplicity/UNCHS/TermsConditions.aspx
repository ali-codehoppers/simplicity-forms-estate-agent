<%@ Page Title="" Language="C#" MasterPageFile="~/Common/subMain.master" AutoEventWireup="true"
    CodeFile="TermsConditions.aspx.cs" Inherits="TermsConditions" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContentPlaceHolder" runat="Server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder" runat="Server" >
    <div style="background-color: White; border-bottom:1px solid white">
        <div style="clear:both">
        </div>
        <table width="1065px" border="0" cellspacing="0" cellpadding="0" style="margin-left:20px;margin-top:15px;padding-top:15px;">
                    <tr>
                      <td width="99%"><span style="color:#2372A6;font-size:20px;">Terms and Conditions</span></td>
                    </tr>
                  </table>
        <div style="margin: 20px; width: 700px;display:inline-block;float:left;">
        </div>
        <div style="display:inline-block;float:right;width:350px;">
            <img src="Images_Estate/at_sign.jpg" alt="@" style="float:left;" />
        </div>
        <div style="clear:both;"></div>
        <div style="width:100%;text-align:center">
            <asp:ImageButton runat="server" ImageUrl="Images_Estate/accept.png" ID="btnAgree" OnClick="btnAgree_Click" AlternateText="I accept that I have Read and Understood the above Disclaimer" />
        </div>
            

    </div>
    <div style="float:left; width:100%">
            <div style="float:left"><asp:Image ID="Image1" runat="server" ImageUrl="~/Images/left_bottom.gif" alt="" width="15" height="14" /></div>
            <div style="background-color:White; float:left; height:14px;width:97.2%;"></div>
            <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/right_bottom.gif" alt="" width="15" height="14" />
        </div>
    
</asp:Content>
