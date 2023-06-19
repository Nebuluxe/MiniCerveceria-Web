using MiniCerveceria.Modelos;
using MiniCerveceria.Servicios;
using Oracle.ManagedDataAccess.Client;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.Odbc;
using System.Drawing;
using System.Linq;
using System.Linq.Expressions;
using System.Threading.Tasks;
using System.Web;
using System.Windows.Forms;
using static System.Windows.Forms.VisualStyles.VisualStyleElement.ListView;

namespace MiniCerveceria.Controladores
{
    public class UsuarioAplicacionServicios : IUsuarioAplicacionServicios
    {
        public OracleConnection SqlCon = new OracleConnection();
        public Usuario GetUsuario(string email, string contrasena)
        {
            Usuario oUsuario = new Usuario();
            OracleDataReader Resultado = null;
            try 
            {
                SqlCon = Conexion.getInstancia().CrearConexion();

                OracleCommand Comando = new OracleCommand("SELECT * FROM usuario WHERE email = '" + email.Trim() + "' AND password = '" + contrasena.Trim() + "'", SqlCon);
                Comando.CommandType = CommandType.Text;
                SqlCon.Open();
                using (Resultado = Comando.ExecuteReader())
                {
                    while (Resultado.Read())
                    {
                        oUsuario.id_usuario = Resultado.GetInt32(0);
                        oUsuario.id_permiso = Resultado.GetInt32(1);
                        oUsuario.id_comuna = Resultado.GetInt32(2);
                        oUsuario.nombre = Resultado.GetString(3);
                        oUsuario.apellido = Resultado.GetString(4);
                        oUsuario.direccion = Resultado.GetString(5);
                        oUsuario.fecha_nacimiento = Resultado.GetDateTime(6);
                        oUsuario.email = Resultado.GetString(7);
                        oUsuario.password = Resultado.GetString(8);
                        oUsuario.tipo_usuario = Resultado.GetInt32(9);
                        oUsuario.activo = Resultado.GetInt32(10);
                        oUsuario.en_linea = Resultado.GetInt32(11);
                        oUsuario.fecha_creacion = Resultado.GetDateTime(12);
                    }
                }
                if (oUsuario != null)
                {
                    return oUsuario;
                }
                else
                {
                    return oUsuario = null;
                }
            } 
            catch (Exception ex)
            {
                return oUsuario = null;
                throw ex;
            }
            finally
            {
                if (SqlCon.State == ConnectionState.Open)
                {
                    OracleConnection.ClearPool(SqlCon);
                    SqlCon.Dispose();
                    SqlCon.Close();
                }
            }
        }

        public int GetIdUsuario()
        {
            int idUsuario = 0;
            OracleDataReader Resultado = null;
            DataTable Tabla = new DataTable();
            try
            {
                SqlCon = Conexion.getInstancia().CrearConexion();

                OracleCommand Comando = new OracleCommand("SELECT COUNT(*) FROM usuario", SqlCon);
                Comando.CommandType = CommandType.Text;
                SqlCon.Open();
                using (Resultado = Comando.ExecuteReader())
                {
                    while (Resultado.Read())
                    {
                        idUsuario = Resultado.GetInt32(0);
                    }
                }
                if (idUsuario != 0)
                {
                    return idUsuario + 1;
                }
                else
                {
                    return idUsuario = 0;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                if (SqlCon.State == ConnectionState.Open)
                {
                    OracleConnection.ClearPool(SqlCon);
                    SqlCon.Dispose();
                    SqlCon.Close();
                }
            }
        }

        public void InsertUsuario(Usuario usuario)
        {
            OracleDataReader Resultado = null;
            DataTable Tabla = new DataTable();
            try
            {
                SqlCon = Conexion.getInstancia().CrearConexion();

                OracleCommand Comando = new OracleCommand("INSERT INTO usuario (id_usuario, id_permiso, id_comuna, nombre, apellido, direccion, telefono, fecha_nacimiento, email, password, tipo_usuario, activo, en_linea, fecha_creacion) " +
                                "VALUES (:id_usuario, :id_permiso, :id_comuna, :nombre, :apellido, :direccion, :telefono, :fecha_nacimiento, :email, :password, :tipo_usuario, :activo, :en_linea, :fecha_creacion)", SqlCon);
                Comando.CommandType = CommandType.Text;
                SqlCon.Open();
                using (Resultado = Comando.ExecuteReader())
                {
                    Comando.Parameters.Add(new OracleParameter("id_usuario", OracleDbType.Int32)).Value = usuario.id_usuario;
                    Comando.Parameters.Add(new OracleParameter("id_permiso", OracleDbType.Int32)).Value = usuario.id_permiso;
                    Comando.Parameters.Add(new OracleParameter("id_comuna", OracleDbType.Int32)).Value = usuario.id_comuna;
                    Comando.Parameters.Add(new OracleParameter("nombre", OracleDbType.Varchar2)).Value = usuario.nombre;
                    Comando.Parameters.Add(new OracleParameter("apellido", OracleDbType.Varchar2)).Value = usuario.apellido;
                    Comando.Parameters.Add(new OracleParameter("direccion", OracleDbType.Varchar2)).Value = usuario.direccion;
                    Comando.Parameters.Add(new OracleParameter("telefono", OracleDbType.Int32)).Value = usuario.telefono;
                    Comando.Parameters.Add(new OracleParameter("fecha_nacimiento", OracleDbType.Date)).Value = usuario.fecha_nacimiento;
                    Comando.Parameters.Add(new OracleParameter("email", OracleDbType.Varchar2)).Value = usuario.email;
                    Comando.Parameters.Add(new OracleParameter("password", OracleDbType.Varchar2)).Value = usuario.password;
                    Comando.Parameters.Add(new OracleParameter("tipo_usuario", OracleDbType.Int32)).Value = usuario.tipo_usuario;
                    Comando.Parameters.Add(new OracleParameter("activo", OracleDbType.Int32)).Value = usuario.activo;
                    Comando.Parameters.Add(new OracleParameter("en_linea", OracleDbType.Int32)).Value = usuario.en_linea;
                    Comando.Parameters.Add(new OracleParameter("fecha_creacion", OracleDbType.Date)).Value = usuario.fecha_creacion;

                    Comando.ExecuteNonQuery();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                if (SqlCon.State == ConnectionState.Open)
                {
                    OracleConnection.ClearPool(SqlCon);
                    SqlCon.Dispose();
                    SqlCon.Close();
                }
            }
        }
    }
}