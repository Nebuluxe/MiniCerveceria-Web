using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MiniCerveceria.Servicios.Modelos
{
    public class InscripcionCurso
    {
        public int id_Inscripcion { get; set; }
        public int id_usuario { get; set; }
        public int id_curso { get; set; }
        public string fecha_inscripcion { get; set; }
        public bool cursado { get; set; }
        public int total { get; set; }
        public string nombre_curso { get; set; }
    }
}