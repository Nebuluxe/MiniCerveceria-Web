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
using Microsoft.Win32.SafeHandles;

namespace MiniCerveceria
{   
    public partial class _Default : Page
	{
		static string conn = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
		static IProductoAplicacionServicios productoApp = new ProductoServicio(conn);
        static ICarritoCompraAplicacionServicios carritoApp = new CarritoCompraServicio(conn);
		static IFavoritoAplicacionServicios favoritoApp = new FavoritoServicio(conn);
		static ICursoAplicacionServicios cursosApp = new CursoServicio(conn);

        protected void Page_Load(object sender, EventArgs e)
        { 

        }
		[WebMethod(EnableSession = true)]
		public static bool AnadirProductoCarrito(int id_producto)
		{
			try
			{
                Usuario oUsuario = (Usuario)(HttpContext.Current.Session["UsuarioSesion"]);

				if (oUsuario == null)
				{
					return false;
				}

                Producto oProducto = new Producto();
                oProducto = productoApp.ObtenerProducto(id_producto);
				if (oProducto != null)
				{
					IList<CarritoCompra> listCarritoCompra = carritoApp.ObtenerCarritoCompra(oUsuario.id_usuario);
					if (listCarritoCompra.Count() > 0)
					{
                        int existeProductoEnCarrito = listCarritoCompra.Where(x => x.id_producto == oProducto.id_producto).Count();
                        if (existeProductoEnCarrito > 0)
                        {
                            CarritoCompra oCarritoCompra = new CarritoCompra();
                            oCarritoCompra = listCarritoCompra.Where(x => x.id_producto == oProducto.id_producto).FirstOrDefault();
                            
                            oCarritoCompra.id_producto = oProducto.id_producto;
                            oCarritoCompra.precio_producto = oProducto.precio;
                            oCarritoCompra.cantidad++;
                            oCarritoCompra.total_detalle = (oProducto.precio * oCarritoCompra.cantidad);
                            carritoApp.CrearCarritoCompra(oCarritoCompra);
                            return true;
                        }
                        else
                        {
                            CarritoCompra oCarritoCompra = new CarritoCompra();
                            oCarritoCompra.id_usuario = oUsuario.id_usuario;
                            oCarritoCompra.id_producto = oProducto.id_producto;
                            oCarritoCompra.precio_producto = oProducto.precio;
                            oCarritoCompra.cantidad = 1;
                            oCarritoCompra.total_detalle = (oProducto.precio * oCarritoCompra.cantidad);
                            carritoApp.CrearCarritoCompra(oCarritoCompra);
                            return true;
                        }
					}
					else
					{
                        CarritoCompra oCarritoCompra = new CarritoCompra();
						oCarritoCompra.id_usuario = oUsuario.id_usuario;
						oCarritoCompra.id_producto = oProducto.id_producto;
						oCarritoCompra.precio_producto = oProducto.precio;
						oCarritoCompra.cantidad = 1;
						oCarritoCompra.total_detalle = (oProducto.precio * oCarritoCompra.cantidad);
                        carritoApp.CrearCarritoCompra(oCarritoCompra);
                        return true;
                    }
				}
				else
				{
					return false;
				}
            }
			catch (Exception)
			{
                return false;
                throw;
			}
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
				return null;
				throw;
			}
		}

		[WebMethod(EnableSession = true)]
		public static int AñadirFavorito(string id_producto)
		{
			try
			{
				Usuario oUsuario = (Usuario)(HttpContext.Current.Session["UsuarioSesion"]);

				if (oUsuario == null)
				{
					return 0;
				}

				Favorito oFavorito = new Favorito();
				oFavorito.id_usuario = oUsuario.id_usuario;
				oFavorito.id_producto = Convert.ToInt32(id_producto);

				bool valid = favoritoApp.AñdirFavorito(oFavorito);

				if (!valid)
				{
					return 2;
				}

				return 1;
			}
			catch (Exception)
			{
				throw;
			}
		}

		[WebMethod(EnableSession = true)]
		public static IList<ComentarioProducto> CargarComentarios()
		{
			try
			{
				IList<ComentarioProducto> comentarios = new List<ComentarioProducto>();

				comentarios = productoApp.ObtenerComentarios();

				return comentarios;
			}
			catch (Exception)
			{
				throw;
			}
		}

		[WebMethod(EnableSession = true)]
		public static IList<Curso> CargarCursos()
		{
			try
			{
				IList<Curso> comentarios = new List<Curso>();

				comentarios = cursosApp.ObtenerCursos(true);

				IList<Curso> CursoFilttrado = new List<Curso>();

				int cont = 0;

				foreach (var item in comentarios)
				{
                    cont++;
                    if (cont > 2)
					{
						break;
					}

					CursoFilttrado.Add(item);
					
				}

				return CursoFilttrado;
			}
			catch (Exception)
			{
				throw;
			}
		}
	}
}