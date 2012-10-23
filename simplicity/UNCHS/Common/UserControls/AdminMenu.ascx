<%@ Control Language="C#" AutoEventWireup="true" CodeFile="AdminMenu.ascx.cs" Inherits="Common_UserControls_AdminMenu" %>
    <div class="left_nav_pnl" style="text-align:center; margin-top:20px;">
        ADMIN NAVIGATION
    </div>
    <div style="background-color:White; width:252px;">
    <asp:TreeView ID="UserMenuTree" runat="server" ExpandDepth="FullyExpand" CollapseImageUrl="~/Images/arrow_bottom.jpg" NoExpandImageUrl="~/Images/arrow_left.jpg"
    ExpandImageUrl="~/Images/arrow_left.jpg" NodeStyle-CssClass="left_nav_link" NodeStyle-HorizontalPadding="10px" style="padding-left:10px;">
        <Nodes>
            <asp:TreeNode NavigateUrl="~/AdminHome.aspx" Text="Home" Value="Home">
            </asp:TreeNode>
            
            <asp:TreeNode Text="Company" Value="Company" >
                <asp:TreeNode NavigateUrl="~/Admin/AddCompany.aspx" Text="Create Company" Value="Create Company"></asp:TreeNode>
                <asp:TreeNode NavigateUrl="~/Admin/CompanyList.aspx" Text="Company List" Value="Company List"></asp:TreeNode>
            </asp:TreeNode>
            <asp:TreeNode Text="Transfer" Value="Transfer" >
                <asp:TreeNode NavigateUrl="~/Admin/TransferHazards.aspx" Text="Transfer Hazards" Value="Transfer Hazards"></asp:TreeNode>
                <asp:TreeNode NavigateUrl="~/Admin/TransferPPE.aspx" Text="Transfer PPE" Value="Transfer PPE"></asp:TreeNode>
                <asp:TreeNode NavigateUrl="~/Admin/TransferTool.aspx" Text="Transfer Plants & Tools" Value="Transfer Plants & Tools"></asp:TreeNode>
                <asp:TreeNode NavigateUrl="~/Admin/TransferPeople.aspx" Text="Transfer People" Value="Transfer People"></asp:TreeNode>
                <%--<asp:TreeNode NavigateUrl="~/Admin/TransferAspects.aspx" Text="Transfer Aspects" Value="Transfer Aspects"></asp:TreeNode>--%>
            </asp:TreeNode>
            
            <asp:TreeNode Text="Departments" Value="Departments" >
                <asp:TreeNode NavigateUrl="~/Maintenance/AddDepartment.aspx" Text="Create Department" Value="Create Department"></asp:TreeNode>
                <asp:TreeNode NavigateUrl="~/Maintenance/DepartmentList.aspx" Text="Departments List" Value="Departments List"></asp:TreeNode>
            </asp:TreeNode>            
            <asp:TreeNode Text="Users" Value="Users" >
                <asp:TreeNode NavigateUrl="~/Admin/AddUser.aspx" Text="Create User" Value="Create User"></asp:TreeNode>
                <asp:TreeNode NavigateUrl="~/Admin/UsersList.aspx" Text="Users List" Value="Users List"></asp:TreeNode>
            </asp:TreeNode>            
            <asp:TreeNode Text="Users" Value="Documents" >
                <asp:TreeNode NavigateUrl="~/Admin/DocumentTypeList.aspx" Text="Document Types List" Value="Document Types List"></asp:TreeNode>
                <asp:TreeNode NavigateUrl="~/Maintenance/DocumentList.aspx" Text="Document List" Value="Document List"></asp:TreeNode>
            </asp:TreeNode>
            <asp:TreeNode NavigateUrl="~/Maintenance/ScreenList.aspx" Text="Screens List" Value="Screens List"></asp:TreeNode>
        </Nodes>
    </asp:TreeView>
    <div style="float:left;">
            <div style="float:left"><asp:Image ID="Image1" runat="server" ImageUrl="~/Images/left_bottom.gif" alt="" width="15" height="14" /></div>
            <div style="background-color:White; float:left; height:14px;width:222px;"></div>
            <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/right_bottom.gif" alt="" width="15" height="14" />
        </div>
    </div>
    
