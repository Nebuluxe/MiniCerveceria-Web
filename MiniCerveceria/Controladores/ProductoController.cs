using Microsoft.Extensions.Configuration;
using MiniCerveceria.Modelos;
using MiniCerveceria.Servicios.Implementacion;
using MiniCerveceria.Servicios;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;

namespace MiniCerveceria.Controladores
{
    public class ProductoController
    {
        static IProductoAplicacionServicios ProductoService;

        public ProductoController(IConfiguration configuration)
        {
            string conn = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
            ProductoService = new ProductoServicio(conn);
        }

        public Producto ObtenerProducto(int id_producto)
        {
            return ProductoService.ObtenerProducto(id_producto);
        }
        public IList<Producto> ListarProductos(int estado)
        {
            return ProductoService.ListarProductos(estado);
        }
        public IList<Producto> ListarProductosCategoria(int categoria, int estado)
        {
            return ProductoService.ListarProductosCategoria(categoria, estado);
        }
        public void CrearProducto(Producto producto)
        {
            ProductoService.CrearProducto(producto);
        }
        public void ActualizarProducto(Producto producto)
        {
            ProductoService.ActualizarProducto(producto);
        }
        public void EliminarProducto(string id)
        {
            ProductoService.EliminarProducto(id);

		}
		public int ObtenerIDProducto()
        {
            return ProductoService.ObtenerIDProducto();
        }
    }
}