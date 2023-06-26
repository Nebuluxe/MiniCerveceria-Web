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
using static System.Data.Entity.Infrastructure.Design.Executor;

namespace MiniCerveceria.Mantenedores.Cursos
{
    public partial class CrearCurso : System.Web.UI.Page
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

						if (uid != "")
						{
							if (!permisosUsusario.editar)
							{
								Response.Redirect("~/Mantenedores/Productos/DefaultProductos.aspx", false);
								return;
							}
						}
						else
						{
							if (!permisosUsusario.crear)
							{
								Response.Redirect("~/Mantenedores/Productos/DefaultProductos.aspx", false);
								return;
							}
						}
					}



					if (uid != "")
					{
						Curso oCuerso = cursoApp.ObtenerCurso(Convert.ToInt32(uid));

						txtNombreProducto.Text = oCuerso.nombre_curso;
						txtDescripcion.Text = oCuerso.descripcion;
						txtPrecioProucto.Text = oCuerso.precio.ToString();
						txtFechaCreacion.Text = oCuerso.fecha_creacion.ToString();
						txtFechaModificacion.Text = oCuerso.fecha_modificacion.ToString();
						ItemImagen.ImageUrl = oCuerso.URL_img;
						hdnEstado.Value = oCuerso.estado.ToString();

						CambioNomVentana.Text = "Editar curso";
						lblNombreItem.Text = oCuerso.nombre_curso;

						update.Value = oCuerso.id_curso.ToString();
					}
					else
					{
						CambioNomVentana.Text = "Crear curso";
						ItemImagen.ImageUrl = "/Imagenes/Iconos/NoImage.png";
					}
				}
			}
			catch (Exception)
			{

				throw;
			}
		}

		protected void btnCrearCurso_Click(object sender, EventArgs e)
		{
			try
			{
				Curso oCurso = new Curso();

				oCurso.nombre_curso = txtNombreProducto.Text;
				oCurso.descripcion = txtDescripcion.Text;
				oCurso.precio = Convert.ToInt32(txtPrecioProucto.Text);
				oCurso.estado = 1;
				oCurso.fecha_creacion = DateTime.Now;
				oCurso.fecha_modificacion = Convert.ToDateTime("01/01/1900 00:00:00");
				oCurso.URL_img = "/Imagenes/Iconos/NoImage.png";

				cursoApp.CrearCurso(oCurso);
			}
			catch (Exception)
			{
				throw;
			}

			Response.Redirect("~/Mantenedores/Cursos/DefaultCursos.aspx");
		}

		protected void btnModificarCurso_Click(object sender, EventArgs e)
		{
			try
			{
				Curso oCurso = new Curso();

				oCurso.id_curso = Convert.ToInt32(update.Value);
				oCurso.nombre_curso = txtNombreProducto.Text;
				oCurso.descripcion = txtDescripcion.Text;
				oCurso.precio = Convert.ToInt32(txtPrecioProucto.Text);
				oCurso.estado = Convert.ToInt32(hdnEstado.Value);
				oCurso.fecha_modificacion = DateTime.Now;
				oCurso.URL_img = "/Imagenes/Iconos/NoImage.png";

				cursoApp.CrearCurso(oCurso);
			}
			catch (Exception)
			{
				throw;
			}

			Response.Redirect("~/Mantenedores/Cursos/DefaultCursos.aspx");
		}
	}
}