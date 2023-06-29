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
                    <div class="card optionItem" style="font-size: 20px; cursor: pointer" id="btnNovedades">
                        <strong>Novedades</strong>
                    </div>
                    <br />
                    <div class="card optionItem" style="cursor: pointer" id="btnIngredientes">
                        <strong>Ingredientes</strong>
                    </div>
                    <div id="IngredientesItems">
                        <ul>
                            <li style="padding: 6px">
                                <div class="card optionItem" style="cursor: pointer" id="btnAzucares">
                                    Azúcares & Extractos
                                </div>
                            </li>
                            <li style="padding: 6px">
                                <div class="card optionItem" style="cursor: pointer" id="btnClarificantes">
                                    Clarificantes
                                </div>
                            </li>
                            <li style="padding: 6px">
                                <div class="card optionItem" style="cursor: pointer" id="btnSalesAditivos">
                                    Sales & aditivos
                                </div>
                            </li>
                            <li style="padding: 6px">
                                <div class="card optionItem" style="cursor: pointer" id="btnMaltas">
                                    Maltas
                                </div>
                            </li>
                            <li style="padding: 6px">
                                <div class="card optionItem" style="cursor: pointer" id="btnLevaduras">
                                    Levaduras
                                </div>
                            </li>
                            <li style="padding: 6px">
                                <div class="card optionItem" style="cursor: pointer" id="btnLupulos">
                                    Lupulos
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-12">
                    <div class="card optionItem" style="cursor: pointer" id="btnAccesorios">
                        <strong>Accesorios</strong>
                    </div>
                    <div id="AccesosriosItem">
                        <ul>
                            <li style="padding: 6px">
                                <div class="card optionItem" style="cursor: pointer" id="btnEmbotellado"> 
                                    Embotellado
                                </div>
                            </li>
                            <li style="padding: 6px">
                                <div class="card optionItem" style="cursor: pointer" id="btnFermentacion">
                                    Fermentacion
                                </div>
                            </li>
                            <li style="padding: 6px">
                                <div class="card optionItem" style="cursor: pointer" id="btnFiltros">
                                    Filtros
                                </div>
                            </li>
                            <li style="padding: 6px">
                                <div class="card optionItem" style="cursor: pointer" id="btnMedicion">
                                    Medicion
                                </div>
                            </li>
                            <li style="padding: 6px">
                                <div class="card optionItem" style="cursor: pointer" id="btnFogones">
                                    Fogones
                                </div>
                            </li>
                            <li style="padding: 6px">
                                <div class="card optionItem" style="cursor: pointer" id="btnEnfriamiento">
                                    Enfriamiento
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-12">
                    <div class="card optionItem" style="cursor: pointer" id="btnClistaleria">
                        <strong>Cristaleria</strong>
                    </div>
                </div>
                <div class="col-lg-12">
                    <br />
                    <div class="card optionItem" style="cursor: pointer" id="btnEquipaamiento">
                        <strong>Equipamiento</strong>
                    </div>
                </div>
                <div class="col-lg-12">
                    <br />
                    <div class="card optionItem" style="cursor: pointer" id="btnLibros">
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

            var idCate = $("#idCategoria").text();
            var idSubCate = $("#idSubCategoria").text();
            var novedad = $("#NameCategoria").text();

            cargarProductos(idCate, idSubCate, novedad);

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

            $('#btnLibros').on('click', function () {
                $("#nombreCategoridaHeader").text('Libros y recetas');
                $("#TextBread1").text(NameCateHead);
                $("#itemBreadbrum1").removeClass("OcultarElemento");
                $("#itemBreadbrum1").removeAttr("href");

                cargarProductos(5,0,'')
            })

            $('#btnEquipaamiento').on('click', function () {
                $("#nombreCategoridaHeader").text('Equipamiento');
                $("#TextBread1").text(NameCateHead);
                $("#itemBreadbrum1").removeClass("OcultarElemento");
                $("#itemBreadbrum1").removeAttr("href");

                cargarProductos(4,0,'')
            })


            $('#btnClistaleria').on('click', function () {
                $("#nombreCategoridaHeader").text('Cristaleria');
                $("#TextBread1").text(NameCateHead);
                $("#itemBreadbrum1").removeClass("OcultarElemento");
                $("#itemBreadbrum1").removeAttr("href");

                cargarProductos(3, 0, '')
            })

            $('#btnEnfriamiento').on('click', function () {
                $("#nombreCategoridaHeader").text('Enfriamiento');
                $("#TextBread1").text(NameCateHead);
                $("#itemBreadbrum1").removeClass("OcultarElemento");
                $("#itemBreadbrum1").removeAttr("href");

                cargarProductos(2, 12, '')
            })

            $('#btnFogones').on('click', function () {
                $("#nombreCategoridaHeader").text('Fogones');
                $("#TextBread1").text(NameCateHead);
                $("#itemBreadbrum1").removeClass("OcultarElemento");
                $("#itemBreadbrum1").removeAttr("href");

                cargarProductos(2, 11, '')
            })

            $('#btnMedicion').on('click', function () {
                $("#nombreCategoridaHeader").text('Medicion');
                $("#TextBread1").text(NameCateHead);
                $("#itemBreadbrum1").removeClass("OcultarElemento");
                $("#itemBreadbrum1").removeAttr("href");

                cargarProductos(2, 10, '')
            })

            $('#btnFiltros').on('click', function () {
                $("#nombreCategoridaHeader").text('Filtros');
                $("#TextBread1").text(NameCateHead);
                $("#itemBreadbrum1").removeClass("OcultarElemento");
                $("#itemBreadbrum1").removeAttr("href");

                cargarProductos(2, 9, '')
            })

            $('#btnFermentacion').on('click', function () {
                $("#nombreCategoridaHeader").text('Fermentacion');
                $("#TextBread1").text(NameCateHead);
                $("#itemBreadbrum1").removeClass("OcultarElemento");
                $("#itemBreadbrum1").removeAttr("href");

                cargarProductos(2, 8, '')
            })

            $('#btnEmbotellado').on('click', function () {
                $("#nombreCategoridaHeader").text('Embotellado');
                $("#TextBread1").text(NameCateHead);
                $("#itemBreadbrum1").removeClass("OcultarElemento");
                $("#itemBreadbrum1").removeAttr("href");

                cargarProductos(2, 7, '')
            })

            $('#btnAccesorios').on('click', function () {
                $("#nombreCategoridaHeader").text('Accesorios');
                $("#TextBread1").text(NameCateHead);
                $("#itemBreadbrum1").removeClass("OcultarElemento");
                $("#itemBreadbrum1").removeAttr("href");

                cargarProductos(2, 0, '')
            })

            $('#btnLupulos').on('click', function () {
                $("#nombreCategoridaHeader").text('Lupulos');
                $("#TextBread1").text(NameCateHead);
                $("#itemBreadbrum1").removeClass("OcultarElemento");
                $("#itemBreadbrum1").removeAttr("href");

                cargarProductos(1, 6, '')
            })

            $('#btnLevaduras').on('click', function () {
                $("#nombreCategoridaHeader").text('Levaduras');
                $("#TextBread1").text(NameCateHead);
                $("#itemBreadbrum1").removeClass("OcultarElemento");
                $("#itemBreadbrum1").removeAttr("href");

                cargarProductos(1, 5, '')
            })

            $('#btnMaltas').on('click', function () {
                $("#nombreCategoridaHeader").text('Maltas');
                $("#TextBread1").text(NameCateHead);
                $("#itemBreadbrum1").removeClass("OcultarElemento");
                $("#itemBreadbrum1").removeAttr("href");

                cargarProductos(1, 4, '')
            })

            $('#btnSalesAditivos').on('click', function () {
                $("#nombreCategoridaHeader").text('Sales & aditivos');
                $("#TextBread1").text(NameCateHead);
                $("#itemBreadbrum1").removeClass("OcultarElemento");
                $("#itemBreadbrum1").removeAttr("href");

                cargarProductos(1, 3, '')
            })

            $('#btnClarificantes').on('click', function () {
                $("#nombreCategoridaHeader").text('Clarificantes');
                $("#TextBread1").text(NameCateHead);
                $("#itemBreadbrum1").removeClass("OcultarElemento");
                $("#itemBreadbrum1").removeAttr("href");

                cargarProductos(1, 2, '')
            })

            $('#btnAzucares').on('click', function () {
                $("#nombreCategoridaHeader").text('Azúcares & Extractos');
                $("#TextBread1").text(NameCateHead);
                $("#itemBreadbrum1").removeClass("OcultarElemento");
                $("#itemBreadbrum1").removeAttr("href");

                cargarProductos(1, 1, '')
            })

            $('#btnIngredientes').on('click', function () {
                $("#nombreCategoridaHeader").text('Ingredientes');
                $("#TextBread1").text(NameCateHead);
                $("#itemBreadbrum1").removeClass("OcultarElemento");
                $("#itemBreadbrum1").removeAttr("href");

                cargarProductos(1, 0, '')
            })

            $('#btnNovedades').on('click', function () {
                $("#nombreCategoridaHeader").text('Novedades');
                $("#TextBread1").text(NameCateHead);
                $("#itemBreadbrum1").removeClass("OcultarElemento");
                $("#itemBreadbrum1").removeAttr("href");

                cargarProductos(0, 0, 'Novedades')
            })
        });

        function cargarProductos(idCate, idSubCate, novedad) {
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
                                            '<a href="/Ventanas/Productos/DetalleProducto?prod=' + val.id_producto + '"/>' +
                                                '<div class="contenedor">' +
                                                    '<img src="' + val.URL_img + '" class="card-img-top imagen">' +
                                                '</div>' +
                                            '</a>' +
                                            '<div align="center">' +
                                                '<div class="card-body">' +
                                                    '<div align="center">' +
                                                        '<div class="row">' +
                                                            '<div class="col-lg-6">' +
                                                                '<a style="cursor: pointer"  class="AnadirProductoFavorito" data-id-producto="' + val.id_producto + '" data-title="Añadir a favoritos">' +
                                                                '<img src="/Imagenes/Iconos/Favorito.png" height="30" class="animationBtnImg"></a>' +
                                                            '</div>' +
                                                            '<div class="col-lg-6">' +
                                                                '<a style="cursor: pointer"  class="AnadirProductoCarrito" data-id-producto="' + val.id_producto + '"  data-title="Añadir al carrito">' +
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


            $(".AnadirProductoCarrito").on("click", function () {
                var id_producto = $(this).data("id-producto");
                AnadirProductoCarrito(id_producto);
            });

            $(".AnadirProductoFavorito").on("click", function () {
                var id_producto = $(this).data("id-producto");
                AnadirFavorito(id_producto);
            });
        }


        function AnadirProductoCarrito(id_producto) {
            $.ajax({
                type: 'POST',
                cache: false,
                url: '<%= ResolveUrl("/Default.aspx/AnadirProductoCarrito") %>',
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                data: JSON.stringify({ 'id_producto': id_producto }),
                async: false,
                success: function (data) {
                    if (data.d == true) {
                        console.log('se insertó o actualizó de pana');
                    } else {
                        console.log('no insertó o actualizó de pana');
                    }
                },
                error: function (data) {
                    alert("Algo ha salido mal!!!");
                }
            });
        }

        function AnadirFavorito(id_producto) {
            $.ajax({
                type: 'POST',
                cache: false,
                url: '<%= ResolveUrl("/Default.aspx/AñadirFavorito") %>',
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                data: JSON.stringify({ 'id_producto': id_producto }),
                async: false,
                success: function (data) {
                    if (data.d == 1) {
                        console.log("Añadido")
                    }
                    if (data.d == 2) {
                        console.log("Ya existe como añadido")
                    }
                    if (data.d == 0) {
                        console.log("Debe inicar sesion")
                    }
                },
                error: function (data) {
                    alert("Algo ha salido mal!!!");
                }
            });
        }
    </script>
</asp:Content>
