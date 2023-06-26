using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MiniCerveceria.Modelos
{
    public class Curso
    {
        public int id_curso { get; set; }
        public string nombre_curso { get; set; }
        public string descripcion { get; set; }
        public int precio { get; set; }
        public int estado { get; set; }
        public string URL_img { get; set; }
        public DateTime fecha_creacion { get; set; }
        public DateTime fecha_modificacion { get; set; }
    }
}