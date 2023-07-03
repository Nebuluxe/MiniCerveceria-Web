<%@ Page Title="Mantenedores" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Comentarios.aspx.cs" Inherits="MiniCerveceria.Mantenedores.Usuarios.Comentarios" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <link href="/GlobalCss/Mantenedores.css" rel="stylesheet" type="text/css">
	
	<style>
		.card-body{
			background:#000000;
			color: #ffffff;
		}
		#headMaster {
			display: none;
		}

        #mainNav{
            display: none;
        }

        #footerDefault{
            display: none;
        }

       #barraNav {
            background: #000000 !important;
            color: #ffffff;
            border-radius: 15px;
       }

       .Checks{
           width: 60px !important;
           height: 30px !important;
       }

        #ContenedorPermisos {
	        height: 800px;
	        width: 100%;
	        overflow-y: scroll;
            overflow-x: hidden;
        }
	</style>
    <nav id="barraNav" class="navbar bg-body-tertiary">
        <div class="container-fluid">
            <a runat="server" href="~/Mantenedores/Default.aspx" data-title="Volver">
                <img id="imgButtonBack" src="/Imagenes/Iconos/BackButtonWithe.png" height="40">
            </a>
            <div class="row">
                <div class="col-2">
                    <img src="/Imagenes/Iconos/ComentarioWithe.png" height="50" width="50">
                </div>
                <div class="col-10">
                    <asp:Label CssClass="titulo" Style="font-size: 1.9em; color: #ffffff;" runat="server" ClientIDMode="Static">Comentarios</asp:Label>
                </div>
            </div>
            <span>

            </span>
        </div>
    </nav>
    <br />
    <div class="input-group" style="justify-content: center">
        <input type="text" class="form-control" id="search" placeholder="Buscador..." aria-label="Buscador...">
        <span class="input-group-text" id="addon-wrapping" style="border: 10px">
            <img src="/Imagenes/Iconos/Lupa.png" height="20">
        </span>
    </div>
    <br />
    <div id="ContenedorPermisos">
        <table class="table CompraDetalle" id="TablaPermisos">
		    <thead>
		        <tr>
			        <th scope="row" colspan="2">Nombre usuario</th>
                    <th scope="row">Fecha</th>
			        <th scope="row">Nombre producto</th>
                    <th scope="row">Puntuacion</th>
			        <th scope="row">Estado</th>
                    <th scope="row">Acciones</th>
		        </tr>
		    </thead>
		    <tbody id="Contenido">

		    </tbody>
	    </table>
    </div>
    <%-- Modal ver comentario --%>
    <div class="fade modal" id="modalVer" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="modalVerLabel" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
          <div class="modal-header">
            <h1 class="modal-title fs-5" id="modalVerLabel">Comentario</h1>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <span id="idPermisoDelete" class="visually-hidden"></span>
          <div class="modal-body">
            <div class="row" id="VerComentario">

            </div>
          </div>
          <div class="modal-footer">
          </div>
        </div>
      </div>
    </div>

    <script>
        var PermisoEditar = <%= PermisoEditar %>;
        var PermisoVer = <%= PermisoVer %>;

        $(document).ready(function () {
            cargarProductosComentarios()

            $("#search").keyup(function () {
                _this = this;
                $.each($("#TablaPermisos tbody tr"), function () {
                    if ($(this).text().toLowerCase().indexOf($(_this).val().toLowerCase()) === -1)
                        $(this).hide();
                    else
                        $(this).show();
                });
            });
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

                    if (data.d != null) {
                        var html = "";

                        $.each(data.d, function (i, val) {

                            var stars = "";

                            if (val.puntuacion == 1) {
                                stars = '<img src="/Imagenes/Iconos/FavOn.png" width="30" /><span> </span>' +
                                    '<img src="/Imagenes/Iconos/FavOff.png" width="30" /><span> </span>' +
                                    '<img src="/Imagenes/Iconos/FavOff.png" width="30" /><span> </span>' +
                                    '<img src="/Imagenes/Iconos/FavOff.png" width="30" /><span> </span>' +
                                    '<img src="/Imagenes/Iconos/FavOff.png" width="30" />';
                            }
                            if (val.puntuacion == 2) {
                                stars = '<img src="/Imagenes/Iconos/FavOn.png" width="30" /><span> </span>' +
                                    '<img src="/Imagenes/Iconos/FavOn.png" width="30" /><span> </span>' +
                                    '<img src="/Imagenes/Iconos/FavOff.png" width="30" /><span> </span>' +
                                    '<img src="/Imagenes/Iconos/FavOff.png" width="30" /><span> </span>' +
                                    '<img src="/Imagenes/Iconos/FavOff.png" width="30" />';
                            }
                            if (val.puntuacion == 3) {
                                stars = '<img src="/Imagenes/Iconos/FavOn.png" width="30" /><span> </span>' +
                                    '<img src="/Imagenes/Iconos/FavOn.png" width="30" /><span> </span>' +
                                    '<img src="/Imagenes/Iconos/FavOn.png" width="30" /><span> </span>' +
                                    '<img src="/Imagenes/Iconos/FavOff.png" width="30" /><span> </span>' +
                                    '<img src="/Imagenes/Iconos/FavOff.png" width="30" />';
                            }
                            if (val.puntuacion == 4) {
                                stars = '<img src="/Imagenes/Iconos/FavOn.png" width="30" /><span> </span>' +
                                    '<img src="/Imagenes/Iconos/FavOn.png" width="30" /><span> </span>' +
                                    '<img src="/Imagenes/Iconos/FavOn.png" width="30" /><span> </span>' +
                                    '<img src="/Imagenes/Iconos/FavOn.png" width="30" /><span> </span>' +
                                    '<img src="/Imagenes/Iconos/FavOff.png" width="30" />';
                            }
                            if (val.puntuacion == 5) {
                                stars = '<img src="/Imagenes/Iconos/FavOn.png" width="30" /><span> </span>' +
                                    '<img src="/Imagenes/Iconos/FavOn.png" width="30" /><span> </span>' +
                                    '<img src="/Imagenes/Iconos/FavOn.png" width="30" /><span> </span>' +
                                    '<img src="/Imagenes/Iconos/FavOn.png" width="30" /><span> </span>' +
                                    '<img src="/Imagenes/Iconos/FavOn.png" width="30" />';
                            }

                            var buttons = "";

                            if (!val.estado) {
                                buttons += '<a style="cursor: pointer" onclick="HabilitarInhabilitar(' + val.id_com_producto + ',' + val.estado + ')" data-title="Habilitar"><img src="/Imagenes/Iconos/ComentarioHabilitar.png" height="25" width="25" /></a>';
                            }
                            else {
                                buttons += '<a style="cursor: pointer" onclick="HabilitarInhabilitar(' + val.id_com_producto + ',' + val.estado + ')" data-title="Deshabilitar"><img src="/Imagenes/Iconos/ComentarioDeshabilitar.png" height="25" width="25" /></a>';
                            }

                            buttons += '<a data-bs-toggle="modal" data-bs-target="#modalVer" style="cursor: pointer" onclick="VerComentario(' + val.id_com_producto + ')" data-title="Ver comentario"><img src="/Imagenes/Iconos/ComentarioUsuario.png" height="25" width="25" /></a>';

                            html += '<tr id="' + val.id_com_producto + '">' +
                                '<td colspan="2">' + val.nombre + ' ' + val.apelido + '</td>' +
                                '<td scope="row" >' + val.fecha + '</td>' +
                                '<td scope="row" >' + val.nombre_producto + '</td>' +
                                '<td scope="row" >' + stars + '</td>' +
                                '<td scope="row" >' + (val.estado? "Habilitado":"Deshabilitado" ) + '</td>' +
                                '<td scope="row" >' + buttons + '</td>' +
                            '</tr>';
                        });

                        $('#Contenido').html(html);
                    }
                },
                error: function (data) {
                    Command: toastr["error"]("Algo ha salido mal!!!")
                }
            });

        }

        function HabilitarInhabilitar(id_comentario,estado) {
            if (PermisoEditar) {
                var id = $('#idPermisoDelete').text();
                $.ajax({
                    type: 'POST',
                    cache: false,
                    url: '<%= ResolveUrl("/Mantenedores/Usuarios/Comentarios.aspx/HabilitarDeshabilitar") %>',
                    contentType: 'application/json; charset=utf-8',
                    async: true,
                    dataType: 'json',
                    data: JSON.stringify({ 'id_comentario': id_comentario, 'estado': estado }),
                    success: function (data) {
                        if (data.d) {

                            if (estado) {
                                Command: toastr["success"]("El comentario ha sido deshabilitado exitosamente")
                            }
                            else {
                                Command: toastr["success"]("El comentario ha sido habilitado exitosamente")
                            }

                            cargarProductosComentarios()
                        }
                    },
                    error: function (data) {
                        Command: toastr["error"]("Algo ha salido mal!!!")
                    }
                });
            }
            else {
                Command: toastr["error"]("No tines permisos para editar")
            }
        }

        function VerComentario(id) {
            if (PermisoVer) {
                $.ajax({
                    type: 'POST',
                    cache: false,
                    url: '<%= ResolveUrl("/Mantenedores/Usuarios/Comentarios.aspx/ObtenerComentario") %>',
                    contentType: 'application/json; charset=utf-8',
                    async: true,
                    dataType: 'json',
                    data: JSON.stringify({ 'id_comentario': id }),
                    success: function (data) {
                        if (data.d != null) {
                            var html = "";

                            var stars = "";

                            if (data.d.puntuacion == 1) {
                                stars = '<img src="/Imagenes/Iconos/FavOn.png" width="35" /><span> </span>' +
                                    '<img src="/Imagenes/Iconos/FavOff.png" width="35" /><span> </span>' +
                                    '<img src="/Imagenes/Iconos/FavOff.png" width="35" /><span> </span>' +
                                    '<img src="/Imagenes/Iconos/FavOff.png" width="35" /><span> </span>' +
                                    '<img src="/Imagenes/Iconos/FavOff.png" width="35" />';
                            }
                            if (data.d.puntuacion == 2) {
                                stars = '<img src="/Imagenes/Iconos/FavOn.png" width="35" /><span> </span>' +
                                    '<img src="/Imagenes/Iconos/FavOn.png" width="35" /><span> </span>' +
                                    '<img src="/Imagenes/Iconos/FavOff.png" width="35" /><span> </span>' +
                                    '<img src="/Imagenes/Iconos/FavOff.png" width="35" /><span> </span>' +
                                    '<img src="/Imagenes/Iconos/FavOff.png" width="35" />';
                            }
                            if (data.d.puntuacion == 3) {
                                stars = '<img src="/Imagenes/Iconos/FavOn.png" width="35" /><span> </span>' +
                                    '<img src="/Imagenes/Iconos/FavOn.png" width="35" /><span> </span>' +
                                    '<img src="/Imagenes/Iconos/FavOn.png" width="35" /><span> </span>' +
                                    '<img src="/Imagenes/Iconos/FavOff.png" width="35" /><span> </span>' +
                                    '<img src="/Imagenes/Iconos/FavOff.png" width="35" />';
                            }
                            if (data.d.puntuacion == 4) {
                                stars = '<img src="/Imagenes/Iconos/FavOn.png" width="35" /><span> </span>' +
                                    '<img src="/Imagenes/Iconos/FavOn.png" width="35" /><span> </span>' +
                                    '<img src="/Imagenes/Iconos/FavOn.png" width="35" /><span> </span>' +
                                    '<img src="/Imagenes/Iconos/FavOn.png" width="35" /><span> </span>' +
                                    '<img src="/Imagenes/Iconos/FavOff.png" width="35" />';
                            }
                            if (data.d.puntuacion == 5) {
                                stars = '<img src="/Imagenes/Iconos/FavOn.png" width="35" /><span> </span>' +
                                    '<img src="/Imagenes/Iconos/FavOn.png" width="35" /><span> </span>' +
                                    '<img src="/Imagenes/Iconos/FavOn.png" width="35" /><span> </span>' +
                                    '<img src="/Imagenes/Iconos/FavOn.png" width="35" /><span> </span>' +
                                    '<img src="/Imagenes/Iconos/FavOn.png" width="35" />';
                            }

                            html += '<div class="col-lg-12">' +
                                '<div class="container">' +
                                '<div class="card">' +
                                '<div>' +
                                '<img src="' + data.d.url_img_prod + '" class="card-img-top" />' +
                                '<div class="card-body" style="background:#ffffff !important; color:#000000">' +
                                '<div class="row">' +
                                '<div class="col-lg-12">' +
                                '<img src="' + data.d.url_img_user + '" style="border-radius: 50%; width: 100px; float:left !important" />' +
                                '<br/><span>' + data.d.nombre + '  ' + data.d.apelido + '</span><br/>' +
                                '<span>' + data.d.fecha + '</span><br/><br/><br/>' +
                                '<p>' + data.d.texto + '</p>' +
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

                            console.log("entreeeee")
                            $('#VerComentario').html(html);
                        }
                    },
                    error: function (data) {
                        Command: toastr["error"]("Algo ha salido mal!!!")
                    }
                });
            }
            else {
                Command: toastr["error"]("No tines permisos para ver")
            }
        }

    </script>
</asp:Content>