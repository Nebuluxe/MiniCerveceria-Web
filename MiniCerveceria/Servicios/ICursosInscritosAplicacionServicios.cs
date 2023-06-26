using MiniCerveceria.Modelos;
using MiniCerveceria.Servicios.Modelos;
using System.Collections.Generic;

namespace MiniCerveceria.Servicios
{
    internal interface ICursosInscritosAplicacionServicios
    {
        void CrearCursoInscrito(CursosInscritos cursosinscritos);
        IList<CursosInscritos> ObtenerCursosInscritosUsuario(int id_usuario);
        IList<CursosInscritos> ObtenerCursosInscritos();
        void EliminarCursosInscritos(int id_usuario);
    }
}
