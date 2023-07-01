using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MiniCerveceria.Modelos
{
	public class Comuna
	{
		public int id_comuna {  get; set; }
		public int id_region { get; set; }
		public string nombre_comuna { get; set; }
		public string nombre_region { get; set; }
	}
}