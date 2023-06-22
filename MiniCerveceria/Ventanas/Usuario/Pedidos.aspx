﻿<%@ Page Title="Pedidos" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" Inherits="MiniCerveceria.Ventanas.Usuario.Pedidos" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">	
    <style>
        .headContent{
            display: none
        }

        a{
            text-decoration:none;
            color: #000000;
        }

        .OptionSelected{
            background-color: rgb(  0, 0, 0);
        }

        #Pedido {
	        height: 500px;
	        width: 100%;
	        overflow-y: scroll;
        }

        #pedidoDetalle {
	        height: 500px;
	        width: 100%;
	        overflow-y: scroll;
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
        <img src="\Imagenes\Iconos\UserIconBlack.png" style="width:80px;top: 80px !important;" class="rounded-circle" alt="Alternate Text" /> Usuario.
      </div>
    </div>
    <br />
    <div class="card">
      <div class="card-body">
        <div class="row">
            <div class="col-lg-3" style="align-content:center; justify-content:center">
                <a runat="server" href="~/Ventanas/Usuario/Datos">
                    <img src="\Imagenes\Iconos\NovedadesBlack.png" style="width:40px;top: 40px !important;" class="rounded-circle" alt="Alternate Text" />
                    <span>
                        Datos personales
                    </span>
                </a>
            </div>
            <div class="col-lg-3" style="align-content:center; justify-content:center">
                <a runat="server" href="~/Ventanas/Usuario/Compras">
                    <img src="\Imagenes\Iconos\NovedadesBlack.png" style="width:40px;top: 40px !important;" class="rounded-circle" alt="Alternate Text" />
                    <span>
                        Historial de compras
                    </span>
                </a>
            </div>            
            <div class="col-lg-3" style="align-content:center; justify-content:center">
                <div class="card OptionSelected">
                    <a runat="server" href="~/Ventanas/Usuario/Pedidos">
                        <img src="\Imagenes\Iconos\NovedadesWithe.png" style="width:40px;top: 40px !important;" class="rounded-circle" alt="Alternate Text" />
                        <span style="color: #ffffff">
                            Pedidos
                        </span>
                    </a>
                </div>
            </div>
            <div class="col-lg-3" style="align-content:center; justify-content:center">
                <a runat="server" href="~/Ventanas/Usuario/Favoritos">
                    <img src="\Imagenes\Iconos\NovedadesBlack.png" style="width:40px;top: 40px !important;" class="rounded-circle" alt="Alternate Text" />
                    <span>
                        Favoritos
                    </span>
                </a>
            </div>
        </div>
      </div>
    </div>
    <br />
    <div class="card">
      <div class="card-body">
        <div class="row">
            <div class="col-lg-4">
                <br />
                <div class="row" id="Pedido">
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
</asp:Content>