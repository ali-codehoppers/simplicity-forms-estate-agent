<%@ Page Language="C#" MasterPageFile="~/Common/Main.master" AutoEventWireup="true"
    CodeFile="AddDepartment.aspx.cs" Inherits="Maintenance_AddDepartment" Title="Add Department" %>

<asp:Content ContentPlaceHolderID="HeadContentPlaceHolder" ID="Content3" runat="server">
    <style type="text/css">
        .ddl_field span
        {
            font-weight: bold;
        }
        .text_field span
        {
            font-weight: bold;
        }
    </style>
</asp:Content>
<asp:Content ContentPlaceHolderID="HeadingPlaceHolder" ID="Content2" runat="server">
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
    <div style="background-color: White; border-top: 1px solid white">
        <div style="margin: auto; width: 98%">
            <div style="float: left">
                <img src="<%=this.ResolveClientUrl("~/images/bc_left.jpg")%>" alt="" width="8" height="31" /></div>
            <div class="breadcrum_mid" style="height: 23px; padding-top: 8px; float: left; width: 96%">
                Add/Edit Department
            </div>
            <img src="<%=this.ResolveClientUrl("~/images/bc_right.jpg")%>" alt="" width="8" height="31" />
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" runat="Server">
    <div style="background-color: White; padding: 15px 10px 25px 10px; min-height:350px;">
        <div class="ddl_field" style="padding-bottom:5px;">
            <asp:Label ID="lblCompany" runat="server" Text="Company:"></asp:Label>
            <asp:DropDownList ID="ddlCompany" runat="server" DataTextField="Name"  CssClass="dropdown_txt"
                DataValueField="CompanyID">
            </asp:DropDownList>
        </div>
        <div class="text_field" style="padding-bottom:5px;">
            <div style="float:left; width:200px;">
                        <span>Department Description:</span>
            </div>
                        <asp:TextBox ID="txtDeptDescription" runat="server" Rows="5" CssClass="text_area" TextMode="MultiLine" style="width:300px"></asp:TextBox>

        </div>
        <div class="button_bar">
            <div style="float: left">
                <asp:Image ID="Image3" runat="server" ImageUrl="~/Images/btn_submit.jpg" />
            </div>
            <div style="float: left; height: 23px; padding-top: 8px; background-image: url('<%=this.ResolveClientUrl("~/images/btn_submit_mid.jpg")%>')">
                <asp:LinkButton ID="btnSave" runat="server" CssClass="txt_white" OnClick="btnSave_Click" >Save</asp:LinkButton>
                <asp:LinkButton ID="btnUpdate" runat="server" OnClick="btnUpdate_Click" Text="Update"  CssClass="txt_white"></asp:LinkButton>
            </div>
            
                <asp:Image ID="Image4" runat="server" ImageUrl="~/Images/btn_submit_right.jpg" />
            
         </div>
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
    </div>
    <div style="float: left; width: 100%">
        <div class="floatLeft">
            <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/left_bottom.gif" alt=""
                Width="15" Height="14" /></div>
        <div class="bottonMid">
        </div>
        <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/right_bottom.gif" alt=""
            Width="15" Height="14" />
    </div>
</asp:Content>
