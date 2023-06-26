using MiniCerveceria.Modelos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MiniCerveceria.Mantenedores.Pedidos
{
	public partial class DefaultPedidos : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			MasterAdmin MasterAdmin = (MasterAdmin)(Session["MasterAdminSesion"]);
			Usuario oUsuario = (Usuario)(Session["UsuarioSesion"]);

			if (MasterAdmin == null)
			{
				if (oUsuario == null)
				{
					Response.Redirect("~/Default.aspx", false);
					return;
				}

				if (oUsuario.email == null)
				{
					Response.Redirect("~/Default.aspx", false);
					return;
				}

				if (oUsuario.id_permiso == 0)
				{
					Response.Redirect("~/Default.aspx", false);
					return;
				}
			}
		}
	}
}