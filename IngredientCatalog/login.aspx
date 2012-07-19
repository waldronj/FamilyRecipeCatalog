<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="IngredientCatalog.login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
    <section class="featured" >
        <div class="content-wrapper">
            <hgroup class="title">
                <h1>Login</h1>
                <h2>to edit recipes / comments</h2>
        
            </hgroup>
            </div>
        </section>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Login ID="Login1" runat="server" DestinationPageUrl="~/Default.aspx" 
        OnLoggedIn="Login1_LoggedIn"></asp:Login>
</asp:Content>
