<%@ Page Title="Productos" Language="C#" MasterPageFile="~/Site.Master" CodeBehind="DetalleProducto.aspx.cs" Inherits="MiniCerveceria.Ventanas.Productos.DetalleProducto" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        header.masthead {
            height: 350px;
            background-image: linear-gradient(rgba(0, 0, 0, .5), rgba(0, 0, 0, .5)), url("/Imagenes/CarrouselHome3.jpg");
        }

        .headContent {
            display: none
        }

        #SideMenuMantenedor {
            display: none;
        }

        #MantenedorNav {
            display: none;
        }

        .optionItem:hover {
            background: #ffd800;
            transition: 1s;
        }

        .optionItem {
            background-color: #ffffff;
            border: none;
            display: flex;
            width: 230px;
        }

        .colorList {
            background-color: #ffffff
        }

        * {
            list-style: none;
        }

        .pageSelector:hover {
            color: #ffd800;
        }

        .pageSelector {
            color: #000000;
        }

        #headMaster {
            height: 350px;
        }
    </style>
    <br />
    <br />
    <br />

    <div class="row">
        <div class="col-lg-3">
            <br />
            <strong style="font-size: 30px">Categorías</strong>
            <div class="row">
                <div class="col-lg-12">
                    <br />
                    <div class="card optionItem" style="font-size: 20px">
                        <strong>Novedades</strong>
                    </div>
                    <br />
                    <div class="card optionItem">
                        <strong>Ingredientes</strong>
                    </div>
                    <div id="IngredientesItems">
                        <ul>
                            <li style="padding: 6px">
                                <div class="card optionItem">
                                    Azúcares & Extractos
                                </div>
                            </li>
                            <li style="padding: 6px">
                                <div class="card optionItem">
                                    Clarificantes
                                </div>
                            </li>
                            <li style="padding: 6px">
                                <div class="card optionItem">
                                    Sales & aditivos
                                </div>
                            </li>
                            <li style="padding: 6px">
                                <div class="card optionItem">
                                    Maltas
                                </div>
                            </li>
                            <li style="padding: 6px">
                                <div class="card optionItem">
                                    Levaduras
                                </div>
                            </li>
                            <li style="padding: 6px">
                                <div class="card optionItem">
                                    Lupulos
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-12">
                    <div class="card optionItem">
                        <strong>Accesorios</strong>
                    </div>
                    <div id="AccesosriosItem">
                        <ul>
                            <li style="padding: 6px">
                                <div class="card optionItem">
                                    Embotellado
                                </div>
                            </li>
                            <li style="padding: 6px">
                                <div class="card optionItem">
                                    Fermentacion
                                </div>
                            </li>
                            <li style="padding: 6px">
                                <div class="card optionItem">
                                    Filtros
                                </div>
                            </li>
                            <li style="padding: 6px">
                                <div class="card optionItem">
                                    Medicion
                                </div>
                            </li>
                            <li style="padding: 6px">
                                <div class="card optionItem">
                                    Fogones
                                </div>
                            </li>
                            <li style="padding: 6px">
                                <div class="card optionItem">
                                    Enfriamiento
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-12">
                    <div class="card optionItem">
                        <strong>Cristaleria</strong>
                    </div>
                </div>
                <div class="col-lg-12">
                    <br />
                    <div class="card optionItem">
                        <strong>Equipamiento</strong>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-8">
        </div>
    </div>
</asp:Content>
