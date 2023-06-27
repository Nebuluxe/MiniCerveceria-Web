using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MiniCerveceria.Modelos;

namespace MiniCerveceria.Modelos
{
    public class Usuario
    {
        public int id_usuario { get; set; }
        public int id_permiso { get; set; }
        public int id_comuna { get; set; }
        public string nombre { get; set; }
        public string apellido { get; set; }
        public string direccion { get; set; }
        public int telefono { get; set; }
        public DateTime fecha_nacimiento { get; set; }
        public string email { get; set; }
        public string password { get; set; }
        public int activo { get; set; }
        public int en_linea { get; set; }
        public DateTime fecha_creacion { get; set; }
        public string nombre_permiso { get; set; }
	}
}