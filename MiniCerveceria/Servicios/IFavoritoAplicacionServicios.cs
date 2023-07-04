using MiniCerveceria.Modelos;
using System.Collections.Generic;

namespace MiniCerveceria.Servicios
{
    internal interface IFavoritoAplicacionServicios
    {
        bool AñdirFavorito(Favorito obj);
		IList<Favorito> ObtenerFavoritosUsuario(int id_usuario);
        void EliminarFavorito(int id_favorito, int id_usuario);
        IList<Favorito> ObtenerFavoritos();

	}
}
