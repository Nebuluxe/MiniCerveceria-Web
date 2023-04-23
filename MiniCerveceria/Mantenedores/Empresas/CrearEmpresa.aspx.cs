using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MiniCerveceria.Mantenedores.Empresas
{
    public partial class CrearEmpresa : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string uid = Request.QueryString["uid"] != null ? Request.QueryString["uid"] : "";

            lblNombreItem.Text = uid == "" ? "Nueva Empresa" : uid;

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