using System;
using System.Collections.Generic;
using MiniCerveceria.Modelos;
using System.Data;
using System.Linq;
using System.Web;
using System.Windows.Forms;
using System.Collections;

namespace MiniCerveceria.Servicios.Implementacion
{
    public class PedidoServicio : IPedidoAplicacionServicios
    {
        static Controladores.Conexion db = new Controladores.Conexion();
        public PedidoServicio(string conn)
        {
            db = new Controladores.Conexion(conn);
        }
        public void CrearPedido(Pedido obj)
        {
            string query = @"DECLARE " +
                                "v_id_pedido NUMBER(10) := 0; " +
                                "v_id_usuario NUMBER(10) := " + obj.id_usuario + "; " +
                            "BEGIN " +
                                "SELECT COUNT(MAX(id_pedido)) + 1 INTO v_id_pedido FROM pedido GROUP BY id_pedido; " +
                                "INSERT INTO pedido (id_pedido, id_usuario, fecha_creacion, fecha_entrega, direccion_envio, costo_envio, subtotal, total, estado, nombre_receptor) " +
                                "VALUES (v_id_pedido, v_id_usuario, CURRENT_DATE, CURRENT_DATE, '" + obj.direccion_envio + "', " + obj.costo_envio + ", " + obj.subtotal + ", " + obj.total + ", " + obj.estado + ", '" + obj.nombre_receptor + "'); " +
                            "EXCEPTION " +
                                "WHEN no_data_found THEN  " +
                                    "INSERT INTO pedido (id_pedido, id_usuario, fecha_creacion, fecha_entrega, direccion_envio, costo_envio, subtotal, total, estado, nombre_receptor) " +
                                    "VALUES (1, v_id_usuario, CURRENT_DATE, CURRENT_DATE, '" + obj.direccion_envio + "', " + obj.costo_envio + ", " + obj.subtotal + ", " + obj.total + ", " + obj.estado + ", '" + obj.nombre_receptor + "'); " +
                            "END;";
            db.Execute(query);
        }
        public int ObtenerIdUltimoPedidoUsuario(int id_usuario)
        {
            string query = @"SELECT MAX(id_pedido) AS id_pedido FROM pedido WHERE id_usuario = " + id_usuario;
            DataTable dt = db.Execute(query);
            int id_pedido = Convert.ToInt32(dt.Rows[0]["id_pedido"]);
            return id_pedido;
        }

        public IList<Pedido> ObtenerPedidosUsuario(int id_usuario)
        {
			string query = "SELECT id_pedido, id_usuario, fecha_creacion, fecha_entrega, direccion_envio, costo_envio, subtotal, total, estado, nombre_receptor FROM pedido WHERE id_usuario = " + id_usuario;
			DataTable dt = db.Execute(query);

			IList<Pedido> lista = new List<Pedido>();
			if (dt.Rows.Count > 0)
			{
				lista = (from DataRow rw in dt.Rows
						 select new Pedido()
						 {
							 id_pedido = Convert.ToInt32(rw["id_pedido"]),
							 id_usuario = Convert.ToInt32(rw["id_usuario"]),
							 fecha_creacion = Convert.ToDateTime(rw["fecha_creacion"]).ToString("dd-MM-yyyy"),
							 fecha_entrega = Convert.ToDateTime(rw["fecha_entrega"]).ToString("dd-MM-yyyy"),
							 direccion_envio = Convert.ToString(rw["direccion_envio"]),
							 costo_envio = Convert.ToInt32(rw["costo_envio"]),
							 subtotal = Convert.ToInt32(rw["subtotal"]),
							 total = Convert.ToInt32(rw["total"]),
							 estado = Convert.ToInt32(rw["estado"]),
							 nombre_receptor = Convert.ToString(rw["nombre_receptor"])
						 }
						).ToList();
				return lista;
			}
			else
			{
				return lista;
			}
		}

		public IList<Pedido> ObtenerPedidos()
		{
			string query = "SELECT id_pedido, id_usuario, fecha_creacion, fecha_entrega, direccion_envio, costo_envio, subtotal, total, estado, nombre_receptor FROM pedido";
			DataTable dt = db.Execute(query);

			IList<Pedido> lista = new List<Pedido>();
			if (dt.Rows.Count > 0)
			{
				lista = (from DataRow rw in dt.Rows
						 select new Pedido()
						 {
							 id_pedido = Convert.ToInt32(rw["id_pedido"]),
							 id_usuario = Convert.ToInt32(rw["id_usuario"]),
							 fecha_creacion = Convert.ToDateTime(rw["fecha_creacion"]).ToString("dd-MM-yyyy"),
							 fecha_entrega = Convert.ToDateTime(rw["fecha_entrega"]).ToString("dd-MM-yyyy"),
							 direccion_envio = Convert.ToString(rw["direccion_envio"]),
							 costo_envio = Convert.ToInt32(rw["costo_envio"]),
							 subtotal = Convert.ToInt32(rw["subtotal"]),
							 total = Convert.ToInt32(rw["total"]),
							 estado = Convert.ToInt32(rw["estado"]),
							 nombre_receptor = Convert.ToString(rw["nombre_receptor"])
						 }
						).ToList();
				return lista;
			}
			else
			{
				return lista;
			}
		}

		public Pedido ObtenerPedido(int id_pedido, int id_usuario)
        {
			string query = "SELECT id_pedido, id_usuario, fecha_creacion, fecha_entrega, direccion_envio, costo_envio, subtotal, total, estado, nombre_receptor FROM pedido WHERE id_usuario = " + id_usuario  + " AND id_pedido = " + id_pedido;
			DataTable dt = db.Execute(query);

			Pedido Pedido = new Pedido();

			Pedido = (from DataRow rw in dt.Rows
						select new Pedido()
						{
							id_pedido = Convert.ToInt32(rw["id_pedido"]),
							id_usuario = Convert.ToInt32(rw["id_usuario"]),
							fecha_creacion = Convert.ToString(rw["fecha_creacion"]),
							fecha_entrega = Convert.ToString(rw["fecha_entrega"]),
							direccion_envio = Convert.ToString(rw["direccion_envio"]),
							costo_envio = Convert.ToInt32(rw["costo_envio"]),
							subtotal = Convert.ToInt32(rw["subtotal"]),
							total = Convert.ToInt32(rw["total"]),
							estado = Convert.ToInt32(rw["estado"]),
							nombre_receptor = Convert.ToString(rw["nombre_receptor"])
						}
					).FirstOrDefault();

			string queryDetalle = "SELECT tbl1.id_det_pedido, tbl1.id_pedido, tbl1.id_producto, tbl1.nro_linea, tbl1.cantidad, tbl1.fecha_creacion, tbl1.total_detalle,  tbl1.precio_producto, tbl2.nombre_producto FROM detallepedido tbl1 JOIN productos tbl2 ON tbl1.id_producto = tbl2.id_producto WHERE tbl1.id_pedido = " + id_pedido;

			dt = new DataTable();

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

			Pedido.DetallePedido = detallePedidos;

			return Pedido;

		}

		public void CambioEstadoPedido(int id_usuario, int id_pedido, int estado)
		{
			string query = @"UPDATE pedido set estado = " + estado + " WHERE id_usuario = " + id_usuario  + " AND id_pedido = " + id_pedido + "";
			db.Execute(query);
		}
    }
}