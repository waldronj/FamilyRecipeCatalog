using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace IngredientCatalog
{
    public partial class test : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string newFileName = Guid.NewGuid().ToString();
            Label1.Text = newFileName;
        }

        protected void btnTest_Click(object sender, EventArgs e)
        {
            throw new System.NullReferenceException("TESTING");
        }

        protected void btnAddPicture_Click(object sender, EventArgs e)
        {
            string Extenstion = Path.GetExtension(fupLoad.FileName);
            string newFileName = Guid.NewGuid().ToString() + Extenstion;
            

            string pictureUploadURL = "http://www.thejwal.com/recipes/uploadedpictures/" + newFileName;
            Label1.Text = pictureUploadURL;
        }
    }
}

