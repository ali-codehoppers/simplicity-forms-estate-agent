<%@ Page Language="C#" MasterPageFile="~/Common/Main.master" AutoEventWireup="true" CodeFile="Default2.aspx.cs" Inherits="TestPages_Default2" Title="Simplicity4Business" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContentPlaceHolder" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadingPlaceHolder" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder" Runat="Server">
    <asp:Wizard ID="Wizard1" runat="server" BackColor="#F7F6F3" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" Height="100%" Width="100%">
        <WizardSteps>
            <asp:WizardStep ID="WizardStep1" runat="server" Title="Main">
            </asp:WizardStep>
            <asp:WizardStep ID="WizardStep2" runat="server" Title="People">
            </asp:WizardStep>
            <asp:WizardStep runat="server" Title="Hazard">
            </asp:WizardStep>
            <asp:WizardStep runat="server" Title="Sig Hazard">
            </asp:WizardStep>
            <asp:WizardStep runat="server" Title="Exit Points">
            </asp:WizardStep>
            <asp:WizardStep runat="server" Title="Access Points">
            </asp:WizardStep>
        </WizardSteps>
        <StepStyle BorderWidth="0px" ForeColor="#5D7B9D" />
        <SideBarButtonStyle BorderWidth="0px" Font-Names="Verdana" ForeColor="White" />
        <NavigationButtonStyle BackColor="#FFFBFF" BorderColor="#CCCCCC" BorderStyle="Solid"
            BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#284775" />
        <SideBarStyle BackColor="#7C6F57" BorderWidth="0px" Font-Size="0.9em" VerticalAlign="Top" />
        <HeaderStyle BackColor="#5D7B9D" BorderStyle="Solid" Font-Bold="True" Font-Size="0.9em"
            ForeColor="White" HorizontalAlign="Left" />
    </asp:Wizard>
</asp:Content>

