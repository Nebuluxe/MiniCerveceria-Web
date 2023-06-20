using Microsoft.Extensions.Configuration;
using MiniCerveceria.Modelos;
using MiniCerveceria.Servicios;
using MiniCerveceria.Servicios.Implementacion;
using System.Collections.Generic;
using System.Windows.Forms;

namespace MiniCerveceria.Controladores
{
    public class UsuarioController
    {
        static IUsuarioAplicacionServicios UsuarioServicio;

        public UsuarioController(IConfiguration configuration)
        {
            string conn = configuration.GetConnectionString("con");
            UsuarioServicio = new UsuarioServicio(conn);
        }

        public void CrearUsuario(Usuario usuario)
        {
            UsuarioServicio.CrearUsuario(usuario);
        }
        public IList<Usuario> ObtenerUsuarios()
        {
            return UsuarioServicio.ListarUsuarios();
        }
        public Usuario ObtenerUsuario(int UsuarioID)
        {
            return UsuarioServicio.Usuario(UsuarioID);
        }
        public void ActualizarUsuario(Usuario usuario)
        {
            UsuarioServicio.ActualizarUsuario(usuario);
        }
        public int ObtenerIDUsuario()
        {
            return UsuarioServicio.ObtenerIDUsuario();
        }
    }
}