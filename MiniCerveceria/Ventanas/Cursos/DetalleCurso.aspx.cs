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

namespace MiniCerveceria.Ventanas.Cursos
{
	public partial class DetalleCurso : System.Web.UI.Page
	{
		static string conn = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
		static ICursoAplicacionServicios cursoApp = new CursoServicio(conn);

		protected void Page_Load(object sender, EventArgs e)
		{
			try
			{
				string uid = Request.QueryString["uid"] != null ? Request.QueryString["uid"] : "";

				if (uid != "")
				{
					Curso oCurso = new Curso();

					oCurso = cursoApp.ObtenerCurso(Convert.ToInt32(uid));

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
	}
}