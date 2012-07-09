<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddNote.aspx.cs" Inherits="IngredientCatalog.AddNote" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
    <section class="featured">
        <div class="content-wrapper">
            <hgroup class="title">
                <h1>Add a Note</h1>
            </hgroup>
        </div>
    </section>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <h3>Your Name:</h3>
    <asp:TextBox ID="tbName" runat="server"></asp:TextBox><br />
    <h3>Note:</h3>
    <asp:TextBox ID="tbNote" runat="server" TextMode="MultiLine" Width="600px" Height="300px"></asp:TextBox>
    <br />
    <asp:Button ID="btnAddNote" runat="server" Text="Add Note" OnClick="btnAddNote_Click"/>
    <br /><br /><br /><br />

    <asp:Label ID="lblResult" runat="server" ></asp:Label>

</asp:Content>
