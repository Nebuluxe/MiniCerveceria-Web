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
        IList<Curso> ObtenerCursos(bool estado);
		void DeshabilitarCurso(int id_curso);
        void HabilitarCurso(int id_curso);
		Curso ObtenerCurso(int id_curso);
        int ObtenerIDCurso();
    }
}
