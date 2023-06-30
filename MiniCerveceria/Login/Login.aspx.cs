using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using MailKit.Net.Smtp;
using MailKit.Security;
using MimeKit;
using MiniCerveceria.Modelos;
using MiniCerveceria.Servicios.Implementacion;
using MiniCerveceria.Servicios;

namespace MiniCerveceria.Login
{
    public partial class Login : System.Web.UI.Page
	{
		private static string smtp_host = Convert.ToString(ConfigurationManager.AppSettings["smtp_host"]);
		private static int smtp_port = Convert.ToInt32(ConfigurationManager.AppSettings["smtp_port"]);
		private static string correo_host = Convert.ToString(ConfigurationManager.AppSettings["correo_host"]);
		private static string password_host = Convert.ToString(ConfigurationManager.AppSettings["password_host"]);

		static string conn = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
		static IUsuarioAplicacionServicios UsuarioService = new UsuarioServicio(conn);

		protected void Page_Load(object sender, EventArgs e)
        {
            
        }

		protected void GenerarUsuariosesion(MasterAdmin admin, Usuario oUsuario)
		{
			try {
				if (admin != null)
				{
					Session["MasterAdmin"] = oUsuario;
					Response.Redirect("~/Default.aspx", false);
					return;
				}
				else
				{
					Session["UsuarioSesion"] = oUsuario;
					Response.Redirect("~/Default.aspx", false);

				}
			} catch (Exception) {
				throw;
			}
		}

		protected void IniciarSesion(object sender, EventArgs e)
        {
			try
			{
				MasterAdmin admin = new MasterAdmin();
				Usuario oUsuario = new Usuario();

				string Email = txtEmailLogin.Text;
				string pass = txtContrasenaLogin.Text;

				if (Email == "MasterAdmin" && pass == "masteradmin")
				{
					
					admin.User = Email;
					admin.Pass = pass;

					GenerarUsuariosesion(admin, null);
				}

				
				oUsuario = UsuarioService.UsuarioEmail(Email, pass);

				if (oUsuario.email == null)
				{
					return;
				}

				GenerarUsuariosesion(null, oUsuario);
			}
			catch (Exception)
			{
				throw;
			}
		}

		[WebMethod(EnableSession = true)]
		public static bool GuardarUsuario(string nombre,string apellido, string direccion, string telefono, string fehcaNacimineto, string email, string pass)
		{
			try
			{
				Usuario oUsuario = new Usuario();
				oUsuario.id_permiso = 0;
				oUsuario.id_comuna = 2;
				oUsuario.nombre = nombre.Trim();
				oUsuario.apellido = apellido.Trim();
				oUsuario.direccion = direccion.Trim();
				oUsuario.telefono = Convert.ToInt32(telefono.Trim());
				oUsuario.fecha_nacimiento = Convert.ToDateTime(fehcaNacimineto.Trim());
				oUsuario.email = email.Trim();
				oUsuario.password = pass.Trim();
				oUsuario.activo = 1;
				oUsuario.en_linea = 1;
				oUsuario.fecha_creacion = DateTime.Now;

				UsuarioService.CrearUsuario(oUsuario);

				return true;
			}
			catch (Exception)
			{
				return false;
				throw;
			}
		}

		[WebMethod(EnableSession = true)]
		public static bool ValidarCorreoIngresado(string email)
		{
			try
			{
				bool existe = UsuarioService.ValidaCorreoExistente(email);

				return existe;
			}
			catch (Exception)
			{
				throw;
			}
		}

		[WebMethod(EnableSession = true)]
		public static string EnviarCorreoVerificacion(string emailReceptor)
		{
			try
			{
				string codigo = GenerateCodigo();

				// Crear el mensaje de correo
				var message = new MimeMessage();
				message.From.Add(new MailboxAddress("MiniCerveceria-Web", correo_host));
				message.To.Add(new MailboxAddress(emailReceptor, emailReceptor));
				message.Subject = "Codigo de recuperacion contraseña";
				message.Body = new TextPart("plain")
				{
					Text = "Hola aqui tienes el codigo de verificacion de tu cuenta de MiniCerveceria," +
						   "CODIGO: " + codigo
				};

				// Enviar el correo
				using (var client = new SmtpClient())
				{
					client.Connect(smtp_host, smtp_port, SecureSocketOptions.SslOnConnect);
					client.Authenticate(correo_host, password_host);
					client.Send(message);
					client.Disconnect(true);
				}

				return codigo;
			}
			catch (Exception)
			{
				return "";
				throw;
			}
		}

		[WebMethod(EnableSession = true)]
		public static string EnviarCorreoRecuperacion(string emailReceptor)
		{
			try
			{
				string codigo = GenerateCodigo();

				// Crear el mensaje de correo
				var message = new MimeMessage();
				message.From.Add(new MailboxAddress("MiniCerveceria-Web", correo_host));
				message.To.Add(new MailboxAddress(emailReceptor, emailReceptor));
				message.Subject = "Codigo de recuperacion contraseña";
				message.Body = new TextPart("plain")
				{
					Text = "Hola aqui tienes el codigo de recuperacion de tu cuenta en MiniCerveceria," +
						   "CODIGO: " + codigo
				};

				// Enviar el correo
				using (var client = new SmtpClient())
				{
					client.Connect(smtp_host, smtp_port, SecureSocketOptions.SslOnConnect);
					client.Authenticate(correo_host, password_host);
					client.Send(message);
					client.Disconnect(true);
				}

				return codigo;
			}
			catch (Exception)
			{

				throw;
			}
		}

		[WebMethod(EnableSession = true)]
		public static bool CambiarContraseña(string email, string pass)
		{
			try
			{
				bool cambio = UsuarioService.CambiarContraseña(email, pass);

				return cambio;
			}
			catch (Exception)
			{

				throw;
			}
		}

		public static string GenerateCodigo()
		{
			Random random = new Random();

			const string characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
			return new string(Enumerable.Repeat(characters, 8)
			  .Select(s => s[random.Next(s.Length)]).ToArray());
		}
	}
}