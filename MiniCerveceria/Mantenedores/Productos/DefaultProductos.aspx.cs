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


namespace MiniCerveceria.Mantenedores.Productos
{
    public partial class DefaultProductos : System.Web.UI.Page
    {
		static string conn = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
		static IProductoAplicacionServicios productoApp = new ProductoServicio(conn);
		static IUsuarioAplicacionServicios usuarioApp = new UsuarioServicio(conn);

		public string PermisoEliminar = "false";

		protected void Page_Load(object sender, EventArgs e)
        {
			try
			{
				if (!IsPostBack)
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

						PermisoEliminar = permisosUsusario.eliminar? "true":"false";
					}
					else
					{
						PermisoEliminar = "true";
					}
					
				}
			}
			catch (Exception)
			{

				throw;
			}
		}

		[WebMethod(EnableSession = true)]
		public static IList<Producto> ListarProductosDefualt()
		{
			try
			{
				IList<Producto> ListProductos = new List<Producto>();

				ListProductos = productoApp.ListarProductos(true);

				return ListProductos;
			}
			catch (Exception)
			{
				throw;
			}
		}

		[WebMethod(EnableSession = true)]
		public static bool EliminarProducto(string id_producto)
		{
			try
			{
				productoApp.EliminarProducto(id_producto);

				return true;
			}
			catch (Exception)
			{
				throw;
			}
		}
	}
}