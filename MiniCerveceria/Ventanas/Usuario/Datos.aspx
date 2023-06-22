<%@ Page Title="Datos" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" Inherits="MiniCerveceria.Ventanas.Usuario.Datos" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">	
    <style>
        .headContent {
            display: none
        }

        a {
            text-decoration: none;
            color: #000000;
        }

        .OptionSelected {
            background-color: rgb( 0, 0, 0);
        }

        #SideMenuMantenedor {
            display: none;
        }

        #MantenedorNav{
            display: none;
        }
    </style>
    <div class="card">
        <div class="card-body">
            <img src="\Imagenes\Iconos\UserIconBlack.png" style="width: 80px; top: 80px !important;" class="rounded-circle" alt="Alternate Text" />
            Usuario.
        </div>
    </div>
    <br />
    <div class="card">
        <div class="card-body">
            <div class="row">
                <div class="col-lg-3" style="align-content: center; justify-content: center">
                    <div class="card OptionSelected">
                        <a runat="server" href="~/Ventanas/Usuario/Datos">
                            <img src="\Imagenes\Iconos\NovedadesWithe.png" style="width: 40px; top: 40px !important;" class="rounded-circle" alt="Alternate Text" />
                            <span style="color: #ffffff">Datos personales
                            </span>
                        </a>
                    </div>
                </div>
                <div class="col-lg-3" style="align-content: center; justify-content: center">
                    <a runat="server" href="~/Ventanas/Usuario/Compras">
                        <img src="\Imagenes\Iconos\NovedadesBlack.png" style="width: 40px; top: 40px !important;" class="rounded-circle" alt="Alternate Text" />
                        <span>Historial de compras
                        </span>
                    </a>
                </div>
                <div class="col-lg-3" style="align-content: center; justify-content: center">
                    <a runat="server" href="~/Ventanas/Usuario/Pedidos">
                        <img src="\Imagenes\Iconos\NovedadesBlack.png" style="width: 40px; top: 40px !important;" class="rounded-circle" alt="Alternate Text" />
                        <span>Pedidos
                        </span>
                    </a>
                </div>
                <div class="col-lg-3" style="align-content: center; justify-content: center">
                    <a runat="server" href="~/Ventanas/Usuario/Favoritos">
                        <img src="\Imagenes\Iconos\NovedadesBlack.png" style="width: 40px; top: 40px !important;" class="rounded-circle" alt="Alternate Text" />
                        <span>Favoritos
                        </span>
                    </a>
                </div>
            </div>
        </div>
    </div>
    <br />
    <div class="card" id="VerDatos">
        <div class="card-body">
            <br />
            <div class="row">
                <div class="col-lg-3">
                    <label for="Nombre" class="form-label"><strong>Nombre: </strong></label>
                    <label class="form-label">xxxxx xx xxxx</label>
                </div>
                <div class="col-lg-3">
                    <label for="Apellido" class="form-label"><strong>Apellido: </strong></label>
                    <label class="form-label">xxxxx xx xxxx</label>
                </div>
                <div class="col-lg-3">
                    <label for="FechaNac" class="form-label"><strong>Fecha nacimiento: </strong></label>
                    <label class="form-label">xxxxx xx xxxx</label>
                </div>
                <div class="col-lg-3">
                    <label for="Direccion" class="form-label"><strong>Direccion: </strong></label>
                    <label class="form-label">xxxxx xx xxxx</label>
                </div>
                <div class="col-lg-3">
                    <label for="Region" class="form-label"><strong>Region: </strong></label>
                    <label class="form-label">xxxxx xx xxxx</label>
                </div>
                <div class="col-lg-3">
                    <label for="Comuna" class="form-label"><strong>Comuna: </strong></label>
                    <label class="form-label">xxxxx xx xxxx</label>
                </div>
                <div class="col-lg-3">
                    <label for="Email" class="form-label"><strong>Email: </strong></label>
                    <label class="form-label">xxxxx xx xxxx</label>
                </div>
                <div class="col-lg-3">
                    <label for="Numero" class="form-label"><strong>Numero: </strong></label>
                    <label class="form-label">xxxxx xx xxxx</label>
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
    <div class="card visually-hidden" id="ModificarDatos">
        <div class="card-body">
            <div class="row">
                <div class="col-lg-12">
                    <a type="button" id="CerrarEditar">
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
                    <input class="form-control" id="EditarFechaNac" placeholder="01/01/1999">
                </div>
            </div>
            <div class="row">
                <div class="col-lg-6">
                    <label for="Direccion" class="form-label">Direccion</label>
                    <input class="form-control" id="EditarDireccion" placeholder="1234 Nombre calle">
                </div>
                <div class="col-lg-3">
                    <label for="Region" class="form-label">Region</label>
                    <select id="EditarRegion" class="form-select">
                        <option selected>Seleccione...</option>
                        <option>...</option>
                    </select>
                </div>
                <div class="col-lg-3">
                    <label for="Comuna" class="form-label">Comuna</label>
                    <select id="EditarComuna" class="form-select">
                        <option selected>Seleccione...</option>
                        <option>...</option>
                    </select>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-4">
                    <label for="Email" class="form-label">Email</label>
                    <input type="email" class="form-control" id="EditarEmail" placeholder="EmailExample@gmail.com">
                </div>
                <div class="col-lg-3">
                    <label for="Constrasenia" class="form-label" style="font-size: 16px">***</label>
                    <button class="form-control" id="EditarConstrasenia">Cambiar Contraseña</button>
                </div>
                <div class="col-lg-5">
                    <label for="Numero" class="form-label">Numero</label>
                    <input class="form-control" id="EditarNumero" placeholder="+56 9 999 999">
                </div>
            </div>
            <br />
            <div class="col-12">
                <button type="submit" class="btn btn-outline-warning">Guardar Cambios</button>
            </div>
            <br />
        </div>
    </div>

    <script>
        $(document).ready(function () {

            $('#btnModificar').on('click', function () {
                $('#ModificarDatos').removeClass('visually-hidden');
                $('#VerDatos').addClass('visually-hidden');
            })

            $('#CerrarEditar').on('click', function () {
                $('#ModificarDatos').addClass('visually-hidden');
                $('#VerDatos').removeClass('visually-hidden');
            })
        });
    </script>
</asp:Content>
