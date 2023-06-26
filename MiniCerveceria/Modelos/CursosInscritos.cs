using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MiniCerveceria.Servicios.Modelos
{
    public class CursosInscritos
    {
        public int id_cursos_inscritos { get; set; }
        public int id_usuario { get; set; }
        public int id_curso { get; set; }
        public DateTime fecha_inscripcion { get; set; }
        public int cursado { get; set; }
        public int total { get; set; }
    }
}