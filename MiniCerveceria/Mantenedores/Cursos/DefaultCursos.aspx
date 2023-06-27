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

    <%-- Modal eliminacion --%>
    <div class="fade modal" id="ModalEliminar" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="ModalEliminarLabelLabel" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
          <div class="modal-header">
            <h1 class="modal-title fs-5" id="ModalEliminarLabelLabel">Eliminar curso</h1>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
            ¿Esta seguro que desea eliminar el curso " <span id="Nombrecurso"></span>" ?
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-success" data-bs-dismiss="modal" id="confirmDelete">Aceptar</button>
          </div>
        </div>
      </div>
    </div>

	<script>
        var PermisoEliminar = <%= PermisoEliminar %>;

        $(document).ready(function () {
            cargarCursos()

            var idCursoDelete = "";

            $('.btnEliminar').on('click', function () {
                if (PermisoEliminar) {
                    var buttons = $(this).parent().parent();

                    var cardBody = $(this).parent().parent().parent();

                    var name = cardBody.find('.fw-normal').text()
                    idCursoDelete = cardBody.find('.idCurso').text()

                    $('#Nombrecurso').text(name);

                    buttons.find('.btnEliminarHide').trigger('click');
                }
            });

            $('#confirmDelete').on('click', function () {
                if (PermisoEliminar) {
                    $.ajax({
                        type: 'POST',
                        cache: false,
                        url: '<%= ResolveUrl("/Mantenedores/Cursos/DefaultCursos.aspx/EliminarCurso") %>',
                        contentType: 'application/json; charset=utf-8',
                        async: false,
                        dataType: 'json',
                        data: JSON.stringify({ 'id_curso': idCursoDelete }),
                        success: function (data) {
                            if (data.d) {
                                cargarCursos()
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
        });

        function cargarCursos() {
            $.ajax({
                type: 'POST',
                cache: false,
                url: '<%= ResolveUrl("/Mantenedores/Cursos/DefaultCursos.aspx/ListarCursosDefualt") %>',
                contentType: 'application/json; charset=utf-8',
                async: false,
                dataType: 'json',
                success: function (data) {

                    var html = "";

                    if (data.d != null) {

                        $.each(data.d, function (i, val) {
                            html += '<div class="col-lg-6">' +
                                        '<div class="card cadContenedor">' +
                                            '<div class="card-body">' +
                                                '<div class="row">' +
                                                    '<div class="col-md-7">' +
                                                        '<h2 class="featurette-heading fw-normal lh-1">' + val.nombre_curso + '</h2>' +
                                                        '<p class="lead">' + val.descripcion.substring(0, 170) + '...</p>' +
                                                        '<spam class="visually-hidden nameCurso">' + val.id_curso + '</span>' +
                                                    '</div>' +
                                                    '<div class="col-md-5">' +
                                                        '<img src="' + val.URL_img + '" style="height: 225px; width: 225px" />' +
                                                        '<button type="button" class="btn btn-outline-danger visually-hidden btnEliminarHide" data-bs-toggle="modal" data-bs-target="#ModalEliminar"></button>' +
                                                        '<div class="btn-group" role="group" >' +
                                                            '<a type="button" class="btn btn-outline-light" runat="server" href="/Mantenedores/Cursos/CrearCurso.aspx?uid=' + val.id_curso + '">Editar</a>' +
                                                            '<a type="button" class="btn btn-outline-light" runat="server" href="/Mantenedores/Cursos/VerCurso.aspx?uid=' + val.id_curso + '">Ver</a>' +
                                                            '<button type="button" class="btn btn-outline-danger btnEliminar">Eliminar</button>' +
                                                        '</div>' +
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
    </script>
</asp:Content>