using MiniCerveceria.Modelos;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace MiniCerveceria.Servicios.Implementacion
{
    public class FavoritoServicio : IFavoritoAplicacionServicios
    {
        static Controladores.Conexion db = new Controladores.Conexion();
        public FavoritoServicio(string conn)
        {
            db = new Controladores.Conexion(conn);
        }
        public bool AñdirFavorito (Favorito obj)
        {
            bool valid = ValidaProductoAñadido(obj.id_usuario, obj.id_producto);

            if (valid)
            {
                return false;
            }

			string query = "DECLARE " +
					            "v_id_fav NUMBER(10) := 0;" +
				            " BEGIN " +
							" SELECT MAX(id_fav) + 1 INTO v_id_fav FROM favoritos;" +
						            " INSERT INTO favoritos (id_fav, " +
												               "id_usuario, " +
												               "id_producto) " +
										" VALUES (v_id_fav, " + obj.id_usuario + ", " + obj.id_producto + ");" +
			               " EXCEPTION WHEN no_data_found THEN " +
						            " INSERT INTO favoritos (id_fav, " +
												               "id_usuario, " +
												               "id_producto) " +
							            " VALUES (1, " + obj.id_usuario + ", " + obj.id_producto + ");" +
				            " END;";
			db.Execute(query);

            return true;
        }
        public IList<Favorito> ObtenerFavoritosUsuario(int id_usuario)
        {
            string query = @"SELECT tbl1.id_fav,tbl1.id_usuario, tbl1.id_producto, tbl2.nombre_producto, tbl2.url_img FROM favoritos tbl1 JOIN productos tbl2 ON tbl1.id_producto = tbl2.id_producto WHERE id_usuario = " + id_usuario;
            DataTable dt = db.Execute(query);

            IList<Favorito> lista = new List<Favorito>();
            if (dt.Rows.Count > 0)
            {
                lista = (from DataRow rw in dt.Rows
                         select new Favorito()
                         {
                             id_fav = Convert.ToInt32(rw["id_fav"]),
                             id_usuario = Convert.ToInt32(rw["id_usuario"]),
                             id_producto = Convert.ToInt32(rw["id_producto"]),
                             nombre_producto = Convert.ToString(rw["nombre_producto"]),
                             URL_img = Convert.ToString(rw["url_img"])
						 }
                        ).ToList();
                return lista;
            }
            else
            {
                return lista;
            }
        }
        public void EliminarFavorito(int id_producto, int id_usuario)
        {
            string query = @"DELETE FROM favoritos " +
							"WHERE id_producto = " + id_producto + " " +
                              "AND id_usuario = " + id_usuario;
            db.Execute(query);
        }
		private bool ValidaProductoAñadido(int id_usuario, int id_producto)
		{
			string query = @"SELECT id_usuario FROM favoritos WHERE id_usuario = " + id_usuario + " AND id_producto = " + id_producto;
			DataTable dt = db.Execute(query);

			if (dt.Rows.Count > 0)
			{
				return true;
			}
			else
			{
				return false;
			}
		}
	}
}