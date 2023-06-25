using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using MiniCerveceria.Modelos;
using MiniCerveceria.CarritoCompras;

namespace MiniCerveceria.Servicios.Implementacion
{
    public class CarritoCompraServicio : ICarritoCompraAplicacionServicios
    {
        static Controladores.Conexion db = new Controladores.Conexion();

        public CarritoCompraServicio(string conn)
        {
            db = new Controladores.Conexion(conn);
        }
        public void CrearCarritoCompra(CarritoCompra obj)
        {

            string query = "DECLARE" +
                               "v_carrito_usuario NUMBER(1) := 0; " +
                               "v_linea_producto NUMBER(10) := 0; " +
                               "v_id_carrito NUMBER(10) := 0; " +
                               "v_nro_linea NUMBER(3) := 0; " +
                           "BEGIN" +
                                "SELECT COUNT(id_carrito) INTO v_carrito_usuario FROM CarritoCompra WHERE id_usuario = " + obj.id_usuario + ";" +
                                "IF v_carrito_usuario > 0 THEN" +
                                    "SELECT COUNT(nro_linea) INTO v_linea_producto FROM CarritoCompra WHERE id_usuario = " + obj.id_usuario + " AND id_producto = " + obj.id_producto + ";" +
                                    "IF v_linea_producto > 0 THEN" +
                                        "SELECT id_carrito INTO v_id_carrito FROM CarritoCompra WHERE id_usuario = " + obj.id_usuario + " AND id_producto = " + obj.id_producto + ";" +
                                        "SELECT nro_linea INTO v_nro_linea FROM CarritoCompra WHERE id_usuario = " + obj.id_usuario + " AND id_producto = " + obj.id_producto + ";" +
                                        "UPDATE CarritoCompra SET precio_producto = " + obj.precio_producto + "," +
                                                                 "cantidad = " + obj.cantidad + "," +
                                                                 "total_detalle = " + obj.total_detalle + "," +
                                                                 "fecha_modificacion = CURRENT_DATE" +
                                        "WHERE id_usuario = " + obj.id_usuario + " AND id_carrito = v_id_carrito AND id_producto = " + obj.id_producto + " AND nro_linea = v_nro_linea; " +
                                    "ELSE" +
                                        "SELECT id_carrito INTO v_id_carrito FROM CarritoCompra WHERE id_usuario = " + obj.id_usuario + " FETCH FIRST 1 ROWS ONLY; " +
                                        "SELECT COUNT(nro_linea) + 1 INTO v_nro_linea FROM CarritoCompra WHERE id_usuario = " + obj.id_usuario + "; " +
                                        "INSERT INTO CarritoCompra (id_carrito, " +
                                                                    "id_usuario, " +
                                                                    "id_producto, " +
                                                                    "precio_producto, " +
                                                                    "nro_linea, " +
                                                                    "cantidad, " +
                                                                    "total_detalle, " +
                                                                    "fecha_creacion, " +
                                                                    "fecha_modificacion) " +
                                        "VALUES (v_id_carrito, " + obj.id_usuario + ", " + obj.id_producto + ", " + obj.precio_producto + ", v_nro_linea, " + obj.cantidad + ", " + obj.total_detalle + ", CURRENT_DATE, CURRENT_DATE); " +
                                    "END IF; " +
                                "ELSE" +
                                    "SELECT COUNT(id_carrito) + 1 INTO v_id_carrito FROM CarritoCompra WHERE id_usuario = " + obj.id_usuario + "; " +
                                    "v_nro_linea := 1; " +
                                    "INSERT INTO CarritoCompra (id_carrito, " +
                                                               "id_usuario, " +
                                                               "id_producto, " +
                                                               "precio_producto, " +
                                                               "nro_linea, " +
                                                               "cantidad, " +
                                                               "total_detalle, " +
                                                               "fecha_creacion, " +
                                                               "fecha_modificacion)" +
                                    "VALUES (v_id_carrito, " + obj.id_usuario + ", " + obj.id_producto + ", " + obj.precio_producto + ", v_nro_linea, " + obj.cantidad + ", " + obj.total_detalle + ", CURRENT_DATE, CURRENT_DATE); " +
                                "END IF; " +
                            "END";
            db.Execute(query);
        }
        public void EliminarLinea(int id_usuario, int id_carrito, int id_producto, int nro_linea)
        {
            string query = @"DELETE FROM carritocompra WHERE id_usuario = " + id_usuario + " AND id_carrito = " + id_carrito + " AND id_producto = " + id_producto + " AND nro_linea = " + nro_linea;
            db.Execute(query);
        }
        public void EliminarCarrito(int id_usuario, int id_carrito)
        {
            string query = @"DELETE FROM carritocompra WHERE id_usuario = " + id_usuario + " AND id_carrito = " + id_carrito;
            db.Execute(query);
        }
        public IList<CarritoCompra> ObtenerCarritoCompra(int id_usuario)
        {
            string query = "SELECT id_carrito, id_usuario, id_producto, precio_producto, nro_linea, cantidad, total_detalle, fecha_creacion, fecha_modificacion FROM carritocompra WHERE id_usuario = " + id_usuario + " ORDER BY nro_linea";
            DataTable dt = db.Execute(query);

            IList<CarritoCompra> lista = new List<CarritoCompra>();
            if (dt.Rows.Count > 0)
            {
                lista = (from DataRow rw in dt.Rows
                         select new CarritoCompra()
                         {
                             id_carrito = Convert.ToInt32(rw["id_carrito"]),
                             id_usuario = Convert.ToInt32(rw["id_usuario"]),
                             id_producto = Convert.ToInt32(rw["id_producto"]),
                             precio_producto = Convert.ToInt32(rw["precio_producto"]),
                             nro_linea = Convert.ToInt32(rw["nro_linea"]),
                             cantidad = Convert.ToInt32(rw["cantidad"]),
                             total_detalle = Convert.ToInt32(rw["total_detalle"]),
                             fecha_creacion = Convert.ToDateTime(rw["fecha_creacion"]),
                             fecha_modificacion = Convert.ToDateTime(rw["fecha_modificacion"])
                         }
                        ).ToList();
                return lista;
            }
            else
            {
                return lista;
            }
        }
        public void AgregarCantidadProducto(CarritoCompra obj) 
        {
            string query = @"UPDATE CarritoCompra SET precio_producto = " + obj.precio_producto + "," +
                                                     "cantidad = " + obj.cantidad + "," +
                                                     "total_detalle = " + obj.total_detalle + "," +
                                                     "fecha_modificacion = CURRENT_DATE" +
                             "WHERE id_usuario = " + obj.id_usuario + " AND id_carrito = " + obj.id_carrito + " AND id_producto = " + obj.id_producto + " AND nro_linea = " + obj.nro_linea;
            db.Execute(query);
        }
        public void DisminuirCantidadProducto(CarritoCompra obj)
        {
            string query = @"UPDATE CarritoCompra SET precio_producto = " + obj.precio_producto + "," +
                                                     "cantidad = " + obj.cantidad + "," +
                                                     "total_detalle = " + obj.total_detalle + "," +
                                                     "fecha_modificacion = CURRENT_DATE" +
                             "WHERE id_usuario = " + obj.id_usuario + " AND id_carrito = " + obj.id_carrito + " AND id_producto = " + obj.id_producto + " AND nro_linea = " + obj.nro_linea;
            db.Execute(query);
        }
    }
}