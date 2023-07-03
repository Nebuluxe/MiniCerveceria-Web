using MiniCerveceria.Modelos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MiniCerveceria.Servicios
{
	internal interface IRegionAplicacionServicio
	{
		IList<Region> ObtenerRegiones();
		void CrearRegion(string nombreComuna);
		void ModificarRegion(int id_region, string nombre);
		void EliminarRegion(int id_region);
	}
}
