using MiniCerveceria.Modelos;
using System.Collections.Generic;

namespace MiniCerveceria.Servicios
{
    internal interface IDetallePedidoAplicacionServicios
    {
        void CrearDetallePedido(DetallePedido obj);
        IList<DetallePedido> obtenerLineas();

	}
}
