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
        public void CrearCursoInscrito(CursosInscritos obj)
        {
            string query = @"DECLARE " +
                                "v_id_cursos_inscritos NUMBER(10) := " + obj.id_cursos_inscritos + ";" +
                            "BEGIN" +
                                "IF (v_id_cursos_inscritos > 0) THEN" +
                                    "UPDATE cursosinscritos SET cursado = " + obj.cursado + "," +
                                                               "total = " + obj.total + "" +
                                    "WHERE id_cursos_inscritos = v_id_cursos_inscritos AND id_usuario = " + obj.id_usuario + " AND id_curso = " + obj.id_curso + ";" +
                                "ELSE " +
									"SELECT MAX(id_cursos_inscritos) + 1 INTO v_id_cursos_inscritos FROM cursosinscritos;" +
                                    "INSERT INTO cursosinscritos (id_cursos_inscritos," +
                                                                 "id_usuario," +
                                                                 "id_curso," +
                                                                 "fecha_inscripcion," +
                                                                 "cursado," +
                                                                 "total)" +
                                    "VALUES (v_id_cursos_inscritos, " + obj.id_usuario + ", " + obj.id_curso + ", CURRENT_DATE, " + obj.cursado + ", " + obj.total + ");" +
                                "END IF;" +
                            "END";
            db.Execute(query);
        }
        public IList<CursosInscritos> ObtenerCursosInscritosUsuario(int id_usuario)
        {
            string query = @"SELECT id_cursos_inscritos, " +
                                  "id_usuario, " +
                                  "id_curso, " +
                                  "fecha_inscripcion, " +
                                  "cursado, " +
                                  "total " +
                           "FROM cursosinscritos " +
                           "WHERE id_usuario = " + id_usuario;
            DataTable dt = db.Execute(query);

            IList<CursosInscritos> lista = new List<CursosInscritos>();
            if (dt.Rows.Count > 0)
            {
                lista = (from DataRow rw in dt.Rows
                         select new CursosInscritos()
                         {
                             id_cursos_inscritos = Convert.ToInt32(rw["id_cursos_inscritos"]),
                             id_usuario = Convert.ToInt32(rw["id_usuario"]),
                             id_curso = Convert.ToInt32(rw["id_curso"]),
                             fecha_inscripcion = Convert.ToDateTime(rw["fecha_inscripcion"]),
                             cursado = Convert.ToInt32(rw["cursado"]),
                             total = Convert.ToInt32(rw["total"]),
                         }
                        ).ToList();
                return lista;
            }
            else
            {
                return lista;
            }
        }
        public IList<CursosInscritos> ObtenerCursosInscritos()
        {
            string query = @"SELECT id_cursos_inscritos, " + 
                                   "id_usuario, " +
                                   "id_curso, " +
                                   "fecha_inscripcion, " +
                                   "cursado, " +
                                   "total " +
                            "FROM cursosinscritos";
            DataTable dt = db.Execute(query);

            IList<CursosInscritos> lista = new List<CursosInscritos>();
            if (dt.Rows.Count > 0)
            {
                lista = (from DataRow rw in dt.Rows
                         select new CursosInscritos()
                         {
                             id_cursos_inscritos = Convert.ToInt32(rw["id_cursos_inscritos"]),
                             id_usuario = Convert.ToInt32(rw["id_usuario"]),
                             id_curso = Convert.ToInt32(rw["id_curso"]),
                             fecha_inscripcion = Convert.ToDateTime(rw["fecha_inscripcion"]),
                             cursado = Convert.ToInt32(rw["cursado"]),
                             total = Convert.ToInt32(rw["total"]),
                         }
                        ).ToList();
                return lista;
            }
            else
            {
                return lista;
            }
        }
        public void EliminarCursosInscritos(int id_usuario)
        {
            string query = @"DELETE FROM cursosinscritos " +
                            "WHERE id_usuario = " + id_usuario;
            db.Execute(query);
        }
    }
}