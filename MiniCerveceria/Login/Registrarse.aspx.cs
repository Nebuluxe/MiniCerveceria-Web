using Microsoft.Extensions.Configuration;
using MiniCerveceria.Controladores;
using MiniCerveceria.Modelos;
using MiniCerveceria.Servicios;
using MiniCerveceria.Servicios.Implementacion;
using System;
using System.Configuration;
using System.Windows.Forms;
using static System.Net.Mime.MediaTypeNames;

namespace MiniCerveceria.Login
{
    public partial class Registrarse : System.Web.UI.Page
    {
        static string conn = ConfigurationManager.ConnectionStrings["con"].ConnectionString; 
        static IUsuarioAplicacionServicios UsuarioService = new UsuarioServicio(conn);
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void GuardarUsuario(object sender, EventArgs e)
        {
            try
            {
                Usuario oUsuario = new Usuario();
                oUsuario.id_permiso = 0;
                oUsuario.id_comuna = 1;
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
            catch (Exception ex)
            {
                MessageBox.Show("Ha sucedido un error :c .   Error =>   " + ex);
                throw ex;
            }
        }
    }
} 