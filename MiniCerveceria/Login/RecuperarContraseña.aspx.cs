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
	public partial class RecuperarContraseña : System.Web.UI.Page
	{
		static string conn = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
		static IUsuarioAplicacionServicios UsuarioService = new UsuarioServicio(conn);

		protected void Page_Load(object sender, EventArgs e)
		{

		}


		[WebMethod(EnableSession = true)]
		public static string EnviarCorreo(string emailReceptor)
		{
			try
			{
				string codigo = GenerateCodigo();

				// Configurar las credenciales y el servidor SMTP
				string email = "Minicerveceriaweb@gmail.com";
				string password = "oazzalvwemmkrjlb";
				string smtpServer = "smtp.gmail.com";
				int smtpPort = 465; // Puerto seguro SSL/TLS para Gmail

				// Crear el mensaje de correo
				var message = new MimeMessage();
				message.From.Add(new MailboxAddress("MiniCerveceria-Web", email));
				message.To.Add(new MailboxAddress(emailReceptor, emailReceptor));
				message.Subject = "Codigo de recuperacion contraseña";
				message.Body = new TextPart("plain")
				{
					Text = "Hola aqui tienes el codigo de recuperacion de tu cuenta en minicervecerai," +
						   "CODIGO: " + codigo
				};

				// Enviar el correo
				using (var client = new SmtpClient())
				{
					client.Connect(smtpServer, smtpPort, SecureSocketOptions.SslOnConnect);
					client.Authenticate(email, password);
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
		public static string GenerateCodigo()
		{
			Random random = new Random();

			const string characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
			return new string(Enumerable.Repeat(characters, 8)
			  .Select(s => s[random.Next(s.Length)]).ToArray());
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

	}


}