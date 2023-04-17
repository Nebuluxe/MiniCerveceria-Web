<%@ Title="Mantenedores" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"  CodeBehind="DefaultProductos.aspx.cs" Inherits="MiniCerveceria.Mantenedores.Productos.DefaultProductos" %>

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
	</style>
	<nav id="barraNav" class="navbar bg-body-tertiary">
	  <div class="container-fluid">
			<a runat="server" href="~/Mantenedores/Default.aspx"> 
				<img id="imgButtonBack" src="/Imagenes/Iconos/BackButtonWithe.png" height="40"> 
			</a>
			<strong class="titulo" style="font-size:1.9em; color: #ffffff;"><img src="/Imagenes/Iconos/ProductosWithe.png" height="40" width="40"><span> </span> Productos</strong>
		  	<a runat="server" href="~/Mantenedores/Cursos/CrearCurso.aspx"> 
				<img src="/Imagenes/Iconos/btnAgregar.png" class="d-flex" height="40" width="40">
			</a>
	  </div>
	</nav>
	<br />
	<div id="TablaProductos" class="container">
		<div class="row">
			<div class="col-lg-3">
				<div class="card" height="250" width="250">
				  <div >
					  <img src="/Imagenes/Iconos/NoImage.png" class="card-img-top">
				  </div>
					<div  align="center">
						<div class="card-body">
						<h5 class="card-title">Card title</h5>
						<div class="btn-group" role="group" >
						  <button type="button" class="btn btn-outline-light">Editar</button>
						  <button type="button" class="btn btn-outline-light">Ver</button>
						  <button type="button" class="btn btn-outline-danger">Eliminar -</button>
						</div>
					  </div>
					</div>
				</div>
			</div>
			<div class="col-lg-3">
				<div class="card" height="250" width="250">
				  <div >
					  <img src="/Imagenes/Iconos/NoImage.png" class="card-img-top">
				  </div>
					<div  align="center">
						<div class="card-body">
						<h5 class="card-title">Card title</h5>
						<div class="btn-group" role="group" >
						  <button type="button" class="btn btn-outline-light">Editar</button>
						  <button type="button" class="btn btn-outline-light">Ver</button>
						  <button type="button" class="btn btn-outline-danger">Eliminar -</button>
						</div>
					  </div>
					</div>
				</div>
			</div>
			<div class="col-lg-3">
				<div class="card" height="250" width="250">
				  <div >
					  <img src="/Imagenes/Iconos/NoImage.png" class="card-img-top">
				  </div>
					<div  align="center">
						<div class="card-body">
						<h5 class="card-title">Card title</h5>
						<div class="btn-group" role="group" >
						  <button type="button" class="btn btn-outline-light">Editar</button>
						  <button type="button" class="btn btn-outline-light">Ver</button>
						  <button type="button" class="btn btn-outline-danger">Eliminar -</button>
						</div>
					  </div>
					</div>
				</div>
			</div>
			<div class="col-lg-3">
				<div class="card" height="250" width="250">
				  <div >
					  <img src="/Imagenes/Iconos/NoImage.png" class="card-img-top">
				  </div>
					<div  align="center">
						<div class="card-body">
						<h5 class="card-title">Card title</h5>
						<div class="btn-group" role="group" >
						  <button type="button" class="btn btn-outline-light">Editar</button>
						  <button type="button" class="btn btn-outline-light">Ver</button>
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
				<div class="card" height="250" width="250">
				  <div >
					  <img src="/Imagenes/Iconos/NoImage.png" class="card-img-top">
				  </div>
					<div  align="center">
						<div class="card-body">
						<h5 class="card-title">Card title</h5>
						<div class="btn-group" role="group" >
						  <button type="button" class="btn btn-outline-light">Editar</button>
						  <button type="button" class="btn btn-outline-light">Ver</button>
						  <button type="button" class="btn btn-outline-danger">Eliminar -</button>
						</div>
					  </div>
					</div>
				</div>
			</div>
			<div class="col-lg-3">
				<div class="card" height="250" width="250">
				  <div >
					  <img src="/Imagenes/Iconos/NoImage.png" class="card-img-top">
				  </div>
					<div  align="center">
						<div class="card-body">
						<h5 class="card-title">Card title</h5>
						<div class="btn-group" role="group" >
						  <button type="button" class="btn btn-outline-light">Editar</button>
						  <button type="button" class="btn btn-outline-light">Ver</button>
						  <button type="button" class="btn btn-outline-danger">Eliminar -</button>
						</div>
					  </div>
					</div>
				</div>
			</div>
			<div class="col-lg-3">
				<div class="card" height="250" width="250">
				  <div >
					  <img src="/Imagenes/Iconos/NoImage.png" class="card-img-top">
				  </div>
					<div  align="center">
						<div class="card-body">
						<h5 class="card-title">Card title</h5>
						<div class="btn-group" role="group" >
						  <button type="button" class="btn btn-outline-light">Editar</button>
						  <button type="button" class="btn btn-outline-light">Ver</button>
						  <button type="button" class="btn btn-outline-danger">Eliminar -</button>
						</div>
					  </div>
					</div>
				</div>
			</div>
			<div class="col-lg-3">
				<div class="card" height="250" width="250">
				  <div >
					  <img src="/Imagenes/Iconos/NoImage.png" class="card-img-top">
				  </div>
					<div  align="center">
						<div class="card-body">
						<h5 class="card-title">Card title</h5>
						<div class="btn-group" role="group" >
						  <button type="button" class="btn btn-outline-light">Editar</button>
						  <button type="button" class="btn btn-outline-light">Ver</button>
						  <button type="button" class="btn btn-outline-danger">Eliminar -</button>
						</div>
					  </div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<br />
	<script>

    </script>
</asp:Content>