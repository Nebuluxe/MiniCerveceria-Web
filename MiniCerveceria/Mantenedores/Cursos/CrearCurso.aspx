<%@ Title="Mantenedores" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CrearCurso.aspx.cs" Inherits="MiniCerveceria.Mantenedores.Cursos.CrearCurso" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
		#barraNav{
			background: #000000;
			color: #ffffff;
			border-radius: 15px;
		}

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
			<a runat="server" href="~/Mantenedores/Cursos/DefaultCursos.aspx"> 
				<img id="imgButtonBack" src="/Imagenes/Iconos/BackButtonWithe.png" height="40"> 
			</a>
			<strong class="titulo" style="font-size:1.9em; color: #ffffff;"><img src="/Imagenes/Iconos/CursosWithe.png" height="40" width="40"><span> </span>Crear Curso</strong>
			<span></span>
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
					  <strong class="titulo" style="font-size:1.9em; color: #ffffff;"><span> </span><asp:Label id="lblNombreProducto" ClientIDMode="Static" runat="server"></asp:Label></strong>
					  <br />
					  <br />
					  <div class="row mb-3">
						<div class="col">
						  <div class="form-outline">
							<input type="text" id="txt1" class="form-control" />
							<label class="form-label">Nombre Curso</label>
						  </div>
						</div>
						<div class="col">
						  <div class="form-outline">
							<input type="text" id="txt2" class="form-control" />
							<label class="form-label">Valor Curso $</label>
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
						  <label class="form-label">Descripcion del Curso</label>
					  </div>
				  </div>
				</div>
			</div>
			<div class="col-lg-4">
				<br />
				<div class="card FormCursoExterno" style="width: 100%;">
					<img src="/Imagenes/Iconos/NoImage.png" class="CardItem">
				</div>
			</div>
		  </div>
		</div>
	</div>
	<br />
</asp:Content>
