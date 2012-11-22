<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UserMenu.ascx.cs" Inherits="Common_UserControls_UserMenu" %>
<div class="left_nav_pnl" style="text-align: center;">
    MAIN NAVIGATION
</div>
<div style="background-color: White; width: 252px;">
   
    <div id="cover"><asp:Image runat="server" ID="Image3" ImageUrl="~/Images/loadingCir.gif" /></div>
    <ul id="red" class="treeview-red" style="width: 100%; min-height: 330px;display:none;">
        <li id="red-home" ><span class="txt_black">
            <asp:Image runat="server" ID="HomeNodeImage" ImageUrl="~/Images/arrow_left.jpg" />
            <asp:HyperLink runat="server" CssClass="txt_black" ID="HomeNode" NavigateUrl="~/UserHome.aspx">Home</asp:HyperLink>
        </span></li>
        <li id="red-folder"><span class="txt_black_collapse">
                    <asp:HyperLink runat="server" CssClass="txt_black" ID="SearchNode" NavigateUrl="~/Orders/SearchOrder.aspx">Properties List</asp:HyperLink></span>
            <ul>
                <li id="red-createfolder"><span class="txt_black">
                    <asp:Image runat="server" ID="CreateNodeImage" ImageUrl="~/Images/arrow_left.jpg" />
                    <asp:HyperLink runat="server" CssClass="txt_black" ID="CreateNode" NavigateUrl="~/Orders/AddOrder.aspx">Create Address</asp:HyperLink>
                </span></li>
                <li id="red-uploadfolder"><span class="txt_black">
                    <asp:Image runat="server" ID="UploadNodeImage" ImageUrl="~/Images/arrow_left.jpg" />
                    <asp:HyperLink runat="server" CssClass="txt_black" ID="UploadNode" NavigateUrl="~/Orders/UploadOrder.aspx">Upload Addresses</asp:HyperLink>
                </span></li>
            </ul>
        </li>
        <li id="red-settings"><span class="txt_black_collapse">Settings</span>
            <ul>
                <li id="red-departments"><span class="txt_black_collapse">Departments</span>
                    <ul>
                        <li id="red-adddepartments"><span class="txt_black">
                            <asp:Image runat="server" ID="CreateDeptNodeImage" ImageUrl="~/Images/arrow_left.jpg" />
                            <asp:HyperLink runat="server" CssClass="txt_black" ID="CreateDeptNode" NavigateUrl="~/Maintenance/AddDepartment.aspx">Create Department</asp:HyperLink>
                        </span></li>
                        <li id="red-listdepartments"><span class="txt_black">
                            <asp:Image runat="server" ID="CreateDeptListNodeImage" ImageUrl="~/Images/arrow_left.jpg" />
                            <asp:HyperLink runat="server" CssClass="txt_black" ID="CreateDeptListNode" NavigateUrl="~/Maintenance/DepartmentList.aspx">Departments List</asp:HyperLink>
                        </span></li>
                    </ul>
                </li>

                <li id="red-categories"><span class="txt_black_collapse">Categories</span>
                    <ul>
                        <li id="red-addcategories"><span class="txt_black">
                            <asp:Image runat="server" ID="CreateCategoryNodeImage" ImageUrl="~/Images/arrow_left.jpg" />
                            <asp:HyperLink runat="server" CssClass="txt_black" ID="CreateCategoryNode" NavigateUrl="~/Maintenance/AddCategories.aspx">Create Categories</asp:HyperLink>
                        </span></li>
                        <li id="red-listcategories"><span class="txt_black">
                            <asp:Image runat="server" ID="CreateCategoryListNodeImage" ImageUrl="~/Images/arrow_left.jpg" />
                            <asp:HyperLink runat="server" CssClass="txt_black" ID="CreateCategoryListNode" NavigateUrl="~/Maintenance/CategoriesList.aspx">Categories List</asp:HyperLink>
                        </span></li>
                    </ul>
                </li>
            </ul>
        </li>
        <li id="red-guide"><span class="txt_black">
            <asp:Image runat="server" ID="GuideNodeImage" ImageUrl="~/Images/arrow_left.jpg" />
            <asp:HyperLink runat="server" ID="GuideNode" NavigateUrl="~/Common/help/help.pdf"
                Target="_blank" CssClass="txt_black">User Guide</asp:HyperLink>
        </span></li>
    </ul>
</div>
    <div style="float: left;">
        <div style="float: left">
            <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/left_bottom.gif" alt=""
                Width="15" Height="14" /></div>
        <div style="background-color: White; float: left; height: 14px; width: 221px;">
        </div>
        <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/right_bottom.gif" alt=""
            Width="15" Height="14" />
    </div>
