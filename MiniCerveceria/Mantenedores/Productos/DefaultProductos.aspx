<%@ Page Title="Mantenedores" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DefaultProductos.aspx.cs" Inherits="MiniCerveceria.Mantenedores.Productos.DefaultProductos" %>

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

        #TablaProductos {
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
                    <img src="/Imagenes/Iconos/ProductosWithe.png" height="40" width="40">
                </div>
                <div class="col-10">
                    <asp:Label CssClass="titulo" Style="font-size: 1.9em; color: #ffffff;" runat="server" ClientIDMode="Static">Productos</asp:Label>
                </div>
            </div>
            <a runat="server" href="~/Mantenedores/Productos/CrearProducto.aspx" data-title="Crear producto">
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
        <div class="row" id="TablaProductos">

        </div>
    </div>

    <%-- Modal eliminacion --%>
    <div class="fade modal" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
          <div class="modal-header">
            <h1 class="modal-title fs-5" id="staticBackdropLabel">Eliminar producto</h1>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
            ¿Esta seguro que dese eliminar el producto " <span id="Nombreproducto"></span>" ?
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-success" data-bs-dismiss="modal" id="confirmDelete">Aceptar</button>
          </div>
        </div>
      </div>
    </div>

    <script type="text/javascript">
        $(document).ready(function () {
            cargarProductos()

            var idProdDelete = "";

            $('.btnEliminar').on('click', function () {
                var cardBody = $(this).parent().parent();

                var name = cardBody.find('.nameProducto').text()
                idProdDelete = cardBody.find('.idprod').text()

                $('#Nombreproducto').text(name);
            });

            $('#confirmDelete').on('click', function () {
                $.ajax({
                    type: 'POST',
                    cache: false,
                    url: '<%= ResolveUrl("/Mantenedores/Productos/DefaultProductos.aspx/EliminarProducto") %>',
                    contentType: 'application/json; charset=utf-8',
                    async: false,
                    dataType: 'json',
                    data: JSON.stringify({ 'id_producto': idProdDelete }),
                    success: function (data) {
                        if (data.d) {
                            cargarProductos()
                        }
                    },
                    error: function (data) {
                        alert("Algo ha salido mal!!!");
                    }
                });
            });

            $("#search").keyup(function () {
                _this = this;
                $.each($("#TablaProductos .tarjProducto"), function () {
                    if ($(this).find('.nameProducto').text().toLowerCase().indexOf($(_this).val().toLowerCase()) === -1)
                        $(this).hide();
                    else
                        $(this).show();
                });
            });
        });

        function cargarProductos() {
            $.ajax({
                type: 'POST',
                cache: false,
                url: '<%= ResolveUrl("/Mantenedores/Productos/DefaultProductos.aspx/ListarProductosDefualt") %>',
                contentType: 'application/json; charset=utf-8',
                async: false,
                dataType: 'json',
                success: function (data) {

                    var html = "";

                    if (data.d != null) {

                        $.each(data.d, function (i, val) {
                            html += '<div class="col-lg-3 tarjProducto">' +
                                        '<br/>' +
                                        '<div class="card" style="width: 90%;">' +
                                            '<div>' +
                                                '<img src="' + val.URL_img + '" class="card-img-top">' +
                                            '</div>' +
                                            '<div align="center">' +
                                            '<div class="card-body">' +
                                                    '<div class="row">' +
                                                        '<div class="col-lg-12">' +
                                                            '<span class="titulo nameProducto">' + val.nombre_producto + '</span>' +
                                                            '<span class="idprod visually-hidden">' + val.id_producto + '</span>' +
                                                        '</div>' +
                                                        '<div class="col-lg-12">' +
                                                            '<div class="btn-group" role="group" >' +
                                                                '<a type="button" class="btn btn-outline-light" runat="server" href="~/Mantenedores/Productos/CrearProducto.aspx?uid=' + val.id_producto + '">Editar</a>' +
                                                                '<a type="button" class="btn btn-outline-light" runat="server" href="~/Mantenedores/Productos/VerProducto.aspx?uid=' + val.id_producto + '">Ver</a>' +
                                                                '<button type="button" class="btn btn-outline-danger btnEliminar" data-bs-toggle="modal" data-bs-target="#staticBackdrop">Eliminar</button>' +
                                                            '</div>' +
                                                        '</div>' +
                                                    '</div>' +
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
