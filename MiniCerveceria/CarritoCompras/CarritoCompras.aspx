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

	#headMaster{
        height: 350px;
    }

    .headContent{
        display: none
    }
</style>
		<br /><br /><br />
		<div class="card FormCursoExterno">
			<div class="card-body">
				<div class="row">
					<div class="col-lg-8">
						<div class="row">
							<div class="col-lg-4">
								<a runat="server" href="~/Default.aspx"> 
									<img id="imgButtonBack" src="/Imagenes/Iconos/BackButtonWithe.png" height="40">
								</a>
							</div>
							<div class="col-lg-8">

							</div>
						</div>
						<br />
						<table class="table CompraDetalle">
							<thead>
							<tr>
								<th scope="row" colspan="2">Productos</th>
								<th scope="row">Cantiddad</th>
								<th scope="row">Precio Unitario</th>
								<th scope="row">Precio Total</th>
								<th scope="row"><span></span></th>
							</tr>
							</thead>
							<tbody>
							<tr>
								<td colspan="2">Producto xx x x</td>
								<td scope="row">1 <a href="#"><img src="/Imagenes/Iconos/btnSumWithe.png" height="20" width="20"/></a><span> </span><a href="#"><img src="/Imagenes/Iconos/btnRestWithe.png" height="20" width="20"/></a></td>
								<td scope="row">$10.000</td>
								<td>$10.000</td>
								<td scope="row"><a href="#"><img src="/Imagenes/Iconos/btnDeleteitem.png" height="20" width="20"/></a></td>
							</tr>
							<tr>
								<td colspan="2">Producto xx x x</td>
								<td scope="row">1 <a href="#"><img src="/Imagenes/Iconos/btnSumWithe.png" height="20" width="20"/></a><span> </span><a href="#"><img src="/Imagenes/Iconos/btnRestWithe.png" height="20" width="20"/></a></td>
								<td scope="row">$9.000</td>
								<td>$9.000</td>
								<td scope="row"><a href="#"><img src="/Imagenes/Iconos/btnDeleteitem.png" height="20" width="20"/></a></td>
							</tr>
							<tr>
								<td colspan="2">Producto xx x x</td>
								<td scope="row">1 <a href="#"><img src="/Imagenes/Iconos/btnSumWithe.png" height="20" width="20"/></a><span> </span><a href="#"><img src="/Imagenes/Iconos/btnRestWithe.png" height="20" width="20"/></a></td>
								<td scope="row">$9.000</td>
								<td>$9.000</td>
								<td scope="row"><a href="#"><img src="/Imagenes/Iconos/btnDeleteitem.png" height="20" width="20"/></a></td>
							</tr>
							<tr>
								<td colspan="2">Producto xx x x</td>
								<td scope="row">1 <a href="#"><img src="/Imagenes/Iconos/btnSumWithe.png" height="20" width="20"/></a><span> </span><a href="#"><img src="/Imagenes/Iconos/btnRestWithe.png" height="20" width="20"/></a></td>
								<td scope="row">$9.000</td>
								<td>$9.000</td>
								<td scope="row"><a href="#"><img src="/Imagenes/Iconos/btnDeleteitem.png" height="20" width="20"/></a></td>
							</tr>
							</tbody>
						</table>
					</div>
					<div class="col-lg-4">
						<div class="card FormCursoInterno" style="width: 100%; height: 100%">
							<div class="card-body">
								<strong class="titulo" style="font-size:1.9em; color: #000000; text-align:center">Montos</strong>
								<div class="card" style="background: #000000; color: #ffffff">
									<div class="card-body">
									<label><strong>Sub Total: </strong> </label><label> $19.000</label>
									</div>
									<div class="card-body">
									<label><strong>Totales: </strong> </label><label> $19.000</label>
									</div>
								</div>
								<div class="d-grid card-footer gap-2">
									<a id="ContinuarCompra" class="btn btn-warning">Continnuar con la Compra</a>
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
			<div class="card-body">
				<div class="row">
					<div class="col-lg-9">
						<div class="row">
							<div class="col-lg-12">
								<div class="row">
									<div class="col-lg-2">
										<a href="#" id="CloseDirecEnvioYpago"> 
											<img id="btnContinueCompra" src="/Imagenes/Iconos/CloseButton.png" height="35">
										</a>
									</div>
								</div>
								<br />
								<strong class="titulo" style="font-size:1.9em; color: #ffffff; text-align:center">Dreccion de Envio</strong>
								<div class="row">
									<div class="col-lg-6">
										<br />
										<input type="text" id="txtNombre" class="form-control" placeholder="Nombre"/>
									</div>
									<div class="col-lg-6">
										<br />
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
							<div class="card-body" style="align-items: center">
								<img src="/Imagenes/Banner-WebPay.png" height="80">
								<div class="d-grid card-footer gap-2">
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

		$('#ContinuarCompra').on('click', function () {
			$('#ContentDireccionyCompra').removeClass('visually-hidden');
            $('#ContinuarCompra').addClass('visually-hidden');
			console.log("Entreeee")
        })

        $('#CloseDirecEnvioYpago').on('click', function () {
			$('#ContentDireccionyCompra').addClass('visually-hidden');
            $('#ContinuarCompra').removeClass('visually-hidden');
        })
	});
</script>
</asp:Content>
