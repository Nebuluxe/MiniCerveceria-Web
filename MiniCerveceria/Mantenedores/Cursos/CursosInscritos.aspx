<%@ Page Title="Mantenedores" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CursosInscritos.aspx.cs" Inherits="MiniCerveceria.Mantenedores.Cursos.CursosInscritos" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

	<link href="/GlobalCss/Mantenedores.css" rel="stylesheet" type="text/css">
	
	<style>
		.card-body{
			background:#000000;
			color: #ffffff;
		}
		#headMaster {
			display: none;
		}

        #mainNav{
            display: none;
        }

        #footerDefault{
            display: none;
        }

       #barraNav {
            background: #000000 !important;
            color: #ffffff;
            border-radius: 15px;
        }
	</style>
    <nav id="barraNav" class="navbar bg-body-tertiary">
        <div class="container-fluid">
            <a runat="server" href="~/Mantenedores/Default.aspx" data-title="Volver">
                <img id="imgButtonBack" src="/Imagenes/Iconos/BackButtonWithe.png" height="40">
            </a>
            <div class="row">
                <div class="col-2">
                    <img src="/Imagenes/Iconos/CursosInscritosWithe.png" height="50" width="50">
                </div>
                <div class="col-10">
                    <asp:Label CssClass="titulo" Style="font-size: 1.9em; color: #ffffff;" runat="server" ClientIDMode="Static">Cursos inscritos</asp:Label>
                </div>
            </div>
            <a data-title="Marcar como cursados" id="CambioEstadoOff">
                <img src="/Imagenes/Iconos/CambioEstadoInscripcionOff.png" height="40">
            </a>
            <a data-title="Marcar como cursados" id="CambioEstadoOn" class="visually-hidden">
                <img src="/Imagenes/Iconos/CambioEstadoInscripcionOn.png" height="40">
            </a>
        </div>
    </nav>
    <br />
    <div class="input-group" style="justify-content: center">
        <select name="select" class="form-select"  id="cboEstado">
            <option selected value="0">por realizar</option>
            <option value="1">Cursados</option>
		</select>
        <select name="select" class="form-select"  id="cboCursos">

		</select>
        <input type="text" class="form-control" id="search" placeholder="Buscador..." aria-label="Buscador...">
        <span class="input-group-text" id="addon-wrapping" style="border: 10px">
            <img src="/Imagenes/Iconos/Lupa.png" height="20">
        </span>
    </div>
    <br />
    <div id="ContenedorPermisos">
        <table class="table CompraDetalle" id="TablaPermisos">
		    <thead>
		        <tr>
                    <th scope="row"><input class="form-check-input" type="checkbox" id="chkAll"  heigth="35"></th>
			        <th scope="row">Nombre curso</th>
                    <th scope="row">Nombre partipante</th>
                    <th scope="row">Email</th>
			        <th scope="row">Fecha inscripcion</th>
                    <th scope="row">Cursado</th>
		        </tr>
		    </thead>
		    <tbody id="Contenido">

		    </tbody>
	    </table>
    </div>
	<script>
        var PermisoEditar = <%= PermisoEditar %>;

        $(document).ready(() => {
            cargarCursosInscritos()
            cargarCursos()

            let items = document.querySelectorAll('.carousel .carousel-item')

            items.forEach((el) => {
                const minPerSlide = 4
                let next = el.nextElementSibling
                for (var i = 1; i < minPerSlide; i++) {
                    if (!next) {
                        // wrap carousel by using first child
                        next = items[0]
                    }
                    let cloneChild = next.cloneNode(true)
                    el.appendChild(cloneChild.children[0])
                    next = next.nextElementSibling
                }
            })
            $('#cboCursos').on('change', function () {
                cargarCursosInscritos()
            })

            $('#cboEstado').on('change', function () {
                if ($('#cboEstado').val() == 1) {
                    $('#CambioEstadoOff').attr('data-title', 'Marcar como por realizar');
                    $('#CambioEstadoOn').attr('data-title', 'Marcar como por realizar');
                }
                else {
                    $('#CambioEstadoOff').attr('data-title', 'Marcar como cursados');
                    $('#CambioEstadoOn').attr('data-title', 'Marcar como cursados');
                    
                }

                cargarCursosInscritos()
            })

            $('#chkAll').on('change', function () {
                if ($('#chkAll').prop('checked')) {
                    $('#CambioEstadoOff').addClass('visually-hidden');
                    $('#CambioEstadoOn').removeClass('visually-hidden');
                }
                else {
                    $('#CambioEstadoOff').removeClass('visually-hidden');
                    $('#CambioEstadoOn').addClass('visually-hidden');
                }

                $('#Contenido input[type=checkbox]').prop('checked', $(this).is(':checked'));
            })

            $('#CambioEstadoOff').on('click', function () {

                Command: toastr["warning"]("Debe seleccionar almenos 1 participante")
            })

            $('#CambioEstadoOn').on('click', function () {
                if (PermisoEditar) {
                    $('#Contenido input[type=checkbox]:checked').each(function () {
                        var id_inscripcion = $(this).val();
                        var estado = true;

                        if ($('#cboEstado').val() == 1) {
                            estado = false;
                        }

                        $.ajax({
                            type: 'POST',
                            cache: false,
                            url: '<%= ResolveUrl("/Mantenedores/Cursos/CursosInscritos.aspx/CambiarEstado") %>',
                            contentType: 'application/json; charset=utf-8',
                            async: false,
                            dataType: 'json',
                            data: JSON.stringify({ 'id_inscripcion': id_inscripcion, 'estado': estado }),
                            success: function (data) {

                            },
                            error: function (data) {
                                Command: toastr["error"]("Algo ha salido mal!!!")
                            }
                        });
                    });

                    Command: toastr["success"]("Se ha cambiado el estado correctamente")

                    cargarCursosInscritos()
                }
                else {
                    Command: toastr["error"]("No tines permisos para editar")
                }
            })

            $('.chkitem').on('click', function () {
                var cont = 0;

                $('#Contenido input[type=checkbox]:checked').each(function () {
                    cont++
                });

                if (cont == 0) {
                    $('#CambioEstadoOff').removeClass('visually-hidden');
                    $('#CambioEstadoOn').addClass('visually-hidden');
                }
                else {
                    $('#CambioEstadoOff').addClass('visually-hidden');
                    $('#CambioEstadoOn').removeClass('visually-hidden');
                }
            })
        });

        function cargarCursosInscritos() {
            var estado = $('#cboEstado').val()
            var id_curso = $('#cboCursos').val()

            if (id_curso == null) {
                id_curso = 0;
            }

            console.log(estado)

            var cursado = estado == 1 ? "true" : "false";
            
            $.ajax({
                type: 'POST',
                cache: false,
                url: '<%= ResolveUrl("/Mantenedores/Cursos/CursosInscritos.aspx/CargarCursosInscritos") %>',
                contentType: 'application/json; charset=utf-8',
                async: false,
                dataType: 'json',
                data: JSON.stringify({ 'id_curso': id_curso, 'cursado': cursado }),
                success: function (data) {

                    var html = "";

                    if (data.d != null) {
                        $.each(data.d, function (i, val) {
                                html += '<tr id="' + val.id_Inscripcion + '">' +
                                    '<td scope="row"><input class="form-check-input chkitem" type="checkbox" value="' + val.id_Inscripcion +  '" heigth="35"></td>' +
                                '<td scope="row">' + val.nombre_curso + '</td>' +
                                '<td scope="row" >' + val.nombre + " " + val.apellido + '</td>' +
                                '<td scope="row"">' + val.email + '</td>' +
                                '<td scope="row" >' + val.fecha_inscripcion + '</td>' +
                                '<td scope="row">' + (val.cursado?"Cursado":"Por realizar") + '</td>' +
                                '</tr>';
                        });

                        $('#Contenido').html(html);
                    }
                },
                error: function (data) {
                    Command: toastr["error"]("Algo ha salido mal!!!")
                }
            });
        }

        function cargarCursos() {
            $.ajax({
                type: 'POST',
                cache: false,
                url: '<%= ResolveUrl("/Mantenedores/Cursos/CursosInscritos.aspx/CargarCursos") %>',
                contentType: 'application/json; charset=utf-8',
                async: false,
                dataType: 'json',
                success: function (data) {
                    var cbo = "";
                    cbo += "<option value='0'>Seleccione curso...</option>"
                    if (data.d != null) {

                        $.each(data.d, function (i, val) {
                            cbo += "<option value='" + val.id_curso + "'>" + val.nombre_curso + "</option>"
                        });

                        $('#cboCursos').html(cbo);
                    }
                },
                error: function (data) {
                    Command: toastr["error"]("Algo ha salido mal!!!")
                }
            });
        }

    </script>
</asp:Content>