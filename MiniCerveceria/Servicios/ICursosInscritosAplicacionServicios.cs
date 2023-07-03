using MiniCerveceria.Modelos;
using MiniCerveceria.Servicios.Modelos;
using System.Collections.Generic;

namespace MiniCerveceria.Servicios
{
    internal interface ICursosInscritosAplicacionServicios
    {
        bool CrearCursoInscrito(InscripcionCurso cursosinscritos);
        IList<InscripcionCurso> ObtenerCursosInscritosUsuario(int id_usuario);
        IList<InscripcionCurso> ObtenerCursosInscritos(int id_curso, string cursado);
		void EliminarCursoInscrito(int id_usuario, int id_inscripcion);
        void CambioEstado(int id_inscripcion, bool estago);

	}
}
