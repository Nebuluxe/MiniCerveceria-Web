using MiniCerveceria.Modelos;
using MiniCerveceria.Servicios;
using Oracle.ManagedDataAccess.Client;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;
using System.Web;

namespace MiniCerveceria.Controladores
{
    public class UsuarioAplicacionServicios : IUsuarioAplicacionServicios
    {
        private string Wallet = ConfigurationManager.ConnectionStrings["Wallet"].ConnectionString;
        private string Conexion = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        OracleConnection con = null;
        OracleCommand cmd = null;
        OracleDataReader reader = null;
        
        public Usuario GetUsuario(string email, string contrasena)
        {
            Usuario oUsuario = new Usuario();
            try
            {
                OracleConfiguration.TnsAdmin = (Wallet);
                OracleConfiguration.WalletLocation = OracleConfiguration.TnsAdmin;
                using (con = new OracleConnection(Conexion))
                {
                    string Query = "SELECT * FROM usuario WHERE email = '" + email.Trim() + "' AND password = '" + contrasena.Trim() + "'";
                    using (cmd = new OracleCommand(Query, con))
                    {
                        cmd.CommandType = System.Data.CommandType.Text;
                        con.Open();
                        using (reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                oUsuario.id_usuario = reader.GetInt32(0);
                                oUsuario.id_permiso = reader.GetInt32(1);
                                oUsuario.id_comuna = reader.GetInt32(2);
                                oUsuario.nombre = reader.GetString(3);
                                oUsuario.apellido = reader.GetString(4);
                                oUsuario.direccion = reader.GetString(5);
                                oUsuario.fecha_nacimiento = Convert.ToString(reader.GetDateTime(6));
                                oUsuario.email = reader.GetString(7);
                                oUsuario.password = reader.GetString(8);
                                oUsuario.tipo_usuario = reader.GetInt32(9);
                                oUsuario.activo = reader.GetInt32(10);
                                oUsuario.en_linea = reader.GetInt32(11);
                                oUsuario.fecha_creacion = Convert.ToString(reader.GetDateTime(12));
                            }
                        }
                        con.Close();
                        if (oUsuario != null)
                        {
                            return oUsuario;
                        } else { 
                            return oUsuario = null; 
                        }
                        
                    }
                }
            }
            catch (Exception ex)
            {
                oUsuario = null;
                return oUsuario;
            }
        }

        public IEnumerable<Usuario> GetUsuarios()
        {
            IEnumerable<Usuario> listUsuario = new List<Usuario>();
            Usuario oUsuario = new Usuario();
            try
            {
                OracleConfiguration.TnsAdmin = (Wallet);
                OracleConfiguration.WalletLocation = OracleConfiguration.TnsAdmin;
                using (con = new OracleConnection(Conexion))
                {
                    string Query = "SELECT * FROM usuario";
                    using (cmd = new OracleCommand(Query, con))
                    {
                        cmd.CommandType = System.Data.CommandType.Text;
                        con.Open();
                        using (reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                oUsuario.id_usuario = reader.GetInt32(0);
                                oUsuario.id_permiso = reader.GetInt32(1);
                                oUsuario.id_comuna = reader.GetInt32(2);
                                oUsuario.nombre = reader.GetString(3);
                                oUsuario.apellido = reader.GetString(4);
                                oUsuario.direccion = reader.GetString(5);
                                oUsuario.fecha_nacimiento = Convert.ToString(reader.GetDateTime(6));
                                oUsuario.email = reader.GetString(7);
                                oUsuario.password = reader.GetString(8);
                                oUsuario.tipo_usuario = reader.GetInt32(9);
                                oUsuario.activo = reader.GetInt32(10);
                                oUsuario.en_linea = reader.GetInt32(11);
                                oUsuario.fecha_creacion = Convert.ToString(reader.GetDateTime(12));
                                listUsuario.Append(oUsuario);
                            }
                        }
                        con.Close();
                        return listUsuario;
                    }
                }
            }
            catch (Exception ex)
            {
                listUsuario = null;
                return listUsuario;
            }
        }

        public bool InsertUsuario(Usuario usuario)
        {
            try
            {
                OracleConfiguration.TnsAdmin = (Wallet);
                OracleConfiguration.WalletLocation = OracleConfiguration.TnsAdmin;
                using (con = new OracleConnection(Conexion))
                {
                    string Query = "INSERT INTO usuario (id_usuario, id_permiso, id_comuna, nombre, apellido, direccion, telefono, fecha_nacimiento, email, password, tipo_usuario, activo, en_linea, fecha_creacion) " +
                                   "VALUES (:id_usuario, :id_permiso, :id_comuna, :nombre, :apellido, :direccion, :telefono, :fecha_nacimiento, :email, :password, :tipo_usuario, :activo, :en_linea, :fecha_creacion)";
                    using (cmd = new OracleCommand(Query, con))
                    {
                        cmd.CommandType = System.Data.CommandType.Text;

                        cmd.Parameters.Add(new OracleParameter("id_usuario", OracleDbType.Int32)).Value = usuario.id_usuario;
                        cmd.Parameters.Add(new OracleParameter("id_permiso", OracleDbType.Int32)).Value = usuario.id_permiso;
                        cmd.Parameters.Add(new OracleParameter("id_comuna", OracleDbType.Int32)).Value = usuario.id_comuna;
                        cmd.Parameters.Add(new OracleParameter("nombre", OracleDbType.Varchar2)).Value = usuario.nombre;
                        cmd.Parameters.Add(new OracleParameter("apellido", OracleDbType.Varchar2)).Value = usuario.apellido;
                        cmd.Parameters.Add(new OracleParameter("direccion", OracleDbType.Varchar2)).Value = usuario.direccion;
                        cmd.Parameters.Add(new OracleParameter("telefono", OracleDbType.Int32)).Value = usuario.telefono;
                        cmd.Parameters.Add(new OracleParameter("fecha_nacimiento", OracleDbType.Date)).Value = usuario.fecha_nacimiento;
                        cmd.Parameters.Add(new OracleParameter("email", OracleDbType.Varchar2)).Value = usuario.email;
                        cmd.Parameters.Add(new OracleParameter("password", OracleDbType.Varchar2)).Value = usuario.password;
                        cmd.Parameters.Add(new OracleParameter("tipo_usuario", OracleDbType.Int32)).Value = usuario.tipo_usuario;
                        cmd.Parameters.Add(new OracleParameter("activo", OracleDbType.Int32)).Value = usuario.activo;
                        cmd.Parameters.Add(new OracleParameter("en_linea", OracleDbType.Int32)).Value = usuario.en_linea;
                        cmd.Parameters.Add(new OracleParameter("fecha_creacion", OracleDbType.Date)).Value = usuario.fecha_creacion;

                        con.Open();
                        
                        int filasAfectadas = cmd.ExecuteNonQuery();

                        con.Close();
                        return filasAfectadas > 0 ? (true) : (false);
                    }
                }
            }
            catch (Exception ex)
            {
                //MessageBox.Show("Mano mio te me le caiste:c, tiro este error wom ----> " + ex);
                return (false);
            }
        }
    }
}