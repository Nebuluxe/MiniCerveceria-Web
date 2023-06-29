using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MiniCerveceria.Modelos
{
    public class DetallePedido
    {
        public int id_det_pedido { get; set; }
        public int id_pedido { get; set; }
        public int id_producto { get; set; }
        public int nro_linea { get; set; }
        public int cantidad { get; set; }
        public string fecha_creacion { get; set; }
        public int total_detalle { get; set; }
        public int precio_producto { get; set; }
        public string nombre_producto { get; set; }
    }
}