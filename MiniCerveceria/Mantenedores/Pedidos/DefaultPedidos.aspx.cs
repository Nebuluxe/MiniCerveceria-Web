using MiniCerveceria.Modelos;
using MiniCerveceria.Servicios.Implementacion;
using MiniCerveceria.Servicios;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

namespace MiniCerveceria.Mantenedores.Pedidos
{
	public partial class DefaultPedidos : System.Web.UI.Page
	{
		static string conn = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
		static IPedidoAplicacionServicios pedidosApp = new PedidoServicio(conn);
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
			}
		}

		[WebMethod(EnableSession = true)]
		public static IList<Pedido> ObtenerPedidos(int estado)
		{
			try
			{
				IList<Pedido> ListPedidos = new List<Pedido>();

				ListPedidos = pedidosApp.ObtenerPedidos(estado);

				return ListPedidos;
			}
			catch (Exception)
			{
				throw;
			}
		}

		[WebMethod(EnableSession = true)]
		public static Pedido ObtenerPedido(string id_pedido, string id_usuario)
		{
			try
			{
				Pedido Pedido = new Pedido();

				Pedido = pedidosApp.ObtenerPedido(Convert.ToInt32(id_pedido), Convert.ToInt32(id_usuario));

				return Pedido;
			}
			catch (Exception)
			{
				throw;
			}
		}

		[WebMethod(EnableSession = true)]
		public static bool CambioEstadoPedido(string id_pedido, string id_usuario, string estado)
		{
			try
			{
				pedidosApp.CambioEstadoPedido(Convert.ToInt32(id_usuario), Convert.ToInt32(id_pedido), Convert.ToInt32(estado));

				return true;

			}
			catch (Exception)
			{
				throw;
			}
		}
	}
}