<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="IngredientCatalog._Default" %>

<asp:Content runat="server" ID="FeaturedContent" ContentPlaceHolderID="FeaturedContent">
    <section class="featured">
        <div class="content-wrapper">
            <hgroup class="title">
                <h1>
                   Welcome</h1>
                <h2>The Family Recipe Catalog, where no family recipe should be forgotten.</h2>
            </hgroup>
            
        </div>
    </section>
</asp:Content>
<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <asp:MultiView ID="mvRecipes" runat="server" ActiveViewIndex="0">
        <asp:View ID="lvBrowse" runat="server">

    <asp:TextBox ID="tbSearch" runat="server" ></asp:TextBox> <br />
            Search by Recipe name, Contributer, or Category.<br />
            Categories: Breakfast, Side Dish, Appetizer, Main Dish, and Dessert <br />
    <asp:Button ID="btnSearch" runat="server" Text="Search" 
        OnClick="btnSearch_Click" />
    <asp:LinkButton ID="btnShowAllRecipes" runat="server" Text="Show All Recipes" OnClick="btnShowAllRecipes_Click"></asp:LinkButton>
    <asp:EntityDataSource ID="edsRecipes" runat="server" 
        ConnectionString="name= RecipeCatalogEntities" 
        DefaultContainerName="RecipeCatalogEntities" EnableFlattening="False" 
        EntitySetName="Recipes"></asp:EntityDataSource>


    <asp:SqlDataSource ID="dsSearch" runat="server"  
        ConnectionString="<%$ ConnectionStrings:RecipeCatalogConnectionString %>" 
        DeleteCommand="DELETE FROM [Recipes] WHERE [RecipeId] = @RecipeId" 
        InsertCommand="INSERT INTO [Recipes] ([Name], [Ingredients], [Instructions], [PictureURL]) VALUES (@Name, @Ingredients, @Instructions, @PictureURL)" 
        SelectCommand="SELECT * FROM [Recipes] WHERE ([Name] LIKE '%' + @Name + '%') or ([Contributer] LIKE '%' + @Contributer + '%')or ([Category] LIKE '%' + @Category + '%')" 
        UpdateCommand="UPDATE [Recipes] SET [Name] = @Name, [Ingredients] = @Ingredients, [Instructions] = @Instructions, [PictureURL] = @PictureURL WHERE [RecipeId] = @RecipeId">
        <DeleteParameters>
            <asp:Parameter Name="RecipeId" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Ingredients" Type="String" />
            <asp:Parameter Name="Instructions" Type="String" />
            <asp:Parameter Name="PictureURL" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="tbSearch" Name="Name" PropertyName="Text" DefaultValue="%"
                Type="String" />
            <asp:ControlParameter ControlID="tbSearch" Name="Contributer" PropertyName="Text" DefaultValue="%"
                Type="String" />
            <asp:ControlParameter ControlID="tbSearch" Name="Category" PropertyName="Text" DefaultValue="%" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Ingredients" Type="String" />
            <asp:Parameter Name="Instructions" Type="String" />
            <asp:Parameter Name="PictureURL" Type="String" />
            <asp:Parameter Name="RecipeId" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

 

    <asp:ListView ID="lvRecipes" runat="server" DataKeyNames="RecipeId" 
        DataSourceID="edsRecipes" 
        OnSelectedIndexChangedS="lvRecipes_SelectedIndexChanged" 
        GroupItemCount="4" OnSelectedIndexChanging="lvRecipes_SelectedIndexChanging">
             
        <AlternatingItemTemplate>
            <td runat="server" style="">
                <asp:Label ID="RecipeID" runat="server" Visible="false" Text='<%# Eval("RecipeId") %>'></asp:Label>
                <asp:ImageButton ID="PictureURLLabel" runat="server" ImageUrl='<%# Eval("PictureURL") %>' Width="200px" Height="200px" CommandName="Select" BorderStyle="Ridge" BorderColor="Gray" />
                <br />
               <center><asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' /></center>
                <br />
            </td>
        </AlternatingItemTemplate>
        <EmptyDataTemplate>
            <table runat="server" style="">
                <tr>
                    <td>No data was returned.</td>
                </tr>
            </table>
        </EmptyDataTemplate>      
        <EmptyItemTemplate>
            <td runat="server" />
        </EmptyItemTemplate>
        <GroupTemplate>
            <tr id="itemPlaceholderContainer" runat="server">
                <td id="itemPlaceholder" runat="server"></td>
            </tr>
        </GroupTemplate>
        <ItemTemplate>
            <td runat="server" style="">
                <asp:Label ID="RecipeID" runat="server" Visible="false" Text='<%# Eval("RecipeId") %>'></asp:Label>
               <asp:ImageButton ID="PictureURLLabel" runat="server" ImageUrl='<%# Eval("PictureURL") %>' Width="200px" Height="200px" CommandName="Select" />
                <br />
               <center><asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' /></center>
                <br />
            </td>
        </ItemTemplate>
        <LayoutTemplate>
            <table runat="server">
                <tr runat="server">
                    <td runat="server">
                        <table id="groupPlaceholderContainer" runat="server" border="0" style="">
                            <tr id="groupPlaceholder" runat="server">
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr runat="server">
                    <td runat="server" style="">
                        <asp:DataPager ID="DataPager1" runat="server" PageSize="12">
                            <Fields>
                                <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" 
                                    ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                <asp:NumericPagerField />
                                <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" 
                                    ShowNextPageButton="False" ShowPreviousPageButton="False" />
                            </Fields>
                        </asp:DataPager>
                    </td>
                </tr>
            </table>
        </LayoutTemplate>        
    </asp:ListView>

