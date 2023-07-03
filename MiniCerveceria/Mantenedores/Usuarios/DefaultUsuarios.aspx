<%@ Page Title="Mantenedores" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"  CodeBehind="DefaultUsuarios.aspx.cs" Inherits="MiniCerveceria.Mantenedores.Usuarios.DefaultUsuarios" %>

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
	</style>
	<nav id="barraNav" class="navbar bg-body-tertiary">
        <div class="container-fluid">
            <a runat="server" href="~/Mantenedores/Default.aspx" data-title="Volver">
                <img id="imgButtonBack" src="/Imagenes/Iconos/BackButtonWithe.png" height="40">
            </a>
            <div class="row">
                <div class="col-2">
                    <img src="/Imagenes/Iconos/UsuariosWithe.png" height="50" width="50">
                </div>
                <div class="col-10">
                    <asp:Label CssClass="titulo" Style="font-size: 1.9em; color: #ffffff;" runat="server" ClientIDMode="Static">Usuarios</asp:Label>
                </div>
            </div>
            <span>

            </span>
        </div>
    </nav>
    <br />
    <div class="input-group" style="justify-content: center">
        <asp:DropDownList runat="server" ClientIDMode="Static" id="cboEstado" class="form-select">
            <asp:ListItem selected="true" value="1">Habilitados</asp:ListItem>
		    <asp:ListItem value="0">Deshabilitados</asp:ListItem>
	    </asp:DropDownList>
        <input type="text" class="form-control" id="search" placeholder="Buscador..." aria-label="Buscador...">
        <span class="input-group-text" id="addon-wrapping" style="border: 10px">
            <img src="/Imagenes/Iconos/Lupa.png" height="20">
        </span>
    </div>
    <br />
    <div id="ContenedorTablaStock">
        <table class="table CompraDetalle" id="TablaPermisos">
		    <thead>
		        <tr>
			        <th scope="row" colspan="2">Nombre</th>
			        <th scope="row">Email</th>
			        <th scope="row">telefono</th>
			        <th scope="row">Perfil</th>
                    <th scope="row">Estado</th>
                    <th scope="row">Acciones</th>
		        </tr>
		    </thead>
		    <tbody id="Contenido">

		    </tbody>
	    </table>
    </div>

    <%-- Modal dehabilitar usuario --%>
    <div class="fade modal" id="modalDeshabilitar" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="modalDeshabilitarLabel" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
          <div class="modal-header">
            <h1 class="modal-title fs-5" id="modalDeshabilitarLabel">Deshabilitar usuario</h1>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <span id="idUsuarioDeshabilitar" class="visually-hidden"></span>
          <div class="modal-body">
            ¿Esta seguro que desea deshabilitar al usuario " <span id="NombeUsuario"></span>" ?
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-success" data-bs-dismiss="modal" id="confirmDeshabilitacion">Aceptar</button>
          </div>
        </div>
      </div>
    </div>

    <%-- Modal asignar perfil usuario --%>
    <div class="fade modal" id="modalAsignar" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="modalAsignarPerfilLabel" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
          <div class="modal-header">
            <h1 class="modal-title fs-5" id="modalAsignarPerfilLabel">Asignar perfil</h1>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <span id="idUsuarioAsignar" class="visually-hidden"></span>
          <div class="modal-body">
            <select class="form-select" id="cboPerfiles">
                
            </select>
            <label>Seleccione un perfil</label>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-success" data-bs-dismiss="modal" id="confirmAsignacion">Aceptar</button>
          </div>
        </div>
      </div>
    </div>

	<script>
        var PermisoEditar = <%= PermisoEditar %>;

        $(document).ready(function () {
            cargarUsuarios(true)

            if (PermisoEditar) {
                cargarPerfiles()
            }

            $("#search").keyup(function () {
                _this = this;
                $.each($("#TablaPermisos tbody tr"), function () {
                    if ($(this).text().toLowerCase().indexOf($(_this).val().toLowerCase()) === -1)
                        $(this).hide();
                    else
                        $(this).show();
                });
            });

            $('#confirmAsignacion').on('click', function () {
                if (PermisoEditar) {
                    var idUser = $('#idUsuarioAsignar').text();
                    var idPermiso = $('#cboPerfiles').val();

                    $.ajax({
                        type: 'POST',
                        cache: false,
                        url: '<%= ResolveUrl("/Mantenedores/Usuarios/DefaultUsuarios.aspx/AsignarQuitarPerfil") %>',
                        contentType: 'application/json; charset=utf-8',
                        async: false,
                        dataType: 'json',
                        data: JSON.stringify({ 'id_usuario': idUser, 'id_permiso': idPermiso }),
                        success: function (data) {
                            if (data.d) {
                                cargarUsuarios(true)
                                $("#cboEstado option[value=1]").attr("selected", true);
                            }
                        },
                        error: function (data) {
                            alert("Algo ha salido mal!!!");
                        }
                    });
                }
                else {
                    Command: toastr["error"]("No tines permisos para eliminar")
                }
            }
            });

            $('#confirmDeshabilitacion').on('click', function () {
                if (PermisoEditar) {
                    var idUser = $('#idUsuarioDeshabilitar').text();

                    $.ajax({
                        type: 'POST',
                        cache: false,
                        url: '<%= ResolveUrl("/Mantenedores/Usuarios/DefaultUsuarios.aspx/HabilitarInhabilitarPerfil") %>',
                        contentType: 'application/json; charset=utf-8',
                        async: false,
                        dataType: 'json',
                        data: JSON.stringify({ 'id_usuario': idUser, 'accion': false }),
                        success: function (data) {
                            if (data.d) {
                                cargarUsuarios(false)
                                $("#cboEstado option[value=0]").attr("selected", true);
                            }
                        },
                        error: function (data) {
                            alert("Algo ha salido mal!!!");
                        }
                    });
                }
            });

            $('#cboEstado').on('change', function () {
                var estado = $('#cboEstado').val();

                if (estado == 1) {
                    cargarUsuarios(true)
                }
                else {
                    cargarUsuarios(false)
                }
            })
        });

        function Deshabilitar(id, nombre) {
            if (PermisoEditar) {
                var tr = $('#Contenido').find('tr[id=' + id + ']');

                tr.find('.deshabilitar').trigger('click');

                $('#idUsuarioDeshabilitar').text(id);
                $('#NombeUsuario').text(nombre);
            }
            else {
                Command: toastr["error"]("No tines permisos para eliminar")
            }
        }

        function Habilitar(id) {
            if (PermisoEditar) {
                $.ajax({
                    type: 'POST',
                    cache: false,
                    url: '<%= ResolveUrl("/Mantenedores/Usuarios/DefaultUsuarios.aspx/HabilitarInhabilitarPerfil") %>',
                    contentType: 'application/json; charset=utf-8',
                    async: false,
                    dataType: 'json',
                    data: JSON.stringify({ 'id_usuario': id, 'accion': true }),
                    success: function (data) {
                        if (data.d) {
                            cargarUsuarios(true)
                            $("#cboEstado option[value=1]").attr("selected", true);
                        }
                    },
                    error: function (data) {
                        alert("Algo ha salido mal!!!");
                    }
                });
            }
            else {
                Command: toastr["error"]("No tines permisos para eliminar")
            }
        }

        function Asignar(id) {
            if (PermisoEditar) {
                var tr = $('#Contenido').find('tr[id=' + id + ']');

                tr.find('.asignarPerfil').trigger('click');

                $('#idUsuarioAsignar').text(id);
            }
            else {
                Command: toastr["error"]("No tines permisos para eliminar")
            }
        }

        function Quitar(id) {
            if (PermisoEditar) {
                $.ajax({
                    type: 'POST',
                    cache: false,
                    url: '<%= ResolveUrl("/Mantenedores/Usuarios/DefaultUsuarios.aspx/AsignarQuitarPerfil") %>',
                    contentType: 'application/json; charset=utf-8',
                    async: false,
                    dataType: 'json',
                    data: JSON.stringify({ 'id_usuario': id, 'id_permiso': "" }),
                    success: function (data) {
                        if (data.d) {
                            cargarUsuarios(true)
                            $("#cboEstado option[value=1]").attr("selected", true);
                        }
                    },
                    error: function (data) {
                        alert("Algo ha salido mal!!!");
                    }
                });
            }
            else {
                Command: toastr["error"]("No tines permisos para eliminar")
            }
        }

        function cargarPerfiles() {
            $.ajax({
                type: 'POST',
                cache: false,
                url: '<%= ResolveUrl("/Mantenedores/Usuarios/Permisos.aspx/ListarPermisos") %>',
                contentType: 'application/json; charset=utf-8',
                async: false,
                dataType: 'json',
                success: function (data) {

                    var html = "<option value='0'>Seleccione...</option>";

                    if (data.d != null) {

                        $.each(data.d, function (i, val) {

                            html += "<option value='" + val.id_permiso + "'>" + val.nombre+ "</option>";
                        });

                        $('#cboPerfiles').html(html);
                    }
                },
                error: function (data) {
                    alert("Algo ha salido mal!!!");
                }
            });
        }

        function cargarUsuarios(estado) {
            $.ajax({
                type: 'POST',
                cache: false,
                url: '<%= ResolveUrl("/Mantenedores/Usuarios/DefaultUsuarios.aspx/ListarUsuarios") %>',
                contentType: 'application/json; charset=utf-8',
                async: false,
                dataType: 'json',
                data: JSON.stringify({ 'estado': estado }),
                success: function (data) {

                    var html = "";

                    if (data.d != null) {

                        $.each(data.d, function (i, val) {

                            var buttons = "";

                            if (val.activo) {
                                buttons += '<a style="cursor: pointer"onclick="Deshabilitar(' + val.id_usuario + ',\'' + val.nombre + " " + val.apellido + '\')" data-title="Deshabilitar usuario"><img src="/Imagenes/Iconos/btnInhabilitarUser.png" height="25" width="25" /></a><span> </span>';
                                buttons += '<button type="button" class="visually-hidden deshabilitar" data-bs-toggle="modal" data-bs-target="#modalDeshabilitar"></button>';
                            } else {
                                buttons += '<a style="cursor: pointer" onclick="Habilitar(' + val.id_usuario + ')" data-title="Habilitar usuario"><img src="/Imagenes/Iconos/btnHabilitarUser.png" height="25" width="25" /></a><span> </span>';
                            }

                            if (val.activo) {
                                if (val.id_permiso == 0) {
                                    buttons += '<a style="cursor: pointer" onclick="Asignar(' + val.id_usuario + ')" data-title="Asignar perfil"><img src="/Imagenes/Iconos/btnAsignarPermiso.png" height="25" width="25" /></a>';
                                    buttons += '<button type="button" class="visually-hidden asignarPerfil" data-bs-toggle="modal" data-bs-target="#modalAsignar"></button>';
                                } else {
                                    buttons += '<a style="cursor: pointer" onclick="Quitar(' + val.id_usuario + ')" data-title="Quitar perfil"><img src="/Imagenes/Iconos/btnQuitarPermiso.png" height="25" width="25" /></a>';
                                }
                            }

                            html += '<tr id="' + val.id_usuario + '">' +
                                    '<td colspan="2">' + val.nombre + ' ' + val.apellido + '</td>' +
                                    '<td scope="row">' + val.email + '</td>' +
                                    '<td scope="row" >' + val.telefono + '</td>' +
                                    '<td scope="row" >' + val.nombre_permiso + '</td>' +
                                    '<td scope="row" >' + (val.activo ? "Habilitado" : "Deshabilitado") + '</td>' +
                                    '<td scope="row">' + buttons + '</td>' +
                                    '</tr>';
                        });

                        $('#Contenido').html(html);
                    }
                },
                error: function (data) {
                    alert("Algo ha salido mal!!!");
                }
            });
        }
    </script>
</asp:Content>
