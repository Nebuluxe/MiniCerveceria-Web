using MiniCerveceria.Modelos;
using System.Collections.Generic;

namespace MiniCerveceria.Servicios
{
    internal interface IPedidoAplicacionServicios
    {
        void CrearPedido(Pedido pedido);
        int ObtenerIdUltimoPedidoUsuario(int id_usuario);
    }
}