</asp:View>
        <asp:View ID="lvSelectedRecipe" runat="server">
            <asp:Button ID="btnBackToRecipes" runat="server" Text="Back To Recipes" OnClick="btnBackToRecipes_Click"/>
       

       <asp:SqlDataSource ID="dsSelectedRecipe" runat="server" 
        ConnectionString="<%$ ConnectionStrings:RecipeCatalogConnectionString %>" 
        SelectCommand="SELECT * FROM [Recipes] WHERE ([RecipeId] = @RecipeId)">
        <SelectParameters>
            <asp:ControlParameter ControlID="lvRecipes" Name="RecipeId" 
                PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>


    <asp:FormView ID="fvSelectedRecipe" runat="server" DataKeyNames="RecipeId" 
        DataSourceID="dsSelectedRecipe" OnPreRender="fvSelectedRecipe_PreRender">    
        <ItemTemplate>
            <h3>Name:</h3>
            <asp:Label ID="NameLabel" runat="server" Text='<%# Bind("Name") %>' />
            <br /> 
            <br />
            <div style="float:left; padding: 0 1em 0 0;">
             <asp:Image ID="PictureURLLabel" runat="server" ImageUrl='<%# Bind("PictureURL") %>' Height="200px" Width="200px" BorderStyle="Ridge" BorderColor="Gray"/>   
                 </div>
            <h3>Category:</h3>
            <asp:Label ID="CategoryLabel" runat="server" Text='<%# Bind("Category") %>' />                                          
            <br />
            <h3>Serves: <asp:Label ID="ServingSizeLabel" runat="server" Text='<%# Bind("ServingSize") %>'></asp:Label></h3>
            <h3>Recipe Origin: <asp:Label ID="RecipeOrigin" runat="server" Text='<%# Bind("RecipeOrigin") %>'></asp:Label></h3>
                  <h3>Contributer: <asp:Label ID="ContributerLabel" runat="server" Text='<%# Bind("Contributer") %>' /></h3>
             <br />
            <br />
            <h3>Ingredients:</h3>
            <asp:Label ID="IngredientsLabel" runat="server" Text='<%# Bind("Ingredients", "{0}") %>' />
            <br />
            <h3>Instructions:</h3>
            <asp:Label ID="InstructionsLabel" runat="server" 
                Text='<%# Bind("Instructions") %>' />
            <br />
           
            
            <br />
            
            <br />

        </ItemTemplate>
    </asp:FormView>
    
     </asp:View>

    </asp:MultiView>
    
</asp:Content>