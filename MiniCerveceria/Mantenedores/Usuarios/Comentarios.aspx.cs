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
	public partial class Comentarios : System.Web.UI.Page
	{
		static string conn = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
		static IUsuarioAplicacionServicios usuarioApp = new UsuarioServicio(conn);
		static IProductoAplicacionServicios productoApp = new ProductoServicio(conn);

		public string PermisoEditar = "false";
		public string PermisoVer = "false";

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
					PermisoVer = permisosUsusario.ver ? "true" : "false";
				}
				else
				{
					PermisoEditar = "true";
					PermisoVer = "true";
				}
			}
			catch (Exception)
			{
				throw;
			}
		}

		[WebMethod(EnableSession = true)]
		public static bool HabilitarDeshabilitar(string id_comentario, bool estado)
		{
			try
			{
				if (estado)
				{
					productoApp.InhabilitarComentario(Convert.ToInt32(id_comentario));
				}
				else
				{
					productoApp.HabilitarComentario(Convert.ToInt32(id_comentario));
				}

				return true;
			}
			catch (Exception)
			{
				throw;
			}
		}

		[WebMethod(EnableSession = true)]
		public static ComentarioProducto ObtenerComentario(string id_comentario)
		{
			try
			{
				ComentarioProducto coment = new ComentarioProducto();

				coment = productoApp.ObtenerComentario(Convert.ToInt32(id_comentario));

				return coment;
			}
			catch (Exception)
			{
				throw;
			}
		}
		
	}


}