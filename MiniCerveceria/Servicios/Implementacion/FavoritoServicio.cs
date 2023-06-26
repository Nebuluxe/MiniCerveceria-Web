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
        public void CrearFavorito (Favorito obj)
        {
            string query = @"INSERT INTO favoritos (id_fav, " + 
                                                   "id_usuario, " +
                                                   "id_producto) " +
                            "VALUES (" + obj.id_fav + ", " + obj.id_usuario + ", " + obj.id_producto + ")";
            db.Execute(query);
        }
        public IList<Favorito> ObtenerFavoritosUsuario(int id_usuario)
        {
            string query = @"SELECT id_fav," + 
                                   "id_usuario, " +
                                   "id_producto " +
                            "FROM favoritos " +
                            "WHERE id_usuario = " + id_usuario;
            DataTable dt = db.Execute(query);

            IList<Favorito> lista = new List<Favorito>();
            if (dt.Rows.Count > 0)
            {
                lista = (from DataRow rw in dt.Rows
                         select new Favorito()
                         {
                             id_fav = Convert.ToInt32(rw["id_fav"]),
                             id_usuario = Convert.ToInt32(rw["id_usuario"]),
                             id_producto = Convert.ToInt32(rw["id_producto"])
                         }
                        ).ToList();
                return lista;
            }
            else
            {
                return lista;
            }
        }
        public void EliminarFavorito(int id_favorito, int id_usuario)
        {
            string query = @"DELETE FROM favoritos " + 
                            "WHERE id_fav = " + id_favorito + " " +
                              "AND id_usuario = " + id_usuario;
            db.Execute(query);
        }
    }
}