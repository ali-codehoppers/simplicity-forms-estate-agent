<%@ Page Title="" Language="C#" MasterPageFile="~/Common/subMain.master" AutoEventWireup="true"
    CodeFile="TermsConditions.aspx.cs" Inherits="TermsConditions" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContentPlaceHolder" runat="Server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder" runat="Server" >
    <div class="termLeftCurve">
    </div>
    <div  class="termMidCurve">
    </div>
    <div class="termRightCurve">
    </div>
    <div style="background-color: White; border-bottom:1px solid white">
    <div style="clear:both">
    </div>
        <table width="1065px" border="0" cellspacing="0" cellpadding="0" style="margin-left:15px;">
                    <tr>
                      <td width="1%" align="right"><img src="images/bc_left.jpg" alt="" width="8" height="31" /></td>
                      <td width="99%" class="breadcrum_mid"><b>Terms and Conditions</b></td>
                      <td width="0%"><img src="images/bc_right.jpg" alt="" width="8" height="31" /></td>
                    </tr>
                  </table>
        <div style="margin: auto; width: 839px;">
            
            <div class="terms" style="margin-top:30px">
                
            </div>
            <div class="terms">
                
            </div>
            <div class="terms">
                
                
            </div>
            <div style="width:100%;text-align:center">
                <button class="rounded" id="btnAgree" runat="server" onserverclick="btnAgree_Click">
	                <span>I accept that I have Read and Understood the above Disclaimer</span>	
                </button>
            </div>
        </div>

            

    </div>
    <div style="float:left; width:100%">
            <div style="float:left"><asp:Image ID="Image1" runat="server" ImageUrl="~/Images/left_bottom.gif" alt="" width="15" height="14" /></div>
            <div style="background-color:White; float:left; height:14px;width:97.2%;"></div>
            <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/right_bottom.gif" alt="" width="15" height="14" />
        </div>
    
</asp:Content>
