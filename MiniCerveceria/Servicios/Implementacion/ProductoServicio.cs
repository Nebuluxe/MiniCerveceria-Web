using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using MiniCerveceria.Modelos;
using System.Web;

namespace MiniCerveceria.Servicios.Implementacion
{
    public class ProductoServicio : IProductoAplicacionServicios
    {
        static Controladores.Conexion db = new Controladores.Conexion();

        public ProductoServicio(string conn)
        {
            db = new Controladores.Conexion(conn);
        }

        public Producto ObtenerProducto(int id_producto)
        {
            string query = string.Format(@"SELECT id_producto, nombre_producto, descripcion, precio, estado, fecha_creacion, fecha_modificacion, cbo_categoria, url_img, sub_categoria, stock, novedad " +
                            "FROM productos WHERE id_producto = {0}", id_producto);
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
                           precio = Convert.ToInt32(rw["precio"]),
						   estado = (Convert.ToInt32(rw["estado"]) == 1 ? true : false),
						   fecha_creacion = Convert.ToDateTime(rw["fecha_creacion"]),
                           fecha_modificacion = Convert.ToDateTime(rw["fecha_modificacion"]),
                           categoria = Convert.ToInt32(rw["cbo_categoria"]),
                           URL_img = Convert.ToString(rw["url_img"]),
						   sub_categoria = Convert.ToInt32(rw["sub_categoria"]),
						   stock = Convert.ToInt32(rw["stock"]),
					       novedad = (Convert.ToInt32(rw["novedad"]) == 1 ? true : false)
					   }
						 ).FirstOrDefault();
            }

            return obj;
        }

        public IList<Producto> ListarProductos(bool estado)
        {
            string query = string.Format(@"SELECT id_producto, nombre_producto, descripcion, precio, estado, fecha_creacion, fecha_modificacion, cbo_categoria, url_img, sub_categoria, stock, novedad " +
                            "FROM productos WHERE estado = {0}", estado ? 1 : 0);
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
                             precio = Convert.ToInt32(rw["precio"]),
							 estado = (Convert.ToInt32(rw["estado"]) == 1 ? true : false),
							 fecha_creacion = Convert.ToDateTime(rw["fecha_creacion"]),
                             fecha_modificacion = Convert.ToDateTime(rw["fecha_modificacion"]),
                             categoria = Convert.ToInt32(rw["cbo_categoria"]),
							 URL_img = Convert.ToString(rw["url_img"]),
							 sub_categoria = Convert.ToInt32(rw["sub_categoria"]),
                             stock = Convert.ToInt32(rw["stock"]),
                             novedad = (Convert.ToInt32(rw["novedad"]) == 1 ? true : false)
						 }
                        ).ToList();
                return lista;
            }
            else
            {
                return lista;
            }
        }

        public IList<Producto> ListarProductosCategoria(int categoria, int sub_categoria)
        {
            string query = string.Format(@"SELECT id_producto, nombre_producto, descripcion, precio, estado, fecha_creacion, fecha_modificacion, cbo_categoria, url_img, sub_categoria, stock, novedad " +
							"FROM productos WHERE estado = 1");

            string condition = "";

            if (categoria != 0)
            {
                condition += " AND cbo_categoria = " + categoria;
			}

            if (sub_categoria != 0)
            {
				condition += " AND sub_categoria = " + sub_categoria;
			}


            DataTable dt = db.Execute(query + condition);

            IList<Producto> lista = new List<Producto>();
            if (dt.Rows.Count > 0)
            {
                lista = (from DataRow rw in dt.Rows
                         select new Producto()
                         {
                             id_producto = Convert.ToInt32(rw["id_producto"]),
                             nombre_producto = Convert.ToString(rw["nombre_producto"]),
                             descripcion = Convert.ToString(rw["descripcion"]),
                             precio = Convert.ToInt32(rw["precio"]),
                             estado = (Convert.ToInt32(rw["estado"]) == 1 ? true : false),
                             fecha_creacion = Convert.ToDateTime(rw["fecha_creacion"]),
                             fecha_modificacion = Convert.ToDateTime(rw["fecha_modificacion"]),
                             categoria = Convert.ToInt32(rw["cbo_categoria"]),
							 URL_img = Convert.ToString(rw["url_img"]),
							 sub_categoria = Convert.ToInt32(rw["sub_categoria"]),
							 stock = Convert.ToInt32(rw["stock"]),
							 novedad = (Convert.ToInt32(rw["novedad"]) == 1 ? true : false)
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
            int id = ObtenerIDProducto();

			string query = string.Format(@"INSERT INTO productos " +
				"(id_producto, nombre_producto, descripcion, precio, estado, fecha_creacion, fecha_modificacion, cbo_categoria, url_img, sub_categoria, stock, novedad) " +
				"VALUES ({0}, '{1}', '{2}', {3}, {4}, TO_DATE('{5}', 'DD-MM-YYYY HH24:MI:SS'), TO_DATE('{6}', 'DD-MM-YYYY HH24:MI:SS'), {7}, '{8}', {9}, 0, 0)",
				id, obj.nombre_producto.Replace("'", "''"), obj.descripcion.Replace("'", "''"), obj.precio,(obj.estado ? 1 : 0 ), obj.fecha_creacion, obj.fecha_modificacion, obj.categoria, obj.URL_img, obj.sub_categoria);
            db.Execute(query);
        }

        public void DeshabilitarProducto(string id_producto)
        {
            string query = string.Format(@"UPDATE productos SET estado = 0 WHERE id_producto = {0}", id_producto);
            db.Execute(query);
        }

		public void HabilitarProducto(string id_producto)
		{
			string query = string.Format(@"UPDATE productos SET estado = 1 WHERE id_producto = {0}", id_producto);
			db.Execute(query);
		}

		public void ActualizarProducto(Producto obj)
        {
            string query = string.Format(@"UPDATE productos SET "+
                                                "nombre_producto = '{1}', descripcion = '{2}', precio = {3}, " +
												"estado = {4}, fecha_modificacion = TO_DATE('{5}', 'DD-MM-YYYY HH24:MI:SS'), cbo_categoria = {6}, url_img = '{7}', sub_categoria = {8} " +
                                          "WHERE id_producto = {0}", 
                                          obj.id_producto, obj.nombre_producto, obj.descripcion, obj.precio, (obj.estado ? 1 : 0), obj.fecha_modificacion, obj.categoria, obj.URL_img, obj.sub_categoria);
            db.Execute(query);
        }

        public void AumentarStock(int id_producto, int cantidad)
        {
            int cantidadActual = obtenerStockActual(id_producto);

			string query = string.Format(@"UPDATE productos SET stock = '{1}' WHERE id_producto = {0}", id_producto, (cantidadActual + cantidad));

			db.Execute(query);
		}

        public void RebajarStock(int id_producto, int cantidad)
        {
			int cantidadActual = obtenerStockActual(id_producto);

			string query = string.Format(@"UPDATE productos SET stock = '{1}' WHERE id_producto = {0}", id_producto, (cantidadActual > cantidad ?  cantidadActual - cantidad : cantidad - cantidadActual ));

			db.Execute(query);
		}

        public void AñadirNovedad(int id_producto)
        {
			string query = string.Format(@"UPDATE productos SET novedad = 1 WHERE id_producto = {0}", id_producto);

			db.Execute(query);
		}

        public void AñadirImagen(int id_producto)
        {
            string query = string.Format(@"UPDATE productos SET url_img = 1 WHERE id_producto = {0}", id_producto);

            db.Execute(query);
        }

        public void QuitarNovedad(int id_producto)
        {
			string query = string.Format(@"UPDATE productos SET novedad = 0 WHERE id_producto = {0}", id_producto);

			db.Execute(query);
		}

		public IList<Producto> ListarNoveddades()
        {
			string query = string.Format(@"SELECT id_producto, nombre_producto, descripcion, precio, estado, fecha_creacion, fecha_modificacion, cbo_categoria, url_img, sub_categoria, stock, novedad " +
				"FROM productos WHERE novedad = 1");
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
							 precio = Convert.ToInt32(rw["precio"]),
							 estado = (Convert.ToInt32(rw["estado"]) == 1 ? true : false),
							 fecha_creacion = Convert.ToDateTime(rw["fecha_creacion"]),
							 fecha_modificacion = Convert.ToDateTime(rw["fecha_modificacion"]),
							 categoria = Convert.ToInt32(rw["cbo_categoria"]),
							 URL_img = Convert.ToString(rw["url_img"]),
							 sub_categoria = Convert.ToInt32(rw["sub_categoria"]),
							 stock = Convert.ToInt32(rw["stock"]),
							 novedad = (Convert.ToInt32(rw["novedad"]) == 1 ? true : false)
						 }
						).ToList();
				return lista;
			}
			else
			{
				return lista;
			}
		}

        public void EnviarComentario(ComentarioProducto obj)
        {
            int id = ObtenerIDComentario();

			string query = "INSERT INTO comentarioproducto(id_com_producto, id_usuario, id_producto, texto, fecha, estado, puntuacion)" +
                         " VALUES (" + id + ", " + obj.id_usuario + "," + obj.id_producto + ",'" + obj.texto + "', CURRENT_DATE , 1, " + obj.puntuacion + ")";

			db.Execute(query);
		}

        public IList<ComentarioProducto> ObtenerComentarios()
        {
            string query = "select tbl1.id_com_producto, tbl1.id_usuario, tbl1.id_producto, tbl1.texto, tbl1.fecha, tbl1.estado, tbl1.puntuacion, tbl2.nombre_producto, tbl2.url_img AS url_img_prod, tbl3.nombre, tbl3.apellido, tbl3.url_img AS url_img_user  from comentarioproducto tbl1 JOIN productos tbl2 ON tbl1.id_producto = tbl2.id_producto JOIN usuario tbl3 ON tbl1.id_usuario = tbl3.id_usuario";

			DataTable dt = db.Execute(query);

			IList<ComentarioProducto> lista = new List<ComentarioProducto>();

			if (dt.Rows.Count > 0)
			{
				lista = (from DataRow rw in dt.Rows
						 select new ComentarioProducto()
						 {
							 id_com_producto = Convert.ToInt32(rw["id_com_producto"]),
							 id_usuario = Convert.ToInt32(rw["id_usuario"]),
							 id_producto = Convert.ToInt32(rw["id_producto"]),
							 texto = Convert.ToString(rw["texto"]),
							 fecha = Convert.ToDateTime(rw["fecha"]).ToString("dd-MM-yyy"),
							 estado = (Convert.ToInt32(rw["estado"]) == 1 ? true : false),
							 puntuacion = Convert.ToInt32(rw["puntuacion"]),
							 nombre_producto = Convert.ToString(rw["nombre_producto"]),
							 url_img_prod = Convert.ToString(rw["url_img_prod"]),
							 nombre = Convert.ToString(rw["nombre"]),
							 apelido = Convert.ToString(rw["apellido"]),
							 url_img_user = Convert.ToString(rw["url_img_user"])
						 }
						).ToList();
				return lista;
			}
			else
			{
				return lista;
			}
		}

        private int obtenerStockActual(int id_producto)
        {
			string query = @"SELECT stock FROM productos WHERE id_producto = " + id_producto;
			DataTable dt = db.Execute(query);
			Producto obj = new Producto();

			if (dt.Rows.Count > 0)
            {
				obj = (from DataRow rw in dt.Rows
					   select new Producto()
					   {
						   stock = Convert.ToInt32(rw["stock"])
					   }
					  ).FirstOrDefault();
				return obj.stock;
			}
            else
            {
                return 0;
            }	
		}

        public int ObtenerIDProducto()
        {
            try
            {
				string query = @"SELECT MAX(id_producto) AS idProducto FROM productos";
				DataTable dt = db.Execute(query);
				int idUsuario = Convert.ToInt32(dt.Rows[0]["idProducto"]);
				return idUsuario + 1;

			}
            catch (Exception)
            {
                return 1;
                throw;
            }
        }

		private int ObtenerIDComentario()
		{
            try
            {
				string query = @"SELECT MAX(id_com_producto) AS idComentario FROM comentarioproducto";
				DataTable dt = db.Execute(query);
				int idUsuario = Convert.ToInt32(dt.Rows[0]["idComentario"]);
				return idUsuario + 1;
			}
            catch (Exception)
            {
                return 1;
                throw;
            }
		}
	}
}