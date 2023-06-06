<%@ Page Title="Cuenta" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" Inherits="MiniCerveceria.Ventanas.Usuario.Datos" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        #headMaster {
            height: 350px;
        }

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
                            <span style="color: #ffffff">Configurar datos personales
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
    <div class="card">
        <div class="card-body">
            <br />
            <div class="row">
                <div class="col-lg-4">
                    <label for="Nombre" class="form-label">Nombre</label>
                    <input class="form-control" id="Nombre" placeholder="Nombre">
                </div>
                <div class="col-lg-4">
                    <label for="Apellido" class="form-label">Apellido</label>
                    <input class="form-control" id="Apellido" placeholder="Apellido">
                </div>
                <div class="col-lg-4">
                    <label for="FechaNac" class="form-label">Fecha nacimiento</label>
                    <input class="form-control" id="FechaNac" placeholder="01/01/1999">
                </div>
            </div>
            <div class="row">
                <div class="col-lg-6">
                    <label for="Direccion" class="form-label">Direccion</label>
                    <input class="form-control" id="Direccion" placeholder="1234 Nombre calle">
                </div>
                <div class="col-lg-3">
                    <label for="Region" class="form-label">Region</label>
                    <select id="Region" class="form-select">
                        <option selected>Seleccione...</option>
                        <option>...</option>
                    </select>
                </div>
                <div class="col-lg-3">
                    <label for="Comuna" class="form-label">Comuna</label>
                    <select id="Comuna" class="form-select">
                        <option selected>Seleccione...</option>
                        <option>...</option>
                    </select>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-4">
                    <label for="Email" class="form-label">Email</label>
                    <input type="email" class="form-control" id="Email" placeholder="EmailExample@gmail.com">
                </div>
                <div class="col-lg-3">
                    <label for="Constrasenia" class="form-label" style="font-size: 16px">***</label>
                    <button class="form-control" id="Constrasenia">Cambiar Contraseña</button>
                </div>
                <div class="col-lg-5">
                    <label for="Numero" class="form-label">Numero</label>
                    <input class="form-control" id="Numero" placeholder="+56 9 999 999">
                </div>
            </div>
            <br />
            <div class="col-12">
                <button type="submit" class="btn btn-primary">Guardar Cambios</button>
            </div>
            <br />
        </div>
    </div>
</asp:Content>
