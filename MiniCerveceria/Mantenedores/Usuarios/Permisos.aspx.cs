using MiniCerveceria.Modelos;
using MiniCerveceria.Servicios.Implementacion;
using MiniCerveceria.Servicios;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MiniCerveceria.Mantenedores.Usuarios
{
	public partial class Permisos : System.Web.UI.Page
	{
		static string conn = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
		static IUsuarioAplicacionServicios usuarioApp = new UsuarioServicio(conn);

		public string PermisoEditar = "false";
		public string PermisoEliminar = "false";
		public string PermisoCrear = "false";

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
					PermisoEliminar = permisosUsusario.eliminar ? "true" : "false";
					PermisoCrear = permisosUsusario.crear ? "true" : "false";
				}
				else
				{
					PermisoEditar = "true";
					PermisoEliminar = "true";
					PermisoCrear = "true";
				}
			}
			catch (Exception)
			{
				throw;
			}
		}

		[WebMethod(EnableSession = true)]
		public static IList<PermisosUsusario> ListarPermisos()
		{
			try
			{
				IList<PermisosUsusario> ListProductos = new List<PermisosUsusario>();

				ListProductos = usuarioApp.ListarPermisos();

				return ListProductos;
			}
			catch (Exception)
			{
				throw;
			}
		}

		[WebMethod(EnableSession = true)]
		public static bool EliminarPermiso(string id_permiso)
		{
			try
			{
				usuarioApp.EliminarPermiso(Convert.ToInt32(id_permiso));

				return true;
			}
			catch (Exception)
			{
				throw;
			}
		}

		[WebMethod(EnableSession = true)]
		public static bool CrearEditarPermiso(string id_permiso, string nombre, string editar, string eliminar, string ver, string crear)
		{
			try
			{
				PermisosUsusario permiso = new PermisosUsusario();
				permiso.nombre = nombre;
				permiso.editar = Convert.ToBoolean(editar);
				permiso.eliminar = Convert.ToBoolean(eliminar);
				permiso.ver = Convert.ToBoolean(ver);
				permiso.crear = Convert.ToBoolean(crear);

				if (id_permiso == "")
				{
					usuarioApp.CrearPermiso(permiso);
				}
				else
				{
					permiso.id_permiso = Convert.ToInt32(id_permiso);
					usuarioApp.ModificarPermiso(permiso);
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