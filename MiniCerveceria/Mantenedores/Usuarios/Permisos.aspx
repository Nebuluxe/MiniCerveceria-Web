<%@ Page Title="Mantenedores" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Permisos.aspx.cs" Inherits="MiniCerveceria.Mantenedores.Usuarios.Permisos" %>

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
            overflow-x: hidden
        }
	</style>
    <nav id="barraNav" class="navbar bg-body-tertiary">
        <div class="container-fluid">
            <a runat="server" href="~/Mantenedores/Default.aspx" data-title="Volver">
                <img id="imgButtonBack" src="/Imagenes/Iconos/BackButtonWithe.png" height="40">
            </a>
            <div class="row">
                <div class="col-2">
                    <img src="/Imagenes/Iconos/PermisosWithe.png" height="50" width="50">
                </div>
                <div class="col-10">
                    <asp:Label CssClass="titulo" Style="font-size: 1.9em; color: #ffffff;" runat="server" ClientIDMode="Static">Pefiles</asp:Label>
                </div>
            </div>
            <button type="button" id="btnAgregarHide" class="visually-hidden" data-bs-toggle="modal" data-bs-target="#modalCrear"></button>
            <a id="btnAgregar" data-title="Crear permiso">
                <img src="/Imagenes/Iconos/btnAgregar.png" class="d-flex" height="40" width="40">
            </a>
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
			        <th scope="row" colspan="2">Nombre</th>
                    <th scope="row">Crear</th>
			        <th scope="row">Editar</th>
                    <th scope="row">Ver</th>
			        <th scope="row">Deshabilitar/Eliminar</th>
                    <th scope="row">Acciones</th>
		        </tr>
		    </thead>
		    <tbody id="Contenido">

		    </tbody>
	    </table>
    </div>
    <%-- Modal eliminacion --%>
    <div class="fade modal" id="modalEliminar" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="modalEliminarLabel" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
          <div class="modal-header">
            <h1 class="modal-title fs-5" id="modalEliminarLabel">Eliminar perfil</h1>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <span id="idPermisoDelete" class="visually-hidden"></span>
          <div class="modal-body">
            ¿Esta seguro que desea eliminar el perfil " <span id="NombrePermiso"></span>" ?
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-success" data-bs-dismiss="modal" id="confirmDelete">Aceptar</button>
          </div>
        </div>
      </div>
    </div>

    <%-- Modal agregar/editar permiso --%>
    <div class="fade modal" id="modalCrear" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="modalCrearLabel" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
        <div class="modal-content">
          <div class="modal-header">
            <h1 class="modal-title fs-5" id="modalCrearLabel"><span id="cambiolblModal"></span> perfil</h1>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
            <div class="container">
                <span id="idPermiso"></span>
                <input type="text" class="form-control" placeholder="Nombre perfil" id="nombrePermiso">
                <br />
                <div class="row">
                    <div class="col-lg-3">
                        <div class="form-check form-switch">
                            <input class="form-check-input Checks" type="checkbox" id="chkEditar" checked>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="form-check form-switch">
                            <input class="form-check-input Checks" type="checkbox" id="chkEliminar">
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="form-check form-switch">
                            <input class="form-check-input Checks" type="checkbox" id="chkVer">
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="form-check form-switch">
                            <input class="form-check-input Checks" type="checkbox" id="chkCrear">
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-3">
                        <div class="form-check form-switch">
                            <label class="form-check-label" for="chkEditar">Editar</label>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="form-check form-switch">
                            <label class="form-check-label" for="chkEliminar">Elimina</label>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="form-check form-switch">
                            <label class="form-check-label" for="chkVer">Ver</label>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="form-check form-switch">
                            <label class="form-check-label" for="chkCrear">Crear</label>
                        </div>
                    </div>
                </div>
            </div>
          </div>
          <div class="modal-footer">
                <button type="button" class="btn btn-success" data-bs-dismiss="modal" id="ConfirmarAgregar">Aceptar</button>
          </div>
        </div>
      </div>
    </div>


	<script>
        var PermisoEditar = <%= PermisoEditar %>;
        var PermisoEliminar = <%= PermisoEliminar %>;
        var PermisoCrear = <%= PermisoCrear %>;

        $(document).ready(function () {
            cargarPermisos()

            $("#search").keyup(function () {
                _this = this;
                $.each($("#TablaPermisos tbody tr"), function () {
                    if ($(this).text().toLowerCase().indexOf($(_this).val().toLowerCase()) === -1)
                        $(this).hide();
                    else
                        $(this).show();
                });
            });

            $('#btnAgregar').on('click', function () {
                if (PermisoCrear) {
                    $('#cambiolblModal').text('Crear');
                    $('#idPermiso').val('');
                    $('#nombrePermiso').val('');
                    $('#chkEditar').prop('checked', false);
                    $('#chkEliminar').prop('checked', false);
                    $('#chkVer').prop('checked', false);
                    $('#chkCrear').prop('checked', false);

                    $('#btnAgregarHide').trigger('click');
                }
                else {
                    Command: toastr["error"]("No tines permisos para crear")
                }
            });

            $('#confirmDelete').on('click', function () {
                if (PermisoEliminar) {
                    var id = $('#idPermisoDelete').text();
                    $.ajax({
                        type: 'POST',
                        cache: false,
                        url: '<%= ResolveUrl("/Mantenedores/Usuarios/Permisos.aspx/EliminarPermiso") %>',
                        contentType: 'application/json; charset=utf-8',
                        async: true,
                        dataType: 'json',
                        data: JSON.stringify({ 'id_permiso': id }),
                        success: function (data) {
                            if (data.d) {
                                Command: toastr["success"]("Cambios generados exitosamente")
                                cargarPermisos()
                            }
                        },
                        error: function (data) {
                            Command: toastr["error"]("Algo ha salido mal!!!")
                        }
                    });
                }
                else {
                    Command: toastr["error"]("No tines permisos para eliminar")
                }
            });

            $('#ConfirmarAgregar').on('click', function () {
                if (PermisoCrear) {
                    var idPermiso = $('#idPermiso').val();
                    var nombre = $('#nombrePermiso').val();
                    var editar = $('#chkEditar').prop('checked');
                    var eliminar = $('#chkEliminar').prop('checked');
                    var ver = $('#chkVer').prop('checked');
                    var crear = $('#chkCrear').prop('checked');

                    if (!editar && !eliminar && !ver && !crear) {
                        Command: toastr["warning"]("Debe seleccionar almenos 1 permiso")
                        return;
                    }

                    if (nombre == "") {
                        Command: toastr["warning"]("Debe ingresar un nombre")
                        return;
                    }

                    $.ajax({
                        type: 'POST',
                        cache: false,
                        url: '<%= ResolveUrl("/Mantenedores/Usuarios/Permisos.aspx/CrearEditarPermiso") %>',
                        contentType: 'application/json; charset=utf-8',
                        async: true,
                        dataType: 'json',
                        data: JSON.stringify({ 'id_permiso': idPermiso, 'nombre': nombre, 'editar': editar, 'eliminar': eliminar, 'ver': ver, 'crear': crear }),
                        success: function (data) {
                            if (data.d) {
                                Command: toastr["success"]("Cambios generados exitosamente")
                                cargarPermisos()
                            }
                        },
                        error: function (data) {
                            Command: toastr["error"]("Algo ha salido mal!!!")
                        }
                    });
                } 
                else {
                    Command: toastr["error"]("No tines permisos para crear")
                }
            });
        });


        function Eliminar(id,nombre) {
            if (PermisoEliminar) {
                var tr = $('#Contenido').find('tr[id=' + id + ']');

                tr.find('.btnEliminarHide').trigger('click');

                $('#idPermisoDelete').text(id);
                $('#NombrePermiso').text(nombre); 
            }
            else {
                Command: toastr["error"]("No tines permisos para eliminar")
            }
        }

        function Editar(id_permiso, nombre, editar, eliminar, ver, crear) { 
            if (PermisoEditar) {
                $('#cambiolblModal').text('Crear');
                $('#idPermiso').val(id_permiso);
                $('#nombrePermiso').val(nombre);
                $('#chkEditar').prop('checked', editar);
                $('#chkEliminar').prop('checked', eliminar);
                $('#chkVer').prop('checked', ver);
                $('#chkCrear').prop('checked', crear);

                $('#btnAgregarHide').trigger('click');
            }
            else {
                Command: toastr["error"]("No tines permisos para editar")
            }
        }

        function cargarPermisos() {
            $.ajax({
                type: 'POST',
                cache: false,
                url: '<%= ResolveUrl("/Mantenedores/Usuarios/Permisos.aspx/ListarPermisos") %>',
                contentType: 'application/json; charset=utf-8',
                async: false,
                dataType: 'json',
                success: function (data) {

                    var html = "";

                    if (data.d != null) {

                        $.each(data.d, function (i, val) {

                            var buttons = "";

                            buttons += '<a style="cursor: pointer" onclick="Eliminar(' + val.id_permiso + ',\'' + val.nombre + '\')" data-title="Eliminar perfil"><img src="/Imagenes/Iconos/btnDeleteitem.png" height="25" width="25" /></a><span> </span>';
                            buttons += '<button type="button" class="visually-hidden btnEliminarHide" data-bs-toggle="modal" data-bs-target="#modalEliminar"></button>'

                            buttons += '<a style="cursor: pointer" onclick="Editar(' + val.id_permiso + ',\'' + val.nombre + '\',' + val.editar + ',' + val.eliminar + ',' + val.ver + ',' + val.crear + ')" data-title="Editar perfil"><img src="/Imagenes/Iconos/EditBlack.png" height="25" width="25" /></a>';

                            html += '<tr id="' + val.id_permiso + '">' +
                                    '<td colspan="2">' + val.nombre + '</td>' +
                                    '<td scope="row" >' + (val.crear ? "Si" : "No") + '</td>' +
                                    '<td scope="row" >' + (val.ver ? "Si" : "No") + '</td>' +
                                    '<td scope="row">' + (val.editar? "Si":"No") + '</td>' +
                                    '<td scope="row" >' + (val.eliminar ? "Si" : "No") + '</td>' +
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
    </script>
</asp:Content>
