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
    <br />
    <br />
    <h5>
       <asp:Label runat="server" ClientIDMode="Static" ID="lblNombreCurso"></asp:Label>
    </h5>
    <h6>
        Fecha publicacion: <asp:Label runat="server" ClientIDMode="Static" ID="lblFechaPublicacion"></asp:Label>
    </h6>
    <br />
    <br />
    <div class="card">
        <div class="card-body">
            <p> 
                <asp:Image runat="server" ClientIDMode="Static" ID="ImagenCurso" align="left" width="400"  height="400"/>
                <asp:Label runat="server" ClientIDMode="Static" ID="lblDescripcionCurso"></asp:Label>
            </p>
        </div>
    </div>
    <br />
    <div class="card">
        <div class="card-body">
            <h5>Precio curso: $ <asp:Label runat="server" ClientIDMode="Static" ID="lblPrecioCurso"></asp:Label></h5>
        </div>
    </div>
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