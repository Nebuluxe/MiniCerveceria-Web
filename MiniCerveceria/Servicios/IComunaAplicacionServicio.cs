using MiniCerveceria.Modelos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MiniCerveceria.Servicios
{
	internal interface IComunaAplicacionServicio
	{
		IList<Comuna> ObtenerComunas();
		void CrearComuna(int id_region, string nombreComuna);
		void ModificarComuna(int id_comuna, int id_region, string nombre);
		void EliminarComuna(int id_comuna);
	}
}
