using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

using MiniCerveceria.Modelos;
using Oracle.ManagedDataAccess.Client;

namespace MiniCerveceria.Login
{
    public partial class Registrarse : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public static int ObtenerUsuarios()
        {
            int cantUsuarios = 0;
            try
            {
                Usuario oUsuario = new Usuario();
                OracleConfiguration.TnsAdmin = (ConfigurationManager.ConnectionStrings["Wallet"].ConnectionString);
                OracleConfiguration.WalletLocation = OracleConfiguration.TnsAdmin;

                using (OracleConnection con = new OracleConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString))
                {
                    string Query = "SELECT COUNT(*) FROM USUARIO";
                    //string ejemploQuery = "INSERT INTO <nombre_de_tabla> (columna1, columna2, columna3) VALUES (:valor1, :valor2, :valor3)";
                    using (OracleCommand command = new OracleCommand(Query, con))
                    {
                        con.Open();
                        using (OracleDataReader reader = command.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                cantUsuarios = reader.GetInt32(0);
                            }
                        }
                        con.Close();
                    }
                }
                return cantUsuarios + 1;
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error al Obtener Usuarios: " + ex.ToString().Trim());
                return cantUsuarios;
            }
        }
        [WebMethod]
        public void GuardarUsuario()
        {
            try
            {
                Usuario oUsuario = new Usuario();
                OracleConfiguration.TnsAdmin = (ConfigurationManager.ConnectionStrings["Wallet"].ConnectionString);
                OracleConfiguration.WalletLocation = OracleConfiguration.TnsAdmin;

                using (OracleConnection con = new OracleConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString))
                {
                    string Query = "INSERT INTO usuario (id_usuario, id_permiso, id_comuna, nombre, apellido, direccion, telefono, fecha_nacimiento, email, password, tipo_usuario, activo, en_linea, fecha_creacion) VALUES (:id_usuario, :id_permiso, :id_comuna, :nombre, :apellido, :direccion, :telefono, :fecha_nacimiento, :email, :password, :tipo_usuario, :activo, :en_linea, :fecha_creacion)";
                    //string ejemploQuery = "INSERT INTO <nombre_de_tabla> (columna1, columna2, columna3) VALUES (:valor1, :valor2, :valor3)";
                    using (OracleCommand command = new OracleCommand(Query, con))
                    {
                        con.Open();
                        int id_usuario = ObtenerUsuarios();
                        command.CommandType = System.Data.CommandType.Text;
                        
                        command.Parameters.Add(new OracleParameter("id_usuario", OracleDbType.Int32)).Value = id_usuario;
                        command.Parameters.Add(new OracleParameter("id_permiso", OracleDbType.Int32)).Value = 1;
                        command.Parameters.Add(new OracleParameter("id_comuna", OracleDbType.Int32)).Value = 1;
                        command.Parameters.Add(new OracleParameter("nombre", OracleDbType.Varchar2)).Value = txtNombre.Text.Trim();
                        command.Parameters.Add(new OracleParameter("apellido", OracleDbType.Varchar2)).Value = txtApellido.Text.Trim();
                        command.Parameters.Add(new OracleParameter("direccion", OracleDbType.Varchar2)).Value = txtDireccion.Text.Trim();
                        command.Parameters.Add(new OracleParameter("telefono", OracleDbType.Int32)).Value = Convert.ToInt32(txtTelefono.Text.Trim());
                        command.Parameters.Add(new OracleParameter("fecha_nacimiento", OracleDbType.Date)).Value = Convert.ToDateTime(txtFechaNacimiento.Text.Trim());
                        command.Parameters.Add(new OracleParameter("email", OracleDbType.Varchar2)).Value = txtEmail.Text.Trim();
                        command.Parameters.Add(new OracleParameter("password", OracleDbType.Varchar2)).Value = txtContrasena.Text.Trim();
                        command.Parameters.Add(new OracleParameter("tipo_usuario", OracleDbType.Int32)).Value = 1;
                        command.Parameters.Add(new OracleParameter("activo", OracleDbType.Int32)).Value = 1;
                        command.Parameters.Add(new OracleParameter("en_linea", OracleDbType.Int32)).Value = 1;
                        command.Parameters.Add(new OracleParameter("fecha_creacion", OracleDbType.Date)).Value = DateTime.Now;

                        // Ejecutar la instrucción INSERT
                        int rowsAffected = command.ExecuteNonQuery();

                        Console.WriteLine("Filas afectadas: " + rowsAffected);

                        con.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                //MessageBox.Show("Mano mio te me le caiste:c, tiro este error wom ----> " + ex);
            }
            //SELECT 'DROP TABLE 'table_name' CASCADE CONSTRAINTS;' FROM user_tables;DROP TABLE COMENTARIOCURSO CASCADE CONSTRAINTS;DROP TABLE COMENTARIOPRODUCTO CASCADE CONSTRAINTS;DROP TABLE COMUNA CASCADE CONSTRAINTS;DROP TABLE CURSO CASCADE CONSTRAINTS;DROP TABLE CURSOSINSCRITOS CASCADE CONSTRAINTS;DROP TABLE DETALLEPEDIDO CASCADE CONSTRAINTS;DROP TABLE FAVORITOS CASCADE CONSTRAINTS;DROP TABLE TIPOUSUARIO CASCADE CONSTRAINTS;DROP TABLE FOTOSCURSOS CASCADE CONSTRAINTS;DROP TABLE FOTOSPRODUCTOS CASCADE CONSTRAINTS;DROP TABLE NOVEDADES CASCADE CONSTRAINTS;DROP TABLE PEDIDO CASCADE CONSTRAINTS;DROP TABLE PERMISOSUSUARIO CASCADE CONSTRAINTS;DROP TABLE PRODUCTOS CASCADE CONSTRAINTS;DROP TABLE RECETAS CASCADE CONSTRAINTS;DROP TABLE REGION CASCADE CONSTRAINTS;DROP TABLE STOCK CASCADE CONSTRAINTS;DROP TABLE USUARIO CASCADE CONSTRAINTS;"
        }
    }
}