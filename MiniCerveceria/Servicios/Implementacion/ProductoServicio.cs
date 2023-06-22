using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using MiniCerveceria.Modelos;
using System.Web;
using static System.Windows.Forms.VisualStyles.VisualStyleElement.ListView;

namespace MiniCerveceria.Servicios.Implementacion
{
    public class ProductoServicio : IProductoAplicacionServicios
    {
        static Controladores.Conexion db = new Controladores.Conexion();

        public ProductoServicio(string conn)
        {
            db = new Controladores.Conexion(conn);
        }

        public Producto ObtenerProducto(int id_producto, int estado)
        {
            string query = string.Format(@"SELECT id_producto, nombre_producto, descripcion, precio, estado, fecha_creacion, fecha_modificacion, cbo_categoria " +
                            "FROM productos WHERE id_producto = {0} AND estado != {1}", id_producto, estado);
            DataTable dt = db.Execute(query);

            Producto obj = new Producto();
            if (dt.Rows.Count > 0)
            {
                obj = (from DataRow rw in dt.Rows
                       select new Producto()
                       {
                           id_producto = Convert.ToInt32(rw["id_producto"]),
                           nombre_producto = Convert.ToString(rw["nombre_producto"]),
                           descripcion = Convert.ToString(rw["descripcion"]),
                           precio = Convert.ToDecimal(rw["precio"]),
                           estado = Convert.ToInt32(rw["estado"]),
                           fecha_creacion = Convert.ToDateTime(rw["fecha_creacion"]),
                           fecha_modificacion = Convert.ToDateTime(rw["fecha_modificacion"]),
                           categoria = Convert.ToInt32(rw["cbo_categoria"])
                       }
                         ).FirstOrDefault();
            }

            return obj;
        }
        public IList<Producto> ListarProductos(int estado)
        {
            string query = string.Format(@"SELECT id_producto, nombre_producto, descripcion, precio, estado, fecha_creacion, fecha_modificacion, cbo_categoria " +
                            "FROM productos WHERE estado != {0}", estado);
            DataTable dt = db.Execute(query);

            IList<Producto> lista = new List<Producto>();
            if (dt.Rows.Count > 0)
            {
                lista = (from DataRow rw in dt.Rows
                         select new Producto()
                         {
                             id_producto = Convert.ToInt32(rw["id_producto"]),
                             nombre_producto = Convert.ToString(rw["nombre_producto"]),
                             descripcion = Convert.ToString(rw["descripcion"]),
                             precio = Convert.ToDecimal(rw["precio"]),
                             estado = Convert.ToInt32(rw["estado"]),
                             fecha_creacion = Convert.ToDateTime(rw["fecha_creacion"]),
                             fecha_modificacion = Convert.ToDateTime(rw["fecha_modificacion"]),
                             categoria = Convert.ToInt32(rw["cbo_categoria"])
                         }
                        ).ToList();
                return lista;
            }
            else
            {
                return lista;
            }
        }
        public IList<Producto> ListarProductosCategoria(int estado, int categoria)
        {
            string query = string.Format(@"SELECT id_producto, nombre_producto, descripcion, precio, estado, fecha_creacion, fecha_modificacion, cbo_categoria " +
                            "FROM productos WHERE cbo_categoria = {0} AND estado != {1}", categoria, estado);
            DataTable dt = db.Execute(query);

            IList<Producto> lista = new List<Producto>();
            if (dt.Rows.Count > 0)
            {
                lista = (from DataRow rw in dt.Rows
                         select new Producto()
                         {
                             id_producto = Convert.ToInt32(rw["id_producto"]),
                             nombre_producto = Convert.ToString(rw["nombre_producto"]),
                             descripcion = Convert.ToString(rw["descripcion"]),
                             precio = Convert.ToDecimal(rw["precio"]),
                             estado = Convert.ToInt32(rw["estado"]),
                             fecha_creacion = Convert.ToDateTime(rw["fecha_creacion"]),
                             fecha_modificacion = Convert.ToDateTime(rw["fecha_modificacion"]),
                             categoria = Convert.ToInt32(rw["cbo_categoria"])
                         }
                        ).ToList();
                return lista;
            }
            else
            {
                return lista;
            }
        }
        public void CrearProducto(Producto obj)
        {
            string query = string.Format(@"INSERT INTO productos " +
                "(id_producto, nombre_producto, descripcion, precio, estado, fecha_creacion, fecha_modificacion, cbo_categoria) " +
                "VALUES ({0}, '{1}', '{2}', {3}, {4}, TO_DATE('{5}', 'DD-MM-YYYY HH24:MI:SS'), TO_DATE('{6}', 'DD-MM-YYYY HH24:MI:SS'), {7})",
                obj.id_producto, obj.nombre_producto, obj.descripcion, obj.precio, obj.estado, obj.fecha_creacion, obj.fecha_modificacion, obj.categoria);
            DataTable dt = db.Execute(query);
        }
        public void EliminarProducto(string id_producto, int estado)
        {
            string query = string.Format(@"DELETE FROM productos WHERE id_producto = {0} AND estado = {1}", id_producto, estado);
            DataTable dt = db.Execute(query);
        }
        public void ActualizarProducto(Producto obj)
        {
            string query = string.Format(@"UPDATE productos SET"+
                                                "nombre_producto = '{1}', descripcion = '{2}', precio = {3}, " +
                                                "estado = {4}, fecha_modificacion = TO_DATE('{5}', 'DD-MM-YYYY HH24:MI:SS'), cbo_categoria = {6} " +
                                          "WHERE id_producto = {0}", 
                                          obj.id_producto, obj.nombre_producto, obj.descripcion, obj.precio, obj.estado, obj.fecha_modificacion, obj.categoria);
            DataTable dt = db.Execute(query);
        }
        public int ObtenerIDProducto()
        {
            string query = @"SELECT COUNT(*) AS idProducto FROM productos";
            DataTable dt = db.Execute(query);
            int idUsuario = Convert.ToInt32(dt.Rows[0]["idProducto"]);
            return idUsuario + 1;
        }
    }
}