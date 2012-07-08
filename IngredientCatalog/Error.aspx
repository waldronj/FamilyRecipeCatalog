<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Error.aspx.cs" Inherits="IngredientCatalog.Error" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
    <section class="featured">
    <div class="content-wrapper">
            <hgroup class="title">
                <h1>Opps</h1>
                
            </hgroup>            
        </div>
        </section>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Something went awry</h2>
    <p>Josh has been notified and will fix the problem.</p>
</asp:Content>
