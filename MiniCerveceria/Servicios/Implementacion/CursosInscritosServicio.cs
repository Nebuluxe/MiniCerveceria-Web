using MiniCerveceria.Modelos;
using MiniCerveceria.Servicios.Modelos;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace MiniCerveceria.Servicios.Implementacion
{
    public class CursosInscritosServicio : ICursosInscritosAplicacionServicios
    {
        static Controladores.Conexion db = new Controladores.Conexion();

        public CursosInscritosServicio(string conn)
        {
            db = new Controladores.Conexion(conn);
        }
        public bool CrearCursoInscrito(InscripcionCurso obj)
        {
            bool valid = ValidaCursoInscrito(obj.id_usuario, obj.id_curso);

            if (valid)
            {
                return false;
            }

            string query = "INSERT INTO cursosinscritos (id_cursos_inscritos," +
                                                                 "id_usuario," +
                                                                 "id_curso," +
                                                                 "fecha_inscripcion," +
                                                                 "cursado," +
                                                                 "total)" +
                            " VALUES (" + ObtenerIDInscripcion() + ", " + obj.id_usuario + ", " + obj.id_curso + ", CURRENT_DATE, 0, " + obj.total + ")";
			db.Execute(query);

            return true;
        }

		public int ObtenerIDInscripcion()
		{
			try
			{
				string query = @"SELECT MAX(id_cursos_inscritos) AS idInscripcion FROM cursosinscritos";
				DataTable dt = db.Execute(query);
				int id_curso = Convert.ToInt32(dt.Rows[0]["idInscripcion"]);
				return id_curso + 1;

			}
			catch (Exception)
			{
				return 1;
				throw;
			}
		}

		public IList<InscripcionCurso> ObtenerCursosInscritosUsuario(int id_usuario)
        {
            string query = @"SELECT tbl1.id_cursos_inscritos, tbl1.id_usuario,tbl1.id_curso, tbl1.fecha_inscripcion,  tbl1.cursado, tbl1.total, tbl2.nombre_curso, tbl3.nombre, tbl3.apellido, tbl3.email FROM cursosinscritos tbl1 JOIN curso tbl2 ON tbl1.id_curso = tbl2.id_curso JOIN usuario tbl3 ON tbl1.id_usuario = tbl3.id_usuario WHERE  tbl1.id_usuario = " + id_usuario;
            DataTable dt = db.Execute(query);

            IList<InscripcionCurso> lista = new List<InscripcionCurso>();
            if (dt.Rows.Count > 0)
            {
                lista = (from DataRow rw in dt.Rows
                         select new InscripcionCurso()
                         {
							 id_Inscripcion = Convert.ToInt32(rw["id_cursos_inscritos"]),
                             id_usuario = Convert.ToInt32(rw["id_usuario"]),
                             id_curso = Convert.ToInt32(rw["id_curso"]),
                             fecha_inscripcion = Convert.ToDateTime(rw["fecha_inscripcion"]).ToString("dd-MM-yyyy"),
                             cursado = Convert.ToInt32(rw["cursado"]) == 1 ? true : false,
                             total = Convert.ToInt32(rw["total"]),
							 nombre_curso = rw["nombre_curso"].ToString(),
							 nombre = rw["nombre"].ToString(),
							 apellido = rw["apellido"].ToString(),
                             email = rw["email"].ToString()
						 }
                        ).ToList();
                return lista;
            }
            else
            {
                return lista;
            }
        }
		private bool ValidaCursoInscrito(int id_usuario, int id_curso)
		{
			string query = @"SELECT id_usuario FROM cursosinscritos WHERE id_usuario = " + id_usuario + " AND id_curso = " + id_curso;
			DataTable dt = db.Execute(query);

			if (dt.Rows.Count > 0)
			{
                return true;
			}
            else
            {
                return false;
            }
		}
		public IList<InscripcionCurso> ObtenerCursosInscritos(int id_curso, string cursado)
        {
            string validacion = "";

            if (cursado != "")
            {
                bool est = Convert.ToBoolean(cursado);

                if (est)
                {
					validacion += " WHERE tbl1.cursado = 1";
				}
                else
                {
					validacion += " WHERE tbl1.cursado = 0";
				}

                
			}

            if (id_curso != 0)
            {
                if (cursado != "")
                {
					validacion += " AND tbl1.id_curso = " + id_curso;
				}
                else
                {
					validacion += " WHERE tbl1.id_curso = " + id_curso;
				}

				
			}

            string query = @"SELECT tbl1.id_cursos_inscritos, tbl1.id_usuario,tbl1.id_curso, tbl1.fecha_inscripcion,  tbl1.cursado, tbl1.total, tbl2.nombre_curso, tbl3.nombre, tbl3.apellido, tbl3.email FROM cursosinscritos tbl1 JOIN curso tbl2 ON tbl1.id_curso = tbl2.id_curso JOIN usuario tbl3 ON tbl1.id_usuario = tbl3.id_usuario " + validacion;
            DataTable dt = db.Execute(query);

            IList<InscripcionCurso> lista = new List<InscripcionCurso>();
            if (dt.Rows.Count > 0)
            {
                lista = (from DataRow rw in dt.Rows
                         select new InscripcionCurso()
                         {
							 id_Inscripcion = Convert.ToInt32(rw["id_cursos_inscritos"]),
                             id_usuario = Convert.ToInt32(rw["id_usuario"]),
                             id_curso = Convert.ToInt32(rw["id_curso"]),
							 fecha_inscripcion = Convert.ToDateTime(rw["fecha_inscripcion"]).ToString("dd-MM-yyyy"),
							 cursado = Convert.ToInt32(rw["cursado"]) == 1? true:false,
                             total = Convert.ToInt32(rw["total"]),
							 nombre_curso = rw["nombre_curso"].ToString(),
                             nombre = rw["nombre"].ToString(),
							 apellido = rw["apellido"].ToString(),
							 email = rw["email"].ToString()
						 }
                        ).ToList();
                return lista;
            }
            else
            {
                return lista;
            }
        }

        public void CambioEstado(int id_inscripcion, bool estago)
        {
            int est = 0;

            if (estago)
            {
                est = 1;

			}

			string query = @"UPDATE cursosinscritos SET cursado = " + est + " WHERE id_cursos_inscritos = " + id_inscripcion;
		    db.Execute(query);
		}

        public void EliminarCursoInscrito(int id_usuario, int id_inscripcion)
        {
            string query = @"DELETE FROM cursosinscritos " +
                            "WHERE id_usuario = " + id_usuario + " AND id_cursos_inscritos = " + id_inscripcion;
            db.Execute(query);
        }
    }
}