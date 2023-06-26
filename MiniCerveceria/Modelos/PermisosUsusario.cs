using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MiniCerveceria.Modelos
{
	public class PermisosUsusario
	{
		public int id_permiso { get; set; }	
		public string nombre { get; set; }	
		public bool editar { get; set; }
		public bool eliminar { get; set; }
		public bool ver { get; set; }
		public bool crear { get; set; }
	}
}