<%@ Page Title="Home" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="MiniCerveceria._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
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

        #SideMenuMantenedor {
            display: none;
        }

        #MantenedorNav {
            display: none;
        }

        a {
            text-decoration: none;
        }
    </style>
    <section id="CursosHome">
        <div class="TitlePage" style="justify-content: center; align-items: center; text-align: center;">
            <a class="masthead-heading text-uppercase cursor-scale" style="color: #000000" href="Ventanas/Cursos/Cursos.aspx">
                <img src="/Imagenes/Iconos/CursosBlack.png" height="80" />
                Cursos</a>
        </div>


        <div class="row">
            <div class="col-lg-6">
                <hr class="featurette-divider">

                <div class="row featurette">
                    <div class="col-md-7">
                        <h2 class="featurette-heading fw-normal lh-1">Title Curso Example.</h2>
                        <p class="lead">And yes, this is the last block of representative placeholder content. Again, not really intended to be actually read, simply here to give you a better view of what this would look like with some actual content. Your content.</p>
                    </div>
                    <div class="col-md-5">
                        <figure class="containerz">
                            <img src="/Imagenes/Iconos/NoImage.png" />
                            <figcaption>
                                <h3>Inscribirse</h3>
                            </figcaption>
                            <a runat="server" href="/Ventanas/Cursos/DetalleCurso.aspx"></a>
                        </figure>
                    </div>
                </div>
            </div>
            <div class="col-lg-6">
                <hr class="featurette-divider">

                <div class="row featurette">
                    <div class="col-md-7">
                        <h2 class="featurette-heading fw-normal lh-1">Title Curso Example.</h2>
                        <p class="lead">And yes, this is the last block of representative placeholder content. Again, not really intended to be actually read, simply here to give you a better view of what this would look like with some actual content. Your content.</p>
                    </div>
                    <div class="col-md-5">
                        <figure class="containerz">
                            <img src="/Imagenes/Iconos/NoImage.png" />
                            <figcaption>
                                <h3>Inscribirse</h3>
                            </figcaption>
                            <a runat="server" href="/Ventanas/Cursos/DetalleCurso.aspx"></a>
                        </figure>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section id="ProductosMasVendidosHome">
        <div class="TitlePage" style="justify-content: center; align-items: center; text-align: center;">
            <a class="masthead-heading text-uppercase cursor-scale" style="color: #000000">Productos Populares</a>
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
    </section>
    <section id="ProductosHome">
        <div class="TitlePage" style="justify-content: center; align-items: center; text-align: center;">
            <a class="masthead-heading text-uppercase cursor-scale" style="color: #000000" href="Ventanas/Productos/Productos.aspx">
                <img src="/Imagenes/Iconos/ProductosBlack.png" height="80" />
                Productos</a>
        </div>
        <div class="row" align="center" id="TablaProductos">

        </div>
    </section>

    <script type="text/javascript">
        $(document).ready(() => {
            cargarProductos()
            $(".AnadirProductoCarrito").on("click", function () {
                var id_producto = $(this).data("id-producto");
                AnadirProductoCarrito(id_producto);
            });

            $(".AnadirProductoFavorito").on("click", function () {
                var id_producto = $(this).data("id-producto");
                AnadirFavorito(id_producto);
            });

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

        function cargarProductos() {
            $.ajax({
                type: 'POST',
                cache: false,
                url: '<%= ResolveUrl("/Default.aspx/ListarProductosMuestra") %>',
                contentType: 'application/json; charset=utf-8',
                async: false,
                dataType: 'json',
                success: function (data) {

                    var html = "";

                    if (data.d != null) {

                        $.each(data.d, function (i, val) {
                            html+= '<div class="col-lg-4" align="center">' +
                                        '<br />' +
                                        '<div class="container">' +
                                            '<figure class="containerz">' +
                                                '<img src="' + val.URL_img.trim() + '" />' +
                                                '<figcaption>' +
                                                    '<h3>' + val.nombre_producto.trim() + '</h3>' +
                                                '</figcaption>' +
                                                '<a href="/Ventanas/Productos/DetalleProducto?prod=' + val.id_producto + '"></a>' +
                                            '</figure>' +
                                            '<div class="card">' +
                                                '<div align="center">' +
                                                    '<div class="card-body">' +
                                                        '<div align="center">'  +
                                                            '<div class="row">' +
                                                                '<div class="col-lg-6">' +
                                                                    '<a class="AnadirProductoFavorito" data-id-producto="' + val.id_producto + '"  class="AnadirProductoFavorito" data-id-producto="' + val.id_producto + '" data-title="Añadir a favoritos">' +
                                                                    '<img src="/Imagenes/Iconos/Favorito.png" height="30" class="animationBtnImg"></a>' +
                                                                '</div>' +
                                                                '<div class="col-lg-6">' +
                                                                    '<a class="AnadirProductoCarrito" data-id-producto="' + val.id_producto + '" data-title="Añadir al carrito">' +
                                                                    '<img src="/Imagenes/Iconos/Bag.png" height="30" class="animationBtnImg"></a>' +
                                                                '</div>' +
                                                            '</div>' +
                                                        '</div>' +
                                                    '</div>' +
                                                '</div>' +
                                            '</div>' +
                                        '</div>' +
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


