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


namespace MiniCerveceria.Mantenedores.Novedades
{
	public partial class DefaultNovedades : System.Web.UI.Page
	{
		static string conn = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
		static IProductoAplicacionServicios productoApp = new ProductoServicio(conn);

		protected void Page_Load(object sender, EventArgs e)
		{

		}

		[WebMethod(EnableSession = true)]
		public static IList<Producto> ObtenerNovedades()
		{
			try
			{
				IList<Producto> ListProductos = new List<Producto>();

				ListProductos = productoApp.ListarNoveddades();

				return ListProductos;
			}
			catch (Exception)
			{
				throw;
			}
		}

		[WebMethod(EnableSession = true)]
		public static IList<Producto> ObtenerProductos()
		{
			try
			{
				IList<Producto> ListProductos = new List<Producto>();

				ListProductos = productoApp.ListarProductos(true);

				return ListProductos.Where(x => !x.novedad).ToList();
			}
			catch (Exception)
			{
				throw;
			}
		}
		[WebMethod(EnableSession = true)]
		public static bool AñadirNovedad(int id_producto)
		{
			try
			{
			    productoApp.AñadirNovedad(id_producto);

				return true;
			}
			catch (Exception)
			{
				throw;
			}
		}

		[WebMethod(EnableSession = true)]
		public static bool QuitarNovedad(int id_producto)
		{
			try
			{
				productoApp.QuitarNovedad(id_producto);

				return true;
			}
			catch (Exception)
			{
				throw;
			}
		}
	}
}