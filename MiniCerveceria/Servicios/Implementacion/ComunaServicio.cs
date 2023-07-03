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

		public void CrearComuna(int id_region, string nombreComuna)
		{
			string query = @"INSERT INTO comuna (id_comuna," +
												"id_region, " +
												"nombre)" +
				"VALUES (" + ObtenerIDComuna() + ", " + id_region + ", '" + nombreComuna + "')";
			db.Execute(query);
		}

		public void ModificarComuna(int id_comuna,int id_region, string nombre)
		{
			string query = string.Format(@"UPDATE comuna SET " +
								" id_region = {1}, nombre = '{2}' WHERE id_comuna = {0}",
								id_comuna, id_region, nombre);
			db.Execute(query);
		}

		public void EliminarComuna(int id_comuna)
		{
			string query = string.Format(@" DELETE FROM comuna WHERE id_comuna = {0} ", id_comuna);

			db.Execute(query);
		}

		private int ObtenerIDComuna()
		{
			try
			{
				string query = @"SELECT MAX(id_comuna) AS idComuna FROM comuna";
				DataTable dt = db.Execute(query);
				int idUsuario = Convert.ToInt32(dt.Rows[0]["idComuna"]);
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