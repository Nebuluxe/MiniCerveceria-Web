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
        Producto ObtenerProducto(int id_producto);
        IList<Producto> ListarProductos(bool estado);
        IList<Producto> ListarProductosCategoria(int categoria, int sub_categoria);
        void CrearProducto(Producto producto);
        void ActualizarProducto(Producto producto);
        void EliminarProducto(string id_producto);
        void AumentarStock(int id_producto, int cantidad);
	    void RebajarStock(int id_producto, int cantidad);
		void AñadirNovedad(int id_producto);
		void QuitarNovedad(int id_producto);
        IList<Producto> ListarNoveddades();
	}
}
