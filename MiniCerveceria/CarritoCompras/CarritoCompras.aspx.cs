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

namespace MiniCerveceria.CarritoCompras
{
    public partial class CarritoCompras : System.Web.UI.Page
    {
        static string conn = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        static IProductoAplicacionServicios productoApp = new ProductoServicio(conn);
        static ICarritoCompraAplicacionServicios carritoApp = new CarritoCompraServicio(conn);
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        [WebMethod(EnableSession = true)]
        public static IList<CarritoCompra> ObtenerCarritoCompra()
        {
            try
            {
                Usuario oUsuario = (Usuario)(HttpContext.Current.Session["UsuarioSesion"]);
                IList<CarritoCompra> ListCarrito = carritoApp.ObtenerCarritoCompra(oUsuario.id_usuario);

                IList<CarritoCompra> ListCarritoCompra = new List<CarritoCompra>();

                foreach (var lineaCarrito in ListCarrito)
                {
                    Producto oProducto = productoApp.ObtenerProducto(lineaCarrito.id_producto);
                    lineaCarrito.nombre_producto = oProducto.nombre_producto;
                    ListCarritoCompra.Add(lineaCarrito);
                }
                return ListCarritoCompra;
            }
            catch (Exception)
            {
                return null;
                throw;
            }
        }
        [WebMethod(EnableSession = true)]
        public static bool AgregarCantidadProducto(int id_producto)
        {
            try
            {
                Usuario oUsuario = (Usuario)(HttpContext.Current.Session["UsuarioSesion"]);
                IList<CarritoCompra> listCarritoCompra = carritoApp.ObtenerCarritoCompra(oUsuario.id_usuario);
                CarritoCompra oCarritoCompra = listCarritoCompra.Where(x => x.id_producto == id_producto).FirstOrDefault();
                oCarritoCompra.cantidad++;
                oCarritoCompra.total_detalle = (oCarritoCompra.cantidad * oCarritoCompra.precio_producto);
                carritoApp.ModificarCantidadProducto(oCarritoCompra);
                return true;
            }
            catch (Exception)
            {
                return false;
                throw;
            }
        }
        [WebMethod(EnableSession = true)]
        public static bool ReducirCantidadProducto(int id_producto)
        {
            try
            {
                Usuario oUsuario = (Usuario)(HttpContext.Current.Session["UsuarioSesion"]);
                IList<CarritoCompra> listCarritoCompra = carritoApp.ObtenerCarritoCompra(oUsuario.id_usuario);
                CarritoCompra oCarritoCompra = listCarritoCompra.Where(x => x.id_producto == id_producto).FirstOrDefault();
                oCarritoCompra.cantidad--;
                oCarritoCompra.total_detalle = (oCarritoCompra.cantidad * oCarritoCompra.precio_producto);
                carritoApp.ModificarCantidadProducto(oCarritoCompra);
                return true;
            }
            catch (Exception)
            {
                return false;
                throw;
            }
        }
        [WebMethod(EnableSession = true)]
        public static bool EliminarLinea(int id_producto)
        {
            try
            {
                Usuario oUsuario = (Usuario)(HttpContext.Current.Session["UsuarioSesion"]);
                IList<CarritoCompra> listCarritoCompra = carritoApp.ObtenerCarritoCompra(oUsuario.id_usuario);
                CarritoCompra oCarritoCompra = listCarritoCompra.Where(x => x.id_producto == id_producto).FirstOrDefault();
                carritoApp.EliminarLinea(oCarritoCompra.id_usuario, oCarritoCompra.id_carrito, oCarritoCompra.id_producto, oCarritoCompra.nro_linea);
                return true;
            }
            catch (Exception)
            {
                return false;
                throw;
            }
        }
        [WebMethod(EnableSession = true)]
        public static bool EliminarCarrito(int id_carrito)
        {
            try
            {
                Usuario oUsuario = (Usuario)(HttpContext.Current.Session["UsuarioSesion"]);
                carritoApp.EliminarCarrito(oUsuario.id_usuario, id_carrito);
                return true;
            }
            catch (Exception)
            {
                return false;
                throw;
            }
        }
    }
}