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
    </style>
    <br />
    <asp:Label runat="server" ClientIDMode="Static" ID="NameCategoria" CssClass="visually-hidden"> </asp:Label>
    <div class="row">
        <div class="col-lg-6">
            <div>
                <img src="/Imagenes/Iconos/NoImage.png" class="animationImg" style="width: 100%">
            </div>
        </div>
        <div class="col-lg-6">
            <div class="card">
                <div class="card-body">
                    <div class="row">
                        <div class="col-lg-12">
                            <h2><asp:Label runat="server" ClientIDMode="Static" id="NomProducto">Producto example</asp:Label></h2>
                        </div>
                        <div class="col-lg-12">
                            <h4>$000.000</h4>
                            <br />
                        </div>
                        <div class="col-lg-12">
                            <p>
                                Why do we use it?

                                It is a long established fact that a reader will be distracted by the readable content of a page
                                when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal
                                distribution of letters, as opposed to using 'Content here, content here', making it look like
                                readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as
                                their default model text, and a search for 'lorem ipsum' will uncover many web sites still in 
                                their infancy. Various versions have evolved over the years, sometimes by accident, sometimes
                                on purpose (injected humour and the like).
                            </p>
                        </div>
                        <div class="col-lg-12">
                            <h6>Categoria: <span> Categoria example </span></h6>
                            <hr class="featurette-divider">
                        </div>
                        <div class="col-lg-4">
                            <div class="card">
                                <div class="card-body">
                                    <tr>
                                        <td>
                                            <strong> 1 </strong>
                                        </td>
                                        <td>
                                            <a href="#"><img src="/Imagenes/Iconos/btnSumBlack.png" height="25" width="25"/></a><span> </span><a href="#"><img src="/Imagenes/Iconos/btnRestBlack.png" height="25" width="25"/></a>
                                        </td>
                                        <td>
                                            <a data-title="Añadir al carrito"><img src="/Imagenes/Iconos/Bag.png" height="30" class="animationBtnImg"></a>
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
        <a class="masthead-heading text-uppercase cursor-scale" style="color: #000000">Productos relacionados</a>
    </div>
    <div class="container text-center my-3">
        <div class="row mx-auto my-auto justify-content-center">
            <div id="recipeCarousel" class="carousel slide" data-bs-ride="carousel">
                <div class="carousel-inner" role="listbox">
                    <div class="carousel-item active">
                        <div class="card">
                            <div>
                                <img src="/Imagenes/Iconos/NoImage.png" class="card-img-top">
                            </div>
                            <div align="center">
                                <div class="card-body">
                                    <h5 class="card-title">Card title</h5>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <div class="card">
                            <div>
                                <img src="/Imagenes/Iconos/NoImage.png" class="card-img-top">
                            </div>
                            <div align="center">
                                <div class="card-body">
                                    <h5 class="card-title">Card title</h5>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <div class="card">
                            <div>
                                <img src="/Imagenes/Iconos/NoImage.png" class="card-img-top">
                            </div>
                            <div align="center">
                                <div class="card-body">
                                    <h5 class="card-title">Card title</h5>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <div class="card">
                            <div>
                                <img src="/Imagenes/Iconos/NoImage.png" class="card-img-top">
                            </div>
                            <div align="center">
                                <div class="card-body">
                                    <h5 class="card-title">Card title</h5>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <div class="card">
                            <div>
                                <img src="/Imagenes/Iconos/NoImage.png" class="card-img-top">
                            </div>
                            <div align="center">
                                <div class="card-body">
                                    <h5 class="card-title">Card title</h5>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <div class="card">
                            <div>
                                <img src="/Imagenes/Iconos/NoImage.png" class="card-img-top">
                            </div>
                            <div align="center">
                                <div class="card-body">
                                    <h5 class="card-title">Card title</h5>
                                </div>
                            </div>
                        </div>
                    </div>
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

    <script type="text/javascript">
        $(document).ready(() => {
            var NameProdHead = $("#NomProducto").text();
            var NameCateHead = $("#NameCategoria").text();

            if (NameProdHead != "") {
                $("#TextBread1").text(NameCateHead);
                $("#itemBreadbrum1").removeClass("OcultarElemento");
                $("#itemBreadbrum1").attr("href", "/Ventanas/Productos/Productos?cate=" + NameCateHead);

                $("#nombreCategoridaHeader").text(NameProdHead);
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
    </script>
</asp:Content>
