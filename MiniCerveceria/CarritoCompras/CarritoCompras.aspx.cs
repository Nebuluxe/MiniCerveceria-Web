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
        static IPedidoAplicacionServicios pedidoApp = new PedidoServicio(conn);
        static IDetallePedidoAplicacionServicios detPedidoApp = new DetallePedidoServicio(conn);
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        [WebMethod(EnableSession = true)]
        public static IList<CarritoCompra> ObtenerCarritoCompra()
        {
            try
            {
                Usuario oUsuario = (Usuario)(HttpContext.Current.Session["UsuarioSesion"]);
				IList<CarritoCompra> ListCarritoCompra = new List<CarritoCompra>();

				if (oUsuario != null)
                {
					IList<CarritoCompra> ListCarrito = carritoApp.ObtenerCarritoCompra(oUsuario.id_usuario);

					foreach (var lineaCarrito in ListCarrito)
					{
						Producto oProducto = productoApp.ObtenerProducto(lineaCarrito.id_producto);
						lineaCarrito.nombre_producto = oProducto.nombre_producto;
						ListCarritoCompra.Add(lineaCarrito);
					}
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
        [WebMethod(EnableSession = true)]
        public static int CrearPedido(string direccion_envio, int costo_envio, int subtotal, int total, string nombre_receptor, int estado)
        {
            int id_pedido = 0;
            try
            {
                Usuario oUsuario = (Usuario)(HttpContext.Current.Session["UsuarioSesion"]);
                Pedido oPedido = new Pedido();
                oPedido.id_usuario = oUsuario.id_usuario;
                oPedido.direccion_envio = direccion_envio;
                oPedido.costo_envio = costo_envio;
                oPedido.subtotal = subtotal;
                oPedido.total = total;
                oPedido.estado = estado;
                oPedido.nombre_receptor = nombre_receptor;
                pedidoApp.CrearPedido(oPedido);
                return id_pedido = pedidoApp.ObtenerIdUltimoPedidoUsuario(oUsuario.id_usuario);
            }
            catch (Exception)
            {
                return id_pedido;
                throw;
            }
        }
        [WebMethod(EnableSession = true)]
        public static void CrearDetallePedido(int id_pedido)
        {
            try
            {
                Usuario oUsuario = (Usuario)(HttpContext.Current.Session["UsuarioSesion"]);
                IList<CarritoCompra> listCarritoCompra = carritoApp.ObtenerCarritoCompra(oUsuario.id_usuario);
                int id_carrito = 0;
                foreach (var item in listCarritoCompra)
                {
                    DetallePedido oDetPedido = new DetallePedido();
                    oDetPedido.id_pedido = id_pedido;
                    oDetPedido.id_producto = item.id_producto;
                    oDetPedido.nro_linea = item.nro_linea;
                    oDetPedido.cantidad = item.cantidad;
                    oDetPedido.total_detalle = item.total_detalle;
                    oDetPedido.precio_producto = item.precio_producto;
                    id_carrito = item.id_carrito;
                    detPedidoApp.CrearDetallePedido(oDetPedido);

                    productoApp.RebajarStock(item.id_producto, item.cantidad);
				}

                carritoApp.EliminarCarrito(oUsuario.id_usuario, id_carrito);
            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}