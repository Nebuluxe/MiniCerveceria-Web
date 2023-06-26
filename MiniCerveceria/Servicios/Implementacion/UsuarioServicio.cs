using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using MiniCerveceria.Modelos;
using System.Diagnostics;
using static System.Windows.Forms.VisualStyles.VisualStyleElement.ListView;

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
				ObtenerIDUsuario(), obj.id_permiso, obj.id_comuna, obj.nombre, obj.apellido, obj.direccion, obj.telefono, obj.fecha_creacion, obj.email, obj.password, obj.tipo_usuario, obj.activo, obj.en_linea, obj.fecha_creacion);
            DataTable dt = db.Execute(query);
        }
        public void InHabiliatarCuentaUsuario(int UsuarioID)
        {
            string query = string.Format(@"UPDATE usuario set activo = 0 WHERE id_usuario = {0}", UsuarioID);
            DataTable dt = db.Execute(query);
        }

		public void HabiliatarCuentaUsuario(int UsuarioID)
		{
			string query = string.Format(@"UPDATE usuario set activo = 1 WHERE id_usuario = {0}", UsuarioID);
			DataTable dt = db.Execute(query);
		}

		public void AsignarPermiso(int UsuarioID, int id_permiso)
		{
			string query = string.Format(@"UPDATE usuario set id_permiso = {1} WHERE id_usuario = {0}", UsuarioID, id_permiso);
			DataTable dt = db.Execute(query);
		}

		public void QuitarPermiso(int UsuarioID)
		{
			string query = string.Format(@"UPDATE usuario set id_permiso = 0 WHERE id_usuario = {0}", UsuarioID);
			DataTable dt = db.Execute(query);
		}

		public IList<Usuario> ListarUsuarios()
        {
            string query = @"SELECT tbl1.id_usuario, tbl1.id_permiso, tbl1.id_comuna, tbl1.nombre, tbl1.apellido, tbl1.direccion, tbl1.telefono, tbl1.fecha_nacimiento, tbl1.email, tbl1.password, tbl1.tipo_usuario, tbl1.activo, tbl1.en_linea, tbl1.fecha_creacion, tbl2.nombre as nombre_permiso FROM usuario tbl1 LEFT JOIN permisosusuario tbl2 on tbl1.id_permiso = tbl2.id_permiso";
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
                             fecha_creacion = Convert.ToDateTime(rw["fecha_nacimiento"]),
                             nombre_permiso = String.IsNullOrEmpty(rw["nombre_permiso"].ToString())? "--" : rw["nombre_permiso"].ToString()
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

        public void CrearPermiso(PermisosUsusario obj)
        {
			string query = @"INSERT INTO permisosusuario (id_permiso, " +
									   "nombre, " +
									   "editar, " +
									   "eliminar, " +
									   "ver, " +
									   "crear) " +
				"VALUES (" + ObtenerIDPermiso() + ", '" + obj.nombre + "', " + (obj.editar?1:0) + ", " + (obj.eliminar?1:0) + ", " + (obj.ver?1:0) + ", " + (obj.crear?1:0) + ")";
			db.Execute(query);
		}

        public void ModificarPermiso(PermisosUsusario obj)
        {
			string query = string.Format(@"UPDATE permisosusuario SET " +
								"nombre = '{1}', editar = {2}, eliminar = {3}, ver = {4}, crear = {5} WHERE id_permiso = {0}",
	                            obj.id_permiso, obj.nombre, (obj.editar ? 1 : 0), (obj.eliminar ? 1 : 0), (obj.ver ? 1 : 0), (obj.crear ? 1 : 0));
			DataTable dt = db.Execute(query);
		}

        public void EliminarPermiso(int id_permiso)
        {
			string query = string.Format(@"DELETE FROM permisosusuario WHERE id_permiso = {0}", id_permiso);
			DataTable dt = db.Execute(query);
		}
		public IList<PermisosUsusario> ListarPermisos()
        {
			string query = @"SELECT id_permiso, nombre, editar, eliminar, ver, crear FROM permisosusuario";
			DataTable dt = db.Execute(query);
			IList<PermisosUsusario> obj = new List<PermisosUsusario>();
			if (dt.Rows.Count > 0)
			{
				obj = (from DataRow rw in dt.Rows
					   select new PermisosUsusario()
					   {
						   id_permiso = Convert.ToInt32(rw["id_permiso"]),
						   nombre = rw["nombre"].ToString(),
						   editar = Convert.ToInt32(rw["editar"]) == 1 ? true : false,
						   eliminar = Convert.ToInt32(rw["eliminar"]) == 1 ? true : false,
						   ver = Convert.ToInt32(rw["ver"]) == 1 ? true : false,
						   crear = Convert.ToInt32(rw["crear"]) == 1 ? true : false,
					   }
						 ).ToList();
				return obj;
			}
			else
			{
				return obj;
			}
		}

		public PermisosUsusario ObtenerPermiso(int id_permiso)
		{
			string query = @"SELECT id_permiso, nombre, editar, eliminar, ver, crear FROM permisosusuario WHERE id_permiso = " + id_permiso;
			DataTable dt = db.Execute(query);
			PermisosUsusario obj = new PermisosUsusario();
			if (dt.Rows.Count > 0)
			{
				obj = (from DataRow rw in dt.Rows
					   select new PermisosUsusario()
					   {
						   id_permiso = Convert.ToInt32(rw["id_permiso"]),
						   nombre = rw["nombre"].ToString(),
						   editar = Convert.ToInt32(rw["editar"]) == 1 ? true : false,
						   eliminar = Convert.ToInt32(rw["eliminar"]) == 1 ? true : false,
						   ver = Convert.ToInt32(rw["ver"]) == 1 ? true : false,
						   crear = Convert.ToInt32(rw["crear"]) == 1 ? true : false,
					   }
						 ).FirstOrDefault();
				return obj;
			}
			else
			{
				return obj;
			}
		}

		private int ObtenerIDUsuario()
        {
            string query = @"SELECT MAX( id_usuario ) AS idUsuario FROM usuario";
            DataTable dt = db.Execute(query);
            int idUsuario = Convert.ToInt32(dt.Rows[0]["idUsuario"]);
            return idUsuario + 1;
        }

		private int ObtenerIDPermiso()
		{
			string query = @"SELECT MAX(id_permiso) AS idPermiso FROM permisosusuario";
			DataTable dt = db.Execute(query);
			int idUsuario = Convert.ToInt32(dt.Rows[0]["idPermiso"]);
			return idUsuario + 1;
		}
	}
}