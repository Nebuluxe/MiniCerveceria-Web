using MiniCerveceria.Modelos;
using System.Collections.Generic;

namespace MiniCerveceria.Servicios
{
    internal interface IPedidoAplicacionServicios
    {
        void CrearPedido(Pedido pedido);
        int ObtenerIdUltimoPedidoUsuario(int id_usuario);
        IList<Pedido> ObtenerPedidosUsuario(int id_usuario);
        Pedido ObtenerPedido(int id_pedido, int id_usuario);
        IList<Pedido> ObtenerPedidos();
        void CambioEstadoPedido(int id_usuario, int id_pedido, int estado);

	}
}
