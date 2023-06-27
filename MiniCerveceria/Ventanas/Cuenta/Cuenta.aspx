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
        <div class="row">
            <div class="col-lg-3" style="align-content:center; justify-content:center">
                <a id="btnVerDatos">
                    <img src="\Imagenes\Iconos\NovedadesBlack.png" style="width:40px;top: 40px !important;" alt="Alternate Text" />
                    <span>
                        Datos personales
                    </span>
                </a>
            </div>
            <div class="col-lg-3" style="align-content:center; justify-content:center">
                <a id="btnCompras">
                    <img src="\Imagenes\Iconos\Bag.png" style="width:40px;top: 40px !important;" alt="Alternate Text" />
                    <span>
                        Historial de compras
                    </span>
                </a>
            </div>
            <div class="col-lg-3" style="align-content:center; justify-content:center">
                <a id="btnPedidos">
                    <img src="\Imagenes\Iconos\PedidosBlack.png" style="width:40px;height: 40px !important;" alt="Alternate Text" />
                    <span>
                        Pedidos
                    </span>
                </a>
            </div>
            <div class="col-lg-3" style="align-content:center; justify-content:center">
                <a id="btnFavoritos">
                    <img src="\Imagenes\Iconos\Favorito.png" style="width:40px;top: 40px !important;" alt="Alternate Text" />
                    <span>
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
      <div class="card-body">
          <br />
          <div class="row">
              <div class="col-sm-3 mb-3 mb-sm-0">
                <br />
				<div class="card" style="width: 100%;">
				  <div >
					  <img src="/Imagenes/Iconos/NoImage.png" class="card-img-top">
				  </div>
					<div  align="center">
						<div class="card-body">
						<h5 class="card-title">Card title</h5>
					  </div>
					</div>
				</div>
              </div>
              <div class="col-sm-3 mb-3 mb-sm-0">
                <br />
				<div class="card" style="width: 100%;">
				  <div >
					  <img src="/Imagenes/Iconos/NoImage.png" class="card-img-top">
				  </div>
					<div  align="center">
						<div class="card-body">
						<h5 class="card-title">Card title</h5>
					  </div>
					</div>
				</div>
              </div>
              <div class="col-sm-3 mb-3 mb-sm-0">
                <br />
				<div class="card" style="width: 100%;">
				  <div >
					  <img src="/Imagenes/Iconos/NoImage.png" class="card-img-top">
				  </div>
					<div  align="center">
						<div class="card-body">
						<h5 class="card-title">Card title</h5>
					  </div>
					</div>
				</div>
              </div>
              <div class="col-sm-3 mb-3 mb-sm-0">
                <br />
				<div class="card" style="width: 100%;">
				  <div >
					  <img src="/Imagenes/Iconos/NoImage.png" class="card-img-top">
				  </div>
					<div  align="center">
						<div class="card-body">
						<h5 class="card-title">Card title</h5>
					  </div>
					</div>
				</div>
              </div>
              <div class="col-sm-3 mb-3 mb-sm-0">
                <br />
				<div class="card" style="width: 100%;">
				  <div >
					  <img src="/Imagenes/Iconos/NoImage.png" class="card-img-top">
				  </div>
					<div  align="center">
						<div class="card-body">
						<h5 class="card-title">Card title</h5>
					  </div>
					</div>
				</div>
              </div>
              <div class="col-sm-3 mb-3 mb-sm-0">
                <br />
				<div class="card" style="width: 100%;">
				  <div >
					  <img src="/Imagenes/Iconos/NoImage.png" class="card-img-top">
				  </div>
					<div  align="center">
						<div class="card-body">
						<h5 class="card-title">Card title</h5>
					  </div>
					</div>
				</div>
              </div>
              <div class="col-sm-3 mb-3 mb-sm-0">
                <br />
				<div class="card" style="width: 100%;">
				  <div >
					  <img src="/Imagenes/Iconos/NoImage.png" class="card-img-top">
				  </div>
					<div  align="center">
						<div class="card-body">
						<h5 class="card-title">Card title</h5>
					  </div>
					</div>
				</div>
              </div>
              <div class="col-sm-3 mb-3 mb-sm-0">
                <br />
				<div class="card" style="width: 100%;">
				  <div >
					  <img src="/Imagenes/Iconos/NoImage.png" class="card-img-top">
				  </div>
					<div  align="center">
						<div class="card-body">
						<h5 class="card-title">Card title</h5>
					  </div>
					</div>
				</div>
              </div>
              <div class="col-sm-3 mb-3 mb-sm-0">
                <br />
				<div class="card" style="width: 100%;">
				  <div >
					  <img src="/Imagenes/Iconos/NoImage.png" class="card-img-top">
				  </div>
					<div  align="center">
						<div class="card-body">
						<h5 class="card-title">Card title</h5>
					  </div>
					</div>
				</div>
              </div>
              <div class="col-sm-3 mb-3 mb-sm-0">
                <br />
				<div class="card" style="width: 100%;">
				  <div >
					  <img src="/Imagenes/Iconos/NoImage.png" class="card-img-top">
				  </div>
					<div  align="center">
						<div class="card-body">
						<h5 class="card-title">Card title</h5>
					  </div>
					</div>
				</div>
              </div>
              <div class="col-sm-3 mb-3 mb-sm-0">
                <br />
				<div class="card" style="width: 100%;">
				  <div >
					  <img src="/Imagenes/Iconos/NoImage.png" class="card-img-top">
				  </div>
					<div  align="center">
						<div class="card-body">
						<h5 class="card-title">Card title</h5>
					  </div>
					</div>
				</div>
              </div>
              <div class="col-sm-3 mb-3 mb-sm-0">
                <br />
				<div class="card" style="width: 100%;">
				  <div >
					  <img src="/Imagenes/Iconos/NoImage.png" class="card-img-top">
				  </div>
					<div  align="center">
						<div class="card-body">
						<h5 class="card-title">Card title</h5>
					  </div>
					</div>
				</div>
              </div>
            </div>
          <br />
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

        });

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
    </script>
</asp:Content>