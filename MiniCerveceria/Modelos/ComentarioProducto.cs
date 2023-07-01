using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MiniCerveceria.Modelos
{
	public class ComentarioProducto
	{
		public int id_com_producto { get; set; }
		public int id_usuario { get; set; }
		public int id_producto { get; set; }
		public string texto { get; set; }
		public string fecha { get; set; }
		public bool estado { get; set; }
		public int puntuacion { get; set; }
		public string nombre_producto { get; set;}
		public string url_img_prod { get; set; }
		public string nombre { get;set;}
		public string apelido { get; set; }
		public string url_img_user { get; set; }
	}
}