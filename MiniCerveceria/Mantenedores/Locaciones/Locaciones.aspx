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
          <div class="modal-header">
            <h1 class="modal-title fs-5" id="modalAgregarRegionLabel">Agregar region</h1>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">

          </div>
          <div class="modal-footer">
          </div>
        </div>
      </div>
    </div>
     <%-- Modal agregar novedad --%>
    <div class="fade modal" id="modalAgregarComuna" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="modalAgregarComunaLabel" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
        <div class="modal-content">
          <div class="modal-header">
            <h1 class="modal-title fs-5" id="modalAgregarComunaLabel">Agregar comuna</h1>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">

          </div>
          <div class="modal-footer">
          </div>
        </div>
      </div>
    </div>
    <script>

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

                        $.each(data.d, function (i, val) {

                            html += '<tr id="' + val.id_region + '">' +
                                    '<td colspan="2">' + val.nombre_region + '</td>' +
                                    '<td scope="row">' + "" + '</td>' +
                                    '</tr>';
                        });

                        $('#ContenidoRegiones').html(html);
                    }
                },
                error: function (data) {
                    alert("Algo ha salido mal!!!");
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

                            html += '<tr id="' + val.id_region + '">' +
                                '<td colspan="2">' + val.nombre_comuna + '</td>' +
                                '<td scope="row">' + "" + '</td>' +
                                '</tr>';


                        });

                        

                        $('#ContenidoComunas').html(html);
                    }
                },
                error: function (data) {
                    alert("Algo ha salido mal!!!");
                }
            });
                }
    </script>
</asp:Content>
