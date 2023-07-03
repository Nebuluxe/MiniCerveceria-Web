using MiniCerveceria.Modelos;
using MiniCerveceria.Servicios.Implementacion;
using MiniCerveceria.Servicios;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;

namespace MiniCerveceria.Mantenedores.Locaciones
{
	public partial class Locaciones : System.Web.UI.Page
	{
		static string conn = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
		static IComunaAplicacionServicio comunaApp = new ComunaServicio(conn);
		static IRegionAplicacionServicio regionApp = new RegionServicio(conn);
		static IUsuarioAplicacionServicios usuarioApp = new UsuarioServicio(conn);

		public string PermisoEliminar = "false";
		public string PermisoCrear = "false";
		public string PermisoEditar = "false"; 
		protected void Page_Load(object sender, EventArgs e)
		{
			MasterAdmin MasterAdmin = (MasterAdmin)(Session["MasterAdminSesion"]);
			Usuario oUsuario = (Usuario)(Session["UsuarioSesion"]);

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

				PermisoEliminar = permisosUsusario.eliminar ? "true" : "false";
				PermisoCrear = permisosUsusario.crear ? "true" : "false";
				PermisoEditar = permisosUsusario.editar ? "true" : "false";
			}
			else
			{
				PermisoEliminar = "true";
				PermisoCrear = "true";
				PermisoEditar = "true";
			}
		}

		[WebMethod(EnableSession = true)]
		public static IList<Region> ObtenerRegiones()
		{
			try
			{
				IList<Region> ListProductos = new List<Region>();

				ListProductos = regionApp.ObtenerRegiones();

				return ListProductos;
			}
			catch (Exception)
			{
				throw;
			}
		}

		[WebMethod(EnableSession = true)]
		public static IList<Comuna> ObtenerComunas()
		{
			try
			{
				IList<Comuna> ListProductos = new List<Comuna>();

				ListProductos = comunaApp.ObtenerComunas();

				return ListProductos;
			}
			catch (Exception)
			{
				throw;
			}
		}

		[WebMethod(EnableSession = true)]
		public static bool CrearModificarRegion(string id_region, string nombre)
		{
			try
			{
				if (id_region != "")
				{
					regionApp.ModificarRegion(Convert.ToInt32(id_region), nombre);
					return true;
				}

				regionApp.CrearRegion(nombre);

				return true;
			}
			catch (Exception)
			{
				throw;
			}
		}

		[WebMethod(EnableSession = true)]
		public static bool CrearModificarComuna(string id_comuna, string id_region, string nombre)
		{
			try
			{
				if (id_comuna != "")
				{
					comunaApp.ModificarComuna(Convert.ToInt32(id_comuna), Convert.ToInt32(id_region), nombre);
					return true;
				}

				comunaApp.CrearComuna(Convert.ToInt32(id_region), nombre);

				return true;
			}
			catch (Exception)
			{
				throw;
			}
		}

		[WebMethod(EnableSession = true)]
		public static bool EliminarRegCom(string id, string RegCom)
		{
			try
			{
				if (RegCom == "com")
				{
					comunaApp.EliminarComuna(Convert.ToInt32(id));
					return true;
				}
				else
				{
					regionApp.EliminarRegion(Convert.ToInt32(id));
					return true;
				}
			}
			catch (Exception)
			{
				throw;
			}
		}
		
	}
}