<%@ Page Title="Mantenedores" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CrearEmpresa.aspx.cs" Inherits="MiniCerveceria.Mantenedores.Empresas.CrearEmpresa" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <link href="/GlobalCss/Mantenedores.css" rel="stylesheet" type="text/css">
    
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

		.CardItem{
			border-radius: 15px;
		}
	</style>

	<nav id="barraNav" class="navbar bg-body-tertiary">
	  <div class="container-fluid">
			<a runat="server" href="~/Mantenedores/Empresas/DefaultEmpresas.aspx"> 
				<img id="imgButtonBack" src="/Imagenes/Iconos/BackButtonWithe.png" height="40"> 
			</a>
			<strong class="titulo" style="font-size:1.9em; color: #ffffff;"><img src="/Imagenes/Iconos/EmpresasAsociadasWithe.png" height="40" width="40"><span> </span><asp:Label runat="server" ClientIDMode="Static" id="CambioNomVentana"></asp:Label> Empresa</strong>
		  	<a href="#"> 
				<img src="/Imagenes/Iconos/BotonGuardarWithe.png" class="d-flex" height="40" width="40">
			</a>
	  </div>
	</nav>
	<br />
	<div>
		<div class="container">
		  <div class="row">
			<div class="col-lg-8">
				<br />
				<div class="card FormCursoExterno">
				  <br />
				  <div class="card-body">
					  <strong class="titulo" style="font-size:1.9em; color: #ffffff;"><span> </span><asp:Label id="lblNombreItem" ClientIDMode="Static" runat="server"></asp:Label></strong>
					  <br />
					  <br />
					  <div class="row mb-3">
						<div class="col">
						  <div class="form-outline">
							<input type="text" id="txt1" class="form-control" />
							<label class="form-label">xxxxx xxxx x x</label>
						  </div>
						</div>
						<div class="col">
						  <div class="form-outline">
							<input type="text" id="txt2" class="form-control" />
							<label class="form-label">xxxxx xxx xxxxx x</label>
						  </div>
						</div>
					  </div>
					  <div class="row mb-3">
						<div class="col">
						  <div class="form-outline">
							<input type="text" id="txt3" class="form-control" />
							<label class="form-label">xxxxx xx xxxx</label>
						  </div>
						</div>
						<div class="col">
						  <div class="form-outline">
							<input type="text" id="txt4" class="form-control" />
							<label class="form-label">xxxxxxxx xx</label>
						  </div>
						</div>
						<div class="col">
						  <div class="form-outline">
							<input type="text" id="txt5" class="form-control" />
							<label class="form-label">xxxxx xx xxxx</label>
						  </div>
						</div>
					  </div>
					  <div class="row mb-3">
						<div class="col">
						  <div class="form-outline">
							<input type="text" id="txt6" class="form-control" />
							<label class="form-label">xxxxx xx xxxx</label>
						  </div>
						</div>
						<div class="col">
						  <div class="form-outline">
							<input type="text" id="txt7" class="form-control" />
							<label class="form-label">xxxxxxxx xx</label>
						  </div>
						</div>
						<div class="col">
						  <div class="form-outline">
							<input type="text" id="txt8" class="form-control" />
							<label class="form-label">xxxxx xx xxxx</label>
						  </div>
						</div>
					  </div>
					  <div class="row mb-1">
						  <textarea class="form-control" id="textArea" rows="3"></textarea>
						  <label class="form-label">xxxxx xx xx xxx xx</label>
					  </div>
				  </div>
				</div>
			</div>
			<div class="col-lg-4">
				<br />
				<div class="card FormCursoExterno" id="ItemImagen" style="width: 100%;">
					<img src="/Imagenes/Iconos/NoImage.png" class="CardItem">
				</div>
				<div class="input-group visually-hidden">
					<input type="file" class="form-control" id="imputFotoItem" aria-describedby="inputGroupFileAddon04" aria-label="Upload">
				</div>
			</div>
		  </div>
		</div>
	</div>
	<br />
	<script>
        $(document).ready(function () {
			$('#ItemImagen').on('click', function () {
				$('#imputFotoItem').click();
			});
        });
    </script>

</asp:Content>
