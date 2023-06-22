using System.Collections.Generic;
using MiniCerveceria.Modelos;

namespace MiniCerveceria.Servicios
{
    public interface IUsuarioAplicacionServicios
    {
        void CrearUsuario(Usuario usuario);
        void EliminarUsuario(int UsuarioID);
        IList<Usuario> ListarUsuarios();
        Usuario Usuario(int UsuarioID);
        void ActualizarUsuario(Usuario usuario);
        Usuario UsuarioEmail(string email, string password);
        int ObtenerIDUsuario();
    }
}
