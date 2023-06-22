using Microsoft.Extensions.Configuration;
using MiniCerveceria.Modelos;
using MiniCerveceria.Servicios;
using MiniCerveceria.Servicios.Implementacion;
using System.Collections.Generic;
using System.Configuration;
using System.Windows.Forms;

namespace MiniCerveceria.Controladores
{
    public class UsuarioController 
    {
        static IUsuarioAplicacionServicios UsuarioService;

        public UsuarioController(IConfiguration configuration)
        {
            string conn = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
            UsuarioService = new UsuarioServicio(conn);
        }

        public void CrearUsuario(Usuario usuario)
        {
            UsuarioService.CrearUsuario(usuario);
        }
        public IList<Usuario> ObtenerUsuarios()
        {
            return UsuarioService.ListarUsuarios();
        }
        public Usuario ObtenerUsuario(int UsuarioID)
        {
            return UsuarioService.Usuario(UsuarioID);
        }
        public Usuario UsuarioEmail(string email, string password)
        {
            return UsuarioService.UsuarioEmail(email, password);
        }
        public void ActualizarUsuario(Usuario usuario)
        {
            UsuarioService.ActualizarUsuario(usuario);
        }
        public int ObtenerIDUsuario()
        {
            return UsuarioService.ObtenerIDUsuario();
        }
    }
}