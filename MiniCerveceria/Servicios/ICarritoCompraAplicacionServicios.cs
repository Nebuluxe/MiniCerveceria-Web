using MiniCerveceria.Modelos;
using System.Collections.Generic;

namespace MiniCerveceria.Servicios
{
    internal interface ICarritoCompraAplicacionServicios
    {
        void CrearCarritoCompra(CarritoCompra carritocompra);
        void EliminarLinea(int id_usuario, int id_carrito, int id_producto, int nro_linea);
        void EliminarCarrito(int id_usuario, int id_carrito);
        IList<CarritoCompra> ObtenerCarritoCompra(int id_usuario);
        void AgregarCantidadProducto(CarritoCompra carritocompra);
        void DisminuirCantidadProducto(CarritoCompra carritocompra);
    }
}
