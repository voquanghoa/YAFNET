﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Header.ascx.cs" Inherits="YAF.Controls.Header" %>
<%@ Import Namespace="YAF.Types.Constants" %>


<%@ Register TagPrefix="YAF" TagName="AdminMenu" Src="AdminMenu.ascx" %>


<YAF:Alert runat="server" Visible="False" ID="GuestUserMessage" 
           Type="info" 
           Dismissing="True">
    <asp:Label id="GuestMessage" runat="server"></asp:Label>
</YAF:Alert>
    
<header class="mb-3">
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <a class="navbar-brand" href="<%=BuildLink.GetLink(ForumPages.forum) %>">
            <%= this.PageContext.BoardSettings.Name %>
        </a>
        
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <asp:PlaceHolder ID="menuListItems" runat="server">
                </asp:PlaceHolder>
                <asp:PlaceHolder ID="AdminModHolder" runat="server" Visible="false">

                    <asp:PlaceHolder ID="menuAdminItems" runat="server"></asp:PlaceHolder>
                    
                    <asp:PlaceHolder runat="server" ID="AdminAdminHolder" Visible="False">
                        <YAF:AdminMenu runat="server"></YAF:AdminMenu>
                    </asp:PlaceHolder>
                    

                    <asp:PlaceHolder runat="server" ID="HostMenuHolder" Visible="False">
                        <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" id="hostDropdown" data-toggle="dropdown" 
                           href="<%= BuildLink.GetLink(ForumPages.admin_hostsettings) %>" 
                           role="button" 
                           aria-haspopup="true" aria-expanded="false">
                           <%= this.GetText("TOOLBAR", "HOST")  %>
                        </a>
                        <div class="dropdown-menu" aria-labelledby="hostDropdown">
                            <a href="<%= BuildLink.GetLink(ForumPages.admin_hostsettings) %>"
                               class="dropdown-item">
                            <i class="fa fa-cog fa-fw"></i>&nbsp;
                                <YAF:LocalizedLabel runat="server" 
                                                    LocalizedTag="admin_hostsettings"></YAF:LocalizedLabel>
                            </a>
                            <a href="<%= BuildLink.GetLink(ForumPages.admin_boards) %>"
                               class="dropdown-item">
                                <i class="fa fa-globe fa-fw"></i>&nbsp;
                                <YAF:LocalizedLabel runat="server" 
                                                    LocalizedTag="admin_boards" LocalizedPage="adminmenu"></YAF:LocalizedLabel>
                            </a>
                            <a href="<%= BuildLink.GetLink(ForumPages.admin_pageaccesslist) %>"
                               class="dropdown-item">
                                <i class="fa fa-building fa-fw"></i>&nbsp;
                                <YAF:LocalizedLabel runat="server" 
                                                    LocalizedTag="admin_pageaccesslist"></YAF:LocalizedLabel>
                            </a>
                        </div>
                  </li>
                    </asp:PlaceHolder>
                    <asp:PlaceHolder runat="server" ID="ModerateHolder" Visible="False">
                        <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" id="moderateDropdown" data-toggle="dropdown" 
                           href="<%= BuildLink.GetLink(ForumPages.admin_hostsettings) %>" 
                           role="button" 
                           aria-haspopup="true" aria-expanded="false">
                           <%= this.GetText("TOOLBAR", "HOST")  %>
                        </a>
                        <div class="dropdown-menu" aria-labelledby="moderateDropdown">
                            <a href="<%= BuildLink.GetLink(ForumPages.admin_hostsettings) %>"
                               class="dropdown-item">
                            <i class="fa fa-cog fa-fw"></i>&nbsp;
                                <YAF:LocalizedLabel runat="server" LocalizedTag="admin_hostsettings"></YAF:LocalizedLabel>
                            </a>
                            <a href="<%= BuildLink.GetLink(ForumPages.admin_boards) %>"
                               class="dropdown-item">
                                <i class="fa fa-globe fa-fw"></i>&nbsp;
                                <YAF:LocalizedLabel runat="server" LocalizedTag="admin_boards"></YAF:LocalizedLabel>
                            </a>
                            <a href="<%= BuildLink.GetLink(ForumPages.admin_pageaccesslist) %>"
                               class="dropdown-item">
                                <i class="fa fa-building fa-fw"></i>&nbsp;
                                <YAF:LocalizedLabel runat="server" LocalizedTag="admin_pageaccesslist"></YAF:LocalizedLabel>
                            </a>
                        </div>
                  </li>
                    </asp:PlaceHolder>
                </asp:PlaceHolder>
                <li class="nav-item dropdown">
                    <asp:PlaceHolder id="LoggedInUserPanel" runat="server" Visible="false">
                        <a class="nav-link dropdown-toggle" id="userDropdown" data-toggle="dropdown" 
                           href="<%= BuildLink.GetLink(ForumPages.profile, "u={0}&name={1}", this.PageContext.PageUserID, 
                                         this.Get<BoardSettings>().EnableDisplayName ? this.PageContext.CurrentUserData.DisplayName : this.PageContext.CurrentUserData.UserName) %>" 
                           role="button" 
                           aria-haspopup="true" aria-expanded="false">
                            <YAF:Icon runat="server" ID="UserIcon"></YAF:Icon>
                            <%= this.Get<BoardSettings>().EnableDisplayName ? this.PageContext.CurrentUserData.DisplayName : this.PageContext.CurrentUserData.UserName  %>
                            <asp:PlaceHolder runat="server" id="UnreadPlaceHolder">
                                <asp:Label runat="server" ID="UnreadLabel" 
                                           CssClass="ml-1 badge badge-danger">
                                </asp:Label>
                            </asp:PlaceHolder>
                        </a>
                        <div class="dropdown-menu" aria-labelledby="userDropdown">
                            <asp:PlaceHolder id="MyProfile" runat="server">
                            </asp:PlaceHolder>
                            <asp:PlaceHolder id="MyActicity" runat="server">
                            </asp:PlaceHolder>
                            <asp:PlaceHolder ID="MyInboxItem" runat="server">
                            </asp:PlaceHolder>
                            <asp:PlaceHolder ID="MyBuddiesItem" runat="server">
                            </asp:PlaceHolder>
                            <asp:PlaceHolder ID="MyAlbumsItem" runat="server">
                            </asp:PlaceHolder>
                            <asp:PlaceHolder ID="MyTopicItem" runat="server">
                            </asp:PlaceHolder>
                            <asp:PlaceHolder ID="LogutItem" runat="server" Visible="false">
                                <div class="dropdown-divider"></div>
                                <asp:LinkButton ID="LogOutButton" runat="server" 
                                            CssClass="dropdown-item"
                                            OnClick="LogOutClick">
                                </asp:LinkButton>
                            </asp:PlaceHolder>
                        </div>
                    </asp:PlaceHolder>
                </li>
            </ul>
            <asp:Panel ID="quickSearch" runat="server" CssClass="form-inline" Visible="false">
                <asp:TextBox ID="searchInput" Type="Search" runat="server" 
                             CssClass="form-control"
                             aria-label="Search"></asp:TextBox>&nbsp;
                <YAF:ThemeButton ID="doQuickSearch" runat="server"
                                 CssClass="my-2 my-sm-0"
                                 Type="OutlineInfo"
                                 OnClick="QuickSearchClick"
                                 Icon="search">
                </YAF:ThemeButton>
            </asp:Panel>
        </div>
    </nav>
</header>