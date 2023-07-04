using MiniCerveceria.Servicios.Implementacion;
using MiniCerveceria.Servicios;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MiniCerveceria.Modelos;
using static System.Data.Entity.Infrastructure.Design.Executor;

namespace MiniCerveceria.Ventanas.Productos
{
	public partial class DetalleProducto : System.Web.UI.Page
	{
		static string conn = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
		static IProductoAplicacionServicios productoApp = new ProductoServicio(conn);

		protected void Page_Load(object sender, EventArgs e)
		{
			try
			{
				string uid = Request.QueryString["prod"] != null ? Request.QueryString["prod"] : "";

				if (!IsPostBack)
				{
					if (uid != "")
					{
						Producto oProducto = productoApp.ObtenerProducto(Convert.ToInt32(uid));

						NomProducto.Text = oProducto.nombre_producto;
						lblDescripcion.Text = oProducto.descripcion;
						lblPecio.Text = "$ " + oProducto.precio.ToString();
						ItemImagen.ImageUrl = oProducto.URL_img;
						idProd.Text = oProducto.id_producto.ToString();

						string categoria = "";

						switch (oProducto.categoria)
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

						idCate.Text = oProducto.categoria.ToString();

						string subcategoria = "";

						switch (oProducto.sub_categoria)
						{
							case 1:
								subcategoria = "Azúcares & Extractos";
								break;
							case 2:
								subcategoria = "Clarificantes";
								break;
							case 3:
								subcategoria = "Sales & aditivos";
								break;
							case 4:
								subcategoria = "Maltas";
								break;
							case 5:
								subcategoria = "Levaduras";
								break;
							case 6:
								subcategoria = "Lupulos";
								break;
							case 7:
								subcategoria = "Embotellado";
								break;
							case 8:
								subcategoria = "Fermentacion";
								break;
							case 9:
								subcategoria = "Filtros";
								break;
							case 10:
								subcategoria = "Medicion";
								break;
							case 11:
								subcategoria = "Fogones";
								break;
							case 12:
								subcategoria = "Enfriamiento";
								break;
						}

						lblCategoria.Text = categoria + (subcategoria != "" ? ", " + subcategoria : "");
						NameCategoria.Text = categoria;
					}
					else
					{
						Response.Redirect("/Ventanas/Productos/Productos.aspx", false);
					}
				}


			}
			catch (Exception)
			{

				throw;
			}
		}
	}
}