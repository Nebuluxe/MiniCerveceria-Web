<%@ Page Title="Mantenedores" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Novedades.aspx.cs" Inherits="MiniCerveceria.Mantenedores.Novedades.DefaultNovedades" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <link href="/GlobalCss/Mantenedores.css" rel="stylesheet" type="text/css">

    <style>
        .card-body {
    		background: #000000;
    		color: #ffffff;
    	}

    	#headMaster {
    		display: none;
    	}

    	#mainNav {
    		display: none;
    	}

    	#footerDefault {
    		display: none;
    	}

        #TablaNovedades {
	        height: 1000px;
	        width: 100%;
	        overflow-y: scroll;
            overflow-x: hidden
        }

        #barraNav {
            background: #000000 !important;
            color: #ffffff;
            border-radius: 15px;
        }
    </style>

    <nav id="barraNav" class="navbar bg-body-tertiary">
        <div class="container-fluid">
            <a runat="server" href="~/Mantenedores/Default.aspx"  data-title="Volver">
                <img id="imgButtonBack" src="/Imagenes/Iconos/BackButtonWithe.png" height="40">
            </a>
            <div class="row">
                <div class="col-2">
                    <img src="/Imagenes/Iconos/StarWithe.png" height="40" width="40">
                </div>
                <div class="col-10">
                    <asp:Label CssClass="titulo" Style="font-size: 1.9em; color: #ffffff;" runat="server" ClientIDMode="Static">Novedades</asp:Label>
                </div>
            </div>
            <button type="button" id="btnAgregarHide" class="visually-hidden" data-bs-toggle="modal" data-bs-target="#modalAgregarNovedad"></button>
            <a id="btnAgregar" data-title="Agregar novedad" style="cursor:pointer">
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
    <div class="container" align="center">
        <div class="row" id="TablaNovedades">

        </div>
    </div>
    <%-- Modal agregar novedad --%>
    <div class="fade modal" id="modalAgregarNovedad" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="modalAgregarNovedadLabel" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
        <div class="modal-content">
          <div class="modal-header">
            <h1 class="modal-title fs-5" id="modalAgregarNovedadLabel">Lista productos</h1>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
            <div class="container" align="center">
                <div class="row" id="TablaProductos">

                </div>
            </div>
          </div>
          <div class="modal-footer">
          </div>
        </div>
      </div>
    </div>
    <script>
        var PermisoEliminar = <%= PermisoEliminar %>;
        var PermisoCrear = <%= PermisoCrear %>;

        $(document).ready(function () {
            cargarNovedades()

            if (PermisoCrear) {
                cargarProductos()
            }

            $("#search").keyup(function () {
                _this = this;
                $.each($("#TablaNovedades .tarjNovedad"), function () {
                    if ($(this).find('.name').text().toLowerCase().indexOf($(_this).val().toLowerCase()) === -1)
                        $(this).hide();
                    else
                        $(this).show();
                });
            });

            $('#btnAgregar').on('click', function () {
                if (PermisoCrear) {
                    $('#btnAgregarHide').trigger('click');
                }
            })
        });

        function añadir(idprod) {
            if (PermisoCrear) {
                $.ajax({
                    type: 'POST',
                    cache: false,
                    url: '<%= ResolveUrl("/Mantenedores/Novedades/Novedades.aspx/AñadirNovedad") %>',
                    contentType: 'application/json; charset=utf-8',
                    async: true,
                    dataType: 'json',
                    data: JSON.stringify({ 'id_producto': idprod }),
                    success: function (data) {
                        if (data.d) {
                            cargarNovedades()
                            cargarProductos()
                            Command: toastr["success"]("Producto agregado como novedad")
                        }
                    },
                    error: function (data) {
                        alert("Algo ha salido mal!!!");
                    }
                });
            }
        }

        function quitar(idprod) {
            if (PermisoEliminar) {
                $.ajax({
                    type: 'POST',
                    cache: false,
                    url: '<%= ResolveUrl("/Mantenedores/Novedades/Novedades.aspx/QuitarNovedad") %>',
                    contentType: 'application/json; charset=utf-8',
                    async: true,
                    dataType: 'json',
                    data: JSON.stringify({ 'id_producto': idprod }),
                    success: function (data) {
                        if (data.d) {
                            cargarNovedades()

                            if (PermisoCrear) {
                                
                                cargarProductos()
                                Command: toastr["success"]("Se quitado el producto de novedades")
                            }
                        }
                    },
                    error: function (data) {
                        alert("Algo ha salido mal!!!");
                    }
                });
            }
        }

        function cargarNovedades() {
            $.ajax({
                type: 'POST',
                cache: false,
                url: '<%= ResolveUrl("/Mantenedores/Novedades/Novedades.aspx/ObtenerNovedades") %>',
                contentType: 'application/json; charset=utf-8',
                async: true,
                dataType: 'json',
                success: function (data) {

                    var html = "";

                    if (data.d != null) {

                        $.each(data.d, function (i, val) {
                            html += '<div class="col-lg-3 tarjNovedad">' +
                                        '<br/>' +
                                        '<div class="card" style="width: 90%;">' +
                                            '<div>' +
                                                '<img src="' + val.URL_img + '" class="card-img-top">' +
                                            '</div>' +
                                            '<div align="center">' +
                                                '<div class="card-body">' +
                                                    '<div class="row">' +
                                                        '<div class="col-lg-12">' +
                                                            '<span class="titulo name">' + val.nombre_producto + '</span>' +
                                                        '</div>' +
                                                        '<div class="col-lg-12">' +
                                                            '<span><a  style="cursor: pointer" data-title="Quitar novedad" onclick="quitar(' + val.id_producto + ')"><img src="/Imagenes/Iconos/btnDeleteitem.png" width="25"></a></span>' +
                                                        '</div>' +
                                                    '</div>' +
                                                '</div>' +
                                            '</div>' +
                                        '</div>' +
                                    '</div>';
                        });

                        $('#TablaNovedades').html(html);
                    }
                },
                error: function (data) {
                    alert("Algo ha salido mal!!!");
                }
            });
        }

        function cargarProductos() {
            $.ajax({
                type: 'POST',
                cache: false,
                url: '<%= ResolveUrl("/Mantenedores/Novedades/Novedades.aspx/ObtenerProductos") %>',
                contentType: 'application/json; charset=utf-8',
                async: true,
                dataType: 'json',
                success: function (data) {

                    var html = "";

                    if (data.d != null) {

                        $.each(data.d, function (i, val) {
                            html += '<div class="col-lg-6 tarjProducto">' +
                                        '<br/>' +
                                        '<div class="card añadirNovedad" style="width: 90%;cursor: pointer">' +
                                            '<a data-bs-dismiss="modal" onclick="añadir(' + val.id_producto + ')">' +
                                                '<div>' +
                                                    '<img src="' + val.URL_img + '" class="card-img-top hoverImg">' +
                                                '</div>' +
                                            '</a>' +
                                            '<div align="center">' +
                                                '<div class="card-body">' +
                                                    '<span class="titulo nameProducto">' + val.nombre_producto + '</span>' +
                                                '</div>' +
                                            '</div>' +
                                        '</div>' +
                                    '</div>';
                        });

                        $('#TablaProductos').html(html);
                    }
                },
                error: function (data) {
                    alert("Algo ha salido mal!!!");
                }
            });
        }
    </script>

</asp:Content>