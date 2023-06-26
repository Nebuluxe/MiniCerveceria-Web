using MiniCerveceria.Modelos;
using MiniCerveceria.Servicios.Implementacion;
using MiniCerveceria.Servicios;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MiniCerveceria.Mantenedores.Cursos
{
    public partial class VerCurso : System.Web.UI.Page
    {
		static string conn = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
		static ICursoAplicacionServicios cursoApp = new CursoServicio(conn);
		static IUsuarioAplicacionServicios usuarioApp = new UsuarioServicio(conn);

		protected void Page_Load(object sender, EventArgs e)
		{
			try
			{
				if (!IsPostBack)
				{
					MasterAdmin MasterAdmin = (MasterAdmin)(Session["MasterAdminSesion"]);
					Usuario oUsuario = (Usuario)(Session["UsuarioSesion"]);
					string uid = Request.QueryString["uid"] != null ? Request.QueryString["uid"] : "";

					if (MasterAdmin == null)
					{
						if (oUsuario == null)
						{
							Response.Redirect("~/Default.aspx", false);
							return;
						}

						if (oUsuario.email == null)
						{
							Response.Redirect("~/Default.aspx", false);
							return;
						}

						if (oUsuario.id_permiso == 0)
						{
							Response.Redirect("~/Default.aspx", false);
							return;
						}

						PermisosUsusario permisosUsusario = new PermisosUsusario();
						permisosUsusario = usuarioApp.ObtenerPermiso(oUsuario.id_permiso);

						if (!permisosUsusario.ver)
						{
							Response.Redirect("~/Mantenedores/Productos/DefaultProductos.aspx", false);
							return;
						}
					}

					if (uid != "")
					{
						Curso oCurso = cursoApp.ObtenerCurso(Convert.ToInt32(uid));

						lblNombreItem.Text = oCurso.nombre_curso;
						txtDescripcion.Text = oCurso.descripcion;
						lblPrecio.Text = oCurso.precio.ToString();
						lblFehcaCreacion.Text = oCurso.fecha_creacion.ToString();
						lblFechaModificacion.Text = oCurso.fecha_modificacion.ToString();
						ItemImagen.ImageUrl = oCurso.URL_img;
					}
				}
			}
			catch (Exception)
			{

				throw;
			}
		}
	}
}