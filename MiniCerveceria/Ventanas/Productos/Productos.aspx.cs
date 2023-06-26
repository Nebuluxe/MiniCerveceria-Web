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

namespace MiniCerveceria
{
	public partial class Productos : System.Web.UI.Page
	{
		static string conn = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
		static IProductoAplicacionServicios productoApp = new ProductoServicio(conn);
		protected void Page_Load(object sender, EventArgs e)
		{
			string idCate = Request.QueryString["cate"] != null ? Request.QueryString["cate"] : "";
			string idSubCate = Request.QueryString["subcate"] != null ? Request.QueryString["subcate"] : "";

			string categoria = "";
			string categoria_id = "0";
			string SubCate_id = "0";

			if (idCate != "nov" && idCate != "")
			{
				switch (Convert.ToInt32(idCate))
				{
					case 1:
						categoria = "Ingredientes";
						break;
					case 2:
						categoria = "Accesorios";
						break;
					case 3:
						categoria = "Cristaleria";
						break;
					case 4:
						categoria = "Equipamiento";
						break;
					case 5:
						categoria = "Libros y recetas";
						break;
				}

				categoria_id = idCate;

				if (idSubCate != "")
				{
					SubCate_id = idSubCate;
				}
			}
			else
			{
				if (idCate == "nov")
				{
					categoria = "Novedades";
				}
				else
				{
					categoria = "Productos";
				}
			}

			idCategoria.Text = categoria_id;
			idSubCategoria.Text = SubCate_id;
			NameCategoria.Text = categoria;
		}

		[WebMethod(EnableSession = true)]
		public static IList<Producto> ListarProductos(string idCate, string idSubCate, string novedad)
		{
			try
			{
				IList<Producto> ListProductos = new List<Producto>();

				if (novedad == "Novedades")
				{
					ListProductos = productoApp.ListarNoveddades();
				}
				else
				{
					ListProductos = productoApp.ListarProductosCategoria(Convert.ToInt32(idCate), Convert.ToInt32(idSubCate));
				}
				return ListProductos;
			}
			catch (Exception)
			{
				throw;
			}
		}
	}
}