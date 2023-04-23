using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MiniCerveceria.Mantenedores.Recetas
{
    public partial class CrearReceta : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string uid = Request.QueryString["ui"] != null ? Request.QueryString["uid"] : "";

            lblNombreItem.Text = uid == "" ? "Nueva Receta" : uid;

            if (uid != "")
            {
                CambioNomVentana.Text = "Editar";
            }
            else 
            {
                CambioNomVentana.Text = "Crear";
            }
        }
    }
}