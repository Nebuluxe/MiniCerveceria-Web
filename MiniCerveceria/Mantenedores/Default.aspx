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
			<div class="card" style="background-color: rgba( 20, 143, 119 , 0.5); border-color: rgba( 20, 143, 119)">
                
			</div>
            <hr class="featurette-divider">
            <div>
                <strong>Cantidad de productos vendidos este mes: </strong> <span id="CantidadProductosVendidos"></span>
            </div>
            <hr class="featurette-divider">
            <div>
                <strong>Ingresos totales de este mes: </strong>$ <span id="IngresosMes"></span>
            </div>
            <hr class="featurette-divider">
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
			<canvas id="grafico4"> </canvas>
		</div>
		<div class="col-lg-6">
            <br />
			<br />
			<br />
			<canvas id="grafico3"> </canvas>
		</div>

	</div>

	<script src="/Scripts/chart.js"></script>
	<script>

        $(document).ready(function () {
            armarGrafico5ProductosMasVendidos()

            armarGraficoProductosMasPopulares()

            armarGraficoLineaTiempoVentas()

            CargarValores()
        });

        function CargarValores() {
            $.ajax({
                type: 'POST',
                cache: false,
                url: '<%= ResolveUrl("/Mantenedores/Default.aspx/ObtenerIngresosCursos") %>',
                contentType: 'application/json; charset=utf-8',
                async: false,
                dataType: 'json',
                success: function (data) {
                    
                    $('#CantidadProductosVendidos').text(data.d.cantidad)
                    $('#IngresosMes').text(data.d.total_detalle)

                    console.log($('#CantidadProductosVendidos').text())
                },
                error: function (data) {
                    Command: toastr["error"]("Algo ha salido mal!!!")
                }
            });
        }

        //grafico 2

        function armarGrafico5ProductosMasVendidos() {
            var labels = [];
            var values = [];

            $.ajax({
                type: 'POST',
                cache: false,
                url: '<%= ResolveUrl("/Mantenedores/Default.aspx/ObtenerrIngresosProductos") %>',
                contentType: 'application/json; charset=utf-8',
                async: false,
                dataType: 'json',
                success: function (data) {
                    var cont = 1;
                    $.each(data.d, function (i, val) {
                        labels.push(val.nombre_producto)
                        values.push(val.total_detalle)
                        cont++;
                    });
                },
                error: function (data) {
                    Command: toastr["error"]("Algo ha salido mal!!!")
                }
            });

            const datos2 = {
                labels: labels,
                datasets: [{
                    label: '5 productos que han generado mas ingresos este mes',
                    data: values,
                    fill: false,
                    backgroundColor: [
                        'rgba( 118, 215, 196, 0.5)',
                        'rgba( 72, 201, 176 , 0.5)',
                        'rgba( 26, 188, 156 , 0.5)',
                        'rgba( 23, 165, 137 , 0.5)',
                        'rgba( 20, 143, 119 , 0.5)',
                    ],
                    borderColor: [
                        'rgb(118, 215, 196)',
                        'rgb(72, 201, 176)',
                        'rgb(26, 188, 156)',
                        'rgb(23, 165, 137)',
                        'rgb(20, 143, 119)',
                    ],
                    borderWidth: 1,
                    tension: 0.1
                }]
            };
            const configuracion2 = {
                type: 'bar',
                data: datos2,
                options: {
                    scales: {
                        y: {
                            beginAtZero: true
                        }
                    }
                },
            };
            var ctx2 = document.getElementById('grafico2').getContext('2d');
            grafico2 = new Chart(ctx2, configuracion2);
        }

        function armarGraficoProductosMasPopulares() {
            var labels = [];
            var values = [];

            $.ajax({
                type: 'POST',
                cache: false,
                url: '<%= ResolveUrl("/Mantenedores/Default.aspx/ObtenerProductosPopulares") %>',
                contentType: 'application/json; charset=utf-8',
                async: false,
                dataType: 'json',
                success: function (data) {
                    var cont = 1;
                    $.each(data.d, function (i, val) {
                        labels.push(val.nombre_producto)
                        values.push(val.cantidad)
                        cont++;
                    });
                },
                error: function (data) {
                    Command: toastr["error"]("Algo ha salido mal!!!")
                }
            });

            const datos2 = {
                labels: labels,
                datasets: [{
                    label: '10 productos mas populares',
                    data: values,
                    fill: false,
                    backgroundColor: 'rgba( 20, 143, 119 , 0.5)',
                    borderColor: 'rgb(20, 143, 119)',
                    borderWidth: 1,
                    tension: 0.1
                }]
            };
            const configuracion2 = {
                type: 'bar',
                data: datos2,
                options: {
                    scales: {
                        y: {
                            beginAtZero: true
                        }
                    }
                },
            };
            var ctx2 = document.getElementById('grafico4').getContext('2d');
            grafico2 = new Chart(ctx2, configuracion2);
        }

        function armarGraficoLineaTiempoVentas() {
            var labels = [];
            var values = [];

            $.ajax({
                type: 'POST',
                cache: false,
                url: '<%= ResolveUrl("/Mantenedores/Default.aspx/ObtenerrLineaTiempoIngresos") %>',
                contentType: 'application/json; charset=utf-8',
                async: false,
                dataType: 'json',
                success: function (data) {
                    var cont = 1;
                    $.each(data.d, function (i, val) {
                        labels.push(val.fecha_creacion)
                        values.push(val.total_detalle)
                        cont++;
                    });
                },
                error: function (data) {
                    Command: toastr["error"]("Algo ha salido mal!!!")
                }
            });

            const datos2 = {
                labels: labels,
                datasets: [{
                    label: 'Ingresos en meses anteriores',
                    data: values,
                    fill: false,
                    backgroundColor: 'rgba( 20, 143, 119 , 0.5)',
                    borderColor: 'rgb(20, 143, 119)',
                    borderWidth: 1,
                    tension: 0.1
                }]
            };
            const configuracion2 = {
                type: 'line',
                data: datos2,
                options: {
                    scales: {
                        y: {
                            beginAtZero: true
                        }
                    }
                },
            };
            var ctx2 = document.getElementById('grafico3').getContext('2d');
            grafico2 = new Chart(ctx2, configuracion2);
        }
    </script>
</asp:Content>
