using CloudinaryDotNet.Actions;
using CloudinaryDotNet;
using MiniCerveceria.Modelos;
using MiniCerveceria.Servicios.Implementacion;
using Org.BouncyCastle.Asn1.X500;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static System.Windows.Forms.VisualStyles.VisualStyleElement.ListView;
using MiniCerveceria.Servicios;
using System.Configuration;

namespace MiniCerveceria
{
    public partial class SiteMaster : MasterPage
    {
		public string EstadoSesion = "false";
		public string UsuarioMaestro = "false";
		public string UserPermisoAcceso = "false";
        static string conn = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        static IUsuarioAplicacionServicios UsuarioService = new UsuarioServicio(conn);
        protected void Page_Load(object sender, EventArgs e)
		{
			Usuario oUsuario = (Usuario)(Session["UsuarioSesion"]);

			MasterAdmin MasterAdmin = (MasterAdmin)(Session["MasterAdminSesion"]);

			if (MasterAdmin == null)
			{
				if (oUsuario != null)
				{
					EstadoSesion = "true";

					if (oUsuario.id_permiso != 0)
					{
						UserPermisoAcceso = "true";
						if (!string.IsNullOrEmpty(oUsuario.URL_img))
                        {
							cropimage.ImageUrl = oUsuario.URL_img;
                        }
						else
                        {
                            cropimage.ImageUrl = @"\Imagenes\Iconos\UserIconBlack.png";
                        }

					}
					else
					{
						UserPermisoAcceso = "false";
					}

				}
				else
				{
                    cropimage.ImageUrl = @"\Imagenes\Iconos\UserIconBlack.png";
                }
			}
			else
			{
				EstadoSesion = "true";
				UsuarioMaestro = "true";
			}

		}

        protected void btnActualizarImagen_Click(object sender, EventArgs e)
        {
            Usuario oUsuario = (Usuario)(Session["UsuarioSesion"]);

            string Base64Imagen = hdnImgBase64.Value;
            if (Base64Imagen != "")
            {
                Account account = new Account("dcj06k5kw", "311972677843661", "ddplFZzKPNEaKOeChrzQjOXIFmo");

                
                string[] partesURL = Base64Imagen.Split(',');
                byte[] imageBytes = Convert.FromBase64String(partesURL[1]);
                MemoryStream ms = new MemoryStream(imageBytes);
                CloudinaryDotNet.Cloudinary cloud = new CloudinaryDotNet.Cloudinary(account);

                var uploadParams = new ImageUploadParams()
                {
                    File = new FileDescription(oUsuario.nombre.Trim() + " " + oUsuario.apellido.Trim(), ms),
                    PublicId = oUsuario.id_usuario.ToString()
                };

                var uploadResult = cloud.Upload(uploadParams);

                oUsuario.URL_img = uploadResult.SecureUrl.ToString();
                cropimage.ImageUrl = oUsuario.URL_img;
                UsuarioService.ActualizarImagenUsuario(oUsuario.URL_img, oUsuario.id_usuario);
                hdnImagenSubidaBool.Value = "true";
            }
            else
            {
                hdnImagenSubidaBool.Value = "false";
                oUsuario.URL_img = @"\Imagenes\Iconos\UserIconBlack.png";
            }
        }
    }
}