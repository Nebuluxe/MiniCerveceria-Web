using System.Collections.Generic;
using MiniCerveceria.Modelos;

namespace MiniCerveceria.Servicios
{
    public interface IUsuarioAplicacionServicios
    {
        void CrearUsuario(Usuario usuario);
        void InHabiliatarCuentaUsuario(int UsuarioID);
		void HabiliatarCuentaUsuario(int UsuarioID);
        void AsignarPermiso(int UsuarioID, int id_permiso);
		void QuitarPermiso(int UsuarioID);
        IList<Usuario> ListarUsuarios(bool estado);
		Usuario Usuario(int UsuarioID);
        void ActualizarUsuario(Usuario usuario);
        Usuario UsuarioEmail(string email, string password);
        void CrearPermiso(PermisosUsusario obj);
        void ModificarPermiso(PermisosUsusario obj);
        void EliminarPermiso(int id_permiso);
        IList<PermisosUsusario> ListarPermisos();
        PermisosUsusario ObtenerPermiso(int id_permiso);
        bool ValidaCorreoExistente(string email);
        bool CambiarContraseña(string email, string contraseña);

	}
}
