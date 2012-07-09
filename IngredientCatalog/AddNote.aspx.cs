using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IngredientCatalog
{
    public partial class AddNote : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAddNote_Click(object sender, EventArgs e)
        {
            RecipeCatalogEntities db = new RecipeCatalogEntities();
            db.Notes.Add(new Note
            {
                NoteValue = tbNote.Text,
                NoteWriter = tbName.Text,
                RecipeRecipeId = int.Parse(Request.QueryString["RecipeId"].ToString())
                
            });
            db.SaveChanges();
            lblResult.Text = "Note has been added";
        }
    }
}