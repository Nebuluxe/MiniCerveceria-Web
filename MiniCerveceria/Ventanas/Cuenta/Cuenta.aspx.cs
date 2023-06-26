using MiniCerveceria.Servicios.Implementacion;
using MiniCerveceria.Servicios;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using MiniCerveceria.Modelos;
using System.IO;


namespace MiniCerveceria.Ventanas.Cuenta
{
	public partial class Cuenta : System.Web.UI.Page
	{
		static string conn = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
		static IUsuarioAplicacionServicios UsuarioApp = new UsuarioServicio(conn);

		public int id_user = 0;
		public string fechaNacimiento = "";
		protected void Page_Load(object sender, EventArgs e)
		{
			Usuario oUsuario = (Usuario)(Session["UsuarioSesion"]);

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

			fechaNacimiento = oUsuario.fecha_nacimiento.ToString("dd/MM/yyyy");
			id_user = oUsuario.id_usuario;
		}

		[WebMethod(EnableSession = true)]
		public static Usuario ObteneSatosUSuario()
		{
			try
			{
				Usuario SesionUser = (Usuario)(HttpContext.Current.Session["UsuarioSesion"]);

				return SesionUser;
			}
			catch (Exception)
			{
				throw;
			}
		}
	}


}