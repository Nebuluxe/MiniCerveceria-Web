<%@ Page Title="Mantenedores" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="MiniCerveceria.Mantenedores.Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">	
	<style>
		hover.HoverLetra{
			color: #ffd800
		}
	</style>
	
	<div class="row p-4">
		<div class="col-12 text-center  animated infinite pulse">
			<div class="row">
				<div class="col-lg-1">
					<img src="/Imagenes/Iconos/MantenedoresLogo.png" height="50" width="50">
				</div>
				<div class="col-lg-1">
					<strong class="titulo" style="font-size:1.9em; color: #000000;">Mantenedores</strong>
				</div>
			</div>
		</div>
	</div>


	<div class="card">
		<div class="card-body">
		<a runat="server" href="~/Mantenedores/Cursos/DefaultCursos.aspx" style="width: 300px" class="btn btn-dark HoverLetra" >Cursos</a><span> </span>
		<img class="imgMantenedores OptionResponsive" src="/Imagenes/Iconos/CursosBlack.png" height="45" width="45">
		</div>
	</div>
	<br />
	<div class="card">
		<div class="card-body">
		<a runat="server" href="~/Mantenedores/Productos/DefaultProductos.aspx" style="width: 300px" class="btn btn-dark" >Productos</a><span> </span>
		<img class="imgMantenedores OptionResponsive" src="/Imagenes/Iconos/ProductosBlack.png" height="45" width="45">
		</div>
	</div>
	<br />
	<div class="card">
		<div class="card-body">
		<a runat="server" href="~/Mantenedores/Empresas/DefaultEmpresas.aspx" style="width: 300px" class="btn btn-dark" >Empresas Asociadas</a><span> </span>
		<img class="imgMantenedores OptionResponsive" src="/Imagenes/Iconos/EmpresasAsociadasBlack.png" height="45" width="45">
		</div>
	</div>
	<br />
	<div class="card">
		<div class="card-body">
		<a runat="server" href="~/Mantenedores/Novedades/DefaultNovedades.aspx" style="width: 300px" class="btn btn-dark" >Novedades</a><span> </span>
		<img class="imgMantenedores OptionResponsive" src="/Imagenes/Iconos/NovedadesBlack.png" height="45" width="45">
		</div>
	</div>
	<br />
	<div class="card">
		<div class="card-body">
			<a runat="server" href="~/Mantenedores/Recetas/DefaultRecetas.aspx" style="width: 300px" class="btn btn-dark" >Recetas</a><span> </span>
			<img class="imgMantenedores OptionResponsive" src="/Imagenes/Iconos/RecetasBlack.png" height="45" width="45">
		</div>
	</div>
	<br />
	<div class="card">
		<div class="card-body">
			<a runat="server" href="~/Mantenedores/Usuarios/DefaultUsuarios.aspx" style="width: 300px" class="btn btn-dark" >Usuarios</a><span> </span>
			<img class="imgMantenedores OptionResponsive" src="/Imagenes/Iconos/UsuariosBlack.png" height="45" width="45">
		</div>
	</div>
	<script>
        $(document).ready(function () {
            $(window).resize(function () {
                cambio();
            });

            cambio();

            function cambio() {
                if ($(window).width() >= 450) {
                    $('.OptionResponsive').removeClass('visually-hidden');
                } else {
                    $('.OptionResponsive').addClass('visually-hidden');
                }
            }
        });
    </script>
</asp:Content>
