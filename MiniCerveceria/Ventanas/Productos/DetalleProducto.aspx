<%@ Page Title="Productos" Language="C#" MasterPageFile="~/Site.Master" CodeBehind="DetalleProducto.aspx.cs" Inherits="MiniCerveceria.Ventanas.Productos.DetalleProducto" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        header.masthead {
            height: 350px;
            background-image: linear-gradient(rgba(0, 0, 0, .5), rgba(0, 0, 0, .5)), url("/Imagenes/CarrouselHome3.jpg");
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

        #headMaster {
            height: 350px;
        }

        @media (max-width: 767px) {
            .carousel-inner .carousel-item > div {
                display: none;
            }

                .carousel-inner .carousel-item > div:first-child {
                    display: block;
                }
        }

        .carousel-inner .carousel-item.active,
        .carousel-inner .carousel-item-next,
        .carousel-inner .carousel-item-prev {
            display: flex;
        }

        /* medium and up screens */
        @media (min-width: 768px) {

            .carousel-inner .carousel-item-end.active,
            .carousel-inner .carousel-item-next {
                transform: translateX(25%);
            }

            .carousel-inner .carousel-item-start.active,
            .carousel-inner .carousel-item-prev {
                transform: translateX(-25%);
            }
        }

        .carousel-inner .carousel-item-end,
        .carousel-inner .carousel-item-start {
            transform: translateX(0);
        }

        #Contador{
            font-size: 20px
        }
    </style>
    <br />
    <asp:Label runat="server" ClientIDMode="Static" ID="NameCategoria" CssClass="visually-hidden"> </asp:Label>
    <asp:Label runat="server" ClientIDMode="Static" ID="idCate" CssClass="visually-hidden"> </asp:Label>
    <asp:Label runat="server" ClientIDMode="Static" ID="idProd" CssClass="visually-hidden"> </asp:Label>
    <div class="row">
        <div class="col-lg-6">
            <div>
                <asp:image runat="server" ClientIDMode="Static" class="animationImg" id="ItemImagen" />
            </div>
        </div>
        <div class="col-lg-6">
            <div class="card">
                <div class="card-body">
                    <div class="row">
                        <div class="col-lg-12">
                            <h2><asp:Label runat="server" ClientIDMode="Static" id="NomProducto"></asp:Label></h2>
                        </div>
                        <div class="col-lg-12">
                            <h4><asp:label runat="server" ClientIDMode="Static" ID="lblPecio"></asp:label></h4>
                            <br />
                        </div>
                        <div class="col-lg-12">
                            <p><asp:label runat="server" ClientIDMode="Static" ID="lblDescripcion"></asp:label></p>
                        </div>
                        <div class="col-lg-12">
                            <h6>Categoria: <asp:label runat="server" ClientIDMode="Static" ID="lblCategoria"></asp:label></h6>
                            <hr class="featurette-divider">
                        </div>
                        <div class="col-lg-4">
                            <div class="card">
                                <div class="card-body">
                                    <tr>
                                        <td>
                                            <a data-title="Añadir al carrito"><img src="/Imagenes/Iconos/Bag.png" height="30" class="animationBtnImg"></a>
                                        </td>
                                        <td>
                                            <a><img src="/Imagenes/Iconos/btnSumBlack.png" height="25" width="25"/></a><span id="Contador"> 0 </span><a><img src="/Imagenes/Iconos/btnRestBlack.png" height="25" width="25"/></a>
                                        </td>
                                    </tr>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="card">
                                <div class="card-body">
                                    <a data-title="Añadir a favoritos"><img src="/Imagenes/Iconos/Favorito.png" height="30" class="animationBtnImg"></a><span  style="color: #ff0000"> Añadir a favoritos </span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <br /><br />
    <div class="TitlePage" style="justify-content: center; align-items: center; text-align: center;">
        <a id="tituloRelacionados"  class="masthead-heading text-uppercase cursor-scale" style="color: #000000">Productos relacionados</a>
    </div>
    <div class="container text-center my-3" id="carrouselRelacionados">
        <div class="row mx-auto my-auto justify-content-center">
            <div id="recipeCarousel" class="carousel slide" data-bs-ride="carousel">
                <div class="carousel-inner" role="listbox" id="TablaRelacionados">
                    
                </div>
                <a class="carousel-control-prev bg-transparent w-aut" href="#recipeCarousel" role="button" data-bs-slide="prev">
                    <img src="/Imagenes/Iconos/carousel-control-prev-icon.png" style="width: 35px">
                </a>
                <a class="carousel-control-next bg-transparent w-aut" href="#recipeCarousel" role="button" data-bs-slide="next">
                    <img src="/Imagenes/Iconos/carousel-control-next-icon.png" style="width: 35px">
                </a>
            </div>
        </div>
    </div>
    <div id="listRelacionados" class="row">

    </div>
    <br />
    <br />

    <script type="text/javascript">
        $(document).ready(() => {
            var NameProdHead = $("#NomProducto").text();
            var NameCateHead = $("#NameCategoria").text();
            var idCate = $("#idCate").text();
            var idProd = $("#idProd").text();

            cargarProductosRelacionados(idCate, idProd);

            if (NameProdHead != "") {
                $("#nombreCategoridaHeader").text(NameCateHead);
                $("#TextBread1").text(NameCateHead);
                $("#itemBreadbrum1").removeClass("OcultarElemento");
                $("#itemBreadbrum1").attr("href", "/Ventanas/Productos/Productos?cate=" + idCate);

                $("#TextBread2").text(NameProdHead);
                $("#itemBreadbrum2").removeClass("OcultarElemento");
                $("#itemBreadbrum2").removeAttr("href");
            }
            else {
                $("#nombreCategoridaHeader").text("Productos");
            }

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
        });

        function cargarProductosRelacionados(idCate,idProd) {

            $.ajax({
                type: 'POST',
                cache: false,
                url: '<%= ResolveUrl("/Ventanas/Productos/Productos.aspx/ListarProductos") %>',
                contentType: 'application/json; charset=utf-8',
                async: false,
                dataType: 'json',
                data: JSON.stringify({ 'idCate': idCate, 'idSubCate': "0", 'novedad': "" }),
                success: function (data) {

                    var html = "";

                    if (data.d != null) {
                        var cont = 1;

                        if (data.d.length  >=  5) {
                            $.each(data.d, function (i, val) {
                                if (val.id_producto != idProd) {
                                    if (cont == 1) {
                                        html += '<div class="carousel-item  active">' +
                                            '<div class="card  hoverImg">' +
                                            '<div>' +
                                            '<a runat="server" href="~/Ventanas/Productos/DetalleProducto?prod=' + val.id_producto + '">' +
                                            '<img src="' + val.URL_img + '" class="card-img-top"></a>' +
                                            '</div>' +
                                            '<div align="center">' +
                                            '<div class="card-body">' +
                                            '<span class="">' + val.nombre_producto + '</span>' +
                                            '</div>' +
                                            '</div>' +
                                            '</div>' +
                                            '</div>'
                                        cont++;
                                    } else {
                                        html += '<div class="carousel-item">' +
                                            '<div class="card  hoverImg">' +
                                            '<div>' +
                                            '<a runat="server" href="~/Ventanas/Productos/DetalleProducto?prod=' + val.id_producto + '">' +
                                            '<img src="' + val.URL_img + '" class="card-img-top"></a>' +
                                            '</div>' +
                                            '<div align="center">' +
                                            '<div class="card-body">' +
                                            '<span >' + val.nombre_producto + '</span>' +
                                            '</div>' +
                                            '</div>' +
                                            '</div>' +
                                            '</div>'
                                    }
                                }
                            });

                            $('#TablaRelacionados').html(html);
                            $('#listRelacionados').hide();
                        } else { 
                            $.each(data.d, function (i, val) {
                                if (val.id_producto != idProd) {
                                    html += '<div class="col-lg-3 card  hoverImg  carousel-item>' +
                                                '<div  class="">' +
                                                    '<div>' +
                                                        '<a runat="server" href="~/Ventanas/Productos/DetalleProducto?prod=' + val.id_producto + '">' +
                                                        '<img src="' + val.URL_img + '" class="card-img-top"></a>' +
                                                    '</div>' +
                                                    '<div align="center">' +
                                                        '<div class="card-body">' +
                                                            '<span >' + val.nombre_producto + '</span>' +
                                                        '</div>' +
                                                    '</div>' +
                                                '</div>' +
                                            '</div>'
                                }
                            });

                            $('#listRelacionados').html(html);
                            $('#carrouselRelacionados').hide();

                            if (data.d.length == 1) {
                                $('#tituloRelacionados').hide();
                            }
                        }
                    }
                },
                error: function (data) {
                    alert("Algo ha salido mal!!!");
                }
            });


        }
    </script>
</asp:Content>
