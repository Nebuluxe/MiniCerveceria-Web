<%@ page Title="Carrito" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CarritoCompras.aspx.cs" Inherits="MiniCerveceria.CarritoCompras.CarritoCompras" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
	<style>
		.FormCursoExterno{
			background:#000000;
			color: #ffffff;
			border-radius: 15px;
		}

		.FormCursoInterno{
			background:#ffffff;
			color: #000000;
			border-radius: 15px;
		}

		.CompraDetalle{
			color:#ffffff
		}

		.carritoImg{
			visibility: hidden;
		}

		header.masthead{
			height: 350px;
			background-image: linear-gradient(rgba(0, 0, 0, .5), rgba(0, 0, 0, .5)), url("/Imagenes/CarrouselHome1.jpg");
		}

		.headContent{
			display: none
		}

		#SideMenuMantenedor {
			display: none;
		}

		#MantenedorNav{
			display: none;
		}
		.table > :not(caption) > * > * {
			color: #ffffff;
		}
	</style>
	<br /><br /><br />
	<div class="card FormCursoExterno">
		<div class="card-body">
			<div id="CartaCarrito" class="row">
				<div class="col-lg-8">
					<div class="row" style="margin-bottom:10px;">
						<div class="col-lg-6">
							<a runat="server" href="~/Default.aspx" style="text-decoration:none;color:#ffffff;"> 
								<img id="imgButtonBack" src="/Imagenes/Iconos/BackButtonWithe.png" height="40">
								Volver Atrás
							</a>
						</div>
						<div id="VaciarCarrito" class="col-lg-6" style="text-align:right; cursor:pointer">
							<a onclick="EliminarCarrito()" style="text-decoration:none;color:#ffffff;" > 
								Vaciar Carrito 
								<img src="/Imagenes/Iconos/BasureroWhite.png" height="35">
							</a>
							<input id="hdnIdCarrito" type="hidden" />
						</div>
					</div>
					<table class="table">
						<thead id="HeaderCarrito">
						<tr>
							<th scope="row" colspan="2">Productos</th>
							<th scope="row">Cantidad</th>
							<th scope="row">Precio Unitario</th>
							<th scope="row">Precio Total</th>
							<th scope="row"><span></span></th>
						</tr>
						</thead>
						<tbody id="CompraDetalle">
						</tbody>
					</table>
				</div>
				<div id="CartaMontos" class="col-lg-4">
					<div class="card FormCursoInterno" style="width: 100%; height: 100%">
						<div class="card-body">
							<strong class="titulo" style="font-size:1.9em; color: #000000; text-align:center">Montos</strong>
							<div class="card" style="background: #000000; color: #ffffff">
								<div class="card-body">
									<label style="font-size: 20px;margin-right:10px;"><strong>SubTotal:</strong></label>  $<label ID="lblSubTotal" style="font-size: 17px;">0</label>
								</div>
								<div class="card-body">
									<label style="font-size: 20px;margin-right:10px;"><strong>Totales:</strong></label>  $<label ID="lblTotal" style="font-size: 17px;">0</label>
								</div>
							</div>
							<div class="d-grid gap-2" style="margin-top: 30px;margin-bottom: 10px;">
								<a id="ContinuarCompra" class="btn btn-warning">Continuar con la Compra</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<br />
	<div class="card FormCursoExterno visually-hidden" id="ContentDireccionyCompra">
		<br />
		<div class="card-body" style="padding: 0px; margin-left: 16px; margin-right: 16px;margin-bottom: 16px;">
			<div class="row">
				<div class="col-lg-9">
					<div class="row">
						<div class="col-lg-12">
							<div class="row">
								<div class="col-lg-9">
									<a href="#" id="CloseDirecEnvioYpago" style="text-decoration:none;"> 
										<img id="btnContinueCompra" src="/Imagenes/Iconos/CloseButtonWithe.png" height="35" style="margin-bottom:10px;">
									</a>
									<strong class="titulo" style="font-size:1.9em; color: #ffffff; text-align:center">Dirección de Envío</strong>
								</div>
							</div>
							<br />
							<div class="row">
								<div class="col-lg-6">
									<input type="text" id="txtNombre" class="form-control" placeholder="Nombre"/>
								</div>
								<div class="col-lg-6">
									<input type="text" id="txtApellido" class="form-control" placeholder="Apellido"/>
								</div>
							</div>
							<div class="row">
								<div class="col-lg-4">
									<br />
									<input type="text" id="txtDireccion" class="form-control" placeholder="Direccion"/>
								</div>
								<div class="col-lg-4">
									<br />
									<input type="text" id="txtNumeroDomicilio" class="form-control" placeholder="Numero de casa/depto"/>
								</div>
								<div class="col-lg-4">
									<br />
									<input type="text" id="txtRegion" class="form-control" placeholder="Region"/>
								</div>
								<div class="col-lg-4">
									<br />
									<input type="text" id="txtComuna" class="form-control" placeholder="Comuna"/>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-3">
					<br />
					<div class="card FormCursoInterno" style="width: 100%; height: 80%">
						<div class="card-body">
							<center>
								<img src="/Imagenes/Banner-WebPay.png" height="80">
							</center>
							<div class="d-grid gap-2" style="margin-top: 10px;margin-bottom: 10px;">
								<button class="btn btn-warning" type="button" onclick="CrearPedido()">Pagar</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<br /><br /><br /><br /><br /><br /><br /><br /><br />
	<script>
		$(document).ready(function () {
			cargarCarritoCompra();
			$('#ContinuarCompra').on('click', function () {
				$('#ContentDireccionyCompra').removeClass('visually-hidden');
				$('#ContinuarCompra').addClass('visually-hidden');
			})

			$('#CloseDirecEnvioYpago').on('click', function () {
				$('#ContentDireccionyCompra').addClass('visually-hidden');
				$('#ContinuarCompra').removeClass('visually-hidden');
			})
		});

        function cargarCarritoCompra() {
            $.ajax({
                type: 'POST',
                cache: false,
                url: '<%= ResolveUrl("/CarritoCompras/CarritoCompras.aspx/ObtenerCarritoCompra") %>',
                contentType: 'application/json; charset=utf-8',
                async: false,
                dataType: 'json',
				success: function (data) {
					if (data.d.length > 0) {
						var html = "";
						var SubTotal = 0;
						$.each(data.d, function (i, val) {
							id_carrito = val.id_carrito;
                            html += "<tr>" +
										"<td colspan='2'>" + val.nombre_producto + "</td>" +
										"<td scope='row'>" +
												"<a class='ReducirCantidad' onclick='ReducirCantidadProducto(" + val.id_producto + ")'  style='cursor: pointer'>" +
												"<img src='/Imagenes/Iconos/btnRestWithe.png' height='20' width='20' />" +
											"</a>" +
											"<label class='CantidadProducto' style='font-size: 17px;margin-left:5px;margin-right:5px;'>" + val.cantidad + "</label>" +
												"<a class='AumentarCantidad' onclick='AgregarCantidadProducto(" + val.id_producto + ")'  style='cursor: pointer'>" +
												"<img src='/Imagenes/Iconos/btnSumWithe.png' height='20' width='20' />" +
											"</a>" +
										"</td>" +
										"<td scope='row'>$" + val.precio_producto + "</td>" +
										"<td>$" + val.total_detalle + "</td>" +
										"<td scope='row'><a style='cursor: pointer' class='EliminarProducto' onclick='EliminarLineaCarrito(" + val.id_producto + ")'><img src='/Imagenes/Iconos/btnDeleteitem.png' height='20' width='20' /></a></td>" +
									"</tr>";
                            SubTotal += val.total_detalle;
							$("#CompraDetalle").html(html);
                        });
                        $("#hdnIdCarrito").val(id_carrito);
                        $("#lblSubTotal").text(SubTotal);
                        $("#lblTotal").text(SubTotal);
					} else {
                        $("#VaciarCarrito").css('display', 'none');
                        $("#CartaMontos").css('display', 'none');
                        $(".table").css('display', 'none');
                        html = "<div class='row' style='text-align:center;'><h3>Usted no tiene productos agregados al carrito de compras.</h3><center><a href='/Ventanas/Productos/Productos.aspx' class='btn btn-warning col-lg-2'>Ver productos</a></center></div>";
						$("#CartaCarrito").append(html);
                    }
                },
                error: function (data) {
                    alert("Algo ha salido mal!!!");
                }
            });
		}

        function AgregarCantidadProducto(id_producto) {
            $.ajax({
                type: 'POST',
                cache: false,
                url: '<%= ResolveUrl("/CarritoCompras/CarritoCompras.aspx/AgregarCantidadProducto") %>',
				contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                data: JSON.stringify({ 'id_producto': id_producto }),
                async: false,
                success: function (data) {
                    if (data.d == true) {
                        cargarCarritoCompra();
                    }
                },
                error: function (data) {
                    alert("Algo ha salido mal!!!");
                }
            });
		}

        function ReducirCantidadProducto(id_producto) {
            $.ajax({
                type: 'POST',
                cache: false,
                url: '<%= ResolveUrl("/CarritoCompras/CarritoCompras.aspx/ReducirCantidadProducto") %>',
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                data: JSON.stringify({ 'id_producto': id_producto }),
                async: false,
                success: function (data) {
                    if (data.d == true) {
                        cargarCarritoCompra();
                    }
                },
                error: function (data) {
                    alert("Algo ha salido mal!!!");
                }
            });
		}

        function EliminarLineaCarrito(id_producto) {
            $.ajax({
                type: 'POST',
                cache: false,
                url: '<%= ResolveUrl("/CarritoCompras/CarritoCompras.aspx/EliminarLinea") %>',
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                data: JSON.stringify({ 'id_producto': id_producto }),
                async: false,
                success: function (data) {
                    if (data.d == true) {
                        Command: toastr["success"]("El producto se ha eliminado del carrito")
                        cargarCarritoCompra();
                    }
                },
                error: function (data) {
                    alert("Algo ha salido mal!!!");
                }
            });
		}

		function EliminarCarrito() {
            var id_carrito = $("#hdnIdCarrito").val();
            $.ajax({
                type: 'POST',
                cache: false,
                url: '<%= ResolveUrl("/CarritoCompras/CarritoCompras.aspx/EliminarCarrito") %>',
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                data: JSON.stringify({ 'id_carrito': id_carrito }),
                async: false,
                success: function (data) {
                    if (data.d == true) {
                        Command: toastr["success"]("Se ha eliminado el carrito de compras")
                        cargarCarritoCompra();
                    }
                },
                error: function (data) {
                    alert("Algo ha salido mal!!!");
                }
            });
		} 

		function CrearPedido() {
			
            var direccion_envio = "" + $("#txtDireccion").val().trim() + ", " + $("#txtNumeroDomicilio").val().trim() + ", " + $("#txtComuna").val().trim() + ", " + $("#txtRegion").val().trim() + "";
			var costo_envio = 10000;
            var subtotal = $("#lblSubTotal").text();
			var total = $("#lblTotal").text();
			var nombre_receptor = "" + $("#txtNombre").val().trim() + " " + $("#txtApellido").val().trim() + "";
            console.log(direccion_envio); console.log(costo_envio); console.log(subtotal); console.log(total); console.log(nombre_receptor);
            $.ajax({
                type: 'POST',
                cache: false,
                url: '<%= ResolveUrl("/CarritoCompras/CarritoCompras.aspx/CrearPedido") %>',
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                data: JSON.stringify({
                    'direccion_envio': direccion_envio.trim(), 'costo_envio': costo_envio, 'subtotal': subtotal, 'total': total, 'nombre_receptor': nombre_receptor.trim(), 'estado':1
					}),
                async: false,
                success: function (data) {
                    if (data.d != 0) {
                        console.log("Se creó pedido");
                        CrearDetallePedido(data.d);
                    } else {
                        console.log("No se eliminó el carrito");
                    }
                },
                error: function (data) {
                    alert("Algo ha salido mal!!!");
                }
            });
		} 
        function CrearDetallePedido(id_pedido) {
            $.ajax({
                type: 'POST',
                cache: false,
                url: '<%= ResolveUrl("/CarritoCompras/CarritoCompras.aspx/CrearDetallePedido") %>',
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                data: JSON.stringify({ 'id_pedido': id_pedido }),
                async: false,
                success: function (data) {
                    console.log("Se generaron de pana las lineas de detalledelpedido y se eliminó el carrito");
                },
                error: function (data) {
                    alert("Algo ha salido mal!!!");
                }
            });
        }
    </script>
</asp:Content>
