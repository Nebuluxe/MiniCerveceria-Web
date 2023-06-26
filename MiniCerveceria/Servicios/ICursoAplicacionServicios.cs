using MiniCerveceria.Modelos;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MiniCerveceria.Servicios
{
    internal interface ICursoAplicacionServicios
    {
        void CrearCurso(Curso curso);
        IList<Curso> ObtenerCursos(Curso curso);
        void EliminarCurso(int id_curso);
        Curso ObtenerCurso(int id_curso, int estado);
    }
}
