using MiniCerveceria.Modelos;
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

namespace MiniCerveceria.Mantenedores.Usuarios
{
    public partial class DefaultUsuarios : System.Web.UI.Page
	{
		static string conn = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
		static IUsuarioAplicacionServicios usuarioApp = new UsuarioServicio(conn);

		public string PermisoEditar = "false";

		protected void Page_Load(object sender, EventArgs e)
        {
			try
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

					PermisosUsusario permisosUsusario = new PermisosUsusario();
					permisosUsusario = usuarioApp.ObtenerPermiso(oUsuario.id_permiso);

					PermisoEditar = permisosUsusario.editar ? "true" : "false";
				}
				else
				{
					PermisoEditar = "true";
				}
			}
			catch (Exception)
			{

				throw;
			}

		}

		[WebMethod(EnableSession = true)]
		public static IList<Usuario> ListarUsuarios( bool estado)
		{
			try
			{
				IList<Usuario> ListProductos = new List<Usuario>();

				ListProductos = usuarioApp.ListarUsuarios(estado);

				return ListProductos;
			}
			catch (Exception)
			{
				throw;
			}
		}

		[WebMethod(EnableSession = true)]
		public static bool AsignarQuitarPerfil(string id_usuario, string id_permiso)
		{
			try
			{
				if (id_permiso != "")
				{
					usuarioApp.AsignarPermiso(Convert.ToInt32(id_usuario),Convert.ToInt32(id_permiso));
				}
				else
				{
					usuarioApp.QuitarPermiso(Convert.ToInt32(id_usuario));
				}
				
				return true;
			}
			catch (Exception)
			{
				throw;
			}
		}

		[WebMethod(EnableSession = true)]
		public static bool HabilitarInhabilitarPerfil(string id_usuario, bool accion)
		{
			try
			{
				if (accion)
				{
					usuarioApp.HabiliatarCuentaUsuario(Convert.ToInt32(id_usuario));
				}
				else
				{
					usuarioApp.InHabiliatarCuentaUsuario(Convert.ToInt32(id_usuario));
				}

				return true;
			}
			catch (Exception)
			{
				throw;
			}
		}
	}
}