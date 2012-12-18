<%@ Page Language="C#" MasterPageFile="~/Common/Main.master" AutoEventWireup="true"
    CodeFile="UploadOrder.aspx.cs" Inherits="Orders_UploadOrder" Title="Simplicity4Business" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContentPlaceHolder" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadingPlaceHolder" runat="Server">
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
                Upload E&amp;A Properties<br />
            </div>
            <img src="<%=this.ResolveClientUrl("~/images/bc_right.jpg")%>" alt="" width="8" height="31" />
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder" runat="Server">
    <div style="background-color: White; padding: 15px 10px 25px 10px; min-height: 290px">
        <div class="field">
            <div style="float: left; width: 200px;">
                <asp:Label ID="lblDepartment" runat="server" CssClass="label" Style="font-weight: bold"
                    Text="Department:">
               
                </asp:Label></div>
            <asp:DropDownList ID="ddlDepartments" runat="server" CssClass="dropdown_txt" AppendDataBoundItems="True"
                DataTextField="DepartmentDesc" DataValueField="Sequence"
                OnDataBound="ddlDepartments_DataBound">
            </asp:DropDownList>
            &nbsp;
        </div>
        <div class="field">
            <div style="float: left; width: 200px;">
                <asp:Label ID="lblCategory" runat="server" CssClass="label" Style="font-weight: bold"
                    Text="Category:">
               
                </asp:Label></div>
            <asp:DropDownList ID="ddlCategory" runat="server" CssClass="dropdown_txt" AppendDataBoundItems="True"
                DataTextField="CategoryDesc" DataValueField="Sequence"
                OnDataBound="ddlCategories_DataBound">
            </asp:DropDownList>
            &nbsp;
        </div>
        <div class="field" style="padding-left: 200px; padding-top: 5px;">
            <asp:FileUpload ID="fileUpload" runat="server" CssClass="field_txt" />
        </div>
        <div class="button_bar">
            <div style="float: left; padding-left: 10px;">
                <asp:Image ID="Image5" runat="server" ImageUrl="~/Images/btn_submit.jpg" />
            </div>
            <div style="float: left; height: 23px; padding-top: 8px; background-image: url('<%=this.ResolveClientUrl("~/images/btn_submit_mid.jpg")%>')">
                <asp:LinkButton ID="btnUpload" runat="server" Text="Upload" ValidationGroup="A" OnClick="btnUpload_Click"
                    CssClass="txt_white">Upload</asp:LinkButton>
            </div>
            <asp:Image ID="Image6" runat="server" ImageUrl="~/Images/btn_submit_right.jpg" />
        </div>
        <div style="font-size: 3; font-weight: bold; color: Navy;">
            <br />
            <b style="font-size:larger;">Format of CSV</b>
            <table>
                <tr>
                    <td>
                        &nbsp;
                    </td>
                </tr>
            </table>
            <table width="669" cellspacing="0" cellpadding="0">
                <tr>
                    <td>
                        <b>Please name the header values of the CSV file as bellow.</b>
                    </td>
                </tr>
                <tr>
                    <td>
                        <b>address_line1,address_line2,address_line3,address_line4,address_line5,address_post_code</b>
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td>
                        <b style="font-size:larger;">Example CSV File.</b>
                    </td>
                </tr>
                <tr>
                    <td>
                        <b>address_line1,address_line2,address_line3,address_line4,address_line5,address_post_code</b>
                    </td>
                </tr>
                <tr>
                    <td>
                        <b>Address line 1 of property,Address line 2,Address line 3,Address line 4,Address line 5,AB00 0ZZ</b>
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <div style="float: left; width: 100%">
        <div style="float: left">
            <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/left_bottom.gif" alt=""
                Width="15" Height="14" /></div>
        <div class="bottonMid">
        </div>
        <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/right_bottom.gif" alt=""
            Width="15" Height="14" />
    </div>
</asp:Content>
