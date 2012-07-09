using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Entity.Validation;
using System.IO;


namespace IngredientCatalog
{
    public partial class AddRecipe : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                //lblIngredientList.Visible = false;
                //lbIngredients.Visible = false;
                //btnRemoveIngredient.Visible = false;
            }
            else
            {
                //btnRemoveIngredient.Visible = true;
                //lblIngredientList.Visible = true;
                //lbIngredients.Visible = true;
            }
        }

        protected void AddIngredient(object sender, EventArgs e)
        {
            //string ingredient = tbIngrediant.Text;
            //lbIngredients.Items.Add(ingredient);
            //tbIngrediant.Text = "";
        }

        protected void RemoveIngredient(object sender, EventArgs e)
        {
            
                //lbIngredients.Items.Remove(lbIngredients.SelectedItem);
        }

        protected void Add_Recipe(object sender, EventArgs e)
        {
            RecipeCatalogEntities db = new RecipeCatalogEntities();
            //string ingredientList = "";
            //foreach (var item in lbIngredients.Items)
            //{
            //    ingredientList += item + "<br />";
            //}
            string pictureUploadURL = "";
            if (fupLoad.HasFile)
            {
                pictureUploadURL = AddPicture();
            }
            
            string instructions = tbInstructions.Text.Replace(Environment.NewLine, "<br />");
            string ingredients = tbIngrediant.Text.Replace(Environment.NewLine, "<br />");
            if (tbPictureUrl.Text == "")
            {
                tbPictureUrl.Text = "http://admin.imbresources.org/photos/noImageFound.l.png";
            }

            if (pictureUploadURL != "")
            {
                db.Recipes.Add(
                  new Recipe{
                         Name = tbName.Text,
                         Ingredients = ingredients,
                         Instructions = instructions,
                         PictureURL = pictureUploadURL,
                         Contributer = tbContributer.Text,
                         Category = ddlCategory.SelectedValue,
                         ServingSize = tbServingSize.Text,
                         RecipeOrigin = tbOrigin.Text
                    });        
            }
            else
            {
                db.Recipes.Add(
                  new Recipe{
                         Name = tbName.Text,
                         Ingredients = ingredients,
                         Instructions = instructions,
                         PictureURL = tbPictureUrl.Text,
                         Contributer = tbContributer.Text,
                         Category = ddlCategory.SelectedValue,
                         ServingSize = tbServingSize.Text,
                         RecipeOrigin = tbOrigin.Text
                    });        
            }

            
            mvAddRecipe.ActiveViewIndex = 1;
            
            try
            {
                db.SaveChanges();
                lblResult.Text = "Recipe has been added.";
            }
            catch (DbEntityValidationException dbEx)
            {
                lblResult.Text = "Something bad happened, try again later.";
                foreach (var validationErrors in dbEx.EntityValidationErrors)
                {
                    foreach (var validationError in validationErrors.ValidationErrors)
                    {
                        System.Diagnostics.Trace.TraceInformation("Property: {0} Error: {1}", validationError.PropertyName, validationError.ErrorMessage);
                    }
                }
            }
            
        }

        protected void cvIngredients_ServerValidate(object source, ServerValidateEventArgs args)
        {           
            //if (lbIngredients.Items.Count > 0)
            //{
            //    Label1.Text = "coming to you from the validator!!!!";
            //    args.IsValid = true;
            //}
            //else
            //{
            //    Label1.Text = "coming to you from the validator";
            //    args.IsValid = false;
            //}
            //args.IsValid = lbIngredients.Items.Count > 0;
        }

        protected string AddPicture()
        {
            
            string Extenstion = Path.GetExtension(fupLoad.FileName);
            string newFileName = Guid.NewGuid().ToString() + Extenstion;
            if (fupLoad.HasFile)
            {                
                    fupLoad.SaveAs(Server.MapPath(@"~/UploadedPictures/" + newFileName ));
            }
            string pictureUploadURL = "http://www.thejwal.com/recipes/uploadedpictures/" + newFileName;
            return pictureUploadURL;
        }

    }
}