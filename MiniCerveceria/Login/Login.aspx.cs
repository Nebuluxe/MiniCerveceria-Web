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

        protected void IniciarSesion(object sender, EventArgs e)
        {
			try
			{
				string Email = txtEmail.Text;
				string pass = txtContrasena.Text;

				if (Email == "MasterAdmin" && pass == "masteradmin")
				{
					MasterAdmin admin = new MasterAdmin();
					admin.User = Email;
					admin.Pass = pass;

					Session["MasterAdminSesion"] = admin;

					Response.Redirect("~/Default.aspx", false);
				}

				Usuario oUsuario = new Usuario();
				oUsuario = UsuarioService.UsuarioEmail(Email, pass);

				if (oUsuario.email == null)
				{
					return;
				}

				Session["UsuarioSesion"] = oUsuario;

				Response.Redirect("~/Default.aspx", false);
			}
			catch (Exception)
			{
				throw;
			}
		}
    }
}