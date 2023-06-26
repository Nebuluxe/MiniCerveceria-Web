using MiniCerveceria.Modelos;
using System.Collections.Generic;

namespace MiniCerveceria.Servicios
{
    internal interface IFavoritoAplicacionServicios
    {
        void CrearFavorito(Favorito favorito);
        IList<Favorito> ObtenerFavoritosUsuario(int id_usuario);
        void EliminarFavorito(int id_favorito, int id_usuario);
    }
}
