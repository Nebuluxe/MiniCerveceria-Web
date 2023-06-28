using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MiniCerveceria.Modelos
{
    public class Pedido
    {
        public int id_pedido { get; set; }
        public int id_usuario { get; set; }
        public DateTime fecha_creacion { get; set; }
        public DateTime fecha_entrega { get; set; }
        public string direccion_envio { get; set; }
        public int costo_envio { get; set; }
        public int subtotal { get; set; }
        public int total { get; set; } 
        public int estado { get; set; }
        public string nombre_receptor { get; set; }
    }
}