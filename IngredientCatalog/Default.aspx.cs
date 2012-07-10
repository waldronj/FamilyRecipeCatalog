using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Entity;
using System.Web.Configuration;
using System.Data.SqlClient;



namespace IngredientCatalog
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }    

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            lvRecipes.DataSourceID = null;
            lvRecipes.DataSource = dsSearch;
            lvRecipes.DataBind();
        }

        protected void lvRecipes_SelectedIndexChanging(object sender, ListViewSelectEventArgs e)
        {
            this.lvRecipes.SelectedIndex = e.NewSelectedIndex;
            lvRecipes.DataSourceID = null;
            lvRecipes.DataSource = dsSearch;
            lvRecipes.DataBind();

            RecipeCatalogEntities db = new RecipeCatalogEntities();
            var selectItem = int.Parse(lvRecipes.SelectedValue.ToString());
            var RecipeNotes = db.Notes.Where(n => n.Recipe.RecipeId == selectItem ).ToArray();
            lvSelectedRecipeNotes.DataSourceID = null;
            lvSelectedRecipeNotes.DataSource = RecipeNotes;
            lvSelectedRecipeNotes.DataBind();

            mvRecipes.ActiveViewIndex = 1;
        }

        protected void btnShowAllRecipes_Click(object sender, EventArgs e)
        {
            lvRecipes.DataSourceID = null;
            lvRecipes.DataSource = edsRecipes;
            lvRecipes.DataBind();
        }

        protected void btnBackToRecipes_Click(object sender, EventArgs e)
        {
            
            mvRecipes.ActiveViewIndex = 0;
        }

        protected void btnAddNote_Click(object sender, EventArgs e)
        {
            if (tbNoteValue.Text != "" && tbName.Text != "")
            {
                RecipeCatalogEntities db = new RecipeCatalogEntities();
                Label lblRecipeId = (Label)fvSelectedRecipe.FindControl("lblRecipeId");
                int recpieId = int.Parse(lblRecipeId.Text);
                db.Notes.Add(new Note
                {
                    NoteValue = tbNoteValue.Text,
                    NoteWriter = tbName.Text,
                    RecipeRecipeId = recpieId

                });
                db.SaveChanges();
                tbName.Text = "";
                tbNoteValue.Text = "";
                
                var selectItem = int.Parse(lvRecipes.SelectedValue.ToString());
                var RecipeNotes = db.Notes.Where(n => n.Recipe.RecipeId == selectItem ).ToArray();
                lvSelectedRecipeNotes.DataSourceID = null;
                lvSelectedRecipeNotes.DataSource = RecipeNotes;
                lvSelectedRecipeNotes.DataBind();
               
            }
            
        }

               
    }
}