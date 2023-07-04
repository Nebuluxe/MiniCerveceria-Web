<%@ Page Title="Cursos" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Cursos.aspx.cs" Inherits="MiniCerveceria.Cursos" %>

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
    
    <br /><br /><br />

    <div id="TablaCursos">

    </div>

    <br /><br /><br /><br /><br>
    <script type="text/javascript">
        $(document).ready(() => {
            cargarCursos()

            $("#TextBread1").text("Cursos");
            $("#itemBreadbrum1").removeClass("OcultarElemento");
            $("#itemBreadbrum1").removeAttr("href");
        });


        function cargarCursos() {
            $.ajax({
                type: 'POST',
                cache: false,
                url: '<%= ResolveUrl("/Mantenedores/Cursos/DefaultCursos.aspx/ListarCursos") %>',
                contentType: 'application/json; charset=utf-8',
                async: false,
                dataType: 'json',
                data: JSON.stringify({ 'estado': true }),
                success: function (data) {

                    var html = "";

                    if (data.d != null) {

                        var contador = 1;

                        $.each(data.d, function (i, val) {

                            var clase = ""

                            if (contador %2 == 0) {
                                clase = "order-md-2";
                            }

                            html += '<hr class="featurette-divider">'+
                                        '<div class="row featurette">'+
                                            '<div class="col-md-7 ' + clase + '">'+
                                                '<h2 class="featurette-heading fw-normal lh-1">' + val.nombre_curso + '.</h2>'+
                                                '<p>' + val.descripcion.substring(0, 1000) + '...</p>'+
                                            '</div>'+
                                            '<div class="col-md-5">'+
                                                '<figure class="containerz">'+
                                                    '<img src="' + val.URL_img + '" alt="sample89"  />'+
                                                    '<figcaption>'+
                                                        '<h3>Ver mas sobre el curso</h3>'+
                                                    '</figcaption>'+
                                                    '<a href="/Ventanas/Cursos/DetalleCurso.aspx?uid=' + val.id_curso + '"></a>'+
                                                '</figure>'+
                                            '</div>'+
                                        '</div>'

                            contador++;
                        });

                        $('#TablaCursos').html(html);
                    }
                },
                error: function (data) {
                    Command: toastr["error"]("Algo ha salido mal!!!")
                }
            });


        }
    </script>
</asp:Content>