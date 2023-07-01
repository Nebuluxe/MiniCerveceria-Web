using MiniCerveceria.Modelos;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace MiniCerveceria.Servicios.Implementacion
{
	public class RegionServicio : IRegionAplicacionServicio
	{
		static Controladores.Conexion db = new Controladores.Conexion();

		public RegionServicio(string conn)
		{
			db = new Controladores.Conexion(conn);
		}
		public IList<Region> ObtenerRegiones()
		{
			string query = @"SELECT id_region, nombre FROM region";
			DataTable dt = db.Execute(query);

			IList<Region> lista = new List<Region>();
			if (dt.Rows.Count > 0)
			{
				lista = (from DataRow rw in dt.Rows
						 select new Region()
						 {
							 id_region = Convert.ToInt32(rw["id_region"]),
							 nombre_region = Convert.ToString(rw["nombre"]),
						 }
						).ToList();
				return lista;
			}
			else
			{
				return lista;
			}
		}
	}
}