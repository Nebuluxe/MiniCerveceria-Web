using System.Collections.Generic;
using MiniCerveceria.Modelos;

namespace MiniCerveceria.Servicios
{
    public interface IUsuarioAplicacionServicios
    {
        void CrearUsuario(Usuario obj);
        void EliminarUsuario(int UsuarioID);
        IList<Usuario> ListarUsuarios();
        Usuario Usuario(int UsuarioID);
        void ActualizarUsuario(Usuario obj);
        int ObtenerIDUsuario();
    }
}
