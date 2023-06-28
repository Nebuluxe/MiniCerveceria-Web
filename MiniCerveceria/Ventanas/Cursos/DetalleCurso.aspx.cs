using MiniCerveceria.Servicios.Implementacion;
using MiniCerveceria.Servicios;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MiniCerveceria.Modelos;
using System.Web.Services;
using MiniCerveceria.Mantenedores.Cursos;
using Oracle.ManagedDataAccess.Types;
using MiniCerveceria.Servicios.Modelos;

namespace MiniCerveceria.Ventanas.Cursos
{
	public partial class DetalleCurso : System.Web.UI.Page
	{
		static string conn = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
		static ICursoAplicacionServicios cursoApp = new CursoServicio(conn);
		static ICursosInscritosAplicacionServicios inscripcionCursoApp = new CursosInscritosServicio(conn);

		public int id_curso = 0;

		protected void Page_Load(object sender, EventArgs e)
		{
			try
			{
				string uid = Request.QueryString["uid"] != null ? Request.QueryString["uid"] : "";

				if (uid != "")
				{
					Curso oCurso = new Curso();

					oCurso = cursoApp.ObtenerCurso(Convert.ToInt32(uid));
					id_curso = oCurso.id_curso;
					lblDescripcionCurso.Text = oCurso.descripcion;
					lblPrecioCurso.Text = oCurso.precio.ToString();
					lblFechaPublicacion.Text = oCurso.fecha_creacion.ToString("dd-MM-yyyy");
					ImagenCurso.ImageUrl = oCurso.URL_img;
					lblNombreCurso.Text = oCurso.nombre_curso;
				}
				else
				{
					Response.Redirect("/Ventanas/Cursos/Cursos.aspx", false);
				}

			}
			catch (Exception)
			{
				throw;
			}
		}

		[WebMethod(EnableSession = true)]
		public static int Inscribirse(string id_curso)
		{
			try
			{
				//0 debe iniciar sesion, 1 inscrito, 2 curso ya inscrito

				Usuario oUsuario = (Usuario)(HttpContext.Current.Session["UsuarioSesion"]);

				if (oUsuario == null)
				{
					return 0;
				}

				Curso oCurso = cursoApp.ObtenerCurso(Convert.ToInt32(id_curso));

				InscripcionCurso oInscripcion = new InscripcionCurso();
				oInscripcion.id_usuario = oUsuario.id_usuario;
				oInscripcion.id_curso = oCurso.id_curso;
				oInscripcion.total = oCurso.precio;

				bool valid = inscripcionCursoApp.CrearCursoInscrito(oInscripcion);

				if (!valid)
				{
					return 2;
				}

				return 1;
			}
			catch (Exception)
			{
				throw;
			}
		}
	}
}