<%@ Title="Mantenedores" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DefaultCursos.aspx.cs" Inherits="MiniCerveceria.Mantenedores.Cursos.DefaultCursos" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">	
	<style>
		#barraNav{
			background: #000000;
			color: #ffffff;
			border-radius: 15px;
		}

		.card-body{
			background:#000000;
			color: #ffffff;
		}

		.optionNav{
			color: #000000 
		}

		
        .imgDefault{
            visibility: hidden;
        }
	</style>
	<nav id="barraNav" class="navbar bg-body-tertiary">
	  <div class="container-fluid">
			<a runat="server" href="~/Mantenedores/Default.aspx"> 
				<img id="imgButtonBack" src="/Imagenes/Iconos/BackButtonWithe.png" height="40"> 
			</a>
			<strong class="titulo" style="font-size:1.9em; color: #ffffff;"><img src="/Imagenes/Iconos/CursosWithe.png" height="40" width="40"><span> </span> Cursos</strong>
		  	<a runat="server" href="~/Mantenedores/Cursos/CrearCurso.aspx"> 
				<img src="/Imagenes/Iconos/btnAgregar.png" class="d-flex" height="40" width="40">
			</a>
	  </div>
	</nav>
	<br />
	<div id="TablaProductos" class="container" align="center">
		<div class="row">
			<div class="col-lg-3">
				<div class="card" style="width: 90%;">
				  <div >
					  <img src="/Imagenes/Iconos/NoImage.png" class="card-img-top">
				  </div>
					<div  align="center">
						<div class="card-body">
						<h5 class="card-title">Card title</h5>
						<div class="btn-group" role="group" >
						  <a type="button" class="btn btn-outline-light" runat="server" href="~/Mantenedores/Cursos/CrearCurso.aspx?uid=ItemPrueba1">Editar</a>
						  <a type="button" class="btn btn-outline-light" runat="server" href="~/Mantenedores/Cursos/VerCurso.aspx?uid=ItemPrueba1">Ver</a>
						  <button type="button" class="btn btn-outline-danger">Eliminar -</button>
						</div>
					  </div>
					</div>
				</div>
			</div>
			<div class="col-lg-3">
				<div class="card" style="width: 90%;">
				  <div >
					  <img src="/Imagenes/Iconos/NoImage.png" class="card-img-top">
				  </div>
					<div  align="center">
						<div class="card-body">
						<h5 class="card-title">Card title</h5>
						<div class="btn-group" role="group" >
						  <a type="button" class="btn btn-outline-light" runat="server" href="~/Mantenedores/Cursos/CrearCurso.aspx?uid=ItemPrueba2">Editar</a>
						  <a type="button" class="btn btn-outline-light" runat="server" href="~/Mantenedores/Cursos/VerCurso.aspx?uid=ItemPrueb21">Ver</a>
						  <button type="button" class="btn btn-outline-danger">Eliminar -</button>
						</div>
					  </div>
					</div>
				</div>
			</div>
			<div class="col-lg-3">
				<div class="card" style="width: 90%;">
				  <div >
					  <img src="/Imagenes/Iconos/NoImage.png" class="card-img-top">
				  </div>
					<div  align="center">
						<div class="card-body">
						<h5 class="card-title">Card title</h5>
						<div class="btn-group" role="group" >
						  <a type="button" class="btn btn-outline-light" runat="server" href="~/Mantenedores/Cursos/CrearCurso.aspx?uid=ItemPrueba3">Editar</a>
						  <a type="button" class="btn btn-outline-light" runat="server" href="~/Mantenedores/Cursos/VerCurso.aspx?uid=ItemPrueba3">Ver</a>
						  <button type="button" class="btn btn-outline-danger">Eliminar -</button>
						</div>
					  </div>
					</div>
				</div>
			</div>
			<div class="col-lg-3">
				<div class="card" style="width: 90%;">
				  <div >
					  <img src="/Imagenes/Iconos/NoImage.png" class="card-img-top">
				  </div>
					<div  align="center">
						<div class="card-body">
						<h5 class="card-title">Card title</h5>
						<div class="btn-group" role="group" >
						  <a type="button" class="btn btn-outline-light" runat="server" href="~/Mantenedores/Cursos/CrearCurso.aspx?uid=ItemPrueba4">Editar</a>
						  <a type="button" class="btn btn-outline-light" runat="server" href="~/Mantenedores/Cursos/VerCurso.aspx?uid=ItemPrueba4">Ver</a>
						  <button type="button" class="btn btn-outline-danger">Eliminar -</button>
						</div>
					  </div>
					</div>
				</div>
			</div>
		</div>
		<br />
		<div class="row">
			<div class="col-lg-3">
				<div class="card" style="width: 90%;">
				  <div >
					  <img src="/Imagenes/Iconos/NoImage.png" class="card-img-top">
				  </div>
					<div  align="center">
						<div class="card-body">
						<h5 class="card-title">Card title</h5>
						<div class="btn-group" role="group" >
						  <a type="button" class="btn btn-outline-light" runat="server" href="~/Mantenedores/Cursos/CrearCurso.aspx?uid=ItemPrueba5">Editar</a>
						  <a type="button" class="btn btn-outline-light" runat="server" href="~/Mantenedores/Cursos/VerCurso.aspx?uid=ItemPrueba5">Ver</a>
						  <button type="button" class="btn btn-outline-danger">Eliminar -</button>
						</div>
					  </div>
					</div>
				</div>
			</div>
			<div class="col-lg-3">
				<div class="card" style="width: 90%;">
				  <div >
					  <img src="/Imagenes/Iconos/NoImage.png" class="card-img-top">
				  </div>
					<div  align="center">
						<div class="card-body">
						<h5 class="card-title">Card title</h5>
						<div class="btn-group" role="group" >
						  <a type="button" class="btn btn-outline-light" runat="server" href="~/Mantenedores/Cursos/CrearCurso.aspx?uid=ItemPrueba6">Editar</a>
						  <a type="button" class="btn btn-outline-light" runat="server" href="~/Mantenedores/Cursos/VerCurso.aspx?uid=ItemPrueba6">Ver</a>
						  <button type="button" class="btn btn-outline-danger">Eliminar -</button>
						</div>
					  </div>
					</div>
				</div>
			</div>
			<div class="col-lg-3">
				<div class="card" style="width: 90%;">
				  <div >
					  <img src="/Imagenes/Iconos/NoImage.png" class="card-img-top">
				  </div>
					<div  align="center">
						<div class="card-body">
						<h5 class="card-title">Card title</h5>
						<div class="btn-group" role="group" >
						  <a type="button" class="btn btn-outline-light" runat="server" href="~/Mantenedores/Cursos/CrearCurso.aspx?uid=ItemPrueba7">Editar</a>
						  <a type="button" class="btn btn-outline-light" runat="server" href="~/Mantenedores/Cursos/VerCurso.aspx?uid=ItemPrueba7">Ver</a>
						  <button type="button" class="btn btn-outline-danger">Eliminar -</button>
						</div>
					  </div>
					</div>
				</div>
			</div>
			<div class="col-lg-3">
				<div class="card" style="width: 90%;">
				  <div >
					  <img src="/Imagenes/Iconos/NoImage.png" class="card-img-top">
				  </div>
					<div  align="center">
						<div class="card-body">
						<h5 class="card-title">Card title</h5>
						<div class="btn-group" role="group" >
						  <a type="button" class="btn btn-outline-light" runat="server" href="~/Mantenedores/Cursos/CrearCurso.aspx?uid=ItemPrueba8">Editar</a>
						  <a type="button" class="btn btn-outline-light" runat="server" href="~/Mantenedores/Cursos/VerCurso.aspx?uid=ItemPrueba8">Ver</a>
						  <button type="button" class="btn btn-outline-danger">Eliminar -</button>
						</div>
					  </div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>

    </script>
</asp:Content>