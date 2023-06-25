using MiniCerveceria.Modelos;
using System.Collections.Generic;

namespace MiniCerveceria.Servicios
{
    internal interface IProductoAplicacionServicios
    {
        /*ObtenerProducto*/
        Producto ObtenerProducto(int id_producto);
        /*ListarProductos*/
        IList<Producto> ListarProductos(int estado);
        /*ListarProductosCategoria*/
        IList<Producto> ListarProductosCategoria(int categoria, int estado);
        /*CrearProducto*/
        void CrearProducto(Producto producto);
        /*ActualizarProducto*/
        void ActualizarProducto(Producto producto);
        /*EliminarProducto*/
        void EliminarProducto(string id_producto);
        /*ObtenerIDProducto*/
        int ObtenerIDProducto();

    }
}
