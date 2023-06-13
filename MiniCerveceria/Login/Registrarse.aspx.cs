using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using dom=System.Web.UI.WebControls;
using MiniCerveceria.Controladores;
using MiniCerveceria.Modelos;
using MiniCerveceria.Servicios;
using Oracle.ManagedDataAccess.Client;

namespace MiniCerveceria.Login
{
    public partial class Registrarse : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public static int ObtenerIdUsuario()
        {
            int cantidadUsuarios = 0;
            try
            {
                IUsuarioAplicacionServicios usuarioApp = new UsuarioAplicacionServicios();
                IEnumerable<Usuario> listUsuarios = usuarioApp.GetUsuarios();
                return cantidadUsuarios = listUsuarios.Count() + 1;
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error al Obtener Usuarios: " + ex.ToString().Trim());
                return cantidadUsuarios = 0;
            }
        }
        public static bool GuardarUsuario()
        {
            try
            {
                IUsuarioAplicacionServicios usuarioApp = new UsuarioAplicacionServicios();
                Usuario oUsuario = new Usuario();
                oUsuario.id_usuario = ObtenerIdUsuario();
                oUsuario.id_comuna = 1;
                //oUsuario.nombre = txtNombre.Text.Trim();
                //oUsuario.apellido = 1;
                //oUsuario.direccion = 1;
                //oUsuario.fecha_nacimiento = 1;
                //oUsuario.email = 1;
                //oUsuario.password = 1;
                oUsuario.tipo_usuario = 1;
                oUsuario.activo = 1;
                oUsuario.en_linea = 1;
                oUsuario.fecha_creacion = Convert.ToString(DateTime.Now);
                //        oUsuario.id_usuario = reader.GetInt32(0);
                //oUsuario.id_permiso = reader.GetInt32(1);
                //oUsuario.id_comuna = reader.GetInt32(2);
                //oUsuario.nombre = reader.GetString(3);
                //oUsuario.apellido = reader.GetString(4);
                //oUsuario.direccion = reader.GetString(5);
                //oUsuario.fecha_nacimiento = Convert.ToString(reader.GetDateTime(6));
                //oUsuario.email = reader.GetString(7);
                //oUsuario.password = reader.GetString(8);
                //oUsuario.tipo_usuario = reader.GetInt32(9);
                //oUsuario.activo = reader.GetInt32(10);
                //oUsuario.en_linea = reader.GetInt32(11);
                //oUsuario.fecha_creacion = Convert.ToString(reader.GetDateTime(12));
                //command.Parameters.Add(new OracleParameter("id_usuario", OracleDbType.Int32)).Value = id_usuario;
                //command.Parameters.Add(new OracleParameter("id_permiso", OracleDbType.Int32)).Value = 1;
                //command.Parameters.Add(new OracleParameter("id_comuna", OracleDbType.Int32)).Value = 1;
                //command.Parameters.Add(new OracleParameter("nombre", OracleDbType.Varchar2)).Value = txtNombre.Text.Trim();
                //command.Parameters.Add(new OracleParameter("apellido", OracleDbType.Varchar2)).Value = txtApellido.Text.Trim();
                //command.Parameters.Add(new OracleParameter("direccion", OracleDbType.Varchar2)).Value = txtDireccion.Text.Trim();
                //command.Parameters.Add(new OracleParameter("telefono", OracleDbType.Int32)).Value = Convert.ToInt32(txtTelefono.Text.Trim());
                //command.Parameters.Add(new OracleParameter("fecha_nacimiento", OracleDbType.Date)).Value = Convert.ToDateTime(txtFechaNacimiento.Text.Trim());
                //command.Parameters.Add(new OracleParameter("email", OracleDbType.Varchar2)).Value = txtEmail.Text.Trim();
                //command.Parameters.Add(new OracleParameter("password", OracleDbType.Varchar2)).Value = txtContrasena.Text.Trim();
                //command.Parameters.Add(new OracleParameter("tipo_usuario", OracleDbType.Int32)).Value = 1;
                //command.Parameters.Add(new OracleParameter("activo", OracleDbType.Int32)).Value = 1;
                //command.Parameters.Add(new OracleParameter("en_linea", OracleDbType.Int32)).Value = 1;
                //command.Parameters.Add(new OracleParameter("fecha_creacion", OracleDbType.Date)).Value = DateTime.Now;
                bool respuesta = usuarioApp.InsertUsuario(oUsuario);
                return respuesta;
            }
            catch (Exception ex)
            {
                bool respuesta = false;
                return respuesta;
                //MessageBox.Show("Mano mio te me le caiste:c, tiro este error wom ----> " + ex);
            }
        }
    }
}