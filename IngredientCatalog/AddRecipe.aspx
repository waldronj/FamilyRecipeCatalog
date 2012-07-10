<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddRecipe.aspx.cs" Inherits="IngredientCatalog.AddRecipe" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
    <section class="featured">
        <div class="content-wrapper">
            <hgroup class="title">
                <h1>Add a Recipe </h1>                
            </hgroup>
            
        </div>
    </section>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server" >
    <asp:MultiView ID="mvAddRecipe" runat="server" ActiveViewIndex="0" >
        <asp:View ID="RecipeInput" runat="server" >
    <h3>Your Name (optional, but we'd like to know who added the recipe):</h3>
    <asp:TextBox ID="tbContributer" runat="server"></asp:TextBox>
    <h3>Recipe Name:</h3>
    <asp:TextBox ID="tbName" runat="server" ></asp:TextBox>
    <asp:RequiredFieldValidator ID="rfvRecipeName" runat="server" ControlToValidate="tbName" Text="Recipe Name is required" ErrorMessage="Recipe Name is required" ForeColor="Red"></asp:RequiredFieldValidator>

    <h3>Where is the Recipe From?</h3>
            <asp:TextBox ID="tbOrigin" runat="server"></asp:TextBox>
    
    <h3>Serving Size:</h3>
    <asp:TextBox ID="tbServingSize" runat="server"></asp:TextBox>

    <h3>Category of Recipe</h3>
    <asp:DropDownList ID="ddlCategory" runat="server">
        <asp:ListItem Value="-1">Choose a Category</asp:ListItem>
        <asp:ListItem>Breakfast</asp:ListItem>
        <asp:ListItem>Side Dish</asp:ListItem>
        <asp:ListItem>Appetizer</asp:ListItem>
        <asp:ListItem>Main Dish</asp:ListItem>
        <asp:ListItem>Dessert</asp:ListItem>
        <asp:ListItem>Drinks</asp:ListItem>
    </asp:DropDownList>
            <asp:RequiredFieldValidator ID="rfvCategory" runat="server" ErrorMessage="Category is required, please make a selection" ControlToValidate="ddlCategory" InitialValue="-1" ForeColor="Red" >
            </asp:RequiredFieldValidator>

    <h3>Ingredients:</h3> 
    <asp:TextBox ID="tbIngrediant" runat="server" TextMode="MultiLine" Height="100px" Width="400px"></asp:TextBox>
    <%--<asp:Button ID="btnAddIngredient" runat="server" Text="Add an ingredient" OnClick="AddIngredient" CausesValidation="false" /> <br />
    <h3><asp:Literal ID="lblIngredientList" runat="server" Text="Current Ingredients:"></asp:Literal></h3>
    <asp:CustomValidator ID="cvIngredients" runat="server" Text="Need ingredients to complete the recipe" ControlToValidate="lbIngredients" OnServerValidate="cvIngredients_ServerValidate" ForeColor="Red"></asp:CustomValidator>
    <br />
    <asp:ListBox ID="lbIngredients" runat="server" Width="600px" SelectionMode="Multiple"></asp:ListBox>            
            <br />
    <asp:Button ID="btnRemoveIngredient" runat="server" Text="Remove Ingredient" OnClick="RemoveIngredient" CausesValidation="false" UseSubmitBehavior="False" />--%>
    <br />
   

    <h3>Instructions:</h3>
    <asp:requiredfieldvalidator ID="rfvInstructions" runat="server" ControlToValidate="tbInstructions" Text="Instructions are required to make the recipe" ForeColor="Red"></asp:requiredfieldvalidator>
    <asp:TextBox ID="tbInstructions" runat="server" TextMode="MultiLine" Width="800px" Height="250px"></asp:TextBox> <br />
        
    <br />
    <h3>Image Link (Optional, but won't get to see how yummy it is):</h3>
    Enter the link to your picture (http://www.letsgodigital.org/images/producten/2086/testrapport/nikon-p90-picture.jpg)
    <asp:TextBox ID="tbPictureUrl" runat="server" ></asp:TextBox><br />
    
    <h4>Or Upload a picture:</h4>
    <asp:FileUpload ID="fupLoad" runat="server" /> 
    <asp:RegularExpressionValidator ID="REVfupload" runat="server" ValidationExpression="^(([a-zA-Z]:)|(\\{2}\w+)\$?)(\\(\w[\w].*))(.jpg|.png|.bmp|.jpeg|.gif)$"
            Text="Only .jpeg, .jpg, .gif, .png files allowed" ControlToValidate="fupLoad" ForeColor="Red"></asp:RegularExpressionValidator>
            <br />
              
    <asp:Button ID="btnAddRecipe" runat="server" Text="Add Recipe" OnClick="Add_Recipe" />
            <asp:Label ID="Label1" runat="server" ></asp:Label>
            </asp:View>
    <asp:View ID="Completed"   runat="server">

    <asp:Label ID="lblResult" runat="server" ></asp:Label><br />
        <br />
        <a href="Default.aspx">Back To Recipes</a><br />
        <a href="AddRecipe.aspx">Add another Recipe</a>
        </asp:View>
      </asp:MultiView>
</asp:Content>
