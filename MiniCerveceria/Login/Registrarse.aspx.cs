using MailKit.Security;
using Microsoft.Extensions.Configuration;
using MimeKit;
using MiniCerveceria.Controladores;
using MiniCerveceria.Modelos;
using MiniCerveceria.Servicios;
using MiniCerveceria.Servicios.Implementacion;
using System;
using System.Configuration;
using System.Linq;
using System.Web.Services;
using System.Windows.Forms;
using MailKit.Net.Smtp;

namespace MiniCerveceria.Login
{
    public partial class Registrarse : System.Web.UI.Page
    {
        static string conn = ConfigurationManager.ConnectionStrings["con"].ConnectionString; 
        static IUsuarioAplicacionServicios UsuarioService = new UsuarioServicio(conn);

		private static string smtp_host = Convert.ToString(ConfigurationManager.AppSettings["smtp_host"]);
		private static int smtp_port = Convert.ToInt32(ConfigurationManager.AppSettings["smtp_port"]);
		private static string correo_host = Convert.ToString(ConfigurationManager.AppSettings["correo_host"]);
		private static string password_host = Convert.ToString(ConfigurationManager.AppSettings["password_host"]);

		protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void GuardarUsuario(object sender, EventArgs e)
        {
            try
            {
                Usuario oUsuario = new Usuario();
                oUsuario.id_permiso = 0;
                oUsuario.id_comuna = 2;
                oUsuario.nombre = txtNombre.Text.Trim();
                oUsuario.apellido = txtApellido.Text.Trim();
                oUsuario.direccion = txtDireccion.Text.Trim();
                oUsuario.telefono = Convert.ToInt32(txtTelefono.Text.Trim());
                oUsuario.fecha_nacimiento = Convert.ToDateTime(txtFechaNacimiento.Text.Trim());
                oUsuario.email = txtEmail.Text.Trim();
                oUsuario.password = txtContrasena.Text.Trim();
                oUsuario.activo = 1;
                oUsuario.en_linea = 1;
                oUsuario.fecha_creacion = DateTime.Now;

                UsuarioService.CrearUsuario(oUsuario);

				Response.Redirect("/Login/Login.aspx", false);
            }
            catch (Exception)
            {
				Response.Redirect("/Login/Registrarse.aspx", false);
				throw;
            }
        }

		[WebMethod(EnableSession = true)]
		public bool ValidarCorreoIngresado(string email)
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
		public static string EnviarCorreo(string emailReceptor)
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
		public static string GenerateCodigo()
		{
			Random random = new Random();

			const string characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
			return new string(Enumerable.Repeat(characters, 8)
			  .Select(s => s[random.Next(s.Length)]).ToArray());
		}
	}
} 