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
		
		protected void Page_Load(object sender, EventArgs e)
        {

        }

		[WebMethod(EnableSession = true)]
		public static IList<Producto> ListarProductosDefualt()
		{
			try
			{
				IList<Producto> ListProductos = new List<Producto>();

				ListProductos = productoApp.ListarProductos(1);

				return ListProductos;
			}
			catch (Exception)
			{
				throw;
			}
		}

		[WebMethod(EnableSession = true)]
		public static bool EliminarProducto(string id)
		{
			try
			{
				productoApp.EliminarProducto(id);

				return true;
			}
			catch (Exception)
			{
				throw;
			}
		}
	}
}