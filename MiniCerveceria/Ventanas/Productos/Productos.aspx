<%@ Page Title="Productos" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Productos.aspx.cs" Inherits="MiniCerveceria.Productos" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .optionItem:hover {
            background: #ffd800;
            transition: 1s;
        }

        .optionItem {
            background-color: #ffffff;
            border: none;
            display: flex;
            width: 230px;
        }

        .colorList {
            background-color: #ffffff
        }

        * {
            list-style: none;
        }

        .pageSelector:hover {
            color: #ffd800;
        }

        .pageSelector {
            color: #000000;
        }

        /*        .ProductosNav{
            text-shadow: 0 0 5px #fff, 0 0 5px #fff;
            transition: 1s;
        }*/

        #headMaster {
            height: 350px;
        }

        .headContent {
            display: none
        }

        #SideMenuMantenedor {
            display: none;
        }

        #MantenedorNav {
            display: none;
        }

        #TablaProductos {
	        height: 1250px;
	        width: 100%;
	        overflow-y: scroll;
            overflow-x: hidden
        }
    </style>
    <br />
    <br />
    <br />
    <asp:Label runat="server" ClientIDMode="Static" ID="NameCategoria" CssClass="visually-hidden"> </asp:Label>
    <asp:Label runat="server" ClientIDMode="Static" ID="idCategoria" CssClass="visually-hidden"> </asp:Label>
    <asp:Label runat="server" ClientIDMode="Static" ID="idSubCategoria" CssClass="visually-hidden"> </asp:Label>
    <div class="row">
        <div class="col-lg-3">
            <br />
            <strong style="font-size: 30px">Categorías</strong>
            <div class="row">
                <div class="col-lg-12">
                    <br />
                    <div class="card optionItem" style="font-size: 20px">
                        <strong>Novedades</strong>
                    </div>
                    <br />
                    <div class="card optionItem">
                        <strong>Ingredientes</strong>
                    </div>
                    <div id="IngredientesItems">
                        <ul>
                            <li style="padding: 6px">
                                <div class="card optionItem">
                                    Azúcares & Extractos
                                </div>
                            </li>
                            <li style="padding: 6px">
                                <div class="card optionItem">
                                    Clarificantes
                                </div>
                            </li>
                            <li style="padding: 6px">
                                <div class="card optionItem">
                                    Sales & aditivos
                                </div>
                            </li>
                            <li style="padding: 6px">
                                <div class="card optionItem">
                                    Maltas
                                </div>
                            </li>
                            <li style="padding: 6px">
                                <div class="card optionItem">
                                    Levaduras
                                </div>
                            </li>
                            <li style="padding: 6px">
                                <div class="card optionItem">
                                    Lupulos
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-12">
                    <div class="card optionItem">
                        <strong>Accesorios</strong>
                    </div>
                    <div id="AccesosriosItem">
                        <ul>
                            <li style="padding: 6px">
                                <div class="card optionItem">
                                    Embotellado
                                </div>
                            </li>
                            <li style="padding: 6px">
                                <div class="card optionItem">
                                    Fermentacion
                                </div>
                            </li>
                            <li style="padding: 6px">
                                <div class="card optionItem">
                                    Filtros
                                </div>
                            </li>
                            <li style="padding: 6px">
                                <div class="card optionItem">
                                    Medicion
                                </div>
                            </li>
                            <li style="padding: 6px">
                                <div class="card optionItem">
                                    Fogones
                                </div>
                            </li>
                            <li style="padding: 6px">
                                <div class="card optionItem">
                                    Enfriamiento
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-12">
                    <div class="card optionItem">
                        <strong>Cristaleria</strong>
                    </div>
                </div>
                <div class="col-lg-12">
                    <br />
                    <div class="card optionItem">
                        <strong>Equipamiento</strong>
                    </div>
                </div>
                <div class="col-lg-12">
                    <br />
                    <div class="card optionItem">
                        <strong>Libros y recetas</strong>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-9">
            <div class="input-group" style="justify-content: center">
                <input type="text" class="form-control" id="search" placeholder="Buscador..." aria-label="Buscador...">
                <span class="input-group-text" id="addon-wrapping" style="border: 10px">
                    <img src="/Imagenes/Iconos/Lupa.png" height="20">
                </span>
            </div>
            <br />
            <div class="row" id="TablaProductos">

            </div>
        </div>
    </div>
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <script>
        $(document).ready(function () {
            cargarProductos();

            var NameCateHead = $("#NameCategoria").text();

            if (NameCateHead != "") {
                $("#nombreCategoridaHeader").text(NameCateHead);
                $("#TextBread1").text(NameCateHead);
                $("#itemBreadbrum1").removeClass("OcultarElemento");
                $("#itemBreadbrum1").removeAttr("href");
            }
            else {
                $("#nombreCategoridaHeader").text("Productos");
            }

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

            var idCate = $("#idCategoria").text();
            var idSubCate = $("#idSubCategoria").text();
            var novedad = $("#NameCategoria").text();

            $.ajax({
                type: 'POST',
                cache: false,
                url: '<%= ResolveUrl("/Ventanas/Productos/Productos.aspx/ListarProductos") %>',
                contentType: 'application/json; charset=utf-8',
                async: false,
                dataType: 'json',
                data: JSON.stringify({ 'idCate': idCate, 'idSubCate': idSubCate, 'novedad': novedad }),
                success: function (data) {

                    var html = "";

                    if (data.d != null) {

                        $.each(data.d, function (i, val) {
                            html += '<div class="col-lg-4 tarjProducto">' +
                                        '<div class="card" style="width: 100%;">' +
                                            '<div>' +
                                                    '<a runat="server" href="~/Ventanas/Productos/DetalleProducto?prod=' + val.id_producto + '">' +
                                                    '<img src="' + val.URL_img + '" class="card-img-top animationImg">' +
                                                '</a>' +
                                            '</div>' +
                                            '<div align="center">' +
                                                '<div class="card-body">' +
                                                    '<div align="center">' +
                                                        '<div class="row">' +
                                                            '<div class="col-lg-6">' +
                                                                '<a data-title="Añadir a favoritos">' +
                                                                    '<img src="/Imagenes/Iconos/Favorito.png" height="30" class="animationBtnImg"></a>' +
                                                            '</div>' +
                                                            '<div class="col-lg-6">' +
                                                                '<a data-title="Añadir al carrito">' +
                                                                    '<img src="/Imagenes/Iconos/Bag.png" height="30" class="animationBtnImg"></a>' +
                                                            '</div>' +
                                                        '</div>' +
                                                        '<h5 class="card-title  nameProducto">' + val.nombre_producto + '</h5>' +
                                                        '<h5>$' + val.precio + '</h5>' +
                                                    '</div>'+
                                                '</div>' +
                                            '</div>' +
                                            '</div>' +
                                            '</br>' +
                                    '</div>' 

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
