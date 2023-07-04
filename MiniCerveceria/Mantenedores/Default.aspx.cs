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
using MiniCerveceria.Servicios.Modelos;

namespace MiniCerveceria.Mantenedores
{
    public partial class Default : System.Web.UI.Page
    {
		static string conn = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
		static IUsuarioAplicacionServicios usuarioApp = new UsuarioServicio(conn);
		static IProductoAplicacionServicios productoApp = new ProductoServicio(conn);
		static ICursoAplicacionServicios cursoApp = new CursoServicio(conn);
		static IPedidoAplicacionServicios pedidoApp = new PedidoServicio(conn);
		static ICursosInscritosAplicacionServicios inscripcionesApp = new CursosInscritosServicio(conn);
		static IDetallePedidoAplicacionServicios detallePedidoApp = new DetallePedidoServicio(conn);
		static IFavoritoAplicacionServicios favoritosApp = new FavoritoServicio(conn);

		protected void Page_Load(object sender, EventArgs e)
		{
			try
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
				}
			}
			catch (Exception)
			{
				throw;
			}
		}

		[WebMethod(EnableSession = true)]
		public static DetallePedido ObtenerrIngresosProductos()
		{
			try
			{
				IList<DetallePedido> list = new List<DetallePedido>();
				list = detallePedidoApp.obtenerLineas();

				DetallePedido ped = new DetallePedido();
				ped.total_detalle = list.Where(x => Convert.ToDateTime(x.fecha_creacion).ToString("MM-yyyy") == DateTime.Now.ToString("MM-yyyy")).Sum(x => x.total_detalle);
				ped.cantidad = list.Sum(x => x.cantidad);

				return ped;
			}
			catch (Exception)
			{
				throw;
			}
		}

		[WebMethod(EnableSession = true)]
		public static IList<DetallePedido> ObtenerrProductosQueGeneranMasIngresos()
		{
			try
			{
				IList<DetallePedido> list = new List<DetallePedido>();
				list = detallePedidoApp.obtenerLineas();

				IList<DetallePedido> filtrado = new List<DetallePedido>();

				foreach (var productos in list.Where(x => Convert.ToDateTime(x.fecha_creacion).ToString("MM/yyyy") == DateTime.Now.ToString("MM/yyyy")).GroupBy(x => x.id_producto))
				{
					DetallePedido filt = new DetallePedido();

					filt.total_detalle = productos.Sum(x => x.total_detalle);
					filt.id_producto = productos.First().id_producto;
					filt.nombre_producto = productos.First().nombre_producto;
					filt.cantidad = productos.Sum(x => x.cantidad);

					filtrado.Add(filt);
				}

				IList<DetallePedido> List5masVendidos = new List<DetallePedido>();

				for (int i = 0; i < 5; i++)
				{
					DetallePedido detmax = new DetallePedido();

					detmax = filtrado.First(obj => obj.total_detalle == filtrado.Max(o => o.total_detalle));

					List5masVendidos.Add(detmax);

					int indicec = 0;

					indicec = filtrado.IndexOf(detmax);

					filtrado.RemoveAt(indicec);
				}

				return List5masVendidos.OrderBy(x => x.total_detalle).ToList();
			}
			catch (Exception)
			{
				throw;
			}
		}

		[WebMethod(EnableSession = true)]
		public static IList<Favorito> ObtenerProductosPopulares()
		{
			try
			{
				IList<Favorito> list = new List<Favorito>();
				list = favoritosApp.ObtenerFavoritos();

				IList<Favorito> filtrado = new List<Favorito>();

				foreach (var productos in list.GroupBy(x => x.id_producto))
				{
					Favorito filt = new Favorito();

					filt.id_producto = productos.First().id_producto;
					filt.nombre_producto = productos.First().nombre_producto;
					filt.cantidad = productos.Count();

					filtrado.Add(filt);
				}

				IList<Favorito> List5masVendidos = new List<Favorito>();

				for (int i = 0; i < 10; i++)
				{
					Favorito detmax = new Favorito();

					detmax = filtrado.First(obj => obj.cantidad == filtrado.Max(o => o.cantidad));

					List5masVendidos.Add(detmax);

					int indicec = 0;

					indicec = filtrado.IndexOf(detmax);

					filtrado.RemoveAt(indicec);
				}

				return List5masVendidos.OrderBy(x => x.cantidad).ToList();
			}
			catch (Exception)
			{
				throw;
			}
		}

		[WebMethod(EnableSession = true)]
		public static IList<DetallePedido> ObtenerrLineaTiempoIngresos()
		{
			try
			{
				IList<DetallePedido> list = new List<DetallePedido>();
				list = detallePedidoApp.obtenerLineas();

				IList<DetallePedido> filtrado = new List<DetallePedido>();

				foreach (var productos in list.GroupBy(x => Convert.ToDateTime(x.fecha_creacion).ToString("MM-yyy")))
				{
					DetallePedido filt = new DetallePedido();

					filt.total_detalle = productos.Sum(x => x.total_detalle);
					filt.id_producto = productos.First().id_producto;
					filt.nombre_producto = productos.First().nombre_producto;
					filt.cantidad = productos.Sum(x => x.cantidad);
					filt.fecha_creacion = Convert.ToDateTime(productos.First().fecha_creacion).ToString("MMMM");

					filtrado.Add(filt);
				}

				IList<DetallePedido> ingresosMeses = new List<DetallePedido>();
				int cont = 0;

				foreach (var item in filtrado.OrderByDescending(x => x.total_detalle).Reverse().ToList())
				{
					if (cont == 12)
					{
						break;
					}

					ingresosMeses.Add(item);
					cont++;
				}

				return ingresosMeses;
			}
			catch (Exception)
			{
				throw;
			}
		}
	}
}