using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using MiniCerveceria.Modelos;
using System.Diagnostics;

namespace MiniCerveceria.Servicios.Implementacion
{
    public class UsuarioServicio : IUsuarioAplicacionServicios
    {
        static Controladores.Conexion db = new Controladores.Conexion();

        public UsuarioServicio(string conn)
        {
            db = new Controladores.Conexion(conn);
        }

        public void CrearUsuario(Usuario obj)
        {
            string query = string.Format(@"INSERT INTO usuario " +
                "(id_usuario, id_permiso, id_comuna, nombre, apellido, direccion, telefono, fecha_nacimiento, email, password, tipo_usuario, activo, en_linea, fecha_creacion) " +
                "VALUES ({0}, {1}, {2}, '{3}', '{4}', '{5}', {6}, TO_DATE('{7}', 'DD-MM-YYYY HH24:MI:SS'), '{8}', '{9}', {10}, {11}, {12}, TO_DATE('{13}', 'DD-MM-YYYY HH24:MI:SS'))", 
                obj.id_usuario, obj.id_permiso, obj.id_comuna, obj.nombre, obj.apellido, obj.direccion, obj.telefono, obj.fecha_creacion, obj.email, obj.password, obj.tipo_usuario, obj.activo, obj.en_linea, obj.fecha_creacion);
            DataTable dt = db.Execute(query);
        }
        public void EliminarUsuario(int UsuarioID)
        {
            string query = string.Format(@"DELETE FROM usuario WHERE id_usuario = {0}", UsuarioID);
            DataTable dt = db.Execute(query);
        }
        public IList<Usuario> ListarUsuarios()
        {
            string query = @"SELECT id_usuario, id_permiso, id_comuna, nombre, apellido, direccion, telefono, fecha_nacimiento, email, password, tipo_usuario, activo, en_linea, fecha_creacion FROM usuario";
            DataTable dt = db.Execute(query);

            IList<Usuario> lista = new List<Usuario>();
            if (dt.Rows.Count > 0)
            {
                lista = (from DataRow rw in dt.Rows
                         select new Usuario()
                         {
                             id_usuario = Convert.ToInt32(rw["id_usuario"]),
                             id_permiso = Convert.ToInt32(rw["id_permiso"]),
                             id_comuna = Convert.ToInt32(rw["id_comuna"]),
                             nombre = rw["nombre"].ToString(),
                             apellido = rw["apellido"].ToString(),
                             direccion = rw["direccion"].ToString(),
                             telefono = Convert.ToInt32(rw["telefono"]),
                             fecha_nacimiento = Convert.ToDateTime(rw["fecha_nacimiento"]),
                             email = rw["email"].ToString(),
                             password = rw["password"].ToString(),
                             tipo_usuario = Convert.ToInt32(rw["tipo_usuario"]),
                             activo = Convert.ToInt32(rw["activo"]),
                             en_linea = Convert.ToInt32(rw["en_linea"]),
                             fecha_creacion = Convert.ToDateTime(rw["fecha_nacimiento"])
                         }
                         ).ToList();
            }

            return lista;
        }
        public Usuario Usuario(int UsuarioID)
        {
            string query = @"SELECT id_usuario, id_permiso, id_comuna, nombre, apellido, direccion, telefono, fecha_nacimiento, email, password, tipo_usuario, activo, en_linea, fecha_creacion FROM usuario WHERE id_usuario = " + UsuarioID;
            DataTable dt = db.Execute(query);

            Usuario obj = new Usuario();
            if (dt.Rows.Count > 0)
            {
                obj = (from DataRow rw in dt.Rows
                       select new Usuario()
                       {
                           id_usuario = Convert.ToInt32(rw["id_usuario"]),
                           id_permiso = Convert.ToInt32(rw["id_permiso"]),
                           id_comuna = Convert.ToInt32(rw["id_comuna"]),
                           nombre = rw["nombre"].ToString(),
                           apellido = rw["apellido"].ToString(),
                           direccion = rw["direccion"].ToString(),
                           telefono = Convert.ToInt32(rw["telefono"]),
                           fecha_nacimiento = Convert.ToDateTime(rw["fecha_nacimiento"]),
                           email = rw["email"].ToString(),
                           password = rw["password"].ToString(),
                           tipo_usuario = Convert.ToInt32(rw["tipo_usuario"]),
                           activo = Convert.ToInt32(rw["activo"]),
                           en_linea = Convert.ToInt32(rw["en_linea"]),
                           fecha_creacion = Convert.ToDateTime(rw["fecha_nacimiento"])
                       }
                         ).FirstOrDefault();
            }

            return obj;
        }
        public Usuario UsuarioEmail(string email, string password)
        {
            string query = @"SELECT id_usuario, id_permiso, id_comuna, nombre, apellido, direccion, telefono, fecha_nacimiento, email, password, tipo_usuario, activo, en_linea, fecha_creacion FROM usuario WHERE email = '" + email + "' AND password = '" + password + "'";
            DataTable dt = db.Execute(query);
            Usuario obj = new Usuario();
            if (dt.Rows.Count > 0)
            {
                obj = (from DataRow rw in dt.Rows
                       select new Usuario()
                       {
                           id_usuario = Convert.ToInt32(rw["id_usuario"]),
                           id_permiso = Convert.ToInt32(rw["id_permiso"]),
                           id_comuna = Convert.ToInt32(rw["id_comuna"]),
                           nombre = rw["nombre"].ToString(),
                           apellido = rw["apellido"].ToString(),
                           direccion = rw["direccion"].ToString(),
                           telefono = Convert.ToInt32(rw["telefono"]),
                           fecha_nacimiento = Convert.ToDateTime(rw["fecha_nacimiento"]),
                           email = rw["email"].ToString(),
                           password = rw["password"].ToString(),
                           tipo_usuario = Convert.ToInt32(rw["tipo_usuario"]),
                           activo = Convert.ToInt32(rw["activo"]),
                           en_linea = Convert.ToInt32(rw["en_linea"]),
                           fecha_creacion = Convert.ToDateTime(rw["fecha_nacimiento"])
                       }
                         ).FirstOrDefault();
                return obj;
            }
            else
            {
                return obj;
            }
        }
        public void ActualizarUsuario(Usuario obj)
        {
            string query = string.Format(@"UPDATE usuario SET " +
                "id_permiso = {1}, id_comuna = {2}, nombre = {3}, apellido = {4}, direccion = {5}, telefono = {6}, fecha_nacimiento = {7}, email = {8}, "+
                "password = {9}, tipo_usuario = {10}, activo = {11}, en_linea = {12}, fecha_creacion = {13})" +
                "WHERE usuario_id = {0}",
                obj.id_usuario, obj.id_permiso, obj.id_comuna, obj.nombre, obj.apellido, obj.direccion, obj.telefono, obj.fecha_creacion, obj.email,
                obj.password, obj.tipo_usuario, obj.activo, obj.en_linea, obj.fecha_creacion);
            DataTable dt = db.Execute(query);
        }
        public int ObtenerIDUsuario()
        {
            string query = @"SELECT COUNT(*) AS idUsuario FROM usuario";
            DataTable dt = db.Execute(query);
            int idUsuario = Convert.ToInt32(dt.Rows[0]["idUsuario"]);
            return idUsuario + 1;
        }
    }
}