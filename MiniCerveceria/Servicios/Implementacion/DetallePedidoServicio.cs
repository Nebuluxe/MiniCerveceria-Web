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
    }
}