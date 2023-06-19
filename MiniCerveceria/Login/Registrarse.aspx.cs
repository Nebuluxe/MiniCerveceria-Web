using MiniCerveceria.Controladores;
using MiniCerveceria.Modelos;
using MiniCerveceria.Servicios;
using System;
using System.Windows.Forms;
using static System.Net.Mime.MediaTypeNames;

namespace MiniCerveceria.Login
{
    public partial class Registrarse : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public static int ObtenerIdUsuario()
        {
            try
            {
                IUsuarioAplicacionServicios usuarioApp = new UsuarioAplicacionServicios();
                int idUsuario = usuarioApp.GetIdUsuario();
                return idUsuario + 1;
            }
            catch (Exception ex)
            {
                MessageBox.Show("Ha sucedido un error :c .   Error =>   " + ex);
                throw ex;
            }
        }
        protected void GuardarUsuario(object sender, EventArgs e)
        {
            try
            {
                IUsuarioAplicacionServicios usuarioApp = new UsuarioAplicacionServicios();
                Usuario oUsuario = new Usuario();
                oUsuario.id_usuario = ObtenerIdUsuario();
                oUsuario.id_comuna = 1;
                oUsuario.nombre = txtNombre.Text.Trim();
                oUsuario.apellido = txtApellido.Text.Trim();
                oUsuario.direccion = txtDireccion.Text.Trim();
                oUsuario.telefono = Convert.ToInt32(txtTelefono.Text.Trim());
                oUsuario.fecha_nacimiento = Convert.ToDateTime(txtFechaNacimiento.Text.Trim());
                oUsuario.email = txtEmail.Text.Trim();
                oUsuario.password = txtContrasena.Text.Trim();
                oUsuario.tipo_usuario = 1;
                oUsuario.activo = 1;
                oUsuario.en_linea = 1;
                oUsuario.fecha_creacion = DateTime.Now;

                usuarioApp.InsertUsuario(oUsuario);
                MessageBox.Show("Te haz registrado correctamente " + oUsuario.nombre.Trim() + "!");
            }
            catch (Exception ex)
            {
                MessageBox.Show("Ha sucedido un error :c .   Error =>   " + ex);
                throw ex;
            }
        }
    }
} 