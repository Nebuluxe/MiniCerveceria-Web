﻿using MiniCerveceria.Modelos;
using MiniCerveceria.Servicios.Implementacion;
using MiniCerveceria.Servicios;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MiniCerveceria.Mantenedores.Productos
{
    public partial class VerProducto : System.Web.UI.Page
    {
		static string conn = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
		static IProductoAplicacionServicios productoApp = new ProductoServicio(conn);

		protected void Page_Load(object sender, EventArgs e)
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
			}

			try
			{
				string uid = Request.QueryString["uid"] != null ? Request.QueryString["uid"] : "";

				if (!IsPostBack)
				{
					if (uid != "")
					{
						Producto oProducto = productoApp.ObtenerProducto(Convert.ToInt32(uid));

						lblNombreItem.Text = oProducto.nombre_producto;
						txtDescripcion.Text = oProducto.descripcion;
						lblPrecio.Text = oProducto.precio.ToString();
						lblFehcaCreacion.Text = oProducto.fecha_creacion.ToString();
						lblFechaModificacion.Text = oProducto.fecha_modificacion.ToString();
						ItemImagen.ImageUrl = oProducto.URL_img;

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
							default:
								categoria = "--";
								break;
						}

						lblCategoria.Text = categoria;


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
							default:
								subcategoria = "--";
								break;
						}

						lblSubCategoria.Text = subcategoria;
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