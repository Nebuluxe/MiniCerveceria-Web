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
	}
}
