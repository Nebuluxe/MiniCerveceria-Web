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
        <div class="row" id="TablaCursos">

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
    <section id="Comentarios">
        <div class="TitlePage" style="justify-content: center; align-items: center; text-align: center;">
                <img src="/Imagenes/Iconos/ComentarioBLack.png" height="80" />
                Comentarios
        </div>
        <div class="container my-3" id="carrouselComentarios">
            <div class="row mx-auto my-auto justify-content-center">
                <div id="recipeCarousel" class="carousel slide" data-bs-ride="carousel">
                    <div class="carousel-inner" role="listbox" id="TablaComentarios">
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
        <div id="listComentarios" class="row">
        </div>
    </section>

    <script type="text/javascript">
        $(document).ready(() => {
            cargarProductos()
            cargarProductosComentarios()
            cargarCursos()

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

        function cargarProductosComentarios() {

            $.ajax({
                type: 'POST',
                cache: false,
                url: '<%= ResolveUrl("/Default.aspx/CargarComentarios") %>',
                contentType: 'application/json; charset=utf-8',
                async: false,
                dataType: 'json',
                success: function (data) {

                    var html = "";

                    if (data.d != null) {
                        var cont = 1;

                        if (data.d.length >= 5) {
                            $.each(data.d, function (i, val) {
                                if (cont == 1) {

                                    var stars = "";


                                    if (val.puntuacion == 1) {
                                        stars = '<img src="/Imagenes/Iconos/FavOn.png" width="35" /><span> </span>' +
                                            '<img src="/Imagenes/Iconos/FavOff.png" width="35" /><span> </span>' +
                                            '<img src="/Imagenes/Iconos/FavOff.png" width="35" /><span> </span>' +
                                            '<img src="/Imagenes/Iconos/FavOff.png" width="35" /><span> </span>' +
                                            '<img src="/Imagenes/Iconos/FavOff.png" width="35" />';
                                    }
                                    if (val.puntuacion == 2) {
                                        stars = '<img src="/Imagenes/Iconos/FavOn.png" width="35" /><span> </span>' +
                                            '<img src="/Imagenes/Iconos/FavOn.png" width="35" /><span> </span>' +
                                            '<img src="/Imagenes/Iconos/FavOff.png" width="35" /><span> </span>' +
                                            '<img src="/Imagenes/Iconos/FavOff.png" width="35" /><span> </span>' +
                                            '<img src="/Imagenes/Iconos/FavOff.png" width="35" />';
                                    }
                                    if (val.puntuacion == 3) {
                                        stars = '<img src="/Imagenes/Iconos/FavOn.png" width="35" /><span> </span>' +
                                            '<img src="/Imagenes/Iconos/FavOn.png" width="35" /><span> </span>' +
                                            '<img src="/Imagenes/Iconos/FavOn.png" width="35" /><span> </span>' +
                                            '<img src="/Imagenes/Iconos/FavOff.png" width="35" /><span> </span>' +
                                            '<img src="/Imagenes/Iconos/FavOff.png" width="35" />';
                                    }
                                    if (val.puntuacion == 4) {
                                        stars = '<img src="/Imagenes/Iconos/FavOn.png" width="35" /><span> </span>' +
                                            '<img src="/Imagenes/Iconos/FavOn.png" width="35" /><span> </span>' +
                                            '<img src="/Imagenes/Iconos/FavOn.png" width="35" /><span> </span>' +
                                            '<img src="/Imagenes/Iconos/FavOn.png" width="35" /><span> </span>' +
                                            '<img src="/Imagenes/Iconos/FavOff.png" width="35" />';
                                    }
                                    if (val.puntuacion == 5) {
                                        stars = '<img src="/Imagenes/Iconos/FavOn.png" width="35" /><span> </span>' +
                                            '<img src="/Imagenes/Iconos/FavOn.png" width="35" /><span> </span>' +
                                            '<img src="/Imagenes/Iconos/FavOn.png" width="35" /><span> </span>' +
                                            '<img src="/Imagenes/Iconos/FavOn.png" width="35" /><span> </span>' +
                                            '<img src="/Imagenes/Iconos/FavOn.png" width="35" />';
                                    }

                                    html += '<div class="carousel-item active">' +
                                        '<div class="container">' +
                                        '<div class="card">' +
                                        '<div>' +
                                        '<img src="' + val.url_img_prod + '" class="card-img-top" />' +
                                        '<div class="card-body">' +
                                        '<div class="row">' +
                                        '<div class="col-lg-12">' +
                                        '<img src="' + val.url_img_user + '" style="border-radius: 50%; width: 100px; float:left !important" />' +
                                        '<br/><span>' + val.nombre + '  ' + val.apelido + '</span><br/>' +
                                        '<span>' + val.fecha + '</span><br/><br/><br/>' +
                                        '<p>' + val.texto + '</p>' +
                                        '</div>' +
                                        '<div class="col-12" align="center">' +
                                        stars +
                                        '</div>' +
                                        '</div>' +
                                        '</div>' +
                                        '</div>' +
                                        '</div>' +
                                        '</div>' +
                                        '</div>'
                                    cont++;
                                } else {

                                    var stars = "";

                                    if (val.puntuacion == 1) {
                                        stars = '<img src="/Imagenes/Iconos/FavOn.png" width="35" /><span> </span>' +
                                            '<img src="/Imagenes/Iconos/FavOff.png" width="35" /><span> </span>' +
                                            '<img src="/Imagenes/Iconos/FavOff.png" width="35" /><span> </span>' +
                                            '<img src="/Imagenes/Iconos/FavOff.png" width="35" /><span> </span>' +
                                            '<img src="/Imagenes/Iconos/FavOff.png" width="35" />';
                                    }
                                    if (val.puntuacion == 2) {
                                        stars = '<img src="/Imagenes/Iconos/FavOn.png" width="35" /><span> </span>' +
                                            '<img src="/Imagenes/Iconos/FavOn.png" width="35" /><span> </span>' +
                                            '<img src="/Imagenes/Iconos/FavOff.png" width="35" /><span> </span>' +
                                            '<img src="/Imagenes/Iconos/FavOff.png" width="35" /><span> </span>' +
                                            '<img src="/Imagenes/Iconos/FavOff.png" width="35" />';
                                    }
                                    if (val.puntuacion == 3) {
                                        stars = '<img src="/Imagenes/Iconos/FavOn.png" width="35" /><span> </span>' +
                                            '<img src="/Imagenes/Iconos/FavOn.png" width="35" /><span> </span>' +
                                            '<img src="/Imagenes/Iconos/FavOn.png" width="35" /><span> </span>' +
                                            '<img src="/Imagenes/Iconos/FavOff.png" width="35" /><span> </span>' +
                                            '<img src="/Imagenes/Iconos/FavOff.png" width="35" />';
                                    }
                                    if (val.puntuacion == 4) {
                                        stars = '<img src="/Imagenes/Iconos/FavOn.png" width="35" /><span> </span>' +
                                            '<img src="/Imagenes/Iconos/FavOn.png" width="35" /><span> </span>' +
                                            '<img src="/Imagenes/Iconos/FavOn.png" width="35" /><span> </span>' +
                                            '<img src="/Imagenes/Iconos/FavOn.png" width="35" /><span> </span>' +
                                            '<img src="/Imagenes/Iconos/FavOff.png" width="35" />';
                                    }
                                    if (val.puntuacion == 5) {
                                        stars = '<img src="/Imagenes/Iconos/FavOn.png" width="35" /><span> </span>' +
                                            '<img src="/Imagenes/Iconos/FavOn.png" width="35" /><span> </span>' +
                                            '<img src="/Imagenes/Iconos/FavOn.png" width="35" /><span> </span>' +
                                            '<img src="/Imagenes/Iconos/FavOn.png" width="35" /><span> </span>' +
                                            '<img src="/Imagenes/Iconos/FavOn.png" width="35" />';
                                    }

                                    html += '<div class="carousel-item">' +
                                        '<div class="container">' +
                                        '<div class="card">' +
                                        '<div>' +
                                        '<img src="' + val.url_img_prod + '" class="card-img-top" />' +
                                        '<div class="card-body">' +
                                        '<div class="row">' +
                                        '<div class="col-lg-12">' +
                                        '<img src="' + val.url_img_user + '" style="border-radius: 50%; width: 100px; float:left !important" />' +
                                        '<br/><span>' + val.nombre + '  ' + val.apelido + '</span><br/>' +
                                        '<span>' + val.fecha + '</span><br/><br/><br/>' +
                                        '<p>' + val.texto + '</p>' +
                                        '</div>' +
                                        '<div class="col-12" align="center">' +
                                        stars +
                                        '</div>' +
                                        '</div>' +
                                        '</div>' +
                                        '</div>' +
                                        '</div>' +
                                        '</div>' +
                                        '</div>'
                                }
                            });

                            $('#TablaComentarios').html(html);
                            $('#listComentarios').hide();
                        } else {
                            $.each(data.d, function (i, val) {

                                var stars = "";

                                if (val.puntuacion == 1) {
                                    stars = '<img src="/Imagenes/Iconos/FavOn.png" width="35" /><span> </span>' +
                                        '<img src="/Imagenes/Iconos/FavOff.png" width="35" /><span> </span>' +
                                        '<img src="/Imagenes/Iconos/FavOff.png" width="35" /><span> </span>' +
                                        '<img src="/Imagenes/Iconos/FavOff.png" width="35" /><span> </span>' +
                                        '<img src="/Imagenes/Iconos/FavOff.png" width="35" />';
                                }
                                if (val.puntuacion == 2) {
                                    stars = '<img src="/Imagenes/Iconos/FavOn.png" width="35" /><span> </span>' +
                                        '<img src="/Imagenes/Iconos/FavOn.png" width="35" /><span> </span>' +
                                        '<img src="/Imagenes/Iconos/FavOff.png" width="35" /><span> </span>' +
                                        '<img src="/Imagenes/Iconos/FavOff.png" width="35" /><span> </span>' +
                                        '<img src="/Imagenes/Iconos/FavOff.png" width="35" />';
                                }
                                if (val.puntuacion == 3) {
                                    stars = '<img src="/Imagenes/Iconos/FavOn.png" width="35" /><span> </span>' +
                                        '<img src="/Imagenes/Iconos/FavOn.png" width="35" /><span> </span>' +
                                        '<img src="/Imagenes/Iconos/FavOn.png" width="35" /><span> </span>' +
                                        '<img src="/Imagenes/Iconos/FavOff.png" width="35" /><span> </span>' +
                                        '<img src="/Imagenes/Iconos/FavOff.png" width="35" />';
                                }
                                if (val.puntuacion == 4) {
                                    stars = '<img src="/Imagenes/Iconos/FavOn.png" width="35" /><span> </span>' +
                                        '<img src="/Imagenes/Iconos/FavOn.png" width="35" /><span> </span>' +
                                        '<img src="/Imagenes/Iconos/FavOn.png" width="35" /><span> </span>' +
                                        '<img src="/Imagenes/Iconos/FavOn.png" width="35" /><span> </span>' +
                                        '<img src="/Imagenes/Iconos/FavOff.png" width="35" />';
                                }
                                if (val.puntuacion == 5) {
                                    stars = '<img src="/Imagenes/Iconos/FavOn.png" width="35" /><span> </span>' +
                                        '<img src="/Imagenes/Iconos/FavOn.png" width="35" /><span> </span>' +
                                        '<img src="/Imagenes/Iconos/FavOn.png" width="35" /><span> </span>' +
                                        '<img src="/Imagenes/Iconos/FavOn.png" width="35" /><span> </span>' +
                                        '<img src="/Imagenes/Iconos/FavOn.png" width="35" />';
                                }

                                html += '<div class="col-lg-3">' +
                                    '<div class="container">' +
                                    '<div class="card">' +
                                    '<div>' +
                                    '<img src="' + val.url_img_prod + '" class="card-img-top" />' +
                                    '<div class="card-body">' +
                                    '<div class="row">' +
                                    '<div class="col-lg-12">' +
                                    '<img src="' + val.url_img_user + '" style="border-radius: 50%; width: 100px; float:left !important" />' +
                                    '<br/><span>' + val.nombre + '  ' + val.apelido + '</span><br/>' +
                                    '<span>' + val.fecha + '</span><br/><br/><br/>' +
                                    '<p>' + val.texto + '</p>' +
                                    '</div>' +
                                    '<div class="col-12" align="center">' +
                                    stars +
                                    '</div>' +
                                    '</div>' +
                                    '</div>' +
                                    '</div>' +
                                    '</div>' +
                                    '</div>' +
                                    '</div>'
                            });

                            $('#listComentarios').html(html);
                            $('#carrouselComentarios').hide();

                        }
                    }
                },
                error: function (data) {
                    alert("Algo ha salido mal!!!");
                }
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
                    if (data.d) {
                        Command: toastr["success"]("Se ha añadido el producto al carrito")
                    }
                    else {
                        Command: toastr["warning"]("Debe registrarse o inicar sesion para añadir al carrito")
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
                        Command: toastr["success"]("El producto se ha añadido a favoritos")
                    }
                    if (data.d == 2) {
                        Command: toastr["warning"]("Este producto ya se encuentra agregado a favoritos")
                    }
                    if (data.d == 0) {
                        Command: toastr["warning"]("Debe registrarse o inicar sesion para añadir a favoritos")
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
                            html += '<div class="col-lg-4" align="center">' +
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
                                '<div align="center">' +
                                '<div class="row">' +
                                '<div class="col-lg-6">' +
                                '<a  style="cursor: pointer" class="AnadirProductoFavorito" data-id-producto="' + val.id_producto + '"  class="AnadirProductoFavorito" data-id-producto="' + val.id_producto + '" data-title="Añadir a favoritos">' +
                                '<img src="/Imagenes/Iconos/Favorito.png" height="30" class="animationBtnImg"></a>' +
                                '</div>' +
                                '<div class="col-lg-6">' +
                                '<a  style="cursor: pointer" class="AnadirProductoCarrito" data-id-producto="' + val.id_producto + '" data-title="Añadir al carrito">' +
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

        function cargarCursos() {
            $.ajax({
                type: 'POST',
                cache: false,
                url: '<%= ResolveUrl("/Default.aspx/CargarCursos") %>',
                contentType: 'application/json; charset=utf-8',
                async: false,
                dataType: 'json',
                success: function (data) {

                    var html = "";

                    if (data.d != null) {

                        $.each(data.d, function (i, val) {
                            html += '<div class="col-lg-6">' +
                                '<hr class="featurette-divider">' +
                                '<div class="row featurette">' +
                                '<div class="col-md-7">' +
                                '<h2 class="featurette-heading fw-normal lh-1">' + val.nombre_curso + '.</h2>' +
                                '<p>' + val.descripcion.substring(0, 200) + '...</p>' +
                                '</div>' +
                                '<div class="col-md-5">' +
                                '<figure class="containerz">' +
                                '<img src="' + val.URL_img + '" alt="sample89" />' +
                                '<figcaption>' +
                                '<h3>Ver mas sobre el curso</h3>' +
                                '</figcaption>' +
                                '<a href="/Ventanas/Cursos/DetalleCurso.aspx?uid=' + val.id_curso + '"></a>' +
                                '</figure>' +
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


