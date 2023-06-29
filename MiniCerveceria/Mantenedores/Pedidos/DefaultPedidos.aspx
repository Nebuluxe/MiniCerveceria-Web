<%@ Page Title="Mantenedores" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DefaultPedidos.aspx.cs" Inherits="MiniCerveceria.Mantenedores.Pedidos.DefaultPedidos" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

	<link href="/GlobalCss/Mantenedores.css" rel="stylesheet" type="text/css">
	
	<style>
		.card-body{
			background:#000000;
			color: #ffffff;
		}
		#headMaster {
			display: none;
		}

        #mainNav{
            display: none;
        }

        #footerDefault{
            display: none;
        }

        #barraNav {
            background: #000000 !important;
            color: #ffffff;
            border-radius: 15px;
        }
        #TablaDetallePedido > :not(caption) > * > * {
			color: #ffffff;
		}

	</style>
    <nav id="barraNav" class="navbar bg-body-tertiary">
        <div class="container-fluid">
            <a runat="server" href="~/Mantenedores/Default.aspx" data-title="Volver">
                <img id="imgButtonBack" src="/Imagenes/Iconos/BackButtonWithe.png" height="40">
            </a>
            <div class="row">
                <div class="col-2">
                    <img src="/Imagenes/Iconos/PedidosWithe.png" height="40" width="40">
                </div>
                <div class="col-10">
                    <asp:Label CssClass="titulo" Style="font-size: 1.9em; color: #ffffff;" runat="server" ClientIDMode="Static">Pedidos clientes</asp:Label>
                </div>
            </div>
            <span>

            </span>
        </div>
    </nav>
    <br />
    <div class="input-group" style="justify-content: center">
        <input type="text" class="form-control" id="search" placeholder="Buscador..." aria-label="Buscador...">
        <span class="input-group-text" id="addon-wrapping" style="border: 10px">
            <img src="/Imagenes/Iconos/Lupa.png" height="20">
        </span>
    </div>
    <br />
    <table class="table CompraDetalle" id="TablaPermisos">
	    <thead>
		    <tr>
                <th scope="row">N° pedido</th>
			    <th scope="row">Nombre receptor</th>
			    <th scope="row" colspan="2">Direccion envio</th>
                <th scope="row">Detalle</th>
                <th scope="row">Traking</th>
		    </tr>
	    </thead>
	    <tbody id="Contenido">

	    </tbody>
    </table>
    <%-- Modal detalle pedido --%>
    <div class="fade modal" id="modalDetallePedido" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="modalDetallePedidoLabel" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
        <div class="modal-content">
          <div class="modal-header">
            <h1 class="modal-title fs-5" id="modalDetallePedidoLabel">Detalle pedido</h1>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
            <div class="container" align="center">
                <div class="card">
                    <div class="card-body">
                        <h5>Detalle del pedido</h5>
                        <h6>Pedido N° <span id="nroPedido"> </span></h6>
                            <div class="row" style="text-align: left !important">
                                <div class="col-lg-12">
                                    <strong>Nombre receptor: </strong><br /><span id="nombreReceptor"> </span>
                                </div>
                                <div class="col-lg-12">
                                    <strong>Fecha compra: </strong><br /><span id="fechaCompra"> </span>
                                </div>
                            <div class="col-lg-12">
                                    <strong>Total: </strong><br />$ <span id="pagoTotal"> </span>
                                </div>
                            </div>
                            <div class="row" style="text-align: left !important">
                            <div class="col-lg-12">
                                    <strong>Direccion envio: </strong><br /><span id="direccion"> </span>
                                </div>
                            </div>
                    </div>
                </div>
                <br />
                <div class="card">
                    <div class="card-body">
                        <table class="table CompraDetalle" id="TablaDetallePedido" style="color:#ffffff !important">
		                    <thead>
		                        <tr>
			                        <th scope="row" colspan="2">Nombre producto</th>
			                        <th scope="row">Cant</th>
			                        <th scope="row">$Precio</th>
			                        <th scope="row">$Total</th>
		                        </tr>
		                    </thead>
		                    <tbody id="ContenidoTablapedidoDetalle">

		                    </tbody>
	                    </table>
                    </div>
                </div>
            </div>
          </div>
          <div class="modal-footer">
          </div>
        </div>
      </div>
    </div>
	<script>
        $(document).ready(function () {
            cargarPedidos()

            $("#search").keyup(function () {
                _this = this;
                $.each($("#TablaPermisos tbody tr"), function () {
                    if ($(this).text().toLowerCase().indexOf($(_this).val().toLowerCase()) === -1)
                        $(this).hide();
                    else
                        $(this).show();
                });
            });

        });

        function cargarPedidos() {
            $.ajax({
                type: 'POST',
                cache: false,
                url: '<%= ResolveUrl("/Mantenedores/Pedidos/DefaultPedidos.aspx/ObtenerPedidos") %>',
                contentType: 'application/json; charset=utf-8',
                async: false,
                dataType: 'json',
                success: function (data) {

                    var html = "";

                    if (data.d != null) {

                        $.each(data.d, function (i, val) {

                            var tracking = "";

                            if (val.estado == 1) {
                                tracking += '<a onclick="CambiarEstado(' + val.id_pedido + ',' + val.id_usuario + ', 1)" style="cursor:pointer" data-title="Marcar en preparacion"><img src="/Imagenes/Traking/PreparacionTrue.png" width="45"></a>';
                                tracking += '<a onclick="CambiarEstado(' + val.id_pedido + ',' + val.id_usuario + ', 2)" style="cursor:pointer" data-title="Marcar en camino"><img src="/Imagenes/Traking/EnCaminoFalse.png" width="45"></a>';
                                tracking += '<a onclick="CambiarEstado(' + val.id_pedido + ',' + val.id_usuario + ', 3)" style="cursor:pointer" data-title="Marcar en entrega"><img src="/Imagenes/Traking/EntregaFalse.png" width="45"></a>';
                                tracking += '<a onclick="CambiarEstado(' + val.id_pedido + ',' + val.id_usuario + ', 4)" style="cursor:pointer" data-title="Marcar como entregado"><img src="/Imagenes/Traking/EntregadoFalse.png" width="45"></a>';
                            }

                            if (val.estado == 2) {
                                tracking += '<a onclick="CambiarEstado(' + val.id_pedido + ',' + val.id_usuario + ', 1)" style="cursor:pointer" data-title="Marcar en preparacion"><img src="/Imagenes/Traking/PreparacionTrue.png" width="45"></a>';
                                tracking += '<a onclick="CambiarEstado(' + val.id_pedido + ',' + val.id_usuario + ', 2)" style="cursor:pointer" data-title="Marcar en camino"><img src="/Imagenes/Traking/EnCaminoTrue.png" width="45"></a>';
                                tracking += '<a onclick="CambiarEstado(' + val.id_pedido + ',' + val.id_usuario + ', 3)" style="cursor:pointer" data-title="Marcar en entrega"><img src="/Imagenes/Traking/EntregaFalse.png" width="45"></a>';
                                tracking += '<a onclick="CambiarEstado(' + val.id_pedido + ',' + val.id_usuario + ', 4)" style="cursor:pointer" data-title="Marcar como entregado"><img src="/Imagenes/Traking/EntregadoFalse.png" width="45"></a>';
                            }

                            if (val.estado == 3) {
                                tracking += '<a onclick="CambiarEstado(' + val.id_pedido + ',' + val.id_usuario + ', 1)" style="cursor:pointer" data-title="Marcar en preparacion"><img src="/Imagenes/Traking/PreparacionTrue.png" width="45"></a>';
                                tracking += '<a onclick="CambiarEstado(' + val.id_pedido + ',' + val.id_usuario + ', 2)" style="cursor:pointer" data-title="Marcar en camino"><img src="/Imagenes/Traking/EnCaminoTrue.png" width="45"></a>';
                                tracking += '<a onclick="CambiarEstado(' + val.id_pedido + ',' + val.id_usuario + ', 3)" style="cursor:pointer" data-title="Marcar en entrega"><img src="/Imagenes/Traking/EntregaTrue.png" width="45"></a>';
                                tracking += '<a onclick="CambiarEstado(' + val.id_pedido + ',' + val.id_usuario + ', 4)" style="cursor:pointer" data-title="Marcar como entregado"><img src="/Imagenes/Traking/EntregadoFalse.png" width="45"></a>';
                            }

                            if (val.estado == 4) {
                                tracking += '<a onclick="CambiarEstado(' + val.id_pedido + ',' + val.id_usuario + ', 1)" style="cursor:pointer" data-title="Marcar en preparacion"><img src="/Imagenes/Traking/PreparacionTrue.png" width="45"></a>';
                                tracking += '<a onclick="CambiarEstado(' + val.id_pedido + ',' + val.id_usuario + ', 2)" style="cursor:pointer" data-title="Marcar en camino"><img src="/Imagenes/Traking/EnCaminoTrue.png" width="45"></a>';
                                tracking += '<a onclick="CambiarEstado(' + val.id_pedido + ',' + val.id_usuario + ', 3)" style="cursor:pointer" data-title="Marcar en entrega"><img src="/Imagenes/Traking/EntregaTrue.png" width="45"></a>';
                                tracking += '<a onclick="CambiarEstado(' + val.id_pedido + ',' + val.id_usuario + ', 4)" style="cursor:pointer" data-title="Marcar como entregado"><img src="/Imagenes/Traking/EntregadoTrue.png" width="45"></a>';
                            }

                            html += '<tr id="' + val.id_pedido + '">' +
                                '<td scope="row" >' + val.id_pedido + '</td>' +
                                '<td scope="row" >' + val.nombre_receptor + '</td>' +
                                '<td scope="row" colspan="2" >' + val.direccion_envio + '</td>' +
                                '<td scope="row" > <a style="cursor:pointer" data-title="Ver detalle del pedido" onclick="ObtenerDetallePedido(' + val.id_pedido + ',' + val.id_usuario + ')" data-bs-toggle="modal" data-bs-target="#modalDetallePedido" ><img  src="/Imagenes/Iconos/Lupa.png" width="25"></a></td>' +
                                '<td scope="row" >' + tracking + '</td>' +
                                '</tr>';
                        });

                        $('#Contenido').html(html);
                    }
                },
                error: function (data) {
                    alert("Algo ha salido mal!!!");
                }
            });
        }

        function ObtenerDetallePedido(idPedido,idUsaurio) {
            $.ajax({
                type: 'POST',
                cache: false,
                url: '<%= ResolveUrl("/Mantenedores/Pedidos/DefaultPedidos.aspx/ObtenerPedido") %>',
                contentType: 'application/json; charset=utf-8',
                async: true,
                dataType: 'json',
                data: JSON.stringify({ 'id_pedido': idPedido, 'id_usuario': idUsaurio }),
                success: function (data) {
                    if (data.d != null) {
                        $('#nroPedido').text(data.d.id_pedido);
                        $('#nombreReceptor').text(data.d.nombre_receptor);
                        $('#fechaCompra').text(data.d.fecha_creacion);
                        $('#pagoTotal').text(data.d.total);
                        $('#direccion').text(data.d.direccion_envio);

                        var html = "";

                        $.each(data.d.DetallePedido, function (i, val) {

                            html += '<tr id="' + val.id_producto + '">' +
                                '<td colspan="2">' + val.nombre_producto + '</td>' +
                                '<td scope="row">' + val.cantidad + '</td>' +
                                '<td scope="row" >' + val.precio_producto + '</td>' +
                                '<td scope="row" >' + val.total_detalle + '</td>' +
                                '</tr>';
                        });

                        $('#ContenidoTablapedidoDetalle').html(html);
                    }
                },
                error: function (data) {
                    alert("Algo ha salido mal!!!");
                }
            });
        }

        function CambiarEstado(idPedido, idUsaurio, estado) {
            $.ajax({
                type: 'POST',
                cache: false,
                url: '<%= ResolveUrl("/Mantenedores/Pedidos/DefaultPedidos.aspx/CambioEstadoPedido") %>',
                contentType: 'application/json; charset=utf-8',
                async: true,
                dataType: 'json',
                data: JSON.stringify({ 'id_pedido': idPedido, 'id_usuario': idUsaurio, 'estado': estado }),
                success: function (data) {
                    if (data.d) {
                        cargarPedidos()
                    }
                },
                error: function (data) {
                    alert("Algo ha salido mal!!!");
                }
            });
        }
    </script>
</asp:Content>