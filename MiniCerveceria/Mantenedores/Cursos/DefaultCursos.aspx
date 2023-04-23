<%@ Page Title="Mantenedores" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DefaultCursos.aspx.cs" Inherits="MiniCerveceria.Mantenedores.Cursos.DefaultCursos" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

	<link href="/GlobalCss/Mantenedores.css" rel="stylesheet" type="text/css">
	
	<style>
		.card-body{
			background:#000000;
			color: #ffffff;
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
						  <a type="button" class="btn btn-outline-light" runat="server" href="~/Mantenedores/Cursos/CrearCurso.aspx?uid=ItemPrueba5">Editar</a>
						  <a type="button" class="btn btn-outline-light" runat="server" href="~/Mantenedores/Cursos/VerCurso.aspx?uid=ItemPrueba5">Ver</a>
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