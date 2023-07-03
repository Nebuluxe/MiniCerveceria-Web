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

        #barraNav {
            background: #000000 !important;
            color: #ffffff;
            border-radius: 15px;
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
    <div class="card" style="--bs-card-border-width: 3px; --bs-card-border-color: rgb(0, 0, 0, .2);">
        <div class="card-body">
            <p> 
                <asp:Image runat="server" ClientIDMode="Static" ID="ImagenCurso" align="left" width="400"  height="400"/>
                <asp:Label runat="server" ClientIDMode="Static" ID="lblDescripcionCurso"></asp:Label>
            </p>
        </div>
    </div>
    <br />
    <nav id="barraNav" class="navbar bg-body-tertiary">
        <div class="container-fluid">
            <h5>Precio curso: $ <asp:Label runat="server" ClientIDMode="Static" ID="lblPrecioCurso"></asp:Label></h5>
            <span>

            </span>
			<a id="btnInscribete" class="btn btn-warning" style="color: #000000"> Insscribete ahora!! </a>
        </div>
    </nav>
    <br />
    <br />
    <br />

    <button type="button" class="visually-hidden" id="Logueate" data-bs-toggle="modal" data-bs-target="#ModalInscripcion"></button>
    <%-- Modal debe tener cuenta --%>
    <div class="fade modal" id="ModalInscripcion" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="ModalInscripcionlLabel" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
            <h6>Atencion!!!</h6>
            <p>Debe estar registrado o haberse logueado para poder inscribir este curso</p>
          </div>
          <div class="modal-footer">
            <a runat="server" href="/Login/Login.aspx" class="btn btn-warning">Ir al login</a>
          </div>
        </div>
      </div>
    </div>

    <button type="button" class="visually-hidden" id="Exito" data-bs-toggle="modal" data-bs-target="#ExitoInscripcion"></button>
    <%-- Modal exito nscripcion --%>
    <div class="fade modal" id="ExitoInscripcion" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="ExitoInscripcionlLabel" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
            <h6>Inscripcion exitosa!!!</h6>
            <p>En breve nos comunicaremos contigo mediante correo electronico para informarte sobre las fechas en las que se inpartira el curso</p>
          </div>
          <div class="modal-footer">
          </div>
        </div>
      </div>
    </div>

    <button type="button" class="visually-hidden" id="YaInscrito" data-bs-toggle="modal" data-bs-target="#ModalYaInscripcion"></button>
    <%-- Modal exito nscripcion --%>
    <div class="fade modal" id="ModalYaInscripcion" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="ModalYaInscripcionlLabel" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
            <h6>Ya te encuentras inscrito en este curso</h6>
          </div>
          <div class="modal-footer">
          </div>
        </div>
      </div>
    </div>

    <script type="text/javascript">

        var idCurso = <%= id_curso %>

        $(document).ready(() => {
            var NameCurso = $("#lblNombreCurso").text();

            if (NameCurso != "") {
                $("#TextBread1").text("Cursos");
                $("#itemBreadbrum1").removeClass("OcultarElemento");
                $("#itemBreadbrum1").attr("href", "/Ventanas/Cursos/Cursos");

                $("#TextBread2").text(NameCurso);
                $("#itemBreadbrum2").removeClass("OcultarElemento");
                $("#itemBreadbrum2").removeAttr("href");
            }

            $('#btnInscribete').on('click', function () {
                $.ajax({
                    type: 'POST',
                    cache: false,
                    url: '<%= ResolveUrl("/Ventanas/Cursos/DetalleCurso.aspx/Inscribirse") %>',
                    contentType: 'application/json; charset=utf-8',
                    async: false,
                    dataType: 'json',
                    data: JSON.stringify({ 'id_curso': idCurso }),
                    success: function (data) {
                        if (data.d == 1) {
                            $('#Exito').trigger('click');
                        }
                        if (data.d == 2) {
                            $('#YaInscrito').trigger('click');
                        }
                        if (data.d == 0) {
                            $('#Logueate').trigger('click');
                        }
                    },
                    error: function (data) {
                        Command: toastr["error"]("Algo ha salido mal!!!")
                    }
                });
            })

        });

    </script>
</asp:Content>