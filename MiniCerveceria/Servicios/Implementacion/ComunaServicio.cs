using MiniCerveceria.Modelos;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace MiniCerveceria.Servicios.Implementacion
{
	public class ComunaServicio : IComunaAplicacionServicio
	{
		static Controladores.Conexion db = new Controladores.Conexion();

		public ComunaServicio(string conn)
		{
			db = new Controladores.Conexion(conn);
		}

		public IList<Comuna> ObtenerComunas()
		{
			string query = @"SELECT tbl1.id_comuna, tbl1.id_region, tbl1.nombre AS nombre_comuna, tbl2.nombre AS nombre_region   FROM comuna tbl1 JOIN region tbl2 ON tbl1.id_region = tbl2.id_region";
			DataTable dt = db.Execute(query);

			IList<Comuna> lista = new List<Comuna>();
			if (dt.Rows.Count > 0)
			{
				lista = (from DataRow rw in dt.Rows
						 select new Comuna()
						 {
							 id_comuna = Convert.ToInt32(rw["id_comuna"]),
							 id_region = Convert.ToInt32(rw["id_region"]),
							 nombre_comuna = Convert.ToString(rw["nombre_comuna"]),
							 nombre_region = Convert.ToString(rw["nombre_region"]),
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