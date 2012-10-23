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
    <div style="background-color: White; padding: 15px 10px 25px 10px">
        <div class="ddl_field" style="padding-bottom:5px;">
            <asp:Label ID="lblCompany" runat="server" Text="Company:"></asp:Label>
            <asp:DropDownList ID="ddlCompany" runat="server" DataSourceID="odsCompanies" DataTextField="co_name_short"  CssClass="dropdown_txt"
                DataValueField="co_id">
            </asp:DropDownList>
        </div>
        <div class="text_field" style="padding-bottom:5px;">
            <div style="float: left; width: 200px;">
                <span>Department Name Short:</span>
            </div>
            <asp:TextBox ID="txtCompanyShortName" runat="server" CssClass="field_txt"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtCompanyShortName"
                ErrorMessage="*Short Name Required">     </asp:RequiredFieldValidator></div>
        <div class="text_field" style="padding-bottom:5px;">
            <div style="float: left; width: 200px;">
                <span>Department Name Long:</span>
            </div>
            <asp:TextBox ID="txtCompanyLongName" runat="server" CssClass="field_txt"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtCompanyLongName"
                ErrorMessage="*Long Name Required"></asp:RequiredFieldValidator></div>
        <div class="text_field" style="padding-bottom:5px;">
        <div style="float:left; width:200px;">
            <span>Contact Title:</span>
            </div><asp:TextBox ID="txtContactTitle" runat="server" CssClass="field_txt"></asp:TextBox></div>
        <div class="text_field" style="padding-bottom:5px;">
        <div style="float:left; width:200px;">
            <span>Contact Initials:</span></div><asp:TextBox ID="txtContactInitial" runat="server" CssClass="field_txt"></asp:TextBox></div>
        <div class="text_field" style="padding-bottom:5px;">
        <div style="float:left; width:200px;">
            <span>Contact Forename:</span></div><asp:TextBox ID="txtForename" runat="server" CssClass="field_txt"></asp:TextBox></div>
        <div class="text_field" style="padding-bottom:5px;">
        <div style="float:left; width:200px;">
            <span>Contact Surname:</span></div><asp:TextBox ID="txtSurname" runat="server" CssClass="field_txt"></asp:TextBox></div>
        <div class="text_field" style="padding-bottom:5px;">
        <div style="float:left; width:200px;">
            <span>Address No:</span></div><asp:TextBox ID="txtAddressNo" runat="server" CssClass="field_txt"></asp:TextBox></div>
        <div class="text_field" style="padding-bottom:5px;">
        <div style="float:left; width:200px;">
            <span>Address:</span></div><asp:TextBox ID="txtAddress1" runat="server" CssClass="field_txt"></asp:TextBox></div>
        <div class="text_field" style="padding-bottom:5px;">
        <div style="float:left; width:200px;">
            <span>&nbsp;</span></div>
            <asp:TextBox ID="txtAddress2" runat="server" CssClass="field_txt"></asp:TextBox></div>
        <div class="text_field" style="padding-bottom:5px;">
        <div style="float:left; width:200px;">
            <span>&nbsp;</span></div>

            <asp:TextBox ID="txtAddress3" runat="server" CssClass="field_txt"></asp:TextBox></div>
        <div class="text_field" style="padding-bottom:5px;">
        <div style="float:left; width:200px;">
            <span>&nbsp;</span></div>
            <asp:TextBox ID="txtAddress4" runat="server" CssClass="field_txt"></asp:TextBox></div>
        <div class="text_field" style="padding-bottom:5px;">
        <div style="float:left; width:200px;">
            <span>&nbsp;</span></div>
            <asp:TextBox ID="txtAddress5" runat="server" CssClass="field_txt"></asp:TextBox></div>
        <div class="text_field" style="padding-bottom:5px;">
        <div style="float:left; width:200px;">
            <span>Postal Code:</span></div><asp:TextBox ID="txtPostalCode" runat="server" CssClass="field_txt"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtPostalCode"
                ErrorMessage="*Postal code Required"></asp:RequiredFieldValidator></div>
        <div class="text_field" style="padding-bottom:5px;">
        <div style="float:left; width:200px;">
            <span>Phone 1:</span></div><asp:TextBox ID="txtTele1" runat="server" CssClass="field_txt"></asp:TextBox></div>
        <div class="text_field" style="padding-bottom:5px;">
        <div style="float:left; width:200px;">
            <span>Phone 2:</span></div><asp:TextBox ID="txtTele" runat="server" CssClass="field_txt"></asp:TextBox></div>
        <div class="text_field" style="padding-bottom:5px;">
        <div style="float:left; width:200px;">
            <span>Fax:</span></div><asp:TextBox ID="txtFax" runat="server" CssClass="field_txt"></asp:TextBox></div>
        <div class="text_field" style="padding-bottom:5px;">
        <div style="float:left; width:200px;">
            <span>Email:</span></div><asp:TextBox ID="txtEmail" runat="server" CssClass="field_txt"></asp:TextBox>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtEmail"
                ErrorMessage="*Enter a valid email address." ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
        </div>
        <div class="text_field" style="padding-bottom:5px;">
            <div style="float:left; width:200px;">
                        <span>Notes:</span>
            </div>
                        <asp:TextBox ID="txtCoNotes" runat="server" Rows="5" CssClass="text_area" TextMode="MultiLine" style="width:300px"></asp:TextBox>

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
        <asp:ObjectDataSource ID="odsCompanies" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetAllCompanies" TypeName="CompanyTableAdapters.un_co_detailsTableAdapter">
        </asp:ObjectDataSource>
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
