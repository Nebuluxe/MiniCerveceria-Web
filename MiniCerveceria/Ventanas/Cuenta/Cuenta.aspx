<%@ Page Title="Cuenta" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Cuenta.aspx.cs" Inherits="MiniCerveceria.Ventanas.Cuenta.Cuenta" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        #headMaster {
            height: 350px;
        }

        .headContent {
            display: none
        }

        a {
            text-decoration: none;
            color: #000000;
        }

        #SideMenuMantenedor {
            display: none;
        }

        #MantenedorNav {
            display: none;
        }

        #Favoritos {
            width: 100%;
            overflow-y: scroll;
            overflow-x: hidden;
        }

        #ComprasList {
            height: 500px;
            overflow-y: scroll;
        }

        #PedidosList {
            height: 500px;
            overflow-y: scroll;
        }

        #pedidoDetalle {
            height: 600px;
            width: 100%;
            overflow-y: scroll;
            overflow-x: hidden;
        }

        #compraDetalle {
            height: 600px;
            width: 100%;
            overflow-y: scroll;
            overflow-x: hidden;
        }

        .sizeOptionsCard {
            height: 600px
        }

        .itemList {
            padding: 2px;
            cursor: pointer;
        }

        .itemList:hover{
            background:rgba(0,0,0,.2);
        }

        .group {
            position: relative;
            width: 33%;
            height: 200px;
            padding: 0;
            outline: 1px solid var(--secundary-color);
            border-radius: 50%;
            overflow: hidden;
        }

            .group .crop-image {
                width: 100%;
                height: 200px;
            }

            .group #input-file {
                display: none;
            }

            .group .label-file {
                position: absolute;
                text-align: center;
                width: 100%;
                margin: auto;
                background-color: rgba(0, 0, 0, 0.74);
                padding: 30px 26px;
                font-size: 13px;
                bottom: -101%;
                left: 0;
                cursor: pointer;
                transition: all 150ms ease-in-out;
                color: var(--primary-color);
            }

            .group:hover .label-file {
                bottom: 0;
            }

        /* ==== Modal estilos ==== */

        .modalCrop {
            background-color: rgba(0, 0, 0, 0.247);
            backdrop-filter: blur(0px);
            position: fixed;
            z-index: 2;
            bottom: 0;
            left: 0;
            right: 0;
            top: 0;
            width: 100%;
            height: 100%;
            display: flex;
            justify-content: center;
            align-items: center;
            opacity: 0;
            visibility: hidden;
            transition: all 150ms ease-in-out;
            overflow: auto;
            padding: 20px;
        }

        .modal-content {
            width: 1200px;
            margin: auto;
            background-color: #ffffff;
            border-radius: 10px;
            overflow: hidden;
            transform: scale(0.9);
            opacity: 0;
            transition: 400ms 300ms all ease;
        }

            .modal-content .modal-header {
                width: 100%;
                padding: 20px 10px;
                text-align: center;
                background-color: #ffffff;
                box-shadow: 0px -2px 7px 1px rgba(0, 0, 0, 0.281);
                font-size: 18px;
            }

            .modal-content .modal-body {
                display: flex;
                justify-content: space-between;
                align-items: flex-start;
                gap: 10px;
                padding: 18px 10px;
            }

        .modal-body .content-imagen-cropper {
            width: 80%;
            height: 400px;
            padding: 5px;
            outline: 1px solid var(--thir-color);
        }

        .content-imagen-cropper .img-cropper {
            width: 100%;
        }

        .modal-body .content-imagen-sample {
            height: 200px;
            width: 200px;
            outline: 1px solid var(--thir-color);
            border-radius: 100%;
            overflow: hidden;
        }

            .modal-body .content-imagen-sample .img-sample {
                height: 100%;
                width: 100%;
            }

        .modal-content .modal-footer {
            width: 100%;
            padding: 10px 10px;
            text-align: center;
            background-color: #ffffff;
            box-shadow: 0px 2px 7px 1px rgba(0, 0, 0, 0.281);
            font-size: 18px;
            display: flex;
            align-items: center;
            justify-content: flex-end;
            gap: 15px;
        }

        .modal-footer .btn {
            border: none;
            padding: 12px 70px;
            border-radius: 5px;
            font-size: 15px;
            cursor: pointer;
            color: #fff;
            transition: background-color 300ms ease;
        }

        .modal-footer .primary {
            background-color: var(--primary-color);
        }

        .modal-footer .secundary {
            background-color: var(--secundary-color);
        }

        .modal-footer .primary:hover {
            background-color: var(--primary-color-hover);
        }

        .modal-footer .secundary:hover {
            background-color: var(--secundary-color-hover);
        }

        /* ==== Modal estilos active ==== */

        .modalCrop.active {
            opacity: 1;
            backdrop-filter: blur(3px);
            visibility: visible;
        }

        .modal-content.active {
            transform: scale(1);
            opacity: 1;
        }

        .modalCrop.remove {
            opacity: 0;
            backdrop-filter: blur(0px);
            visibility: hidden;
            transition: 150ms 150ms all ease-in-out;
        }

        .modal-content.remove {
            transform: scale(0.9);
            opacity: 0;
            transition: 150ms all ease;
        }
    </style>
    <br />
    <div class="card" style="--bs-card-border-width: 3px; --bs-card-border-color: rgb(0, 0, 0, .2);">
        <div class="card-body">
            <div class="row" align="center">
                <div class="col-lg-2" style="align-content: center; justify-content: center">
                    <a id="btnVerDatos">
                        <img src="\Imagenes\Iconos\NovedadesBlack.png" style="width: 40px; top: 40px !important; cursor: pointer" alt="Alternate Text" />
                        <span style="cursor: pointer">Datos personales
                        </span>
                    </a>
                </div>
                <div class="col-lg-3" style="align-content: center; justify-content: center">
                    <a id="btnCompras">
                        <img src="\Imagenes\Iconos\Bag.png" style="width: 40px; top: 40px !important; cursor: pointer" alt="Alternate Text" />
                        <span style="cursor: pointer">Historial de compras
                        </span>
                    </a>
                </div>
                <div class="col-lg-2" style="align-content: center; justify-content: center">
                    <a id="btnPedidos">
                        <img src="\Imagenes\Iconos\PedidosBlack.png" style="width: 40px; height: 40px !important; cursor: pointer" alt="Alternate Text" />
                        <span style="cursor: pointer">Pedidos
                        </span>
                    </a>
                </div>
                <div class="col-lg-2" style="align-content: center; justify-content: center">
                    <a id="btnCursosInscritos">
                        <img src="\Imagenes\Iconos\CursosBlack.png" style="width: 40px; top: 40px !important; cursor: pointer" alt="Alternate Text" />
                        <span style="cursor: pointer">Cursos inscritos
                        </span>
                    </a>
                </div>
                <div class="col-lg-2" style="align-content: center; justify-content: center">
                    <a id="btnFavoritos">
                        <img src="\Imagenes\Iconos\Favorito.png" style="width: 40px; top: 40px !important; cursor: pointer" alt="Alternate Text" />
                        <span style="cursor: pointer">Favoritos
                        </span>
                    </a>
                </div>
            </div>
        </div>
    </div>
    <br />
    <div class="card sizeOptionsCard" id="VerDatos" style="--bs-card-border-width: 3px; --bs-card-border-color: rgb(0, 0, 0, .2);">
        <div class="card-body">
            <br />
            <div class="row">
                <div class="col-lg-4">
                    <label for="Nombre" class="form-label"><strong>Nombre: </strong></label>
                    <label class="form-label" id="verNombre"></label>
                </div>
                <div class="col-lg-4">
                    <label for="Apellido" class="form-label"><strong>Apellido: </strong></label>
                    <label class="form-label" id="verApelido"></label>
                </div>
                <div class="col-lg-4">
                    <label for="FechaNac" class="form-label"><strong>Fecha nacimiento: </strong></label>
                    <label class="form-label" type="date" id="verFechaNacimiento"></label>
                </div>
                <div class="col-lg-4">
                    <label for="Direccion" class="form-label"><strong>Direccion: </strong></label>
                    <label class="form-label" id="verDireccion"></label>
                </div>
                <div class="col-lg-4">
                    <label for="Email" class="form-label"><strong>Email: </strong></label>
                    <label class="form-label" id="verEmail"></label>
                </div>
                <div class="col-lg-4">
                    <label for="telefono" class="form-label"><strong>telefono: </strong></label>
                    <label class="form-label" id="verNumero"></label>
                </div>
            </div>
            <br />
            <div class="row">
                <div class="col-lg-12">
                    <a class="btn btn-outline-warning" id="btnModificar">Modificar</a>
                </div>
            </div>
            <br />
        </div>
    </div>
    <div class="card visually-hidden sizeOptionsCard" id="Favoritos" style="--bs-card-border-width: 3px; --bs-card-border-color: rgb(0, 0, 0, .2);">
        <div class="card-body" align="center">
            <br />
            <div class="row" id="tablaFavoritos">
            </div>
            <br />
            <div id="SinFvoritos" class="visually-hidden">
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <h3>Usted no tiene productos añadidos a favoritos</h3>
                <a href="/Ventanas/Productos/Productos.aspx" class="btn btn-warning">Ver productos</a>
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
            </div>
        </div>
    </div>
    <div class="card visually-hidden" id="Compras" style="--bs-card-border-width: 3px; --bs-card-border-color: rgb(0, 0, 0, .2);">
        <div class="card-body" align="center">
            <div class="row" id="TablaCompreas">
                <div class="col-lg-4">
                    <div class="row" id="ListaCompras">
                    </div>
                </div>
                <div class="col-lg-8">
                    <div class="card" id="compraDetalle">
                        <div class="card-body">
                            <div id="defaultCompras">
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                                <img src="/Imagenes/DefaultCompras.png" width="250">
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                            </div>
                            <div id="DetalleCompra" class="visually-hidden">
                                <img src="/Imagenes/DefaultCompras.png" width="90">
                                <div class="card">
                                    <div class="card-body">
                                        <h5>Detalle del compra</h5>
                                        <h6>Pedido N° <span id="nroCompra"></span></h6>
                                        <div class="row" style="text-align: left !important">
                                            <div class="col-lg-4">
                                                <strong>Nombre: </strong>
                                                <br />
                                                <span id="nombreReceptorCompra"></span>
                                            </div>
                                            <div class="col-lg-4">
                                                <strong>Fecha compra: </strong>
                                                <br />
                                                <span id="fechaCompraHistorial"></span>
                                            </div>
                                            <div class="col-lg-4">
                                                <strong>Total: </strong>
                                                <br />
                                                $ <span id="pagoTotalCompra"></span>
                                            </div>
                                        </div>
                                        <div class="row" style="text-align: left !important">
                                            <div class="col-lg-12">
                                                <strong>Direccion envio: </strong>
                                                <br />
                                                <span id="direccionCompra"></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <br />
                                <div class="card">
                                    <div class="card-body">
                                        <table class="table CompraDetalle" id="TablaDetalleCompra">
                                            <thead>
                                                <tr>
                                                    <th scope="row" colspan="2">Nombre producto</th>
                                                    <th scope="row">Cantidad</th>
                                                    <th scope="row">Precio</th>
                                                    <th scope="row">Total</th>
                                                    <th scope="row">Acciones</th>
                                                </tr>
                                            </thead>
                                            <tbody id="ContenidoTablHistorialcompraDetalle">
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <div id="ComentarioProductoCompra" class="row visually-hidden">
                                <div class="col-lg-1">
                                    <a style="cursor:pointer" onclick="CerrarComentarioCompra()"><img src="/Imagenes/Iconos/CloseButtonBlack.png" width="35" /></a>
                                </div>
                                <div class="col-lg-12">
                                    <h5>Danos tu opinion sobre el producto "<span id="nomProdCompra"></span>"</h5>
                                    <span id="idProdCompra" class="visually-hidden"></span>
                                    <br />
                                </div>
                                <div class="col-lg-12">
                                    <span id="puntuacionCompra" class="visually-hidden"></span>
                                    <a style="cursor:pointer" onclick="PuntuarProdCompra(1)"><img id="OneStarCompra" src="/Imagenes/Iconos/FavOff.png" width="35"/></a><span> </span>
                                    <a style="cursor:pointer" onclick="PuntuarProdCompra(2)"><img id="TwoStarCompra" src="/Imagenes/Iconos/FavOff.png" width="35"/></a><span> </span>
                                    <a style="cursor:pointer" onclick="PuntuarProdCompra(3)"><img id="ThreeStarCompra" src="/Imagenes/Iconos/FavOff.png" width="35"/></a><span> </span>
                                    <a style="cursor:pointer" onclick="PuntuarProdCompra(4)"><img id="FourStarCompra" src="/Imagenes/Iconos/FavOff.png" width="35"/></a><span> </span>
                                    <a style="cursor:pointer" onclick="PuntuarProdCompra(5)"><img id="FiveStarCompra" src="/Imagenes/Iconos/FavOff.png" width="35"/></a>
                                </div>
                                <div class="col-lg-12">
                                        <br />
                                        <textarea placeholder="escribe tu comentario..." id="ComentarioProdCompra" name="textarea" rows="10" cols="50" class="form-control"></textarea>
                                </div>
                                <div class="col-lg-12">
                                    <br />
                                        <a id="enviarComentarioProductoCompra" class="btn btn-warning">Enviar comentario</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div id="SinCompras" align="center" class="visually-hidden">
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <h3>No has realizado ninguna compra</h3>
                <a href="/Ventanas/Productos/Productos.aspx" class="btn btn-warning">Ver productos</a>
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
            </div>
        </div>
    </div>
    <div class="card visually-hidden" id="Pedidos" style="--bs-card-border-width: 3px; --bs-card-border-color: rgb(0, 0, 0, .2);">
            <div class="card-body" align="center">
            <div class="row" id="TablaPedidos">
                <div class="col-lg-4">
                    <div class="row" id="ListaPedidos">
                    </div>
                </div>
                <div class="col-lg-8">
                    <div class="card" id="pedidoDetalle">
                        <div class="card-body">
                            <div id="defaultPedidos">
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                                <img src="/Imagenes/DefaultPedidos.png" width="300">
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                            </div>
                            <div id="DetallePedido" class="visually-hidden">
                                <img src="/Imagenes/DefaultPedidos.png" width="150">
                                <div class="card">
                                    <div class="card-body">
                                        <h5>Detalle del pedido</h5>
                                        <h6>Pedido N° <span id="nroPedido"></span></h6>
                                        <div class="row" style="text-align: left !important">
                                            <div class="col-lg-4">
                                                <strong>Nombre: </strong>
                                                <br />
                                                <span id="nombreReceptor"></span>
                                            </div>
                                            <div class="col-lg-4">
                                                <strong>Fecha compra: </strong>
                                                <br />
                                                <span id="fechaCompra"></span>
                                            </div>
                                            <div class="col-lg-4">
                                                <strong>Total: </strong>
                                                <br />
                                                $ <span id="pagoTotal"></span>
                                            </div>
                                        </div>
                                        <div class="row" style="text-align: left !important">
                                            <div class="col-lg-12">
                                                <strong>Direccion envio: </strong>
                                                <br />
                                                <span id="direccion"></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <br />
                                <div class="card">
                                    <div class="card-body">
                                        <h5>Estado del pedido</h5>
                                        <div class="row" id="preparacion">
                                            <div class="col-lg-3">
                                                <img src="/Imagenes/Traking/PreparacionTrue.png" width="100">
                                                <br />
                                                <span>En preparacion </span>
                                            </div>
                                            <div class="col-lg-3">
                                                <img src="/Imagenes/Traking/EnCaminoFalse.png" width="100">
                                                <br />
                                                <span>En camino </span>
                                            </div>
                                            <div class="col-lg-3">
                                                <img src="/Imagenes/Traking/EntregaFalse.png" width="100">
                                                <br />
                                                <span>En entrega </span>
                                            </div>
                                            <div class="col-lg-3">
                                                <img src="/Imagenes/Traking/EntregadoFalse.png" width="100">
                                                <br />
                                                <span>Entregado </span>
                                            </div>
                                        </div>
                                        <div class="row visually-hidden" id="camino">
                                            <div class="col-lg-3">
                                                <img src="/Imagenes/Traking/PreparacionTrue.png" width="100">
                                                <br />
                                                <span>En preparacion </span>
                                            </div>
                                            <div class="col-lg-3">
                                                <img src="/Imagenes/Traking/EnCaminoTrue.png" width="100">
                                                <br />
                                                <span>En camino </span>
                                            </div>
                                            <div class="col-lg-3">
                                                <img src="/Imagenes/Traking/EntregaFalse.png" width="100">
                                                <br />
                                                <span>En entrega </span>
                                            </div>
                                            <div class="col-lg-3">
                                                <img src="/Imagenes/Traking/EntregadoFalse.png" width="100">
                                                <br />
                                                <span>Entregado </span>
                                            </div>
                                        </div>
                                        <div class="row visually-hidden" id="entrega">
                                            <div class="col-lg-3">
                                                <img src="/Imagenes/Traking/PreparacionTrue.png" width="100">
                                                <br />
                                                <span>En preparacion </span>
                                            </div>
                                            <div class="col-lg-3">
                                                <img src="/Imagenes/Traking/EnCaminoTrue.png" width="100">
                                                <br />
                                                <span>En camino </span>
                                            </div>
                                            <div class="col-lg-3">
                                                <img src="/Imagenes/Traking/EntregaTrue.png" width="100">
                                                <br />
                                                <span>En entrega </span>
                                            </div>
                                            <div class="col-lg-3">
                                                <img src="/Imagenes/Traking/EntregadoFalse.png" width="100">
                                                <br />
                                                <span>Entregado </span>
                                            </div>
                                        </div>
                                        <div class="row visually-hidden" id="entregado">
                                            <div class="col-lg-3">
                                                <img src="/Imagenes/Traking/PreparacionTrue.png" width="100">
                                                <br />
                                                <span>En preparacion </span>
                                            </div>
                                            <div class="col-lg-3">
                                                <img src="/Imagenes/Traking/EnCaminoTrue.png" width="100">
                                                <br />
                                                <span>En camino </span>
                                            </div>
                                            <div class="col-lg-3">
                                                <img src="/Imagenes/Traking/EntregaTrue.png" width="100">
                                                <br />
                                                <span>En entrega </span>
                                            </div>
                                            <div class="col-lg-3">
                                                <img src="/Imagenes/Traking/EntregadoTrue.png" width="100">
                                                <br />
                                                <span>Entregado </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <br />
                                <div class="card">
                                    <div class="card-body">
                                        <table class="table CompraDetalle" id="TablaDetallePedido">
                                            <thead>
                                                <tr>
                                                    <th scope="row" colspan="2">Nombre producto</th>
                                                    <th scope="row">Cantidad</th>
                                                    <th scope="row">Precio</th>
                                                    <th scope="row">Total</th>
                                                    <th scope="row">Acciones</th>
                                                </tr>
                                            </thead>
                                            <tbody id="ContenidoTablcompraDetalle">
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <div id="ComentarioProductoPedido" class="row visually-hidden">
                                <div class="col-lg-1">
                                    <a style="cursor:pointer" onclick="CerrarComentarioPedido()"><img src="/Imagenes/Iconos/CloseButtonBlack.png" width="35" /></a>
                                </div>
                                <div class="col-lg-12">
                                    <h5>Danos tu opinion sobre el producto "<span id="nomProdPedido"></span>"</h5>
                                    <span id="idProdPedido" class="visually-hidden"></span>
                                    <br />
                                </div>
                                <div class="col-lg-12">
                                    <span id="puntuacionPedido" class="visually-hidden"></span>
                                    <a style="cursor:pointer" onclick="PuntuarProdPedido(1)"><img id="OneStarPedido" src="/Imagenes/Iconos/FavOff.png" width="35"/></a><span> </span>
                                    <a style="cursor:pointer" onclick="PuntuarProdPedido(2)"><img id="TwoStarPedido" src="/Imagenes/Iconos/FavOff.png" width="35"/></a><span> </span>
                                    <a style="cursor:pointer" onclick="PuntuarProdPedido(3)"><img id="ThreeStarPedido" src="/Imagenes/Iconos/FavOff.png" width="35"/></a><span> </span>
                                    <a style="cursor:pointer" onclick="PuntuarProdPedido(4)"><img id="FourStarPedido" src="/Imagenes/Iconos/FavOff.png" width="35"/></a><span> </span>
                                    <a style="cursor:pointer" onclick="PuntuarProdPedido(5)"><img id="FiveStarPedido" src="/Imagenes/Iconos/FavOff.png" width="35"/></a>
                                </div>
                                <div class="col-lg-12">
                                        <br />
                                        <textarea placeholder="escribe tu comentario..." id="ComentarioProdPedido" name="textarea" rows="10" cols="50" class="form-control"></textarea>
                                </div>
                                <div class="col-lg-12">
                                    <br />
                                        <a id="enviarComentarioProductoPedido" class="btn btn-warning">Enviar comentario</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            </div>
            <div id="SinPedidos" align="center" class="visually-hidden">
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <h3>No tienes pedidos pendientes</h3>
                <a href="/Ventanas/Productos/Productos.aspx" class="btn btn-warning">Ver productos</a>
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
            </div>
        </div>
    <div class="card sizeOptionsCard visually-hidden" id="CursosInscritos" style="--bs-card-border-width: 3px; --bs-card-border-color: rgb(0, 0, 0, .2);">
        <div class="card-body" align="center">
            <br />
            <table class="table CompraDetalle" id="TablaInscripciones">
                <thead>
                    <tr>
                        <th scope="row" colspan="2">Nombre</th>
                        <th scope="row">Fecha inscripcion</th>
                        <th scope="row">Acciones</th>
                    </tr>
                </thead>
                <tbody id="ContenidoCursosInscritos">
                </tbody>
            </table>
            <div id="SinCursos" align="center" class="visually-hidden">
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <h3>Usted no tiene cursos inscritos</h3>
                <a href="/Ventanas/Cursos/Cursos.aspx" class="btn btn-warning">Ver cursos</a>
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
            </div>
        </div>
    </div>
    <div class="card visually-hidden sizeOptionsCard" id="ModificarDatos" style="--bs-card-border-width: 3px; --bs-card-border-color: rgb(0, 0, 0, .2);">
        <div class="card-body">
            <div class="row">
                <div class="col-lg-12">
                    <a id="CerrarEditar" style="cursor:pointer">
                        <img src="/Imagenes/Iconos/CloseButtonBlack.png" height="35">
                    </a>
                </div>
            </div>
            <br />
            <div class="row">
                <div class="col-lg-4">
                    <label for="Nombre" class="form-label">Nombre</label>
                    <input class="form-control" id="EditarNombre" placeholder="Nombre">
                </div>
                <div class="col-lg-4">
                    <label for="Apellido" class="form-label">Apellido</label>
                    <input class="form-control" id="EditarApellido" placeholder="Apellido">
                </div>
                <div class="col-lg-4">
                    <label for="FechaNac" class="form-label">Fecha nacimiento</label>
                    <input type="date" class="form-control" id="EditarFechaNacimiento" required="required" placeholder="01/01/1999">
                </div>
            </div>
            <div class="row">
                <div class="col-lg-4">
                    <label for="Direccion" class="form-label">Direccion</label>
                    <input class="form-control" id="EditarDireccion" placeholder="1234 Nombre calle">
                </div>
                <div class="col-lg-4">
                    <label for="Email" class="form-label">Email</label>
                    <input type="email" class="form-control" id="EditarEmail" placeholder="EmailExample@gmail.com">
                </div>
                <div class="col-lg-4">
                    <label for="telefono" class="form-label">Telefono</label>
                    <input class="form-control isNumero" id="EditarNumero" maxlength="9" placeholder="9 9999 9999">
                </div>
            </div>
            <div class="row">
                <div class="col-lg-4">
                    <label for="Comuna" class="form-label">Comuna</label>
                    <select name="select" class="form-select"  id="cboComuna">

					</select>
                </div>
            </div>
            <br />
            <div class="col-12">
                <button class="btn btn-outline-warning" id="ConfirmCambios">Guardar Cambios</button>
            </div>
        </div>
    </div>
    <!-- blob a 64 -->
    <div class="visually-hidden">
        <input type="file" id="fileInput" />
        <h1>Blob a B64</h1>
        <button type="button" id="btnTob64" class="btn primary recortar">Convertir a Base 64</button>
        <button>B64 to Blob</button>
        <button id="btnToBlob" type="button" class="btn primary recortar">Convert to Blob</button>
        <img id="ImagenB64" src="" class="btn primary recortar" alt="Alternate Text" />
    </div>
    <!-- blob a 64 -->
    <br />
    <br />
    <br />
    <script type="text/javascript">
        var id_user = '<%= id_user %>';
        var fechaNacimiento = '<%= fechaNacimiento %>';
        var OptionSelectedSide = '<%= OptionSelectedSide %>';

        $(document).ready(function () {
            CargarInformacion()

            if (OptionSelectedSide != "") {
                if (OptionSelectedSide == "h") {
                    $('#Compras').removeClass("visually-hidden");

                    if (!$('#ModificarDatos').hasClass("visually-hidden")) {
                        $('#ModificarDatos').addClass('visually-hidden');
                    }

                    if (!$('#Favoritos').hasClass("visually-hidden")) {
                        $('#Favoritos').addClass('visually-hidden');
                    }

                    if (!$('#Pedidos').hasClass("visually-hidden")) {
                        $('#Pedidos').addClass('visually-hidden');
                    }

                    if (!$('#VerDatos').hasClass("visually-hidden")) {
                        $('#VerDatos').addClass('visually-hidden');
                    }

                    if (!$('#CursosInscritos').hasClass("visually-hidden")) {
                        $('#CursosInscritos').addClass('visually-hidden');
                    }

                    CargarCompras()
                }

                if (OptionSelectedSide == "f") {

                    $('#Favoritos').removeClass("visually-hidden");

                    if (!$('#ModificarDatos').hasClass("visually-hidden")) {
                        $('#ModificarDatos').addClass('visually-hidden');
                    }

                    if (!$('#Compras').hasClass("visually-hidden")) {
                        $('#Compras').addClass('visually-hidden');
                    }

                    if (!$('#Pedidos').hasClass("visually-hidden")) {
                        $('#Pedidos').addClass('visually-hidden');
                    }

                    if (!$('#VerDatos').hasClass("visually-hidden")) {
                        $('#VerDatos').addClass('visually-hidden');
                    }

                    if (!$('#CursosInscritos').hasClass("visually-hidden")) {
                        $('#CursosInscritos').addClass('visually-hidden');
                    }

                    cargarFavoritos()
                }

                if (OptionSelectedSide == "p") {

                    $('#Pedidos').removeClass("visually-hidden");

                    if (!$('#ModificarDatos').hasClass("visually-hidden")) {
                        $('#ModificarDatos').addClass('visually-hidden');
                    }

                    if (!$('#Compras').hasClass("visually-hidden")) {
                        $('#Compras').addClass('visually-hidden');
                    }

                    if (!$('#Favoritos').hasClass("visually-hidden")) {
                        $('#Favoritos').addClass('visually-hidden');
                    }

                    if (!$('#VerDatos').hasClass("visually-hidden")) {
                        $('#VerDatos').addClass('visually-hidden');
                    }

                    if (!$('#CursosInscritos').hasClass("visually-hidden")) {
                        $('#CursosInscritos').addClass('visually-hidden');
                    }

                    CargarPedidos()
                }

                if (OptionSelectedSide == "c") {

                    $('#CursosInscritos').removeClass("visually-hidden");

                    if (!$('#ModificarDatos').hasClass("visually-hidden")) {
                        $('#ModificarDatos').addClass('visually-hidden');
                    }

                    if (!$('#Compras').hasClass("visually-hidden")) {
                        $('#Compras').addClass('visually-hidden');
                    }

                    if (!$('#Favoritos').hasClass("visually-hidden")) {
                        $('#Favoritos').addClass('visually-hidden');
                    }

                    if (!$('#VerDatos').hasClass("visually-hidden")) {
                        $('#VerDatos').addClass('visually-hidden');
                    }

                    if (!$('#Pedidos').hasClass("visually-hidden")) {
                        $('#Pedidos').addClass('visually-hidden');
                    }

                    CargarCursosInscritos()
                }
            }

            $('#btnModificar').on('click', function () {
                $('#ModificarDatos').removeClass('visually-hidden');
                $('#VerDatos').addClass('visually-hidden');
            })

            $('#CerrarEditar').on('click', function () {
                $('#ModificarDatos').addClass('visually-hidden');
                $('#VerDatos').removeClass('visually-hidden');
            })

            $('#btnCompras').on('click', function () {
                $('#Compras').removeClass("visually-hidden");

                if (!$('#ModificarDatos').hasClass("visually-hidden")) {
                    $('#ModificarDatos').addClass('visually-hidden');
                }

                if (!$('#Favoritos').hasClass("visually-hidden")) {
                    $('#Favoritos').addClass('visually-hidden');
                }

                if (!$('#Pedidos').hasClass("visually-hidden")) {
                    $('#Pedidos').addClass('visually-hidden');
                }

                if (!$('#VerDatos').hasClass("visually-hidden")) {
                    $('#VerDatos').addClass('visually-hidden');
                }

                if (!$('#CursosInscritos').hasClass("visually-hidden")) {
                    $('#CursosInscritos').addClass('visually-hidden');
                }

                CargarCompras()
            })

            $('#btnPedidos').on('click', function () {
                $('#Pedidos').removeClass("visually-hidden");

                if (!$('#ModificarDatos').hasClass("visually-hidden")) {
                    $('#ModificarDatos').addClass('visually-hidden');
                }

                if (!$('#Compras').hasClass("visually-hidden")) {
                    $('#Compras').addClass('visually-hidden');
                }

                if (!$('#Favoritos').hasClass("visually-hidden")) {
                    $('#Favoritos').addClass('visually-hidden');
                }

                if (!$('#VerDatos').hasClass("visually-hidden")) {
                    $('#VerDatos').addClass('visually-hidden');
                }

                if (!$('#CursosInscritos').hasClass("visually-hidden")) {
                    $('#CursosInscritos').addClass('visually-hidden');
                }

                CargarPedidos()
            })

            $('#btnFavoritos').on('click', function () {
                $('#Favoritos').removeClass("visually-hidden");

                if (!$('#ModificarDatos').hasClass("visually-hidden")) {
                    $('#ModificarDatos').addClass('visually-hidden');
                }

                if (!$('#Compras').hasClass("visually-hidden")) {
                    $('#Compras').addClass('visually-hidden');
                }

                if (!$('#Pedidos').hasClass("visually-hidden")) {
                    $('#Pedidos').addClass('visually-hidden');
                }

                if (!$('#VerDatos').hasClass("visually-hidden")) {
                    $('#VerDatos').addClass('visually-hidden');
                }

                if (!$('#CursosInscritos').hasClass("visually-hidden")) {
                    $('#CursosInscritos').addClass('visually-hidden');
                }

                cargarFavoritos()
            })

            $('#btnVerDatos').on('click', function () {
                $('#VerDatos').removeClass("visually-hidden");

                if (!$('#ModificarDatos').hasClass("visually-hidden")) {
                    $('#ModificarDatos').addClass('visually-hidden');
                }

                if (!$('#Compras').hasClass("visually-hidden")) {
                    $('#Compras').addClass('visually-hidden');
                }

                if (!$('#Pedidos').hasClass("visually-hidden")) {
                    $('#Pedidos').addClass('visually-hidden');
                }

                if (!$('#Favoritos').hasClass("visually-hidden")) {
                    $('#Favoritos').addClass('visually-hidden');
                }

                if (!$('#CursosInscritos').hasClass("visually-hidden")) {
                    $('#CursosInscritos').addClass('visually-hidden');
                }
            })

            $('#btnCursosInscritos').on('click', function () {
                $('#CursosInscritos').removeClass("visually-hidden");

                if (!$('#ModificarDatos').hasClass("visually-hidden")) {
                    $('#ModificarDatos').addClass('visually-hidden');
                }

                if (!$('#Compras').hasClass("visually-hidden")) {
                    $('#Compras').addClass('visually-hidden');
                }

                if (!$('#Favoritos').hasClass("visually-hidden")) {
                    $('#Favoritos').addClass('visually-hidden');
                }

                if (!$('#VerDatos').hasClass("visually-hidden")) {
                    $('#VerDatos').addClass('visually-hidden');
                }

                if (!$('#Pedidos').hasClass("visually-hidden")) {
                    $('#Pedidos').addClass('visually-hidden');
                }

                CargarCursosInscritos()
            })

            $('#ConfirmCambios').on('click', function () {

                var fecnac = $('#EditarFechaNacimiento').val();
                var nombre = $('#EditarNombre').val();
                var apellido = $('#EditarApellido').val();
                var direccion = $('#EditarDireccion').val();
                var email = $('#EditarEmail').val();
                var numero = $('#EditarNumero').val();
                var comuna = $('#cboComuna').val();

                $.ajax({
                    type: 'POST',
                    cache: false,
                    url: '<%= ResolveUrl("/Ventanas/Cuenta/Cuenta.aspx/ActualizarDatos") %>',
                    contentType: 'application/json; charset=utf-8',
                    async: false,
                    dataType: 'json',
                    data: JSON.stringify({ 'nombre': nombre, 'apellido': apellido, 'fechanacimiento': fecnac, 'direccion': direccion, 'email': email, 'telefono': numero, 'comuna': comuna }),
                    success: function (data) {
                        Command: toastr["success"]("Los cambios se han realizado correctamentes")
                    },
                    error: function (data) {
                        alert("Algo ha salido mal!!!");
                    }
                });
            })

            $('#confirmDelete').on('click', function () {
                var id = $('#idInscripcion').text();
                $.ajax({
                    type: 'POST',
                    cache: false,
                    url: '<%= ResolveUrl("/Ventanas/Cuenta/Cuenta.aspx/EliminarInscripcion") %>',
                    contentType: 'application/json; charset=utf-8',
                    async: true,
                    dataType: 'json',
                    data: JSON.stringify({ 'id_inscripcion': id }),
                    success: function (data) {
                        if (data.d) {
                            Command: toastr["success"]("La inscripcion ha sido anulada correctamente")
                            CargarCursosInscritos()
                        }
                    },
                    error: function (data) {

                    }
                });
            });

            $('#enviarComentarioProductoPedido').on('click', function () {
                var id = $('#idProdPedido').text();
                var texto = $('#ComentarioProdPedido').val();
                var puntuacion = $('#puntuacionPedido').text()

                if (texto == "") {
                    Command: toastr["warning"]("Para enviar un comentario debe escribir que es lo que opina del producto")
                    return;
                }

                if (puntuacion == "0") {
                    Command: toastr["warning"]("Debe puntuar el produto en una escala de 1 a 5 estrellas")
                    return;
                }

                $.ajax({
                    type: 'POST',
                    cache: false,
                    url: '<%= ResolveUrl("/Ventanas/Cuenta/Cuenta.aspx/EnviarComentario") %>',
                    contentType: 'application/json; charset=utf-8',
                    async: false,
                    dataType: 'json',
                    data: JSON.stringify({ 'id_producto': id, 'texto': texto, 'puntuacion': puntuacion }),
                    success: function (data) {
                        if (data.d) {
                            Command: toastr["success"]("Su comentario ha sido enviado")

                            $('#DetallePedido').removeClass('visually-hidden')
                            $('#ComentarioProductoPedido').addClass('visually-hidden')
                        }
                    },
                    error: function (data) {
                        alert("Algo ha salido mal!!!");
                    }
                });
            })

            $('#enviarComentarioProductoCompra').on('click', function () {
                var id = $('#idProdCompra').text();
                var texto = $('#ComentarioProdCompra').val();
                var puntuacion = $('#puntuacionCompra').text()

                if (texto == "") {
                    Command: toastr["warning"]("Para enviar un comentario debe escribir que es lo que opina del producto")
                    return;
                }

                if (puntuacion == "0") {
                    Command: toastr["warning"]("Debe puntuar el produto en una escala de 1 a 5 estrellas")
                    return;
                }

                $.ajax({
                    type: 'POST',
                    cache: false,
                    url: '<%= ResolveUrl("/Ventanas/Cuenta/Cuenta.aspx/EnviarComentario") %>',
                    contentType: 'application/json; charset=utf-8',
                    async: false,
                    dataType: 'json',
                    data: JSON.stringify({ 'id_producto': id, 'texto': texto, 'puntuacion': puntuacion }),
                    success: function (data) {
                        if (data.d) {
                            Command: toastr["success"]("Su comentario ha sido enviado")

                            $('#DetalleCompra').removeClass('visually-hidden')
                            $('#ComentarioProductoCompra').addClass('visually-hidden')
                        }
                    },
                    error: function (data) {
                        alert("Algo ha salido mal!!!");
                    }
                });
            })

            let cropper = null;
            $("#btnTob64").on('submit', function (evt) {
                evt.preventDefault();
            });

            $("#cut").on('submit', function (evt) {
                evt.preventDefault();

                console.log($('#input-file').val())
            });
            $("#close").on('submit', function (evt) {
                evt.preventDefault();
            });
            $("#input-file").on('submit', function (evt) {
                evt.preventDefault();
            });
            $('#input-file').on('change', () => {
                let image = document.getElementById('img-cropper')
                let input = document.getElementById('input-file')

                let archivos = input.files
                let extensiones = input.value.substring(input.value.lastIndexOf('.'), input.value.lenght)


                if (!archivos || !archivos.length) {
                    image.src = "";
                    input.value = "";

                } else if (input.getAttribute('accept').split(',').indexOf(extensiones) < 0) {
                    alert('Debes seleccionar una imagen')
                    input.value = "";

                } else {
                    let imagenUrl = URL.createObjectURL(archivos[0])
                    image.src = imagenUrl

                    cropper = new Cropper(image, {
                        aspectRatio: 1, // es la proporción en la que queremos que recorte en este caso 1:1
                        preview: '.img-sample', // contenedor donde se va a ir viendo en tiempo real la imagen cortada
                        zoomable: false, //Para que no haga zoom 
                        viewMode: 1, //Para que no estire la imagen al contenedor
                        responsive: false, //Para que no reacomode con zoom la imagen al contenedor
                        dragMode: 'none', //Para que al arrastrar no haga nada
                        ready() { // metodo cuando cropper ya este activo, le ponemos el alto y el ancho del contenedor de cropper al 100%
                            document.querySelector('.cropper-container').style.width = '100%'
                            document.querySelector('.cropper-container').style.height = '100%'
                            document.querySelector('.cropper-container').style.border = '2px solid #000000'
                        }
                    })

                    $('.modalCrop').addClass('active')
                    $('.modal-content').addClass('active')

                    $('.modalCrop').removeClass('remove')
                    $('.modal-content').removeClass('remove')
                }
            })

            $('#close').on('click', () => {
                let image = document.getElementById('img-cropper')
                let input = document.getElementById('input-file')

                image.src = "";
                input.value = "";

                cropper.destroy()

                $('.modalCrop').addClass('remove')
                $('.modal-content').addClass('remove')

                $('.modalCrop').removeClass('active')
                $('.modal-content').removeClass('active')
            })

            $('#cut').on('click', () => {
                let crop_image = document.getElementById('#crop-image')
                let canva = cropper.getCroppedCanvas()
                let image = document.getElementById('#img-cropper')
                let input = document.getElementById('#input-file')

                canva.toBlob(function (blob) {
                    let url_cut = URL.createObjectURL(blob)
                    console.log("blob lol :" + url_cut)
                    $('#crop-image').attr("src", url_cut);
                })

                $('#img-cropper').attr("src", '');
                $('#input-file').val('')

                cropper.destroy()

                $('.modalCrop').addClass('remove')
                $('.modal-content').addClass('remove')

                $('.modalCrop').removeClass('active')
                $('.modal-content').removeClass('active')
            })
            const blobToBase64 = (blob) => {
                return new Promise((resolve, reject) => {
                    const reader = new FileReader();
                    reader.readAsDataURL(blob);
                    reader.onloadend = () => {
                        resolve(reader.result.split(',')[1]);
                        // "data:image/jpg;base64,    =sdCXDSAsadsadsa"
                    };
                });
            };

            const b64ToBlob = async (b64, type) => {
                const blob = await fetch(`data:${type};base64,${b64}`);
                return blob;
            };

            const fileInput = document.querySelector('#fileInput');
            const btnTob64 = document.querySelector('#btnTob64');
            const btnToBlob = document.querySelector('#btnToBlob');



            btnTob64.addEventListener('click', async (e) => {
                console.log(btnTob64.innerText);
                console.log('Convirtiendo mi blob');
                const myBlob = fileInput.files[0];
                const myB64 = await blobToBase64(myBlob);
                console.log("mi blob 2" + myBlob);
                document.getElementById("ImagenB64").src = "data:image/png; base64," + myB64;

            });

            btnToBlob.addEventListener('click', async (e) => {//data:image/png; base64,/9j/4AAQSk
                Console.Log(image.src.Split(",", 1))
            });
        });

        function CerrarComentarioPedido() {
            $('#DetallePedido').removeClass('visually-hidden')
            $('#ComentarioProductoPedido').addClass('visually-hidden')
        }

        function CerrarComentarioCompra() {
            $('#DetalleCompra').removeClass('visually-hidden')
            $('#ComentarioProductoCompra').addClass('visually-hidden')
        }

        function Eliminar(id) {
            $.ajax({
                type: 'POST',
                cache: false,
                url: '<%= ResolveUrl("/Ventanas/Cuenta/Cuenta.aspx/EliminarInscripcion") %>',
                contentType: 'application/json; charset=utf-8',
                async: true,
                dataType: 'json',
                data: JSON.stringify({ 'id_inscripcion': id }),
                success: function (data) {
                    if (data.d) {
                        Command: toastr["success"]("La inscripcion ha sido anulada correctamente")
                        CargarCursosInscritos()
                    }
                },
                error: function (data) {
                    alert("Algo ha salido mal!!!");
                }
            });
        }

        function CargarCursosInscritos() {
            $.ajax({
                type: 'POST',
                cache: false,
                url: '<%= ResolveUrl("/Ventanas/Cuenta/Cuenta.aspx/ObtenerCursosIncritos") %>',
                contentType: 'application/json; charset=utf-8',
                async: false,
                dataType: 'json',
                success: function (data) {
                    var html = "";

                    if (data.d != null) {

                        if (data.d.length > 0) {
                            $.each(data.d, function (i, val) {

                                var buttons = "";

                                buttons += '<a style="cursor: pointer" onclick="Eliminar(' + val.id_Inscripcion + ')" data-title="Anular inscripcio"  data-bs-toggle="modal" data-bs-target="#modalEliminar"><img src="/Imagenes/Iconos/btnDeleteitem.png" height="25" width="25"/></a><span> </span>';

                                buttons += '<a href="/Ventanas/Cursos/DetalleCurso.aspx?uid=' + val.id_curso + '" data-title="Ver curso"><img src="/Imagenes/Iconos/CursosBlack.png" height="25" width="25" /></a>';

                                html += '<tr id="' + val.id_Inscripcion + '">' +
                                    '<td colspan="2">' + val.nombre_curso + '</td>' +
                                    '<td scope="row" >' + val.fecha_inscripcion + '</td>' +
                                    '<td scope="row" >' + buttons + '</td>' +
                                    '</tr>';
                            });

                            $('#ContenidoCursosInscritos').html(html);
                        }
                        else {
                            $('#SinCursos').removeClass('visually-hidden');
                            $('#TablaInscripciones').addClass('visually-hidden');
                        }


                    }
                },
                error: function (data) {
                    alert("Algo ha salido mal!!!");
                }
            });
        }

        function CargarInformacion() {
            CargarComuna()
            $.ajax({
                type: 'POST',
                cache: false,
                url: '<%= ResolveUrl("/Ventanas/Cuenta/Cuenta.aspx/ObteneDatosUsuario") %>',
                contentType: 'application/json; charset=utf-8',
                async: false,
                dataType: 'json',
                success: function (data) {
                    if (data.d != null) {
                        $('#verNombre').text(data.d.nombre);
                        $('#verApelido').text(data.d.apellido);
                        $('#verFechaNacimiento').text(fechaNacimiento);
                        $('#verDireccion').text(data.d.direccion);
                        $('#verEmail').text(data.d.email);
                        $('#verNumero').text(data.d.telefono);

                        $('#EditarFechaNacimiento').val(fechaNacimiento);
                        $('#EditarNombre').val(data.d.nombre);
                        $('#EditarApellido').val(data.d.apellido);
                        $('#EditarDireccion').val(data.d.direccion);
                        $('#EditarEmail').val(data.d.email);
                        $('#EditarNumero').val(data.d.telefono);

                        $("#cboComuna option[value=" + data.d.id_comuna + "]").attr("selected", true);
                    }
                },
                error: function (data) {
                    alert("Algo ha salido mal!!!");
                }
            });
        }

        function cargarFavoritos() {
            $.ajax({
                type: 'POST',
                cache: false,
                url: '<%= ResolveUrl("/Ventanas/Cuenta/Cuenta.aspx/obtenerFavoritos") %>',
                contentType: 'application/json; charset=utf-8',
                async: true,
                dataType: 'json',
                success: function (data) {

                    var html = "";

                    if (data.d.length > 0) {

                        $.each(data.d, function (i, val) {
                            html += '<div class="col-lg-3 tarjNovedad">' +
                                '<br/>' +
                                '<div class="card" style="width: 90%;">' +
                                '<a style="cursor: pointer" href="/Ventanas/Productos/DetalleProducto?prod=' + val.id_producto + '">' +
                                '<div class="contenedor">' +
                                '<img src="' + val.URL_img + '" class="card-img-top imagen">' +
                                '</div>' +
                                '</a>' +
                                '<div align="center">' +
                                '<div class="card-body">' +
                                '<div class="row">' +
                                '<div class="col-lg-12">' +
                                '<span class="titulo name">' + val.nombre_producto + '</span>' +
                                '</div>' +
                                '<div class="col-lg-12">' +
                                '<span><a style="cursor: pointer" data-title="Eliminar de favoritos" onclick="quitar(' + val.id_producto + ')"><img src="/Imagenes/Iconos/btnDeleteitem.png" width="25"></a></span>' +
                                '</div>' +
                                '</div>' +
                                '</div>' +
                                '</div>' +
                                '</div>' +
                                '</div>';
                        });

                        $('#tablaFavoritos').html(html);
                    }
                    else {
                        $('#SinFvoritos').removeClass('visually-hidden');
                        $('#tablaFavoritos').addClass('visually-hidden');
                    }
                },
                error: function (data) {
                    alert("Algo ha salido mal!!!");
                }
            });
        }

        function quitar(idprod) {
            $.ajax({
                type: 'POST',
                cache: false,
                url: '<%= ResolveUrl("/Ventanas/Cuenta/Cuenta.aspx/QuitarFavorito") %>',
                contentType: 'application/json; charset=utf-8',
                async: true,
                dataType: 'json',
                data: JSON.stringify({ 'id_producto': idprod }),
                success: function (data) {
                    if (data.d) {
                        Command: toastr["success"]("El producto se ha eliminado favoritos")
                        cargarFavoritos()
                    }
                },
                error: function (data) {
                    alert("Algo ha salido mal!!!");
                }
            });
        }

        function CargarPedidos() {
            $.ajax({
                type: 'POST',
                cache: false,
                url: '<%= ResolveUrl("/Ventanas/Cuenta/Cuenta.aspx/ObtenerPedidos") %>',
                contentType: 'application/json; charset=utf-8',
                async: false,
                dataType: 'json',
                success: function (data) {
                    var html = "";

                    if (data.d != null) {

                        if (data.d.length > 0) {
                            $.each(data.d, function (i, val) {

                                html += '<div class="col-lg-12 itemList">' +
                                    '<div class="card" onclick="ObtenerDetallePedido(' + val.id_pedido + ')">' +
                                    '<div class="card-body">' +
                                    '<span> N° pedido: ' + val.id_pedido + ', ' + val.fecha_creacion + ', $ ' + val.total + ' </span>' +
                                    '</div>' +
                                    '</div>' +
                                    '</div>'
                            });

                            $('#ListaPedidos').html(html);
                        }
                        else {
                            $('#SinPedidos').removeClass('visually-hidden');
                            $('#TablaPedidos').addClass('visually-hidden');
                        }


                    }
                },
                error: function (data) {
                    alert("Algo ha salido mal!!!");
                }
            });
        }

        function CargarCompras() {
            $.ajax({
                type: 'POST',
                cache: false,
                url: '<%= ResolveUrl("/Ventanas/Cuenta/Cuenta.aspx/ObtenerCompras") %>',
                contentType: 'application/json; charset=utf-8',
                async: false,
                dataType: 'json',
                success: function (data) {
                    var html = "";

                    if (data.d != null) {

                        if (data.d.length > 0) {
                            $.each(data.d, function (i, val) {

                                html += '<div class="col-lg-12 itemList">' +
                                    '<div class="card" onclick="ObtenerDetalleCompra(' + val.id_pedido + ')">' +
                                    '<div class="card-body">' +
                                    '<span> N° pedido: ' + val.id_pedido + ', ' + val.fecha_creacion + ', $ ' + val.total + ' </span>' +
                                    '</div>' +
                                    '</div>' +
                                    '</div>'
                            });

                            $('#ListaCompras').html(html);
                        }
                        else {
                            $('#SinCompras').removeClass('visually-hidden');
                            $('#TablaCompreas').addClass('visually-hidden');
                        }


                    }
                },
                error: function (data) {
                    alert("Algo ha salido mal!!!");
                }
            });
        }

        function ObtenerDetallePedido(idPedido) {
            $.ajax({
                type: 'POST',
                cache: false,
                url: '<%= ResolveUrl("/Ventanas/Cuenta/Cuenta.aspx/ObtenerPedido") %>',
                contentType: 'application/json; charset=utf-8',
                async: true,
                dataType: 'json',
                data: JSON.stringify({ 'id_pedido': idPedido }),
                success: function (data) {
                    if (data.d != null) {
                        $('#nroPedido').text(data.d.id_pedido);
                        $('#nombreReceptor').text(data.d.nombre_receptor);
                        $('#fechaCompra').text(data.d.fecha_creacion);
                        $('#pagoTotal').text(data.d.total);
                        $('#direccion').text(data.d.direccion_envio);

                        var html = "";

                        

                        $.each(data.d.DetallePedido, function (i, val) {
                            var nom = "'" + val.nombre_producto + "'";

                            html += '<td colspan="2">' + val.nombre_producto + '</td>' +
                                '<td scope="row">' + val.cantidad + '</td>' +
                                '<td scope="row" >$ ' + val.precio_producto + '</td>' +
                                '<td scope="row" >$ ' + val.total_detalle + '</td>' +
                                '<td scope="row" ><a data-title="Ver producto" href="/Ventanas/Productos/DetalleProducto.aspx?prod=' + val.id_producto + '"><img src="/Imagenes/Iconos/ProductosBlack.png" height="40" /></a><span> </span><a onclick="ComentarProductoPedido(' + val.id_producto + ',  ' + nom + ')" style="cursor:pointer" data-title="Comentar"><img src="/Imagenes/Iconos/Comentario.png" height="30" /></a></td>' +
                                '</tr>';
                                    '<td scope="row" >$ ' + val.precio_producto + '</td>' +
                                    '<td scope="row" >$ ' + val.total_detalle + '</td>' +
                                '<td scope="row" ><a data-title="Ver producto" href="/Ventanas/Productos/DetalleProducto.aspx?prod=' + val.id_producto + '"><img src="/Imagenes/Iconos/ProductosBlack.png" height="40" /></a></td>' +
                                    '</tr>';
                        });

                        $('#ContenidoTablcompraDetalle').html(html);

                        if (data.d.estado == 1) {
                            $('#preparacion').removeClass('visually-hidden');
                            $('#entrega').addClass('visually-hidden');
                            $('#camino').addClass('visually-hidden');
                            $('#entregado').addClass('visually-hidden');
                        }

                        if (data.d.estado == 2) {
                            $('#preparacion').addClass('visually-hidden');
                            $('#entrega').removeClass('visually-hidden');
                        }

                        if (data.d.estado == 3) {
                            $('#preparacion').addClass('visually-hidden');
                            $('#camino').removeClass('visually-hidden');
                        }

                        if (data.d.estado == 4) {
                            $('#preparacion').addClass('visually-hidden');
                            $('#entregado').removeClass('visually-hidden');
                        }

                        if (!$('#defaultPedidos').hasClass("visually-hidden")) {
                            $('#defaultPedidos').addClass('visually-hidden');
                        }

                        if ($('#DetallePedido').hasClass("visually-hidden")) {
                            $('#DetallePedido').removeClass('visually-hidden');
                        }
                    }
                },
                error: function (data) {
                    alert("Algo ha salido mal!!!");
                }
            });
        }


        function ObtenerDetalleCompra(idPedido) {
            $.ajax({
                type: 'POST',
                cache: false,
                url: '<%= ResolveUrl("/Ventanas/Cuenta/Cuenta.aspx/ObtenerPedido") %>',
                contentType: 'application/json; charset=utf-8',
                async: true,
                dataType: 'json',
                data: JSON.stringify({ 'id_pedido': idPedido }),
                success: function (data) {
                    if (data.d != null) {
                        $('#nroCompra').text(data.d.id_pedido);
                        $('#nombreReceptorCompra').text(data.d.nombre_receptor);
                        $('#fechaCompra').text(data.d.fecha_creacion);
                        $('#pagoTotalCompra').text(data.d.total);
                        $('#direccionCompra').text(data.d.direccion_envio);

                        var html = "";

                        $.each(data.d.DetallePedido, function (i, val) {

                            html += '<tr id="' + val.id_producto + '">' +
                                '<td colspan="2">' + val.nombre_producto + '</td>' +
                                '<td scope="row">' + val.cantidad + '</td>' +
                                '<td scope="row" >$ ' + val.precio_producto + '</td>' +
                                '<td scope="row" >$ ' + val.total_detalle + '</td>' +
                                '<td scope="row" ><a data-title="Ver producto" href="/Ventanas/Productos/DetalleProducto.aspx?prod=' + val.id_producto + '"><img src="/Imagenes/Iconos/ProductosBlack.png" height="40" /></a><span> </span><a style="cursor:pointer" data-title="Comentar"><img src="/Imagenes/Iconos/ComentarioBLack.png" height="30" /></a></td>' +
                                '</tr>';
                        });


                        if (!$('#defaultCompras').hasClass("visually-hidden")) {
                            $('#defaultCompras').addClass('visually-hidden');
                        }

                        if ($('#DetalleCompra').hasClass("visually-hidden")) {
                            $('#DetalleCompra').removeClass('visually-hidden');
                        }

                        $('#ContenidoTablHistorialcompraDetalle').html(html);
                    }
                },
                error: function (data) {
                    alert("Algo ha salido mal!!!");
                }
            });
        }


        function ObtenerDetalleCompra(idPedido) {
            $.ajax({
                type: 'POST',
                cache: false,
                url: '<%= ResolveUrl("/Ventanas/Cuenta/Cuenta.aspx/ObtenerPedido") %>',
                contentType: 'application/json; charset=utf-8',
                async: true,
                dataType: 'json',
                data: JSON.stringify({ 'id_pedido': idPedido }),
                success: function (data) {
                    if (data.d != null) {
                        $('#nroCompra').text(data.d.id_pedido);
                        $('#nombreReceptorCompra').text(data.d.nombre_receptor);
                        $('#fechaCompra').text(data.d.fecha_creacion);
                        $('#pagoTotalCompra').text(data.d.total);
                        $('#direccionCompra').text(data.d.direccion_envio);

                        var html = "";

                        $.each(data.d.DetallePedido, function (i, val) {

                            var nom = "'" + val.nombre_producto + "'";

                            html += '<tr id="' + val.id_producto + '">' +
                                '<td colspan="2">' + val.nombre_producto + '</td>' +
                                '<td scope="row">' + val.cantidad + '</td>' +
                                '<td scope="row" >$ ' + val.precio_producto + '</td>' +
                                '<td scope="row" >$ ' + val.total_detalle + '</td>' +
                                '<td scope="row" ><a data-title="Ver producto" href="/Ventanas/Productos/DetalleProducto.aspx?prod=' + val.id_producto + '"><img src="/Imagenes/Iconos/ProductosBlack.png" height="40" /></a><span> </span><a  onclick="ComentarProductoCompra(' + val.id_producto + ',  ' + nom + ')" class="comentario" style="cursor:pointer" data-title="Comentar"><img src="/Imagenes/Iconos/ComentarioBLack.png" height="30" /></a></td>' +
                                '</tr>';
                        });


                        if (!$('#defaultCompras').hasClass("visually-hidden")) {
                            $('#defaultCompras').addClass('visually-hidden');
                        }

                        if ($('#DetalleCompra').hasClass("visually-hidden")) {
                            $('#DetalleCompra').removeClass('visually-hidden');
                        }

                        $('#ContenidoTablHistorialcompraDetalle').html(html);
                    }
                },
                error: function (data) {
                    alert("Algo ha salido mal!!!");
                }
            });
        }

        function ComentarProductoPedido(id, nom) {
            $('#puntuacionPedido').text(0)
            $('#ComentarioProdPedido').val('')

            $('#OneStarPedido').attr('src', '/Imagenes/Iconos/FavOff.png');
            $('#TwoStarPedido').attr('src', '/Imagenes/Iconos/FavOff.png');
            $('#ThreeStarPedido').attr('src', '/Imagenes/Iconos/FavOff.png');
            $('#FourStarPedido').attr('src', '/Imagenes/Iconos/FavOff.png');
            $('#FiveStarPedido').attr('src', '/Imagenes/Iconos/FavOff.png');

            $('#DetallePedido').addClass('visually-hidden')
            $('#ComentarioProductoPedido').removeClass('visually-hidden')

            $('#idProdPedido').text(id);
            $('#nomProdPedido').text(nom);
        }

        function PuntuarProdPedido(puntuacion) {

            if (puntuacion == 1) {
                $('#OneStarPedido').attr('src', '/Imagenes/Iconos/FavOn.png');
                $('#TwoStarPedido').attr('src', '/Imagenes/Iconos/FavOff.png');
                $('#ThreeStarPedido').attr('src', '/Imagenes/Iconos/FavOff.png');
                $('#FourStarPedido').attr('src', '/Imagenes/Iconos/FavOff.png');
                $('#FiveStarPedido').attr('src', '/Imagenes/Iconos/FavOff.png');
            }
            if (puntuacion == 2) {
                $('#OneStarPedido').attr('src', '/Imagenes/Iconos/FavOn.png');
                $('#TwoStarPedido').attr('src', '/Imagenes/Iconos/FavOn.png');
                $('#ThreeStarPedido').attr('src', '/Imagenes/Iconos/FavOff.png');
                $('#FourStarPedido').attr('src', '/Imagenes/Iconos/FavOff.png');
                $('#FiveStarPedido').attr('src', '/Imagenes/Iconos/FavOff.png');
            }
            if (puntuacion == 3) {
                $('#OneStarPedido').attr('src', '/Imagenes/Iconos/FavOn.png');
                $('#TwoStarPedido').attr('src', '/Imagenes/Iconos/FavOn.png');
                $('#ThreeStarPedido').attr('src', '/Imagenes/Iconos/FavOn.png');
                $('#FourStarPedido').attr('src', '/Imagenes/Iconos/FavOff.png');
                $('#FiveStarPedido').attr('src', '/Imagenes/Iconos/FavOff.png');
            }
            if (puntuacion == 4) {
                $('#OneStarPedido').attr('src', '/Imagenes/Iconos/FavOn.png');
                $('#TwoStarPedido').attr('src', '/Imagenes/Iconos/FavOn.png');
                $('#ThreeStarPedido').attr('src', '/Imagenes/Iconos/FavOn.png');
                $('#FourStarPedido').attr('src', '/Imagenes/Iconos/FavOn.png');
                $('#FiveStarPedido').attr('src', '/Imagenes/Iconos/FavOff.png');
            }
            if (puntuacion == 5) {
                $('#OneStarPedido').attr('src', '/Imagenes/Iconos/FavOn.png');
                $('#TwoStarPedido').attr('src', '/Imagenes/Iconos/FavOn.png');
                $('#ThreeStarPedido').attr('src', '/Imagenes/Iconos/FavOn.png');
                $('#FourStarPedido').attr('src', '/Imagenes/Iconos/FavOn.png');
                $('#FiveStarPedido').attr('src', '/Imagenes/Iconos/FavOn.png');
            }

            $('#puntuacionPedido').text(puntuacion);
        }

        function ComentarProductoCompra(id, nom) {
            $('#puntuacionCompra').text(0)
            $('#ComentarioProdCompra').val('')

            $('#OneStarCompra').attr('src', '/Imagenes/Iconos/FavOff.png');
            $('#TwoStarCompra').attr('src', '/Imagenes/Iconos/FavOff.png');
            $('#ThreeStarCompra').attr('src', '/Imagenes/Iconos/FavOff.png');
            $('#FourStarCompra').attr('src', '/Imagenes/Iconos/FavOff.png');
            $('#FiveStarCompra').attr('src', '/Imagenes/Iconos/FavOff.png');

            $('#DetalleCompra').addClass('visually-hidden')
            $('#ComentarioProductoCompra').removeClass('visually-hidden')

            $('#idProdCompra').text(id);
            $('#nomProdCompra').text(nom);
        }

        function PuntuarProdCompra(puntuacion) {

            if (puntuacion == 1) {
                $('#OneStarCompra').attr('src', '/Imagenes/Iconos/FavOn.png');
                $('#TwoStarCompra').attr('src', '/Imagenes/Iconos/FavOff.png');
                $('#ThreeStarCompra').attr('src', '/Imagenes/Iconos/FavOff.png');
                $('#FourStarCompra').attr('src', '/Imagenes/Iconos/FavOff.png');
                $('#FiveStarCompra').attr('src', '/Imagenes/Iconos/FavOff.png');
            }
            if (puntuacion == 2) {
                $('#OneStarCompra').attr('src', '/Imagenes/Iconos/FavOn.png');
                $('#TwoStarCompra').attr('src', '/Imagenes/Iconos/FavOn.png');
                $('#ThreeStarCompra').attr('src', '/Imagenes/Iconos/FavOff.png');
                $('#FourStarCompra').attr('src', '/Imagenes/Iconos/FavOff.png');
                $('#FiveStarCompra').attr('src', '/Imagenes/Iconos/FavOff.png');
            }
            if (puntuacion == 3) {
                $('#OneStarCompra').attr('src', '/Imagenes/Iconos/FavOn.png');
                $('#TwoStarCompra').attr('src', '/Imagenes/Iconos/FavOn.png');
                $('#ThreeStarCompra').attr('src', '/Imagenes/Iconos/FavOn.png');
                $('#FourStarCompra').attr('src', '/Imagenes/Iconos/FavOff.png');
                $('#FiveStarCompra').attr('src', '/Imagenes/Iconos/FavOff.png');
            }
            if (puntuacion == 4) {
                $('#OneStarCompra').attr('src', '/Imagenes/Iconos/FavOn.png');
                $('#TwoStarCompra').attr('src', '/Imagenes/Iconos/FavOn.png');
                $('#ThreeStarCompra').attr('src', '/Imagenes/Iconos/FavOn.png');
                $('#FourStarCompra').attr('src', '/Imagenes/Iconos/FavOn.png');
                $('#FiveStarCompra').attr('src', '/Imagenes/Iconos/FavOff.png');
            }
            if (puntuacion == 5) {
                $('#OneStarCompra').attr('src', '/Imagenes/Iconos/FavOn.png');
                $('#TwoStarCompra').attr('src', '/Imagenes/Iconos/FavOn.png');
                $('#ThreeStarCompra').attr('src', '/Imagenes/Iconos/FavOn.png');
                $('#FourStarCompra').attr('src', '/Imagenes/Iconos/FavOn.png');
                $('#FiveStarCompra').attr('src', '/Imagenes/Iconos/FavOn.png');
            }

            $('#puntuacionCompra').text(puntuacion);
        }

        function CargarComuna() {
            $.ajax({
                type: 'POST',
                cache: false,
                url: '<%= ResolveUrl("/Login/Login.aspx/ObtenerComunas") %>',
                contentType: 'application/json; charset=utf-8',
                async: false,
                dataType: 'json',
                success: function (data) {

                    var html = "";

                    if (data.d != null) {
                        html += "<option value='0'>Seleccione...</option>";
                        $.each(data.d, function (i, val) {
                            html += "<option value='" + val.id_comuna + "'>" + val.nombre_comuna + ", " + val.nombre_region + "</option>";
                        });

                        $('#cboComuna').html(html);
                    }
                },
                error: function (data) {
                    alert("Algo ha salido mal!!!");
                }
            });
                }
    </script>
</asp:Content>
