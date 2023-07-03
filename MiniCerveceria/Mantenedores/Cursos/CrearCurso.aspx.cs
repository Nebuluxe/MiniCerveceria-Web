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
using CloudinaryDotNet.Actions;
using CloudinaryDotNet;
using System.IO;

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
						Curso oCurso = cursoApp.ObtenerCurso(Convert.ToInt32(uid));

						txtNombreProducto.Text = oCurso.nombre_curso;
						txtDescripcion.Text = oCurso.descripcion;
						txtPrecioProucto.Text = oCurso.precio.ToString();
						txtFechaCreacion.Text = oCurso.fecha_creacion.ToString();
						txtFechaModificacion.Text = oCurso.fecha_modificacion.ToString();
						hdnEstado.Value = oCurso.estado.ToString();
                        if (oCurso.URL_img.Trim() != "")
                        {
                            imagenRecortada.ImageUrl = oCurso.URL_img.ToString();
                        }
                        else
                        {
                            imagenRecortada.ImageUrl = "/Imagenes/Iconos/NoImage.png";
                        }

                        CambioNomVentana.Text = "Editar curso";
						lblNombreItem.Text = oCurso.nombre_curso;

						update.Value = oCurso.id_curso.ToString();
					}
					else
					{
						CambioNomVentana.Text = "Crear curso";
                        imagenRecortada.ImageUrl = "/Imagenes/Iconos/NoImage.png";
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
                string[] partesURL = hdnRuta.Value.Split(',');
                Account account = new Account("dcj06k5kw", "311972677843661", "ddplFZzKPNEaKOeChrzQjOXIFmo");

                byte[] imageBytes = Convert.FromBase64String(partesURL[1]);
                MemoryStream ms = new MemoryStream(imageBytes);
                CloudinaryDotNet.Cloudinary cloud = new CloudinaryDotNet.Cloudinary(account);

                oCurso.id_curso = cursoApp.ObtenerIDCurso();
				
                var uploadParams = new ImageUploadParams()
                {
                    File = new FileDescription(oCurso.id_curso.ToString(), ms),
                    PublicId = oCurso.id_curso.ToString()
                };

                var uploadResult = cloud.Upload(uploadParams);

                oCurso.URL_img = uploadResult.SecureUrl.ToString();
                oCurso.id_curso = 0;
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
                string[] partesURL = hdnRuta.Value.Split(',');
                Account account = new Account("dcj06k5kw", "311972677843661", "ddplFZzKPNEaKOeChrzQjOXIFmo");

                byte[] imageBytes = Convert.FromBase64String(partesURL[1]);
                MemoryStream ms = new MemoryStream(imageBytes);
                CloudinaryDotNet.Cloudinary cloud = new CloudinaryDotNet.Cloudinary(account);

                var uploadParams = new ImageUploadParams()
                {
                    File = new FileDescription(oCurso.nombre_curso.ToString(), ms),
                    PublicId = oCurso.id_curso.ToString()
                };

                var uploadResult = cloud.Upload(uploadParams);

                oCurso.URL_img = uploadResult.SecureUrl.ToString();

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