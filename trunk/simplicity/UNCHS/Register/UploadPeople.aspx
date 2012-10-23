<%@ Page Language="C#" MasterPageFile="~/Common/Register.master" AutoEventWireup="true" CodeFile="UploadPeople.aspx.cs" Inherits="Register_UploadPeople" Title="Simplicity4Business" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="content4" ContentPlaceHolderID="MenuContentPlaceHolder" runat="server">
  <div class="selectcontainer"></div>
  <div class="schedule" ></div>
  <div class="checkout" ></div>
  <div class="userbilling" ></div>
  <div class="verificationselected" ></div>
</asp:Content>
<asp:Content ID="conttent3" ContentPlaceHolderID="HeadingContentPlaceHolder" runat="server">Upload People</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" Runat="Server">
    <div>
        <div class="field">Upload list of People for your Company</div>
        <div>            
            <asp:FileUpload ID="FileUploader" runat="server" CssClass="field_txt"/>
            <asp:Button ID="UploadButton" runat="server" Text="Upload" OnClick="UploadButton_Click" style="font: normal 12px Arial, Verdana, Helvetica, sans-serif;color: #333;height:18px;background-image: url(../Images/filed_gradient.jpg);background-repeat: repeat-x;border: 1px solid #cccccc;"/>
        </div>
        <div style="color:Gray">
            The file should be a CSV file with the following format. 
            <br />
            Please also note that headers should be provided in the first row. Any data in first row will not be processed.<br /><br />
            Click <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Register/CSVHelp.aspx?return=2">here</asp:HyperLink> on help on how to create CSV file. <br />
            Click <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Register/Simplicity4Business_SampleCSV_UploadPeople.csv">here</asp:HyperLink> to open a Sample CSV file. <br /><br />
        </div>
        
        <div>
            <table style="width:100%;" class="uploadTable" cellpadding="0" cellspacing="0">
            <thead>
            <tr>
                <td>
                    Name</td>
                <td>
                    Supervisor?</td>
                <td>
                    First Aider?</td>
                <td>
                    Fire Warden?</td>
            </tr>
            </thead>
            <tbody>
            <%for (int i = 0; i < 9; i++)
            { %>
            <tr>
                <td>
                    John Doe</td>
                <td>
                    1</td>
                <td>
                    1</td>
                <td>
                    1</td>
                    
            </tr>
            <%} %>
            </tbody>
        </table>

        </div>
        <div class="infoMessage" style="margin-top:10px">
            Please note that 0 means that the given user does <b><u>not</u></b> have the said role. You can user false/no also instead of 0.<br /> 
            Please note that 1 means that the given user does have the said role. You can user true/yes also instead of 1.
        </div>
    <div class="button_bar">
        <asp:Button ID="btnContinue" runat="server" Text="Continue" onclick="btnContinue_Click" Visible="true" style="font: normal 12px Arial, Verdana, Helvetica, sans-serif;color: #333;height:30px;width:200px;background-image: url(../Images/filed_gradient.jpg);background-repeat: repeat-x;border: 1px solid #cccccc;"/>
    </div>        
    </div>
</asp:Content>

