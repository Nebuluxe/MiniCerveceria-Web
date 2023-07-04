using MiniCerveceria.Modelos;
using System.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MiniCerveceria.Servicios.Implementacion
{
	public class DetallePedidoServicio : IDetallePedidoAplicacionServicios
	{
		static Controladores.Conexion db = new Controladores.Conexion();
		public DetallePedidoServicio(string conn)
		{
			db = new Controladores.Conexion(conn);
		}
		public void CrearDetallePedido(DetallePedido obj)
		{
			string query = @"DECLARE " +
								"v_id_det_pedido NUMBER(10) := 0; " +
								"v_id_pedido NUMBER(10) := " + obj.id_pedido + "; " +
							"BEGIN " +
								"SELECT COUNT(MAX(id_det_pedido)) + 1 INTO v_id_det_pedido FROM detallepedido GROUP BY id_det_pedido; " +
								"INSERT INTO detallepedido (id_det_pedido, id_pedido, id_producto, nro_linea, cantidad, fecha_creacion, total_detalle, precio_producto) " +
								"VALUES (v_id_det_pedido, v_id_pedido, " + obj.id_producto + ", " + obj.nro_linea + ", " + obj.cantidad + ", CURRENT_DATE, " + obj.total_detalle + ", " + obj.precio_producto + "); " +
							"EXCEPTION " +
								"WHEN no_data_found THEN " +
									"INSERT INTO detallepedido (id_det_pedido, id_pedido, id_producto, nro_linea, cantidad, fecha_creacion, total_detalle, precio_producto) " +
									"VALUES (1, v_id_pedido, " + obj.id_producto + ", " + obj.nro_linea + ", " + obj.cantidad + ", CURRENT_DATE, " + obj.total_detalle + ", " + obj.precio_producto + "); " +
							"END;";
			db.Execute(query);
		}

		public IList<DetallePedido> obtenerLineas()
		{
			string queryDetalle = "SELECT tbl1.id_det_pedido, tbl1.id_pedido, tbl1.id_producto, tbl1.nro_linea, tbl1.cantidad, tbl1.fecha_creacion, tbl1.total_detalle,  tbl1.precio_producto, tbl2.nombre_producto FROM detallepedido tbl1 JOIN productos tbl2 ON tbl1.id_producto = tbl2.id_producto ";

			DataTable dt = new DataTable();

			dt = db.Execute(queryDetalle);

			IList<DetallePedido> detallePedidos = new List<DetallePedido>();

			detallePedidos = (from DataRow rw in dt.Rows
							  select new DetallePedido()
							  {
								  id_det_pedido = Convert.ToInt32(rw["id_det_pedido"]),
								  id_pedido = Convert.ToInt32(rw["id_pedido"]),
								  id_producto = Convert.ToInt32(rw["id_producto"]),
								  nro_linea = Convert.ToInt32(rw["nro_linea"]),
								  cantidad = Convert.ToInt32(rw["cantidad"]),
								  fecha_creacion = Convert.ToDateTime(rw["fecha_creacion"]).ToString("dd-MM-yyyy"),
								  total_detalle = Convert.ToInt32(rw["total_detalle"]),
								  precio_producto = Convert.ToInt32(rw["precio_producto"]),
								  nombre_producto = Convert.ToString(rw["nombre_producto"])
							  }
							).ToList();

			return detallePedidos;
		}
	}
}
