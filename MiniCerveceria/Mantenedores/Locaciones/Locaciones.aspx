<%@ Page Title="Mantenedores" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Locaciones.aspx.cs" Inherits="MiniCerveceria.Mantenedores.Locaciones.Locaciones" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <link href="/GlobalCss/Mantenedores.css" rel="stylesheet" type="text/css">
    <style>
        .card-body {
    		background: #000000;
    		color: #ffffff;
    	}

    	#headMaster {
    		display: none;
    	}

    	#mainNav {
    		display: none;
    	}

    	#footerDefault {
    		display: none;
    	}

        #TablaNovedades {
	        height: 1000px;
	        width: 100%;
	        overflow-y: scroll;
            overflow-x: hidden
        }

        #barraNav {
            background: #000000 !important;
            color: #ffffff;
            border-radius: 15px;
        }

        #TablaRegiones > :not(caption) > * > * {
			color: #ffffff;
		}
        #TablaComunas > :not(caption) > * > * {
			color: #ffffff;
		}

    </style>

    <nav id="barraNav" class="navbar bg-body-tertiary">
        <div class="container-fluid">
            <a runat="server" href="~/Mantenedores/Default.aspx"  data-title="Volver">
                <img id="imgButtonBack" src="/Imagenes/Iconos/BackButtonWithe.png" height="40">
            </a>
            <div class="row">
                <div class="col-2">
                    <img src="/Imagenes/Iconos/LocationWhite.png" height="40" width="35">
                </div>
                <div class="col-10">
                    <asp:Label CssClass="titulo" Style="font-size: 1.9em; color: #ffffff;" runat="server" ClientIDMode="Static">Comunas y regiones</asp:Label>
                </div>
            </div>
            <span>

            </span>
            <button type="button" id="btnAgregarHide" class="visually-hidden" data-bs-toggle="modal" data-bs-target="#modalAgregarNovedad"></button>
        </div>
    </nav>
    <br />
    <div class="row">
        <div class="col-lg-6">
            <div class="card">
                <div class="card-body">
                    <div class="row">
                        <div class="col-lg-10">
                                Comunas
                        </div>
                        <div class="col-lg-2">
                            <a id="btnAgregarComuna" data-title="Agregar comuna" style="cursor:pointer" data-bs-toggle="modal" data-bs-target="#modalAgregarComuna">
                                <img src="/Imagenes/Iconos/btnAgregar.png" height="30" width="30">
                            </a>    
                        </div>
                    </div>
                </div>
            </div>
            <br />
            <div class="card">
                <div class="card-body" style="height: 800px; overflow-y: scroll; overflow-x:hidden">
                    <div class="input-group" style="justify-content: center">
                        <input type="text" class="form-control" id="searchComunas" placeholder="Buscar comuna...." aria-label="Buscar comuna.....">
                        <span class="input-group-text" style="border: 10px">
                            <img src="/Imagenes/Iconos/Lupa.png" height="20">
                        </span>
                    </div>
                    <table class="table" id="TablaComunas">
	                    <thead>
		                    <tr>
                                <th scope="row">Nombre</th>
			                    <th scope="row">Acciones</th>
		                    </tr>
	                    </thead>
	                    <tbody id="ContenidoComunas">

	                    </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="col-lg-6">
            <div class="card">
                <div class="card-body">
                    <div class="row">
                        <div class="col-lg-10">
                                Regiones
                        </div>
                        <div class="col-lg-2">
                            <a id="btnAgregarRegion" data-title="Agregar region" style="cursor:pointer" data-bs-toggle="modal" data-bs-target="#modalAgregarRegion">
                                <img src="/Imagenes/Iconos/btnAgregar.png" height="30" width="30">
                            </a>    
                        </div>
                    </div>
                </div>
            </div>
            <br />
            <div class="card">
                <div class="card-body" style="height: 800px; overflow-y: scroll; overflow-x:hidden">
                    <div class="input-group" style="justify-content: center">
                        <input type="text" class="form-control" id="searchRegiones" placeholder="Buscar region..." aria-label="Buscar region....">
                        <span class="input-group-text" style="border: 10px">
                            <img src="/Imagenes/Iconos/Lupa.png" height="20">
                        </span>
                    </div>
                    <table class="table" id="TablaRegiones">
	                    <thead>
		                    <tr>
                                <th scope="row">Nombre</th>
			                    <th scope="row">Acciones</th>
		                    </tr>
	                    </thead>
	                    <tbody id="ContenidoRegiones">

	                    </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <%-- Modal agregar region --%>
    <div class="fade modal" id="modalAgregarRegion" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="modalAgregarRegionLabel" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
        <div class="modal-content">
          <span id="idRegion" class="visually-hidden"></span>
          <div class="modal-header">
            <h1 class="modal-title fs-5" id="modalAgregarRegionLabel">Agregar region</h1>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
              <label for="nombreComuna" class="form-label">Nombre region</label>
                <input type="text" class="form-control" placeholder="Nombre..." id="nombreRegion">
          </div>
          <div class="modal-footer"> 
              <button type="button" class="btn btn-success" data-bs-dismiss="modal" id="ConfirmarAgregarRegion">Aceptar</button>
          </div>
        </div>
      </div>
    </div>
     <%-- Modal agregar comuna --%>
    <div class="fade modal" id="modalAgregarComuna" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="modalAgregarComunaLabel" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
        <div class="modal-content">
          <span id="idComuna" class="visually-hidden"></span>
          <div class="modal-header">
            <h1 class="modal-title fs-5" id="modalAgregarComunaLabel"></h1>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
            <label for="Region" class="form-label">Region</label>
            <select name="select" class="form-select"  id="cboRegion">

			</select>
              <label for="nombreComuna" class="form-label">Nombre comuna</label>
            <input type="text" class="form-control" placeholder="Nombre..." id="nombreComuna">
          </div>
          <div class="modal-footer">
              <button type="button" class="btn btn-success" data-bs-dismiss="modal" id="ConfirmarAgregarComuna">Aceptar</button>
          </div>
        </div>
      </div>
    </div>

    <%-- Modal eliminacion --%>
    <div class="fade modal" id="modalEliminar" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="modalEliminarLabel" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
          <div class="modal-header">
            <h1 class="modal-title fs-5" id="modalEliminarLabel">Eliminar <span class="TipoEliminar"> </span></h1>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <span id="idEliminar" class="visually-hidden"></span>
            <span id="TipoEliminar" class="visually-hidden"></span>
          <div class="modal-body">
            ¿Esta seguro que desea eliminar la <span class="TipoEliminar"> </span> " <span id="NombreEliminar"></span>" ?
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-success" data-bs-dismiss="modal" id="confirmDelete">Aceptar</button>
          </div>
        </div>
      </div>
    </div>

    <script>
        var PermisoEditar = <%= PermisoEditar %>;
        var PermisoEliminar = <%= PermisoEliminar %>;
        var PermisoCrear = <%= PermisoCrear %>;
        
        $(document).ready(function () {
            ObtenerRegiones()
            ObtenerComunas()

            $("#searchRegiones").keyup(function () {
                _this = this;
                $.each($("#TablaRegiones tbody tr"), function () {
                    if ($(this).text().toLowerCase().indexOf($(_this).val().toLowerCase()) === -1)
                        $(this).hide();
                    else
                        $(this).show();
                });
            });

            $("#searchComunas").keyup(function () {
                _this = this;
                $.each($("#TablaComunas tbody tr"), function () {
                    if ($(this).text().toLowerCase().indexOf($(_this).val().toLowerCase()) === -1)
                        $(this).hide();
                    else
                        $(this).show();
                });
            });

            $('#btnAgregarRegion').on('click', function () {
                $('#nombreRegion').val('');
                $('#idRegion').text('');
                $('#modalAgregarRegionLabel').text('Agregar region');
            })

            $('#btnAgregarComuna').on('click', function () {
                $('#nombreComuna').val('');
                $('#idComuna').text('');
                $("#cboRegion option[value=0]").attr("selected", true);
                $('#modalAgregarComunaLabel').text('Agregar comuna');
            })


            $('#ConfirmarAgregarRegion').on('click', function () {
                var nombre = $('#nombreRegion').val();
                var idRegion = $('#idRegion').text();

                if (idRegion != "") {
                    if (!PermisoEditar) {
                        Command: toastr["error"]("No tines permisos para editar")
                        return;
                    }
                }
                else {
                    if (!PermisoCrear) {
                        Command: toastr["error"]("No tines permisos para crear")
                        return;
                    }
                }

                $.ajax({
                    type: 'POST',
                    cache: false,
                    url: '<%= ResolveUrl("/Mantenedores/Locaciones/Locaciones.aspx/CrearModificarRegion") %>',
                    contentType: 'application/json; charset=utf-8',
                    async: true,
                    dataType: 'json',
                    data: JSON.stringify({ 'id_region': idRegion, 'nombre': nombre }),
                    success: function (data) {
                        if (data.d) {
                            Command: toastr["success"]("La region a sido creada exitosamente")
                            ObtenerRegiones()
                        }
                    },
                    error: function (data) {
                        Command: toastr["error"]("Algo ha salido mal!!!")
                    }
                });
                
            });

            $('#ConfirmarAgregarComuna').on('click', function () {
                var nombre = $('#nombreComuna').val();
                var idRegion = $('#cboRegion').val() 
                var idComuna = $('#idComuna').text();

                if (idComuna != "") {
                    if (!PermisoEditar) {
                        Command: toastr["error"]("No tines permisos para editar")
                        return;
                    }
                }
                else {
                    if (!PermisoCrear) {
                        Command: toastr["error"]("No tines permisos para crear")
                        return;
                    }
                }

                $.ajax({
                    type: 'POST',
                    cache: false,
                    url: '<%= ResolveUrl("/Mantenedores/Locaciones/Locaciones.aspx/CrearModificarComuna") %>',
                    contentType: 'application/json; charset=utf-8',
                    async: true,
                    dataType: 'json',
                    data: JSON.stringify({'id_comuna':idComuna, 'id_region': idRegion, 'nombre': nombre }),
                    success: function (data) {
                        if (data.d) {
                            Command: toastr["success"]("La comuna a sido creada exitosamente")
                            ObtenerComunas()
                        }
                    },
                    error: function (data) {
                        Command: toastr["error"]("Algo ha salido mal!!!")
                    }
                });
            });

            $('#confirmDelete').on('click', function () {
                if (PermisoEliminar) {
                    var id = $('#idEliminar').text()
                    var RegCom = $('#TipoEliminar').text()
                    $.ajax({
                        type: 'POST',
                        cache: false,
                        url: '<%= ResolveUrl("/Mantenedores/Locaciones/Locaciones.aspx/EliminarRegCom") %>',
                        contentType: 'application/json; charset=utf-8',
                        async: true,
                        dataType: 'json',
                        data: JSON.stringify({ 'id': id, 'RegCom': RegCom }),
                        success: function (data) {
                            if (data.d) {
                                Command: toastr["success"]("Se ha eliminado exitosamente")

                                if (RegCom == "com") {
                                    ObtenerComunas()
                                }
                                else {
                                    ObtenerRegiones()
                                }
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

        });

        function ObtenerRegiones() {
            $.ajax({
                type: 'POST',
                cache: false,
                url: '<%= ResolveUrl("/Mantenedores/Locaciones/Locaciones.aspx/ObtenerRegiones") %>',
                contentType: 'application/json; charset=utf-8',
                async: true,
                dataType: 'json',
                success: function (data) {
                    if (data.d != null) {
                        var html = "";
                        var cbo = "";
                        cbo += "<option value='0'>Seleccione...</option>";

                        $.each(data.d, function (i, val) {

                            var buttons  = "";

                            var nom = "'" + val.nombre_region + "'";

                            buttons += '<a data-bs-toggle="modal" data-bs-target="#modalEliminar" style="cursor: pointer" onclick="Eliminar(' + val.id_region + ', \'reg\',' + nom + ')" data-title="Eliminar"><img src="/Imagenes/Iconos/btnDeleteitem.png" height="25" width="25" /></a><span> </span>';

                            buttons += '<a style="cursor: pointer" data-bs-toggle="modal" data-bs-target="#modalAgregarRegion" onclick="EditarRegion(' + val.id_region + ',' + nom + ')" data-title="Editar"><img src="/Imagenes/Iconos/EditWithe.png" height="25" width="25" /></a>';

                            html += '<tr id="' + val.id_region + '">' +
                                    '<td colspan="2">' + val.nombre_region + '</td>' +
                                    '<td scope="row">' + buttons + '</td>' +
                                '</tr>';

                            cbo += "<option value='" + val.id_region + "'>" + val.nombre_region + "</option>";
                        });

                        $('#cboRegion').html(cbo);
                        $('#ContenidoRegiones').html(html);
                    }
                },
                error: function (data) {
                    Command: toastr["error"]("Algo ha salido mal!!!")
                }
            });
        }

        function ObtenerComunas() {
            $.ajax({
                type: 'POST',
                cache: false,
                url: '<%= ResolveUrl("/Mantenedores/Locaciones/Locaciones.aspx/ObtenerComunas") %>',
                contentType: 'application/json; charset=utf-8',
                async: true,
                dataType: 'json',
                success: function (data) {
                    if (data.d != null) {
                        var html = "";

                        $.each(data.d, function (i, val) {
                            var buttons = "";

                            var nom = "'" + val.nombre_comuna + "'";

                            buttons += '<a data-bs-toggle="modal" data-bs-target="#modalEliminar" style="cursor: pointer" onclick="Eliminar(' + val.id_comuna + ', \'com\',' + nom + ')" data-title="Eliminar"><img src="/Imagenes/Iconos/btnDeleteitem.png" height="25" width="25" /></a><span> </span>';

                            buttons += '<a style="cursor: pointer" data-bs-toggle="modal" data-bs-target="#modalAgregarComuna" onclick="EditarComuna(' + val.id_comuna + ',' + val.id_region + ',' + nom + ')" data-title="Editar"><img src="/Imagenes/Iconos/EditWithe.png" height="25" width="25" /></a>';

                            html += '<tr id="' + val.id_comuna + '">' +
                                '<td colspan="2">' + val.nombre_comuna + '</td>' +
                                '<td scope="row">' + buttons + '</td>' +
                                '</tr>';

                        });

                        $('#ContenidoComunas').html(html);
                    }
                },
                error: function (data) {
                    Command: toastr["error"]("Algo ha salido mal!!!")
                }
            });
        }

        function EditarRegion(id_region, nombre) {
            $('#idRegion').text(id_region);
            $('#nombreRegion').val(nombre);
            $('#modalAgregarRegionLabel').text('Editar region');
        }

        function EditarComuna(id_comuna, id_region, nombre) {
            $('#nombreComuna').val(nombre);
            $('#idComuna').text(id_comuna);
            $("#cboRegion option[value=" + id_region + "]").attr("selected", true);
            $('#modalAgregarComunaLabel').text('Editar comuna');
        }

        function Eliminar(id,RegCom,nombre) {
            $('#idEliminar').text(id)
            $('#TipoEliminar').text(RegCom)
            $('#NombreEliminar').text(nombre)

            console.log(id + RegCom + nombre)

            if (RegCom == "com") {
                $('.TipoEliminar').text('Comuna')
            }
            else {
                $('.TipoEliminar').text('Region')
            }
        }

    </script>
</asp:Content>
