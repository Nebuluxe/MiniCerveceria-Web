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
						<div id="VaciarCarrito" class="col-lg-6" style="text-align:right;">
							<a onclick="EliminarCarrito()" style="text-decoration:none;color:#ffffff;" href="" > 
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
									<input type="text" id="Apellido" class="form-control" placeholder="Apellido"/>
								</div>
							</div>
							<div class="row">
								<div class="col-lg-4">
									<br />
									<input type="text" id="Direccion" class="form-control" placeholder="Direccion"/>
								</div>
								<div class="col-lg-4">
									<br />
									<input type="text" id="NumeroDomicilio" class="form-control" placeholder="Numero de casa/depto"/>
								</div>
								<div class="col-lg-4">
									<br />
									<input type="text" id="Region" class="form-control" placeholder="Region"/>
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
								<button class="btn btn-warning" type="button">Pagar</button>
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

   //         $(".AumentarCantidad").on('click', function () {
			//	var id_producto = $(this).data("id-producto");
			//	AgregarCantidadProducto(id_producto);
			//})

   //         $(".ReducirCantidad").on('click', function () {
			//	var id_producto = $(this).data("id-producto");
			//	ReducirCantidadProducto(id_producto);
			//})
			
   //         $(".EliminarProducto").on('click', function () {
   //             var id_producto = $(this).data("id-producto");
   //             EliminarLineaCarrito(id_producto);
   //         })
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
					var id_carrito = 0; 
                    var html = "";
					var SubTotal = 0;
                    if (data.d.length > 0) {
						$.each(data.d, function (i, val) {
							id_carrito = val.id_carrito;
                            html += "<tr>" +
										"<td colspan='2'>" + val.nombre_producto + "</td>" +
										"<td scope='row'>" +
											"<a class='ReducirCantidad' onclick='ReducirCantidadProducto(" + val.id_producto + ")'>" +
												"<img src='/Imagenes/Iconos/btnRestWithe.png' height='20' width='20' />" +
											"</a>" +
											"<label class='CantidadProducto' style='font-size: 17px;margin-left:5px;margin-right:5px;'>" + val.cantidad + "</label>" +
											"<a class='AumentarCantidad' onclick='AgregarCantidadProducto(" + val.id_producto + ")'>" +
												"<img src='/Imagenes/Iconos/btnSumWithe.png' height='20' width='20' />" +
											"</a>" +
										"</td>" +
										"<td scope='row'>$" + val.precio_producto + "</td>" +
										"<td>$" + val.total_detalle + "</td>" +
										"<td scope='row'><a class='EliminarProducto' onclick='EliminarLineaCarrito(" + val.id_producto + ")'><img src='/Imagenes/Iconos/btnDeleteitem.png' height='20' width='20' /></a></td>" +
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
                        html = "<div class='row' style='text-align:center;'><h3>Usted no tiene productos agregados al carrito de compras.</h3></div>";
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
						console.log("Se aumentó la cantidad del producto");
                        cargarCarritoCompra();
                    } else {
						console.log("No se aumentó la cantidad del producto");
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
                        console.log("Se redució la cantidad del producto");
                        cargarCarritoCompra();
                    } else {
						console.log("No se redució la cantidad del producto");
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
                        console.log("Se eliminó el producto del carrito");
                        cargarCarritoCompra();
                    } else {
						console.log("No se eliminó el producto del carrito");
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
                        console.log("Se eliminó el carrito");
                        cargarCarritoCompra();
                    } else {
						console.log("No se eliminó el carrito");
                    }
                },
                error: function (data) {
                    alert("Algo ha salido mal!!!");
                }
            });
        } 
    </script>
</asp:Content>
