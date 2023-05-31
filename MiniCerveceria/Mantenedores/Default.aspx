<%@ Page Title="Mantenedores" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="MiniCerveceria.Mantenedores.Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">	

	<link href="/GlobalCss/Mantenedores.css" rel="stylesheet" type="text/css">
	
	<style>
		#mainNav {
			display: none;
		}

		#headMaster {
			display: none;
		}

		#footerDefault{
			display:none;
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
	<div class="row">
		<div class="col-lg-4">
		    <div class="card">
				<div class="card-body">
				<a runat="server" href="~/Mantenedores/Cursos/DefaultCursos.aspx" style="width: 300px" class="btn btn-dark" >Cursos</a><span> </span>
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
			<br />
			<div class="row p-4">
				<div class="col-12 text-center  animated infinite pulse">
					<div class="row">
						<div class="col-lg-3">
							<img src="/Imagenes/Iconos/UserIconBlack.png" height="50" width="50">
						</div>
						<div class="col-lg-1">
							<strong class="titulo" style="font-size:1.9em; color: #000000;">Usuarios</strong>
						</div>
					</div>
				</div>
			</div>
			<div class="card">
				<div class="card-body">
					<a runat="server" href="~/Mantenedores/Usuarios/DefaultUsuarios.aspx" style="width: 300px" class="btn btn-dark" >Usuarios</a><span> </span>
					<img class="imgMantenedores OptionResponsive" src="/Imagenes/Iconos/UsuariosBlack.png" height="45" width="45">
				</div>
			</div>
			<br />
			<br />
			<br />
			<br />
		</div>
		<div class="col-lg-8">
			<br />
			<br />
			<br />
			<canvas id="grafico"> </canvas>
		</div>
	</div>

	<script src="/Scripts/chart.js"></script>
	<script>
        $(document).ready(function () {
            $(window).resize(function () {
                cambio();
            });

			cambio();


            // Datos para el gráfico
            var datos = {
                labels: ['Cursos', 'Productos'],
                datasets: [{
                    label: 'Ventas Totales ',
                    data: [1500000, 2000000],
                    backgroundColor: 'rgba(75, 192, 192, 0.2)', // Color de fondo de las barras
                    borderColor: 'rgba(75, 192, 192, 1)', // Color del borde de las barras
                    borderWidth: 1 // Ancho del borde de las barras
                }]
            };

            // Configuración del gráfico
            var configuracion = {
                type: 'bar', // Tipo de gráfico de barras
				data: datos,
                options: {
                    scales: {
                        y: {
                            beginAtZero: true // Empezar en el eje Y desde cero
                        }
                    }
                }
            };

            // Crear el gráfico con jQuery
			var ctx = document.getElementById('grafico').getContext('2d');

            var grafico = new Chart(ctx, configuracion);

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
