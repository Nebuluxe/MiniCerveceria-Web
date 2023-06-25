using BD = Oracle.ManagedDataAccess.Client;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using System.Configuration;
using System.Windows;
using Oracle.ManagedDataAccess.Client;
using MiniCerveceria.Modelos;
using System.Web.Services;
using MiniCerveceria.Servicios.Implementacion;
using MiniCerveceria.Servicios;

namespace MiniCerveceria
{   
    public partial class _Default : Page
	{
		static string conn = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
		static IProductoAplicacionServicios productoApp = new ProductoServicio(conn);

		protected void Page_Load(object sender, EventArgs e)
        { 

        }

		[WebMethod(EnableSession = true)]
		public static IList<Producto> ListarProductosMuestra()
		{
			try
			{
				IList<Producto> ListProductos = new List<Producto>();

				ListProductos = productoApp.ListarProductos(true);

				IList<Producto> List8 = new List<Producto>();

				int contador = 0;

				foreach (Producto producto in ListProductos)
				{
					List8.Add(producto);

					contador++;

					if (contador == 12)
					{
						break;
					}
				}

				return List8;
			}
			catch (Exception)
			{
				throw;
			}
		}
	}
}