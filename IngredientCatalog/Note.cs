//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

using System;
using System.Collections.Generic;

namespace IngredientCatalog
{
    public partial class Note
    {
        public int NoteId { get; set; }
        public string NoteWriter { get; set; }
        public string NoteValue { get; set; }
        public int RecipeRecipeId { get; set; }
    
        public virtual Recipe Recipe { get; set; }
    }
    
}
