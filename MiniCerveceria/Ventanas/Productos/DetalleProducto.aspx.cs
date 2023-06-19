using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MiniCerveceria.Ventanas.Productos
{
	public partial class DetalleProducto : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			string uid = Request.QueryString["prod"] != null ? Request.QueryString["prod"] : "";

			NomProducto.Text = uid == "" ? "Producto xxxxxx" : uid;

			string nameCate = Request.QueryString["cate"] != null ? Request.QueryString["cate"] : "";

			NameCategoria.Text = nameCate != "" ? nameCate : "Categoria";
		}
	}
}