using MiniCerveceria.Modelos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace MiniCerveceria.Servicios
{
    internal interface IProductoAplicacionServicios
    {
        /*ObtenerProducto*/
        Producto ObtenerProducto(int id_producto, int estado);
        /*ListarProductos*/
        IList<Producto> ListarProductos(int estado);
        /*ListarProductosCategoria*/
        IList<Producto> ListarProductosCategoria(int categoria, int estado);
        /*CrearProducto*/
        void CrearProducto(Producto producto);
        /*ActualizarProducto*/
        void ActualizarProducto(Producto producto);
        /*EliminarProducto*/
        void EliminarProducto(string id_producto, int estado);
        /*ObtenerIDProducto*/
        int ObtenerIDProducto();

    }
}
