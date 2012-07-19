using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IngredientCatalog
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Login1_LoggedIn(object sender, EventArgs e)
        {
            Response.Redirect("~/default.aspx");
        }
    }
}