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

		public void CrearRegion(string nombreComuna)
		{
			string query = @"INSERT INTO region (id_region, " +
												"nombre)" +
				"VALUES (" + ObtenerIDRegion() + ", '" + nombreComuna + "')";
			db.Execute(query);
		}

		public void ModificarRegion(int id_region, string nombre)
		{
			string query = string.Format(@"UPDATE region SET " +
								"nombre = '{1}' WHERE id_region = {0}",
								id_region, nombre);
		    db.Execute(query);
		}

		public void EliminarRegion(int id_region)
		{
			string query = string.Format(@" DELETE FROM region WHERE id_region = {0} ", id_region);

			db.Execute(query);
		}

		private int ObtenerIDRegion()
		{
			try
			{
				string query = @"SELECT MAX(id_region) AS idRegion FROM region";
				DataTable dt = db.Execute(query);
				int idUsuario = Convert.ToInt32(dt.Rows[0]["idRegion"]);
				return idUsuario + 1;
			}
			catch (Exception)
			{
				return 1;
				throw;
			}
		}
	}
}