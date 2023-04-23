<%@ Page Title="Home" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="MiniCerveceria._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">



        <link rel="stylesheet" href="Scripts/home.css" />

        <link href="GlobalCss/PisaBootstrap.css" rel="stylesheet" />
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@splidejs/splide@3.6.12/dist/css/splide.min.css">
        <style>
            bd-placeholder-img {
                font-size: 1.125rem;
                text-anchor: middle;
                -webkit-user-select: none;
                -moz-user-select: none;
                user-select: none;
            }

            @media (min-width: 768px) {
                .bd-placeholder-img-lg {
                    font-size: 3.5rem;
                }
            }

            .b-example-divider {
                height: 3rem;
                background-color: rgba(0, 0, 0, .1);
                border: solid rgba(0, 0, 0, .15);
                border-width: 1px 0;
                box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
            }

            .b-example-vr {
                flex-shrink: 0;
                width: 1.5rem;
                height: 100vh;
            }

            .bi {
                vertical-align: -.125em;
                fill: currentColor;
            }

            .nav-scroller {
                position: relative;
                z-index: 2;
                height: 2.75rem;
                overflow-y: hidden;
            }

                .nav-scroller .nav {
                    display: flex;
                    flex-wrap: nowrap;
                    padding-bottom: 1rem;
                    margin-top: -1px;
                    overflow-x: auto;
                    text-align: center;
                    white-space: nowrap;
                    -webkit-overflow-scrolling: touch;
                }
        </style>
    </head>

    <div class="container">
        <div class="row">
            <div class="splide">
                <div class="splide__track">
                    <div class="splide__list">
                        <div class="col-sm-4 splide__slide m-2">
                            <div class="card bg-dark text-white">
                                <div class="card-body">
                                    <h5 class="card-title">Lúpulus Genericus</h5>
                                    <p class="card-text">Cuenta la leyenda que estos son los lúpulos más genericos que han existido.</p>
                                    <a href="#" class="btn-neon">
                                        <span class="span1"></span>
                                        <span class="span2"></span>
                                        <span class="span3"></span>
                                        <span class="span4"></span>
                                        Comprar Producto
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-4 splide__slide m-2">
                            <div class="card bg-dark text-white">
                                <div class="card-body">
                                    <h5 class="card-title">Lúpulus Genericus</h5>
                                    <p class="card-text">Cuenta la leyenda que estos son los lúpulos más genericos que han existido.</p>
                                    <a href="#" class="btn-neon">
                                        <span class="span1"></span>
                                        <span class="span2"></span>
                                        <span class="span3"></span>
                                        <span class="span4"></span>
                                        Comprar Producto
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-4 splide__slide m-2">
                            <div class="card bg-dark text-white">
                                <div class="card-body">
                                    <h5 class="card-title">Lúpulus Genericus</h5>
                                    <p class="card-text">Cuenta la leyenda que estos son los lúpulos más genericos que han existido.</p>
                                    <a href="#" class="btn-neon">
                                        <span class="span1"></span>
                                        <span class="span2"></span>
                                        <span class="span3"></span>
                                        <span class="span4"></span>
                                        Comprar Producto
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-4 splide__slide m-2">
                            <div class="card bg-dark text-white">
                                <div class="card-body">
                                    <h5 class="card-title">Lúpulus Genericus</h5>
                                    <p class="card-text">Cuenta la leyenda que estos son los lúpulos más genericos que han existido.</p>
                                    <a href="#" class="btn-neon">
                                        <span class="span1"></span>
                                        <span class="span2"></span>
                                        <span class="span3"></span>
                                        <span class="span4"></span>
                                        Comprar Producto
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <%--<div class="contenedor">
        <i id="left" class="fa-solid fa-angle-left"></i>
        <div class="carrusel">
            <asp:Image ImageUrl="~/Imagenes/zero.png" ClientIDMode="Static" runat="server" alt="img" draggable="false" />
            <a href="#" class="btn-neon">
                <span id="span1"></span>
                <span id="span2"></span>
                <span id="span3"></span>
                <span id="span4"></span>
                BOTON NEON
            </a>
            <asp:Image ImageUrl="~/Imagenes/zero.png" ClientIDMode="Static" runat="server" alt="img" draggable="false"/>
            <a href="#" class="btn-neon">
                <span id="span1"></span>
                <span id="span2"></span>
                <span id="span3"></span>
                <span id="span4"></span>
                BOTON NEON
            </a>
            <asp:Image ImageUrl="~/Imagenes/zero.png" ClientIDMode="Static" runat="server" alt="img" draggable="false"/>
            <a href="#" class="btn-neon">
                <span id="span1"></span>
                <span id="span2"></span>
                <span id="span3"></span>
                <span id="span4"></span>
                BOTON NEON
            </a>
            <asp:Image ImageUrl="~/Imagenes/zero.png" ClientIDMode="Static" runat="server" alt="img" draggable="false"/>
            <a href="#" class="btn-neon" style="position:fixed;">
                <span id="span1"></span>
                <span id="span2"></span>
                <span id="span3"></span>
                <span id="span4"></span>
                BOTON NEON
            </a>
        </div>
        <i id="right" class="fa-solid fa-angle-right"></i>
    </div>--%>
    <br />

    <!-- Marketing messaging and featurettes
  ================================================== -->
    <!-- Wrap the rest of the page in another container to center all the content. -->

    <div class="container marketing">

        <!-- Three columns of text below the carrusel -->
        <div class="row">
            <div class="col-lg-4">
                <svg class="bd-placeholder-img rounded-circle" width="140" height="140" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 140x140" preserveAspectRatio="xMidYMid slice" focusable="false">
                    <title>Placeholder</title>
                    <rect width="100%" height="100%" fill="#777" />
                    <text x="50%" y="50%" fill="#777" dy=".3em">140x140</text></svg>

                <h2 class="fw-normal">Heading</h2>
                <p>Some representative placeholder content for the three columns of text below the carrusel. This is the first column.</p>
                <p><a class="btn btn-secondary" href="#">View details &raquo;</a></p>
            </div>
            <!-- /.col-lg-4 -->
            <div class="col-lg-4">
                <svg class="bd-placeholder-img rounded-circle" width="140" height="140" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 140x140" preserveAspectRatio="xMidYMid slice" focusable="false">
                    <title>Placeholder</title>
                    <rect width="100%" height="100%" fill="#777" />
                    <text x="50%" y="50%" fill="#777" dy=".3em">140x140</text></svg>

                <h2 class="fw-normal">Heading</h2>
                <p>Another exciting bit of representative placeholder content. This time, we've moved on to the second column.</p>
                <p><a class="btn btn-secondary" href="#">View details &raquo;</a></p>
            </div>
            <!-- /.col-lg-4 -->
            <div class="col-lg-4">
                <svg class="bd-placeholder-img rounded-circle" width="140" height="140" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 140x140" preserveAspectRatio="xMidYMid slice" focusable="false">
                    <title>Placeholder</title>
                    <rect width="100%" height="100%" fill="#777" />
                    <text x="50%" y="50%" fill="#777" dy=".3em">140x140</text></svg>

                <h2 class="fw-normal">Heading</h2>
                <p>And lastly this, the third column of representative placeholder content.</p>
                <p><a class="btn btn-secondary" href="#">View details &raquo;</a></p>
            </div>
            <!-- /.col-lg-4 -->
        </div>
        <!-- /.row -->


        <!-- START THE FEATURETTES -->

        <hr class="featurette-divider">

        <div class="row featurette">
            <div class="col-md-7">
                <h2 class="featurette-heading fw-normal lh-1">First featurette heading. <span class="text-muted">It’ll blow your mind.</span></h2>
                <p class="lead">Some great placeholder content for the first featurette here. Imagine some exciting prose here.</p>
            </div>
            <div class="col-md-5">
                <svg class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" width="500" height="500" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 500x500" preserveAspectRatio="xMidYMid slice" focusable="false">
                    <title>Placeholder</title>
                    <rect width="100%" height="100%" fill="#eee" />
                    <text x="50%" y="50%" fill="#aaa" dy=".3em">500x500</text></svg>

            </div>
        </div>

        <hr class="featurette-divider">

        <div class="row featurette">
            <div class="col-md-7 order-md-2">
                <h2 class="featurette-heading fw-normal lh-1">Oh yeah, it’s that good. <span class="text-muted">See for yourself.</span></h2>
                <p class="lead">Another featurette? Of course. More placeholder content here to give you an idea of how this layout would work with some actual real-world content in place.</p>
            </div>
            <div class="col-md-5 order-md-1">
                <svg class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" width="500" height="500" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 500x500" preserveAspectRatio="xMidYMid slice" focusable="false">
                    <title>Placeholder</title>
                    <rect width="100%" height="100%" fill="#eee" />
                    <text x="50%" y="50%" fill="#aaa" dy=".3em">500x500</text></svg>

            </div>
        </div>

        <hr class="featurette-divider">

        <div class="row featurette">
            <div class="col-md-7">
                <h2 class="featurette-heading fw-normal lh-1">And lastly, this one. <span class="text-muted">Checkmate.</span></h2>
                <p class="lead">And yes, this is the last block of representative placeholder content. Again, not really intended to be actually read, simply here to give you a better view of what this would look like with some actual content. Your content.</p>
            </div>
            <div class="col-md-5">
                <svg class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" width="500" height="500" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 500x500" preserveAspectRatio="xMidYMid slice" focusable="false">
                    <title>Placeholder</title>
                    <rect width="100%" height="100%" fill="#eee" />
                    <text x="50%" y="50%" fill="#aaa" dy=".3em">500x500</text></svg>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/@splidejs/splide@3.6.12/dist/js/splide.min.js"></script>
    </div>
    <script type="text/javascript">
        $(document).ready(() => {
            var splide = new Splide('.splide', {
                type: 'loop',
                perPage: 3,
                rewind: true,
            });

            splide.mount();
            const carrusel = document.querySelector(".carrusel"),
                primeraImagen = carrusel.querySelectorAll("img")[0],
                flechasCarrusel = document.querySelectorAll(".contenedor i");
            let isDragStart = false, isDragging = false, prevPageX, prevScrollLeft, positionDiff;
            const showHideIcons = () => {
                // showing and hiding prev/next icon according to carrusel scroll left value
                let scrollWidth = carrusel.scrollWidth - carrusel.clientWidth; // getting max scrollable width
                flechasCarrusel[0].style.display = carrusel.scrollLeft == 0 ? "none" : "block";
                flechasCarrusel[1].style.display = carrusel.scrollLeft == scrollWidth ? "none" : "block";
            }
            flechasCarrusel.forEach(icon => {
                icon.addEventListener("click", () => {
                    let primeraImagenWidth = primeraImagen.clientWidth + 14; // getting first img width & adding 14 margin value
                    // if clicked icon is left, reduce width value from the carrusel scroll left else add to it
                    carrusel.scrollLeft += icon.id == "left" ? -primeraImagenWidth : primeraImagenWidth;
                    setTimeout(() => showHideIcons(), 60); // calling showHideIcons after 60ms
                });
            });
            const autoSlide = () => {
                // if there is no image left to scroll then return from here
                if (carrusel.scrollLeft - (carrusel.scrollWidth - carrusel.clientWidth) > -1 || carrusel.scrollLeft <= 0) return;
                positionDiff = Math.abs(positionDiff); // making positionDiff value to positive
                let primeraImagenWidth = primeraImagen.clientWidth + 14;
                // getting difference value that needs to add or reduce from carrusel left to take middle img center
                let valDifference = primeraImagenWidth - positionDiff;
                if (carrusel.scrollLeft > prevScrollLeft) { // if user is scrolling to the right
                    return carrusel.scrollLeft += positionDiff > primeraImagenWidth / 3 ? valDifference : -positionDiff;
                }
                // if user is scrolling to the left
                carrusel.scrollLeft -= positionDiff > primeraImagenWidth / 3 ? valDifference : -positionDiff;
            }
            const dragStart = (e) => {
                // updatating global variables value on mouse down event
                isDragStart = true;
                prevPageX = e.pageX || e.touches[0].pageX;
                prevScrollLeft = carrusel.scrollLeft;
            }
            const dragging = (e) => {
                // scrolling images/carrusel to left according to mouse pointer
                if (!isDragStart) return;
                e.preventDefault();
                isDragging = true;
                carrusel.classList.add("dragging");
                positionDiff = (e.pageX || e.touches[0].pageX) - prevPageX;
                carrusel.scrollLeft = prevScrollLeft - positionDiff;
                showHideIcons();
            }
            const dragStop = () => {
                isDragStart = false;
                carrusel.classList.remove("dragging");
                if (!isDragging) return;
                isDragging = false;
                autoSlide();
            }
            carrusel.addEventListener("mousedown", dragStart);
            carrusel.addEventListener("touchstart", dragStart);
            document.addEventListener("mousemove", dragging);
            carrusel.addEventListener("touchmove", dragging);
            document.addEventListener("mouseup", dragStop);
            carrusel.addEventListener("touchend", dragStop);    

        });
    </script>
</asp:Content>
