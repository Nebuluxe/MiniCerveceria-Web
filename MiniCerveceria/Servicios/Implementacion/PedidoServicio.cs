using System;
using System.Collections.Generic;
using MiniCerveceria.Modelos;
using System.Data;
using System.Linq;
using System.Web;
using System.Windows.Forms;

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
    }
}