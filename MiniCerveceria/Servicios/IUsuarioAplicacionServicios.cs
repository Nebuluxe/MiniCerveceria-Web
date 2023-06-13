using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MiniCerveceria.Modelos;

namespace MiniCerveceria.Servicios
{
    public interface IUsuarioAplicacionServicios
    {
        bool InsertUsuario(Usuario usuario);
        Usuario GetUsuario(string email, string contrasena);
        IEnumerable<Usuario> GetUsuarios();
    }
}
