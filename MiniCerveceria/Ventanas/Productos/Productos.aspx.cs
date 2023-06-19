using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MiniCerveceria
{
	public partial class Productos : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			string nameCate = Request.QueryString["cate"] != null ? Request.QueryString["cate"] : "";

			NameCategoria.Text = nameCate != "" ? nameCate : "Productos";
		}
	}
}