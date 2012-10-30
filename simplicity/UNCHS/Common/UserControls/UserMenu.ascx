<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UserMenu.ascx.cs" Inherits="Common_UserControls_UserMenu" %>
<div class="left_nav_pnl" style="text-align: center;">
    MAIN NAVIGATION
</div>
<div style="background-color: White; width: 252px;">
    <ul id="red" class="treeview-red" style="width: 100%; min-height: 330px;">
        <li id="red-home" ><span class="txt_black">
            <asp:Image runat="server" ID="HomeNodeImage" ImageUrl="~/Images/arrow_left.jpg" />
            <asp:HyperLink runat="server" CssClass="txt_black" ID="HomeNode" NavigateUrl="~/UserHome.aspx">Home</asp:HyperLink>
        </span></li>
        <li id="red-folder"><span class="txt_black_collapse">
            <%--<asp:Image runat="server" ID="SearchNodeImage" ImageUrl="~/Images/arrow_left.jpg" />--%>
                    <asp:HyperLink runat="server" CssClass="txt_black" ID="SearchNode" NavigateUrl="~/Orders/SearchOrder.aspx">Properties List</asp:HyperLink></span>
            <ul>
                <li id="red-createfolder"><span class="txt_black">
                    <asp:Image runat="server" ID="CreateNodeImage" ImageUrl="~/Images/arrow_left.jpg" />
                    <asp:HyperLink runat="server" CssClass="txt_black" ID="CreateNode" NavigateUrl="~/Orders/AddOrder.aspx">Create Address</asp:HyperLink>
                </span></li>
                <%--<li id="red-searchfolder"><span class="txt_black">
                    <asp:Image runat="server" ID="SearchNodeImage" ImageUrl="~/Images/arrow_left.jpg" />
                    <asp:HyperLink runat="server" CssClass="txt_black" ID="SearchNode" NavigateUrl="~/Orders/SearchOrder.aspx">Search Properties</asp:HyperLink>
                </span></li>--%>
                <li id="red-uploadfolder"><span class="txt_black">
                    <asp:Image runat="server" ID="UploadNodeImage" ImageUrl="~/Images/arrow_left.jpg" />
                    <asp:HyperLink runat="server" CssClass="txt_black" ID="UploadNode" NavigateUrl="~/Orders/UploadOrder.aspx">Upload Addresses</asp:HyperLink>
                </span></li>
            </ul>
        </li>
        <%--<li id="red-signage"><span class="txt_black">
            <asp:Image runat="server" ID="SignageNodeImage" ImageUrl="~/Images/arrow_left.jpg" />
            <asp:HyperLink runat="server" CssClass="txt_black" ID="SignageNode" NavigateUrl="~/GenerateSignage.aspx">Signage</asp:HyperLink>
        </span></li>--%>
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


                <%--<li id="red-safety"><span class="txt_black_collapse">Safety Method Statement Default</span>
                    <ul>
                        <li id="red-default"><span class="txt_black">
                            <asp:Image runat="server" ID="DefaultListNodeImage" ImageUrl="~/Images/arrow_left.jpg" />
                            <asp:HyperLink CssClass="txt_black" runat="server" ID="DefaultListNode" NavigateUrl="~/Maintenance/DepartmentPersonList.aspx">Default Person List</asp:HyperLink></span></li>
                        <li id="red-ppe"><span class="txt_black_collapse">PPE</span>
                            <ul>
                                <li id="red-categoryppe"><span class="txt_black">
                                    <asp:Image runat="server" ID="PPENodeImage" ImageUrl="~/Images/arrow_left.jpg" />
                                    <asp:HyperLink CssClass="txt_black" runat="server" ID="PPENode" NavigateUrl="~/Maintenance/DepartmentPPECategoryList.aspx">PPE Category List</asp:HyperLink>
                                </span></li>
                                <li id="red-listppe"><span class="txt_black">
                                    <asp:Image runat="server" ID="PPEListNodeImage" ImageUrl="~/Images/arrow_left.jpg" />
                                    <asp:HyperLink CssClass="txt_black" runat="server" ID="PPEListNode" NavigateUrl="~/Maintenance/DepartmentPPEList.aspx">Default PPE List</asp:HyperLink>
                                </span></li>
                            </ul>
                        </li>
                        <li id="red-hazards"><span class="txt_black_collapse">Key Hazards</span>
                            <ul>
                                <li id="red-categoryhazards"><span class="txt_black">
                                    <asp:Image runat="server" ID="KeyNodeImage" ImageUrl="~/Images/arrow_left.jpg" />
                                    <asp:HyperLink CssClass="txt_black" runat="server" ID="KeyNode" NavigateUrl="~/Maintenance/DepartmentHazardCategoryList.aspx">Key Hazard Category List</asp:HyperLink></span></li>
                                <li id="red-listhazards"><span class="txt_black">
                                    <asp:Image runat="server" ID="KeyListNodeImage" ImageUrl="~/Images/arrow_left.jpg" />
                                    <asp:HyperLink CssClass="txt_black" runat="server" ID="KeyListNode" NavigateUrl="~/Maintenance/DepartmentHazardList.aspx">Default Key Hazards List </asp:HyperLink></span></li>
                            </ul>
                        </li>
                        <li id="red-tools"><span class="txt_black_collapse">Plants & Tools</span>
                            <ul>
                                <li id="red-categorytools"><span class="txt_black">
                                    <asp:Image runat="server" ID="PlantNodeImage" ImageUrl="~/Images/arrow_left.jpg" />
                                    <asp:HyperLink CssClass="txt_black" runat="server" ID="PlantNode" NavigateUrl="~/Maintenance/DepartmentToolCategoryList.aspx">Plants & Tools Category List</asp:HyperLink></span></li>
                                <li id="red-listtools"><span class="txt_black">
                                    <asp:Image runat="server" ID="PlantListNodeImage" ImageUrl="~/Images/arrow_left.jpg" />
                                    <asp:HyperLink CssClass="txt_black" runat="server" ID="PlantListNode" NavigateUrl="~/Maintenance/DepartmentToolList.aspx">Default Plants & Tools List</asp:HyperLink></span></li>
                            </ul>
                        </li>
                        <li id="red-work"><span class="txt_black_collapse">Works</span>
                            <ul>
                                <li id="red-categorywork"><span class="txt_black">
                                    <asp:Image runat="server" ID="WorkNodeImage" ImageUrl="~/Images/arrow_left.jpg" />
                                    <asp:HyperLink CssClass="txt_black" runat="server" ID="WorkNode" NavigateUrl="~/Maintenance/DepartmentWorkCategoryList.aspx">Work Category List</asp:HyperLink></span></li>
                                <li id="red-listwork"><span class="txt_black">
                                    <asp:Image runat="server" ID="WorkListNodeImage" ImageUrl="~/Images/arrow_left.jpg" />
                                    <asp:HyperLink CssClass="txt_black" runat="server" ID="WorkListNode" NavigateUrl="~/Maintenance/DepartmentWorkList.aspx">Default Works List</asp:HyperLink></span></li>
                            </ul>
                        </li>
                        <li id="red-emergency"><span class="txt_black_collapse">Emergency</span>
                            <ul>
                                <li id="red-categoryemergency"><span class="txt_black">
                                    <asp:Image runat="server" ID="EmergencyNodeImage" ImageUrl="~/Images/arrow_left.jpg" />
                                    <asp:HyperLink CssClass="txt_black" runat="server" ID="EmergencyNode" NavigateUrl="~/Maintenance/DepartmentEmergencyCategoryList.aspx">Emergency Category List</asp:HyperLink></span></li>
                                <li id="red-listemergency"><span class="txt_black">
                                    <asp:Image runat="server" ID="EmergencyListNodeImage" ImageUrl="~/Images/arrow_left.jpg" />
                                    <asp:HyperLink CssClass="txt_black" runat="server" ID="EmergencyListNode" NavigateUrl="~/Maintenance/DepartmentEmergencyList.aspx">Default Emergency List</asp:HyperLink></span></li>
                            </ul>
                        </li>
                        <li id="red-requirements"><span class="txt_black_collapse">Requirements</span>
                            <ul>
                                <li id="red-categoryrequirements"><span class="txt_black">
                                    <asp:Image runat="server" ID="RequirmentNodeImage" ImageUrl="~/Images/arrow_left.jpg" />
                                    <asp:HyperLink CssClass="txt_black" runat="server" ID="RequirmentNode" NavigateUrl="~/Maintenance/DepartmentRequirementCategoryList.aspx">Requirement Category List</asp:HyperLink></span></li>
                                <li id="red-lsitrequirements"><span class="txt_black">
                                    <asp:Image runat="server" ID="RequirmentListNodeImage" ImageUrl="~/Images/arrow_left.jpg" />
                                    <asp:HyperLink CssClass="txt_black" runat="server" ID="RequirmentListNode" NavigateUrl="~/Maintenance/DepartmentRequirementList.aspx">Default Requirements List</asp:HyperLink></span></li>
                            </ul>
                        </li>
                        <li id="red-aspects"><span class="txt_black_collapse">Aspects</span>
                            <ul>
                                <li id="red-categoryaspects"><span class="txt_black">
                                    <asp:Image runat="server" ID="AspectNodeImage" ImageUrl="~/Images/arrow_left.jpg" />
                                    <asp:HyperLink CssClass="txt_black" runat="server" ID="AspectNode" NavigateUrl="~/Maintenance/DepartmentAspectCategoryList.aspx">Aspect Category List</asp:HyperLink></span></li>
                                <li id="red-listaspects"><span class="txt_black">
                                    <asp:Image runat="server" ID="AspectListNodeImage" ImageUrl="~/Images/arrow_left.jpg" />
                                    <asp:HyperLink CssClass="txt_black" runat="server" ID="AspectListNode" NavigateUrl="~/Maintenance/DepartmentAspectList.aspx">Default Aspects List</asp:HyperLink></span></li>
                            </ul>
                        </li>
                    </ul>
                </li>--%>
                <%--<li id="red-template"><span class="txt_black_collapse">Document Templates</span>
                    <ul>
                        <li id="red-categorytemplate"><span class="txt_black">
                            <asp:Image runat="server" ID="DocumentNodeImage" ImageUrl="~/Images/arrow_left.jpg" />
                            <asp:HyperLink CssClass="txt_black" runat="server" ID="DocumentNode" NavigateUrl="~/Maintenance/DocumentCategoryList.aspx">Documents Category List</asp:HyperLink>
                        </span></li>
                        <li id="red-sectiontemplate"><span class="txt_black">
                            <asp:Image runat="server" ID="SectionNodeImage" ImageUrl="~/Images/arrow_left.jpg" />
                            <asp:HyperLink CssClass="txt_black" runat="server" ID="SectionNode" NavigateUrl="~/Maintenance/SectionList.aspx">Sections List</asp:HyperLink>
                        </span></li>
                        <li id="red-listtemplate"><span class="txt_black">
                            <asp:Image runat="server" ID="DocumentListNodeImage" ImageUrl="~/Images/arrow_left.jpg" />
                            <asp:HyperLink CssClass="txt_black" runat="server" ID="DocumentListNode" NavigateUrl="~/Maintenance/DocumentList.aspx">Documents List</asp:HyperLink>
                        </span></li>
                    </ul>
                </li>--%>
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
