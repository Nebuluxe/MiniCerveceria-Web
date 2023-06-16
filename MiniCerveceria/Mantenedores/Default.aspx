<%@ Page Title="Mantenedores" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="MiniCerveceria.Mantenedores.Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">	

	<link href="/GlobalCss/Mantenedores.css" rel="stylesheet" type="text/css">
	
	<style>
		#mainNav {
			display: none;
		}

		#footerDefault{
			display:none;
		}

        /* esta css es para ocultar el head de el site.master se debe poner en cada pagina del mantenedor se intento poner en el Manetenedores.css pero no lo tomaba */
        #headMaster {
            display: none;
        }

        #mainNav{
            display: none;
        }

        #footerDefault{
            display: none;
        }
	</style>
	
	<div class="row">
		<div class="col-lg-6">
            <br />
			<br />
			<br />
			<canvas id="grafico1"> </canvas>
		</div>
		<div class="col-lg-6">
			<br />
			<br />
			<br />
			<canvas id="grafico2"> </canvas>
		</div>
		<div class="col-lg-6">
            <br />
			<br />
			<br />
			<canvas id="grafico3"> </canvas>
		</div>
		<div class="col-lg-6">
			<br />
			<br />
			<br />
			<canvas id="grafico4"> </canvas>
		</div>
	</div>

	<script src="/Scripts/chart.js"></script>
	<script>
        $(document).ready(function () {

            // Datos para los graficos
            var datos1 = {
                labels: ['Cursos', 'Productos'],
                datasets: [{
                    label: 'Ventas Totales ',
                    data: [1500000, 2000000],
                    backgroundColor: 'rgba(75, 192, 192, 0.2)', // Color de fondo de las barras
                    borderColor: 'rgba(75, 192, 192, 1)', // Color del borde de las barras
                    borderWidth: 1 // Ancho del borde de las barras
                }]
            };

            /*const labels = Utils.months({ count: 7 });*/
            const datos2 = {
                labels: "Enero",
                datasets: [{
                    label: 'My First Dataset',
                    data: [65, 59, 80, 81, 56, 55, 40],
                    fill: false,
                    borderColor: 'rgb(75, 192, 192)',
                    tension: 0.1
                }]
            };

            const datos3 = {
                labels: [
                    'Red',
                    'Green',
                    'Yellow',
                    'Grey',
                    'Blue'
                ],
                datasets: [{
                    label: 'My First Dataset',
                    data: [11, 16, 7, 3, 14],
                    backgroundColor: [
                        'rgb(255, 99, 132, 0.2)',
                        'rgb(75, 192, 192, 0.2)',
                        'rgb(255, 205, 86, 0.2)',
                        'rgb(201, 203, 207, 0.2)',
                        'rgb(54, 162, 235, 0.2)'
                    ],
                    borderColor: [
                        'rgb(255, 99, 132, 1)',
                        'rgb(75, 192, 192, 1)',
                        'rgb(255, 205, 86, 1)',
                        'rgb(201, 203, 207, 1)',
                        'rgb(54, 162, 235, 1)'
                    ],
                    borderWidth: 1
                }]
            };

            const datos4 = {
                labels: [
                    'Red',
                    'Blue',
                    'Yellow'
                ],
                datasets: [{
                    label: 'My First Dataset',
                    data: [300, 50, 100],
                    backgroundColor: [
                        'rgb(255, 99, 132, 0.2)',
                        'rgb(54, 162, 235, 0.2)',
                        'rgb(255, 205, 86, 0.2)'
                    ],
                    borderColor: [
                        'rgb(255, 99, 132, 1)',
                        'rgb(54, 162, 235, 1)',
                        'rgb(255, 205, 86, 1)'
                    ],
                    borderWidth: 1,
                    hoverOffset: 4
                }]
            };

            //configuracion de los graficos

            var configuracion1 = {
                type: 'bar', 
                data: datos1,
                options: {
                    scales: {
                        y: {
                            beginAtZero: true 
                        }
                    }
                }
            };

            const configuracion2 = {
                type: 'line',
                data: datos2,
            };

            const configuracion3 = {
                type: 'polarArea',
                data: datos3,
                options: {}
            };

            const configuracion4 = {
                type: 'doughnut',
                data: datos4,
            };

            // Crear el gráfico con jQuery
            var ctx1 = document.getElementById('grafico1').getContext('2d');
            var ctx2 = document.getElementById('grafico2').getContext('2d');
            var ctx3 = document.getElementById('grafico3').getContext('2d');
            var ctx4 = document.getElementById('grafico4').getContext('2d');

            var grafico1 = new Chart(ctx1, configuracion1);
            var grafico2 = new Chart(ctx2, configuracion2);
            var grafico3 = new Chart(ctx3, configuracion3);
            var grafico2 = new Chart(ctx4, configuracion4);

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
