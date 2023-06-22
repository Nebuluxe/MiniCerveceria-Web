<%@ Page Title="Cursos" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DetalleCurso.aspx.cs" Inherits="MiniCerveceria.Ventanas.Cursos.DetalleCurso" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        header.masthead{
            height: 350px;
            background-image: linear-gradient(rgba(0, 0, 0, .5), rgba(0, 0, 0, .5)), url("/Imagenes/HomePage.jpg");
        }

        .headContent{
            display: none
        }

        #SideMenuMantenedor {
            display: none;
        }

        #MantenedorNav{
            display: none;
        }
    </style>
    <asp:Label runat="server" ClientIDMode="Static" ID="NameCurso" CssClass="visually-hidden"> </asp:Label>
    <br />
    <br />
    <h5>
        Nombre del curso
    </h5>
    <h6>
        Fecha publicacion: 20-02-2022
    </h6>
    <br />
    <br />
    <div class="card">
        <div class="card-body">
            <p> 
                <img src="/Imagenes/Iconos/NoImage.png" align="left" width="400"  height="400">
                "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur? "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?""Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?""
            </p>
        </div>
    </div>
    <br />
    <br />
    <hr class="featurette-divider">
    <h5>
        Formulario de Inscripción
    </h5>
    <div class="row">
        <div class="col-lg-4">
            <label for="Nombre" class="form-label">Nombre</label>
            <input class="form-control" id="Nombre" placeholder="Nombre">
        </div>
        <div class="col-lg-4">
            <label for="Apellido" class="form-label">Apellido</label>
            <input class="form-control" id="Apellido" placeholder="Apellido">
        </div>
        <div class="col-lg-4">
            <label for="FechaNac" class="form-label">Email</label>
            <input class="form-control" id="Email" placeholder="xxxxx@gmail.com">
        </div>
        <div class="col-lg-12">
            <label for="FechaNac" class="form-label">Mensaje</label>
            <textarea class="form-control" id="Mensaje"></textarea>
        </div>
        <div class="col-lg-12">
            <br />
            <a class="btn btn-outline-warning"> Enviar </a>
        </div>
    </div>

    <script type="text/javascript">
        $(document).ready(() => {
            var NameCurso = $("#NameCurso").text();

            if (NameCurso != "") {
                $("#TextBread1").text("Cursos");
                $("#itemBreadbrum1").removeClass("OcultarElemento");
                $("#itemBreadbrum1").attr("href", "/Ventanas/Cursos/Cursos");

                $("#TextBread2").text(NameCurso);
                $("#itemBreadbrum2").removeClass("OcultarElemento");
                $("#itemBreadbrum2").removeAttr("href");
            }
        });
    </script>
</asp:Content>