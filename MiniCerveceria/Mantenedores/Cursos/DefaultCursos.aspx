<%@ Page Title="Mantenedores" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DefaultCursos.aspx.cs" Inherits="MiniCerveceria.Mantenedores.Cursos.DefaultCursos" %>

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

        #TablaCursos {
	        height: 1000px;
	        width: 100%;
	        overflow-y: scroll;
            overflow-x: hidden
        }
	</style>
    <nav id="barraNav" class="navbar bg-body-tertiary">
        <div class="container-fluid">
            <a runat="server" href="~/Mantenedores/Default.aspx" data-title="Volver">
                <img id="imgButtonBack" src="/Imagenes/Iconos/BackButtonWithe.png" height="40">
            </a>
            <div class="row">
                <div class="col-2">
                    <img src="/Imagenes/Iconos/CursosWithe.png" height="40" width="40">
                </div>
                <div class="col-10">
                    <asp:Label CssClass="titulo" Style="font-size: 1.9em; color: #ffffff;" runat="server" ClientIDMode="Static">Cursos</asp:Label>
                </div>
            </div>
            <a runat="server" href="~/Mantenedores/Cursos/CrearCurso.aspx" data-title="Crear producto">
                <img src="/Imagenes/Iconos/btnAgregar.png" class="d-flex" height="40" width="40">
            </a>
        </div>
    </nav>
    <br />
    <div class="input-group" style="justify-content: center">
        <asp:DropDownList runat="server" ClientIDMode="Static" id="cboEstado" class="form-select">
            <asp:ListItem selected="true" value="1">Habilitados</asp:ListItem>
		    <asp:ListItem value="0">Deshabilitados</asp:ListItem>
	    </asp:DropDownList>
        <input type="text" class="form-control" id="search" placeholder="Buscador..." aria-label="Buscador...">
        <span class="input-group-text" id="addon-wrapping" style="border: 10px">
            <img src="/Imagenes/Iconos/Lupa.png" height="20">
        </span>
    </div>
    <br />
    <div class="container">
        <div class="row" id="TablaCursos">

        </div>
    </div>

    <%-- Modal deshabilitar --%>
    <div class="fade modal" id="ModalDeshabiitar" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="ModalDeshabiitarLabel" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
          <div class="modal-header">
            <h1 class="modal-title fs-5" id="ModalDeshabiitarLabel">Eliminar curso</h1>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
            ¿Esta seguro que desea eliminar el curso " <span id="Nombrecurso"></span>" ?
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-success" data-bs-dismiss="modal" id="confirmDeshabilitar">Aceptar</button>
          </div>
        </div>
      </div>
    </div>

	<script>
        var PermisoEliminar = <%= PermisoEliminar %>;

        var idCurso = "";

        $(document).ready(function () {
            cargarCursos(true)

            $('#confirmDeshabilitar').on('click', function () {
                if (PermisoEliminar) {
                    $.ajax({
                        type: 'POST',
                        cache: false,
                        url: '<%= ResolveUrl("/Mantenedores/Cursos/DefaultCursos.aspx/DeshabilitarCurso") %>',
                        contentType: 'application/json; charset=utf-8',
                        async: false,
                        dataType: 'json',
                        data: JSON.stringify({ 'id_curso': idCurso }),
                        success: function (data) {
                            if (data.d) {
                                Command: toastr["success"]("El curso ha sido deshabilitado exitosamente")
                                cargarCursos(false)
                                $("#cboEstado option[value=0]").attr("selected", true);
                            }
                        },
                        error: function (data) {
                            alert("Algo ha salido mal!!!");
                        }
                    });
                }
            });

            $("#search").keyup(function () {
                _this = this;
                $.each($("#TablaCursos .cadContenedor"), function () {
                    if ($(this).find('.fw-normal').text().toLowerCase().indexOf($(_this).val().toLowerCase()) === -1)
                        $(this).hide();
                    else
                        $(this).show();
                });
            });

            $('#cboEstado').on('change', function () {
                var estado = $('#cboEstado').val();

                if (estado == 1) {
                    cargarCursos(true)
                }
                else {
                    cargarCursos(false)
                }
            })
        });

        function cargarCursos(estado) {
            $.ajax({
                type: 'POST',
                cache: false,
                url: '<%= ResolveUrl("/Mantenedores/Cursos/DefaultCursos.aspx/ListarCursos") %>',
                contentType: 'application/json; charset=utf-8',
                async: false,
                dataType: 'json',
                data: JSON.stringify({ 'estado': estado }),
                success: function (data) {

                    var html = "";

                    if (data.d != null) {

                        $.each(data.d, function (i, val) {

                            var buttons = "";
                            var DesHabButton = "";

                            if (estado) {
                                buttons += '<a type="button" class="btn btn-outline-light" runat="server" href="/Mantenedores/Cursos/CrearCurso.aspx?uid=' + val.id_curso + '">Editar</a>';
                                buttons += '<a type="button" class="btn btn-outline-light" runat="server" href="/Mantenedores/Cursos/VerCurso.aspx?uid=' + val.id_curso + '">Ver</a>';

                                DesHabButton = '<div class="btn-group" role="group" >' +
                                                '<a onclick="Deshabilitar($(this).parent().parent())" type="button" class="btn btn-outline-danger btnDeshabilitar">Deshabilitar</a>' +
                                                '</div>';
                            }
                            else {
                                buttons = '<a onclick="Habilitar(' + val.id_curso + ')" class="btn btn-outline-success btnHabilitar">Habilitar</a>';
                            }

                            html += '<div class="col-lg-6">' +
                                        '<div class="card cadContenedor" style="border-radius:2%;">' +
                                            '<div class="card-body" style="border-radius: 2%;">' +
                                                '<div class="row">' +
                                                    '<div class="col-md-7">' +
                                                        '<h2 class="featurette-heading fw-normal lh-1">' + val.nombre_curso + '</h2>' +
                                                        '<p class="lead">' + val.descripcion.substring(0, 170) + '...</p>' +
                                                        '<div class="btn-group col-md-6" role="group">' +
                                                             buttons +
                                                             DesHabButton +
                                                        '</div>' +
                                                             
                                                        '<span class="visually-hidden idCurso">' + val.id_curso + '</span>' +
                                                    '</div>' +
                                                    
                                                    '<div class="col-md-5">' +
                                                         '<img src="' + val.URL_img + '" style="height: 225px; width: 225px; border-radius: 10%;" />' +
                                                         '<button type="button" class="btn btn-outline-danger visually-hidden btnDeshabilitarHide" data-bs-toggle="modal" data-bs-target="#ModalDeshabiitar"></button>' +
                                                    '</div>' +
                                                '</div>' +
                                            '</div>' +
                                        '</div>' +
                                    '</div>' 
                        });

                        $('#TablaCursos').html(html);
                    }
                },
                error: function (data) {
                    alert("Algo ha salido mal!!!");
                }
            });
        }

        function Habilitar(idCurso) {
            if (PermisoEliminar) {
                $.ajax({
                    type: 'POST',
                    cache: false,
                    url: '<%= ResolveUrl("/Mantenedores/Cursos/DefaultCursos.aspx/HabilitarCurso") %>',
                    contentType: 'application/json; charset=utf-8',
                    async: false,
                    dataType: 'json',
                    data: JSON.stringify({ 'id_curso': idCurso }),
                    success: function (data) {
                        if (data.d) {
                            Command: toastr["success"]("El curso ha sido habilitado exitosamente")
                            cargarCursos(true)
                            $("#cboEstado option[value=1]").attr("selected", true);
                        }
                    },
                    error: function (data) {
                        alert("Algo ha salido mal!!!");
                    }
                });
            }
        }

        function Deshabilitar(element) {
            if (PermisoEliminar) {
                var buttons = element;

                var cardBody = element.parent();

                var name = cardBody.find('.fw-normal').text()
                idCurso = cardBody.find('.idCurso').text()

                $('#Nombrecurso').text(name);

                buttons.find('.btnDeshabilitarHide').trigger('click');
            }
        }

    </script>
</asp:Content>