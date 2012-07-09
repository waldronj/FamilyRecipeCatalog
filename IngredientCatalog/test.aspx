<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="test.aspx.cs" Inherits="IngredientCatalog.test" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    
    <asp:FileUpload ID="fupLoad" runat="server" />  
    <asp:Button ID="btnAddPicture" runat="server" Text="Add Picture" OnClick="btnAddPicture_Click" />
    <br />
    <asp:Label ID="Label1" Text="text" runat="server" />
    
    <br /><br /><br /><br />
    <asp:Button ID="btnTest" runat="server" Text="test me for error handling" OnClick="btnTest_Click"/>

    
</asp:Content>
