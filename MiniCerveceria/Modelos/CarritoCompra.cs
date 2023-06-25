using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MiniCerveceria.Modelos
{
    public class CarritoCompra
    {
        public int id_carrito { get; set; }
        public int id_usuario { get; set; }
        public int id_producto { get; set; }
        public int precio_producto { get; set; }
        public int nro_linea { get; set; }
        public int cantidad { get; set; }
        public int total_detalle { get; set; }
        public DateTime fecha_creacion { get; set; }
        public DateTime fecha_modificacion { get; set; }
    }
}