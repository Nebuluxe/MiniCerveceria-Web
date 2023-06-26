<%@ Page Title="Mantenedores" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"  CodeBehind="StockProducto.aspx.cs" Inherits="MiniCerveceria.Mantenedores.Productos.StockProducto" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <link href="/GlobalCss/Mantenedores.css" rel="stylesheet" type="text/css">

    <style>
    	#headMaster {
    		display: none;
    	}

    	#mainNav {
    		display: none;
    	}

    	#footerDefault {
    		display: none;
    	}

        #barraNav {
            background: #000000 !important;
            color: #ffffff;
            border-radius: 15px;
        }

        #ContenedorTablaStock {
	        height: 800px;
	        width: 100%;
	        overflow-y: scroll;
            overflow-x: hidden
        }
    </style>

    <nav id="barraNav" class="navbar bg-body-tertiary">
        <div class="container-fluid">
            <a runat="server" href="~/Mantenedores/Default.aspx">
                <img id="imgButtonBack" src="/Imagenes/Iconos/BackButtonWithe.png" height="40">
            </a>
            <div class="row">
                <div class="col-2">
                    <img src="/Imagenes/Iconos/StockWithe.png" height="40" width="40">
                </div>
                <div class="col-10">
                    <asp:Label CssClass="titulo" Style="font-size: 1.9em; color: #ffffff;" runat="server" ClientIDMode="Static">Stock</asp:Label>
                </div>
            </div>
            <span></span>
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
    <div id="ContenedorTablaStock">
        <table class="table CompraDetalle" id="TablaStockProductos">
		    <thead>
		        <tr>
			        <th scope="row" colspan="2">Productos</th>
			        <th scope="row">Precio Unitario</th>
			        <th scope="row">Cantidad stock</th>
			        <th scope="row">Acciones</th>
		        </tr>
		    </thead>
		    <tbody id="Contenido">

		    </tbody>
	    </table>
    </div>
    
    <%-- Modal aumentar stock --%>
    <div class="fade modal" id="modalAumentaStock" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="modalAumentaStockLabel" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
          <div class="modal-header">
            <h1 class="modal-title fs-5" id="modalAumentaStockLabel">Aumentar stock</h1>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
            <span id="idProdAumenta" class="visually-hidden"></span>
            <input runat="server" ClientIDMode="Static" type="text" id="txtCantidadAumentar" class="form-control" />
            <label class="form-label">Cantidad</label>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-success" data-bs-dismiss="modal" id="confirmAumenta">Aceptar</button>
          </div>
        </div>
      </div>
    </div>

    <%-- Modal rebajar stock --%>
    <div class="fade modal" id="modalRebajaStock" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="modalRebajaStockLabel" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
          <div class="modal-header">
            <h1 class="modal-title fs-5" id="modalRebajaStockLabel">Rebajar stock</h1>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
            <span id="idProdRebaja" class="visually-hidden"></span>
            <span id="StockActualdRebaja" class="visually-hidden"></span>
            <input runat="server" ClientIDMode="Static" type="text" id="txtCantidadRebajar" class="form-control" />
            <label class="form-label">Cantidad</label>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-success" data-bs-dismiss="modal" id="confirmRebaja">Aceptar</button>
          </div>
        </div>
      </div>
    </div>

    <script type="text/javascript">
        var PermiosEditar = <%= PermiosEditar %>;

        $(document).ready(function () {
            cargarStockProductos()

            $("#search").keyup(function () {
                _this = this;
                $.each($("#TablaStockProductos tbody tr"), function () {
                    if ($(this).text().toLowerCase().indexOf($(_this).val().toLowerCase()) === -1)
                        $(this).hide();
                    else
                        $(this).show();
                });
            });

            $('#confirmAumenta').on('click', function (e) {
                if (PermiosEditar) {
                    var cantidad = $('#txtCantidadAumentar').val();
                    var idProdAumenta = $('#idProdAumenta').text();

                    $.ajax({
                        type: 'POST',
                        cache: false,
                        url: '<%= ResolveUrl("/Mantenedores/Productos/StockProducto.aspx/AumentarStock") %>',
                        contentType: 'application/json; charset=utf-8',
                        async: false,
                        dataType: 'json',
                        data: JSON.stringify({ 'id_producto': idProdAumenta, 'cantidad': cantidad }),
                        success: function (data) {
                            if (data.d) {
                                cargarStockProductos()

                                $('#txtCantidadAumentar').val('');
                            }
                        },
                        error: function (data) {
                            alert("Algo ha salido mal!!!");
                        }
                    });
                }
            });

            $('#confirmRebaja').on('click', function () {
                if (PermiosEditar) {
                    var cantidad = $('#txtCantidadRebajar').val();
                    var idProdRebaja = $('#idProdRebaja').text();

                    var cantidadActual = $('#StockActualdRebaja').text();

                    if (cantidad < cantidadActual) {
                        $.ajax({
                            type: 'POST',
                            cache: false,
                            url: '<%= ResolveUrl("/Mantenedores/Productos/StockProducto.aspx/RebajarStock") %>',
                            contentType: 'application/json; charset=utf-8',
                            async: false,
                            dataType: 'json',
                            data: JSON.stringify({ 'id_producto': idProdRebaja, 'cantidad': cantidad }),
                            success: function (data) {
                                if (data.d) {
                                    cargarStockProductos()

                                    $('#txtCantidadRebajar').val('');
                                }
                            },
                            error: function (data) {
                                alert("Algo ha salido mal!!!");
                            }
                        });
                    } else {
                        alert("El stock a rebajar no puede ser mayor al actual!!");
                    }
                }
            });
        });

        function aumenta(id) {
            if (PermiosEditar) {
                var tr = $('#Contenido').find('tr[id=' + id + ']');

                tr.find('.aumenta').trigger('click');

                $('#idProdAumenta').text(id);
            }
        }

        function rebaja(id, cantidad) {
            if (PermiosEditar) {
                var tr = $('#Contenido').find('tr[id=' + id + ']');

                tr.find('.rebajar').trigger('click');

                $('#idProdRebaja').text(id);
                $('#StockActualdRebaja').text(cantidad);
            }
        }

        function cargarStockProductos() {
            $.ajax({
                type: 'POST',
                cache: false,
                url: '<%= ResolveUrl("/Mantenedores/Productos/StockProducto.aspx/ListarStockProductosDefualt") %>',
                contentType: 'application/json; charset=utf-8',
                async: false,
                dataType: 'json',
                success: function (data) {

                    var html = "";

                    if (data.d != null) {

                        $.each(data.d, function (i, val) {
                            var buttons = "";

                            buttons += '<a  onclick="aumenta(' + val.id_producto + ')" data-title="Aumentar stock"><img src="/Imagenes/Iconos/btnSumBlack.png" height="25" width="25" /></a><span> </span>';
                            buttons += '<button type="button" class="visually-hidden aumenta" data-bs-toggle="modal" data-bs-target="#modalAumentaStock"></button>';

                            buttons += '<a  onclick="rebaja(' + val.id_producto + ', ' + val.stock + ')" data-title="Rebajar stock"><img src="/Imagenes/Iconos/btnRestBlack.png" height="25" width="25" /></a>';
                            buttons += '<button type="button" class="visually-hidden rebajar" data-bs-toggle="modal" data-bs-target="#modalRebajaStock"></button>';

                            html += '<tr id="' + val.id_producto + '">' +
                                        '<td colspan="2">' + val.nombre_producto + '</td>' +
                                        '<td scope="row">$' + val.precio + '</td>' +
                                        '<td scope="row" >' + val.stock + '</td>' +
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