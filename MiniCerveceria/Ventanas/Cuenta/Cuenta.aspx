<%@ Page Title="Cuenta" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Cuenta.aspx.cs" Inherits="MiniCerveceria.Ventanas.Cuenta.Cuenta" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        #headMaster{
            height: 350px;
        }

        .headContent{
            display: none
        }

        a{
            text-decoration:none;
            color: #000000;
        }

        #SideMenuMantenedor {
            display: none;
        }

        #MantenedorNav{
            display: none;
        }

        #Favoritos {
	        width: 100%;
	        overflow-y: scroll;
            overflow-x: hidden;
        }

        #ComprasList{
	        height: 500px;
	        overflow-y: scroll;        

        }

        #PedidosList{
	        height: 500px;
	        overflow-y: scroll;        

        }

        #pedidoDetalle {
	        height: 500px;
	        width: 100%;
	        overflow-y: scroll;
        }

        #compraDetalle{
            height: 500px;
	        width: 100%;
	        overflow-y: scroll;
        }

        .sizeOptionsCard{
            height: 600px
        }
    </style>
    <div class="card">
      <div class="card-body">
        <img src="\Imagenes\Iconos\UserIconBlack.png" style="width:80px;top: 80px !important;" class="rounded-circle" alt="Alternate Text" /> <span id="Usuario"></span>
      </div>
    </div>
    <br />
    <div class="card">
      <div class="card-body">
        <div class="row" align="center">
            <div class="col-lg-2" style="align-content:center; justify-content:center">
                <a id="btnVerDatos">
                    <img src="\Imagenes\Iconos\NovedadesBlack.png" style="width:40px;top: 40px !important;cursor: pointer" alt="Alternate Text" />
                    <span style="cursor: pointer">
                        Datos personales
                    </span>
                </a>
            </div>
            <div class="col-lg-3" style="align-content:center; justify-content:center">
                <a id="btnCompras">
                    <img src="\Imagenes\Iconos\Bag.png" style="width:40px;top: 40px !important;cursor: pointer" alt="Alternate Text" />
                    <span style="cursor: pointer">
                        Historial de compras
                    </span>
                </a>
            </div>
            <div class="col-lg-2" style="align-content:center; justify-content:center">
                <a id="btnPedidos">
                    <img src="\Imagenes\Iconos\PedidosBlack.png" style="width:40px;height: 40px !important;cursor: pointer" alt="Alternate Text" />
                    <span style="cursor: pointer">
                        Pedidos
                    </span>
                </a>
            </div>
            <div class="col-lg-2" style="align-content:center; justify-content:center">
                <a id="btnCursosInscritos">
                    <img src="\Imagenes\Iconos\CursosBlack.png" style="width:40px;top: 40px !important;cursor: pointer" alt="Alternate Text" />
                    <span style="cursor: pointer">
                        Cursos inscritos
                    </span>
                </a>
            </div>
            <div class="col-lg-2" style="align-content:center; justify-content:center">
                <a id="btnFavoritos">
                    <img src="\Imagenes\Iconos\Favorito.png" style="width:40px;top: 40px !important;cursor: pointer" alt="Alternate Text" />
                    <span style="cursor: pointer">
                        Favoritos
                    </span>
                </a>
            </div>
        </div>
      </div>
    </div>
    <br />
    <div class="card sizeOptionsCard" id="VerDatos">
        <div class="card-body">
            <br />
            <div class="row">
                <div class="col-lg-4">
                    <label for="Nombre" class="form-label"><strong>Nombre: </strong></label>
                    <label class="form-label" id="verNombre"></label>
                </div>
                <div class="col-lg-4">
                    <label for="Apellido" class="form-label"><strong>Apellido: </strong></label>
                    <label class="form-label" id="verApelido"></label>
                </div>
                <div class="col-lg-4">
                    <label for="FechaNac" class="form-label"><strong>Fecha nacimiento: </strong></label>
                    <label class="form-label" type="date" id="verFechaNacimiento"></label>
                </div>
                <div class="col-lg-4">
                    <label for="Direccion" class="form-label"><strong>Direccion: </strong></label>
                    <label class="form-label" id="verDireccion"></label>
                </div>
                <div class="col-lg-4">
                    <label for="Email" class="form-label"><strong>Email: </strong></label>
                    <label class="form-label" id="verEmail"></label>
                </div>
                <div class="col-lg-4">
                    <label for="telefono" class="form-label"><strong>telefono: </strong></label>
                    <label class="form-label" id="verNumero"></label>
                </div>
            </div>
            <br />
            <div class="row">
                <div class="col-lg-12">
                    <a class="btn btn-outline-warning" id="btnModificar">Modificar</a>
                </div>
            </div>
            <br />
        </div>
    </div>
    <div class="card visually-hidden sizeOptionsCard" id="Favoritos">
      <div class="card-body" align="center">
          <br />
          <div class="row" id="tablaFavoritos">

          </div>
          <br />
        <div id="SinFvoritos" class="visually-hidden">
            <br /><br /><br /><br /><br /><br /><br /><br />
            <h3>Usted no tiene productos añadidos a favoritos</h3>
            <a href="/Ventanas/Productos/Productos.aspx"class="btn btn-warning">Ver productos</a>
            <br /><br /><br /><br /><br /><br /><br /><br />
        </div>  
      </div>
    </div>
    <div class="card visually-hidden" id="Compras">
      <div class="card-body">
        <br />
        <div class="row">
            <div class="col-lg-4">
                <br />
                <div class="row" id="ComprasList">
                    <div class="col-lg-12">
                        <div class="card">
                          <div class="card-body">
                            Compra Example.
                          </div>
                        </div>
                    </div>
                    <div class="col-lg-12">
                        <div class="card">
                          <div class="card-body">
                            Compra Example.
                          </div>
                        </div>
                    </div>
                    <div class="col-lg-12">
                        <div class="card">
                          <div class="card-body">
                            Compra Example.
                          </div>
                        </div>
                    </div>
                    <div class="col-lg-12">
                        <div class="card">
                          <div class="card-body">
                            Compra Example.
                          </div>
                        </div>
                    </div>
                    <div class="col-lg-12">
                        <div class="card">
                          <div class="card-body">
                            Compra Example.
                          </div>
                        </div>
                    </div>
                    <div class="col-lg-12">
                        <div class="card">
                          <div class="card-body">
                            Compra Example.
                          </div>
                        </div>
                    </div>
                    <div class="col-lg-12">
                        <div class="card">
                          <div class="card-body">
                            Compra Example.
                          </div>
                        </div>
                    </div>
                    <div class="col-lg-12">
                        <div class="card">
                          <div class="card-body">
                            Compra Example.
                          </div>
                        </div>
                    </div>
                    <div class="col-lg-12">
                        <div class="card">
                          <div class="card-body">
                            Compra Example.
                          </div>
                        </div>
                    </div>
                    <div class="col-lg-12">
                        <div class="card">
                          <div class="card-body">
                            Compra Example.
                          </div>
                        </div>
                    </div>
                    <div class="col-lg-12">
                        <div class="card">
                          <div class="card-body">
                            Compra Example.
                          </div>
                        </div>
                    </div>
                    <div class="col-lg-12">
                        <div class="card">
                          <div class="card-body">
                            Compra Example.
                          </div>
                        </div>
                    </div>
                </div>
                <br />
            </div>
            <div class="col-lg-8">
                <br />
                <div class="card" id="compraDetalle">
                  <div class="card-body">
                    <div class="row">

                    </div>
                  </div>
                </div>
                <br />
            </div>
        </div>
      </div>
    </div>
    <div class="card visually-hidden" id="Pedidos">
      <div class="card-body">
        <br />
        <div class="row">
            <div class="col-lg-4" id="PedidosList">
                <br />
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                          <div class="card-body">
                            Pedido Example.
                          </div>
                        </div>
                    </div>
                    <div class="col-lg-12">
                        <div class="card">
                          <div class="card-body">
                            Pedido Example.
                          </div>
                        </div>
                    </div>
                    <div class="col-lg-12">
                        <div class="card">
                          <div class="card-body">
                            Pedido Example.
                          </div>
                        </div>
                    </div>
                    <div class="col-lg-12">
                        <div class="card">
                          <div class="card-body">
                            Pedido Example.
                          </div>
                        </div>
                    </div>
                    <div class="col-lg-12">
                        <div class="card">
                          <div class="card-body">
                            Pedido Example.
                          </div>
                        </div>
                    </div>
                    <div class="col-lg-12">
                        <div class="card">
                          <div class="card-body">
                            Pedido Example.
                          </div>
                        </div>
                    </div>
                    <div class="col-lg-12">
                        <div class="card">
                          <div class="card-body">
                            Pedido Example.
                          </div>
                        </div>
                    </div>
                    <div class="col-lg-12">
                        <div class="card">
                          <div class="card-body">
                            Pedido Example.
                          </div>
                        </div>
                    </div>
                    <div class="col-lg-12">
                        <div class="card">
                          <div class="card-body">
                            Pedido Example.
                          </div>
                        </div>
                    </div>
                    <div class="col-lg-12">
                        <div class="card">
                          <div class="card-body">
                            Pedido Example.
                          </div>
                        </div>
                    </div>
                    <div class="col-lg-12">
                        <div class="card">
                          <div class="card-body">
                            Pedido Example.
                          </div>
                        </div>
                    </div>
                    <div class="col-lg-12">
                        <div class="card">
                          <div class="card-body">
                            Pedido Example.
                          </div>
                        </div>
                    </div>
                </div>
                <br />
            </div>
            <div class="col-lg-8">
                <br />
                <div class="card" id="pedidoDetalle">
                  <div class="card-body">
                    <div class="row">

                    </div>
                  </div>
                </div>
                <br />
            </div>
        </div>
      </div>
    </div>
    <div class="card sizeOptionsCard visually-hidden" id="CursosInscritos">
      <div class="card-body" align="center">
        <br />
        <table class="table CompraDetalle" id="TablaInscripciones">
		    <thead>
		        <tr>
			        <th scope="row" colspan="2">Nombre</th>
                    <th scope="row">Fecha inscripcion</th>
                    <th scope="row">Acciones</th>
		        </tr>
		    </thead>
		    <tbody id="ContenidoCursosInscritos">

		    </tbody>
	    </table>
        <div id="SinCursos" align="center" class="visually-hidden">
            <br /><br /><br /><br /><br /><br /><br /><br />
            <h3>Usted no tiene cursos inscritos</h3>
            <a href="/Ventanas/Cursos/Cursos.aspx"class="btn btn-warning">Ver cursos</a>
            <br /><br /><br /><br /><br /><br /><br /><br />
        </div>  
      </div>
    </div>
    <div class="card visually-hidden sizeOptionsCard" id="ModificarDatos">
        <div class="card-body">
            <div class="row">
                <div class="col-lg-12">
                    <a id="CerrarEditar">
                       <img src="/Imagenes/Iconos/CloseButtonBlack.png" height="35"> 
                    </a>
                </div>
            </div>
            <br />
            <div class="row">
                <div class="col-lg-4">
                    <label for="Nombre" class="form-label">Nombre</label>
                    <input class="form-control" id="EditarNombre" placeholder="Nombre">
                </div>
                <div class="col-lg-4">
                    <label for="Apellido" class="form-label">Apellido</label>
                    <input class="form-control" id="EditarApellido" placeholder="Apellido">
                </div>
                <div class="col-lg-4">
                    <label for="FechaNac" class="form-label">Fecha nacimiento</label>
                    <input type="date" class="form-control" id="EditarFechaNacimiento" required="required"  placeholder="01/01/1999" >
                </div>
            </div>
            <div class="row">
                <div class="col-lg-4">
                    <label for="Direccion" class="form-label">Direccion</label>
                    <input class="form-control" id="EditarDireccion" placeholder="1234 Nombre calle">
                </div>
                <div class="col-lg-4">
                    <label for="Email" class="form-label">Email</label>
                    <input type="email" class="form-control" id="EditarEmail" placeholder="EmailExample@gmail.com">
                </div>
                <div class="col-lg-4">
                    <label for="telefono" class="form-label">telefono</label>
                    <input class="form-control isNumero" id="EditarNumero" maxlength="9" placeholder="9 9999 9999">
                </div>
            </div>
            <br />
            <div class="col-12">
                <button class="btn btn-outline-warning" id="ConfirmCambios">Guardar Cambios</button>
            </div>
            <br />
        </div>
    </div>

    <%-- Modal eliminacion --%>
    <div class="fade modal" id="modalEliminar" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="modalEliminarLabel" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
          <div class="modal-header">
            <h1 class="modal-title fs-5" id="modalEliminarLabel">Eliminar inscipcion</h1>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <span id="idInscripcion" class="visually-hidden"></span>
          <div class="modal-body">
            ¿Esta seguro que desea anular su inscripcion ?
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-success" data-bs-dismiss="modal" id="confirmDelete">Aceptar</button>
          </div>
        </div>
      </div>
    </div>

    <br />
    <br />
    <br />
    <script type="text/javascript">
        var id_user = '<%= id_user %>';
        var fechaNacimiento = '<%= fechaNacimiento %>'; 
        var OptionSelectedSide = '<%= OptionSelectedSide %>'; 

        $(document).ready(function () {
            CargarInformacion()

            if (OptionSelectedSide != "") {
                if (OptionSelectedSide == "h") {
                    $('#Compras').removeClass("visually-hidden");

                    if (!$('#ModificarDatos').hasClass("visually-hidden")) {
                        $('#ModificarDatos').addClass('visually-hidden');
                    }

                    if (!$('#Favoritos').hasClass("visually-hidden")) {
                        $('#Favoritos').addClass('visually-hidden');
                    }

                    if (!$('#Pedidos').hasClass("visually-hidden")) {
                        $('#Pedidos').addClass('visually-hidden');
                    }

                    if (!$('#VerDatos').hasClass("visually-hidden")) {
                        $('#VerDatos').addClass('visually-hidden');
                    }

                    if (!$('#CursosInscritos').hasClass("visually-hidden")) {
                        $('#CursosInscritos').addClass('visually-hidden');
                    }
                }

                if (OptionSelectedSide == "f") {

                    $('#Favoritos').removeClass("visually-hidden");

                    if (!$('#ModificarDatos').hasClass("visually-hidden")) {
                        $('#ModificarDatos').addClass('visually-hidden');
                    }

                    if (!$('#Compras').hasClass("visually-hidden")) {
                        $('#Compras').addClass('visually-hidden');
                    }

                    if (!$('#Pedidos').hasClass("visually-hidden")) {
                        $('#Pedidos').addClass('visually-hidden');
                    }

                    if (!$('#VerDatos').hasClass("visually-hidden")) {
                        $('#VerDatos').addClass('visually-hidden');
                    }

                    if (!$('#CursosInscritos').hasClass("visually-hidden")) {
                        $('#CursosInscritos').addClass('visually-hidden');
                    }

                    cargarFavoritos()
                }

                if (OptionSelectedSide == "p") {
                   
                    $('#Pedidos').removeClass("visually-hidden");

                    if (!$('#ModificarDatos').hasClass("visually-hidden")) {
                        $('#ModificarDatos').addClass('visually-hidden');
                    }

                    if (!$('#Compras').hasClass("visually-hidden")) {
                        $('#Compras').addClass('visually-hidden');
                    }

                    if (!$('#Favoritos').hasClass("visually-hidden")) {
                        $('#Favoritos').addClass('visually-hidden');
                    }

                    if (!$('#VerDatos').hasClass("visually-hidden")) {
                        $('#VerDatos').addClass('visually-hidden');
                    }

                    if (!$('#CursosInscritos').hasClass("visually-hidden")) {
                        $('#CursosInscritos').addClass('visually-hidden');
                    }
                }

                if (OptionSelectedSide == "c") {

                    $('#CursosInscritos').removeClass("visually-hidden");

                    if (!$('#ModificarDatos').hasClass("visually-hidden")) {
                        $('#ModificarDatos').addClass('visually-hidden');
                    }

                    if (!$('#Compras').hasClass("visually-hidden")) {
                        $('#Compras').addClass('visually-hidden');
                    }

                    if (!$('#Favoritos').hasClass("visually-hidden")) {
                        $('#Favoritos').addClass('visually-hidden');
                    }

                    if (!$('#VerDatos').hasClass("visually-hidden")) {
                        $('#VerDatos').addClass('visually-hidden');
                    }

                    if (!$('#Pedidos').hasClass("visually-hidden")) {
                        $('#Pedidos').addClass('visually-hidden');
                    }

                    CargarCursosInscritos()
                }
            }

            $('#btnModificar').on('click', function () {
                $('#ModificarDatos').removeClass('visually-hidden');
                $('#VerDatos').addClass('visually-hidden');
            })

            $('#CerrarEditar').on('click', function () {
                $('#ModificarDatos').addClass('visually-hidden');
                $('#VerDatos').removeClass('visually-hidden');
            })

            $('#btnCompras').on('click', function () {
                $('#Compras').removeClass("visually-hidden");

                if (!$('#ModificarDatos').hasClass("visually-hidden")) {
                    $('#ModificarDatos').addClass('visually-hidden');
                }

                if (!$('#Favoritos').hasClass("visually-hidden")) {
                    $('#Favoritos').addClass('visually-hidden');
                }

                if (!$('#Pedidos').hasClass("visually-hidden")) {
                    $('#Pedidos').addClass('visually-hidden');
                }

                if (!$('#VerDatos').hasClass("visually-hidden")) {
                    $('#VerDatos').addClass('visually-hidden');
                }

                if (!$('#CursosInscritos').hasClass("visually-hidden")) {
                    $('#CursosInscritos').addClass('visually-hidden');
                }
            })

            $('#btnPedidos').on('click', function () {
                $('#Pedidos').removeClass("visually-hidden");

                if (!$('#ModificarDatos').hasClass("visually-hidden")) {
                    $('#ModificarDatos').addClass('visually-hidden');
                }

                if (!$('#Compras').hasClass("visually-hidden")) {
                    $('#Compras').addClass('visually-hidden');
                }

                if (!$('#Favoritos').hasClass("visually-hidden")) {
                    $('#Favoritos').addClass('visually-hidden');
                }

                if (!$('#VerDatos').hasClass("visually-hidden")) {
                    $('#VerDatos').addClass('visually-hidden');
                }

                if (!$('#CursosInscritos').hasClass("visually-hidden")) {
                    $('#CursosInscritos').addClass('visually-hidden');
                }
            })

            $('#btnFavoritos').on('click', function () {
                $('#Favoritos').removeClass("visually-hidden");

                if (!$('#ModificarDatos').hasClass("visually-hidden")) {
                    $('#ModificarDatos').addClass('visually-hidden');
                }

                if (!$('#Compras').hasClass("visually-hidden")) {
                    $('#Compras').addClass('visually-hidden');
                }

                if (!$('#Pedidos').hasClass("visually-hidden")) {
                    $('#Pedidos').addClass('visually-hidden');
                }

                if (!$('#VerDatos').hasClass("visually-hidden")) {
                    $('#VerDatos').addClass('visually-hidden');
                }

                if (!$('#CursosInscritos').hasClass("visually-hidden")) {
                    $('#CursosInscritos').addClass('visually-hidden');
                }

                cargarFavoritos()
            })

            $('#btnVerDatos').on('click', function () {
                $('#VerDatos').removeClass("visually-hidden");

                if (!$('#ModificarDatos').hasClass("visually-hidden")) {
                    $('#ModificarDatos').addClass('visually-hidden');
                }

                if (!$('#Compras').hasClass("visually-hidden")) {
                    $('#Compras').addClass('visually-hidden');
                }

                if (!$('#Pedidos').hasClass("visually-hidden")) {
                    $('#Pedidos').addClass('visually-hidden');
                }

                if (!$('#Favoritos').hasClass("visually-hidden")) {
                    $('#Favoritos').addClass('visually-hidden');
                }

                if (!$('#CursosInscritos').hasClass("visually-hidden")) {
                    $('#CursosInscritos').addClass('visually-hidden');
                }
            })

            $('#btnCursosInscritos').on('click', function () {
                $('#CursosInscritos').removeClass("visually-hidden");

                if (!$('#ModificarDatos').hasClass("visually-hidden")) {
                    $('#ModificarDatos').addClass('visually-hidden');
                }

                if (!$('#Compras').hasClass("visually-hidden")) {
                    $('#Compras').addClass('visually-hidden');
                }

                if (!$('#Favoritos').hasClass("visually-hidden")) {
                    $('#Favoritos').addClass('visually-hidden');
                }

                if (!$('#VerDatos').hasClass("visually-hidden")) {
                    $('#VerDatos').addClass('visually-hidden');
                }

                if (!$('#Pedidos').hasClass("visually-hidden")) {
                    $('#Pedidos').addClass('visually-hidden');
                }

                CargarCursosInscritos()
            })

            $('#ConfirmCambios').on('click', function () {

                var fecnac = $('#EditarFechaNacimiento').val();
                var nombre = $('#EditarNombre').val();
                var apellido = $('#EditarApellido').val();
                var direccion = $('#EditarDireccion').val();
                var email = $('#EditarEmail').val();
                var numero = $('#EditarNumero').val(); 

                $.ajax({
                    type: 'POST',
                    cache: false,
                    url: '<%= ResolveUrl("/Ventanas/Cuenta/Cuenta.aspx/ActualizarDatos") %>',
                    contentType: 'application/json; charset=utf-8',
                    async: false,
                    dataType: 'json',
                    data: JSON.stringify({ 'nombre': nombre, 'apellido': apellido, 'fechanacimiento': fecnac, 'direccion': direccion, 'email': email, 'telefono': numero }),
                    success: function (data) {

                    },
                    error: function (data) {
                        alert("Algo ha salido mal!!!");
                    }
                });
            })

            $('#confirmDelete').on('click', function () {
                var id = $('#idInscripcion').text();
                $.ajax({
                    type: 'POST',
                    cache: false,
                    url: '<%= ResolveUrl("/Ventanas/Cuenta/Cuenta.aspx/EliminarInscripcion") %>',
                    contentType: 'application/json; charset=utf-8',
                    async: true,
                    dataType: 'json',
                    data: JSON.stringify({ 'id_inscripcion': id }),
                    success: function (data) {
                        if (data.d) {
                            CargarCursosInscritos()
                        }
                    },
                    error: function (data) {
                        alert("Algo ha salido mal!!!");
                    }
                });
            });

        });

        function Eliminar(id) {
            $('#idInscripcion').text(id);
        }

        function CargarCursosInscritos() {
            $.ajax({
                type: 'POST',
                cache: false,
                url: '<%= ResolveUrl("/Ventanas/Cuenta/Cuenta.aspx/ObtenerCursosIncritos") %>',
                contentType: 'application/json; charset=utf-8',
                async: false,
                dataType: 'json',
                success: function (data) {
                    var html = "";

                    if (data.d != null) {

                        if (data.d.length > 0) {
                            $.each(data.d, function (i, val) {

                                var buttons = "";

                                buttons += '<a  onclick="Eliminar(' + val.id_Inscripcion + ')" data-title="Anular inscripcio"><img src="/Imagenes/Iconos/btnDeleteitem.png" height="25" width="25" data-bs-toggle="modal" data-bs-target="#modalEliminar" /></a><span> </span>';

                                buttons += '<a href="/Ventanas/Cursos/DetalleCurso.aspx?uid=' + val.id_curso + '" data-title="Ver curso"><img src="/Imagenes/Iconos/CursosBlack.png" height="25" width="25" /></a>';

                                html += '<tr id="' + val.id_Inscripcion + '">' +
                                    '<td colspan="2">' + val.nombre_curso + '</td>' +
                                    '<td scope="row" >' + val.fecha_inscripcion + '</td>' +
                                    '<td scope="row" >' + buttons + '</td>' +
                                    '</tr>';
                            });

                            $('#ContenidoCursosInscritos').html(html);
                        }
                        else {
                            $('#SinCursos').removeClass('visually-hidden');
                            $('#TablaInscripciones').addClass('visually-hidden');
                        }


                    }
                },
                error: function (data) {
                    alert("Algo ha salido mal!!!");
                }
            });
        }

        function CargarInformacion() {
            $.ajax({
                type: 'POST',
                cache: false,
                url: '<%= ResolveUrl("/Ventanas/Cuenta/Cuenta.aspx/ObteneSatosUSuario") %>',
                contentType: 'application/json; charset=utf-8',
                async: false,
                dataType: 'json',
                success: function (data) {
                    if (data.d != null) {
                        $('#Usuario').text(data.d.nombre + " " + data.d.apellido);
                        $('#verNombre').text(data.d.nombre);
                        $('#verApelido').text(data.d.apellido);
                        $('#verFechaNacimiento').text(fechaNacimiento);
                        $('#verDireccion').text(data.d.direccion);
                        $('#verEmail').text(data.d.email);
                        $('#verNumero').text(data.d.telefono); 

                        $('#EditarFechaNacimiento').val(fechaNacimiento);
                        $('#EditarNombre').val(data.d.nombre);
                        $('#EditarApellido').val(data.d.apellido);
                        $('#EditarDireccion').val(data.d.direccion);
                        $('#EditarEmail').val(data.d.email);
                        $('#EditarNumero').val(data.d.telefono); 
                    }
                },
                error: function (data) {
                    alert("Algo ha salido mal!!!");
                }
            });
        }

        function cargarFavoritos() {
            $.ajax({
                type: 'POST',
                cache: false,
                url: '<%= ResolveUrl("/Ventanas/Cuenta/Cuenta.aspx/obtenerFavoritos") %>',
                contentType: 'application/json; charset=utf-8',
                async: true,
                dataType: 'json',
                success: function (data) {

                    var html = "";

                    if (data.d.length > 0) {

                        $.each(data.d, function (i, val) {
                            html += '<div class="col-lg-3 tarjNovedad">' +
                                        '<br/>' +
                                        '<div class="card" style="width: 90%;">' +
                                        '<div class="contenedor">' +
                                        '<a href="/Ventanas/Productos/DetalleProducto?prod=' + val.id_producto + '"/>' +
                                        '<img src="' + val.URL_img + '" class="card-img-top imagen">' +
                                        '</div>' +
                                        '<div align="center">' +
                                        '<div class="card-body">' +
                                        '<div class="row">' +
                                        '<div class="col-lg-12">' +
                                        '<span class="titulo name">' + val.nombre_producto + '</span>' +
                                        '</div>' +
                                        '<div class="col-lg-12">' +
                                        '<span><a data-title="Eliminar de favoritos" onclick="quitar(' + val.id_producto + ')"><img src="/Imagenes/Iconos/btnDeleteitem.png" width="25"></a></span>' +
                                        '</div>' +
                                        '</div>' +
                                        '</div>' +
                                        '</div>' +
                                        '</div>' +
                                    '</div>';
                        });

                        $('#tablaFavoritos').html(html);
                    }
                    else {
                        $('#SinFvoritos').removeClass('visually-hidden');
                        $('#tablaFavoritos').addClass('visually-hidden');
                    }
                },
                error: function (data) {
                    alert("Algo ha salido mal!!!");
                }
            });
        }

        function quitar(idprod) {
            $.ajax({
                type: 'POST',
                cache: false,
                url: '<%= ResolveUrl("/Ventanas/Cuenta/Cuenta.aspx/QuitarFavorito") %>',
                contentType: 'application/json; charset=utf-8',
                async: true,
                dataType: 'json',
                data: JSON.stringify({ 'id_producto': idprod }),
                success: function (data) {
                    if (data.d) {
                        cargarFavoritos()
                    }
                },
                error: function (data) {
                    alert("Algo ha salido mal!!!");
                }
            });
        }
    </script>
</asp:Content>