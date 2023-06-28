using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MiniCerveceria.Modelos
{
    public class Favorito
    {
        public int id_fav { get; set; }
        public int id_usuario { get; set; }
        public int id_producto { get; set; }
        public string nombre_producto { get; set; }
        public string URL_img { get; set; }
    }
}