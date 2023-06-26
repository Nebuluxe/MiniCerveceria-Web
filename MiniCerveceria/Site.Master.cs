using MiniCerveceria.Modelos;
using MiniCerveceria.Servicios.Implementacion;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static System.Windows.Forms.VisualStyles.VisualStyleElement.ListView;

namespace MiniCerveceria
{
    public partial class SiteMaster : MasterPage
    {
		public string EstadoSesion = "";
		public string PermisoAdmin = "";

		protected void Page_Load(object sender, EventArgs e)
		{
			Usuario oUsuario = (Usuario)(Session["UsuarioSesion"]);

			MasterAdmin MasterAdmin = (MasterAdmin)(Session["MasterAdminSesion"]);

			if (MasterAdmin == null)
			{
				if (oUsuario != null)
				{
					EstadoSesion = "true";

					PermisoAdmin = "false";
				}
				else
				{
					EstadoSesion = "false";

					PermisoAdmin = "false";
				}
			}
			else
			{
				EstadoSesion = "true";
				PermisoAdmin = "true";
			}

		}
    }
}