using MiniCerveceria.Servicios.Implementacion;
using MiniCerveceria.Servicios;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using MiniCerveceria.Modelos;

namespace MiniCerveceria.Login
{
    public partial class Login : System.Web.UI.Page
    {
        static string conn = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        static IUsuarioAplicacionServicios UsuarioService = new UsuarioServicio(conn);
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        [WebMethod(EnableSession = true)]
        public static Usuario IniciarSesion(string email, string password)
        {
            Usuario oUsuario = new Usuario();
            oUsuario = UsuarioService.UsuarioEmail(email, password);
            return oUsuario;
        }
    }
}