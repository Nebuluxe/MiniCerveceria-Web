<%@ Page Title="Mantenedores" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="VerProducto.aspx.cs" Inherits="MiniCerveceria.Mantenedores.Productos.VerProducto" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <link href="/GlobalCss/Mantenedores.css" rel="stylesheet" type="text/css">

    <style>
        .FormCursoExterno {
            background: #000000;
            color: #ffffff;
            border-radius: 15px;
        }

        .FormCursoInterno {
            background: #ffffff;
            color: #000000;
            border-radius: 15px;
        }

        .lblDetalle {
            font-size: 22px
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

        #barraNav {
            background: #000000 !important;
            color: #ffffff;
            border-radius: 15px;
        }
    </style>

    <nav id="barraNav" class="navbar bg-body-tertiary">
        <div class="container-fluid">
            <a runat="server" href="~/Mantenedores/Productos/DefaultProductos.aspx">
                <img id="imgButtonBack" src="/Imagenes/Iconos/BackButtonWithe.png" height="40">
            </a>
            <div class="row">
                <div class="col-2">
                    <img src="/Imagenes/Iconos/ProductosWithe.png" height="40" width="40">
                </div>
                <div class="col-10">
                    <asp:Label CssClass="titulo" Style="font-size: 1.9em; color: #ffffff;" runat="server" ClientIDMode="Static">Ver Productos</asp:Label>
                </div>
            </div>
            <span></span>
        </div>
    </nav>
    <br />
    <div>
        <div class="container">
            <div class="card FormCursoExterno">
                <br />
                <div class="card-body">
                    <div class="row">
                        <div class="col-lg-8">
                            <asp:Label class="titulo" Style="font-size: 1.9em; color: #ffffff;" ID="lblNombreItem" ClientIDMode="Static" runat="server"></asp:Label>
                            <br />
                            <br />
                            <div class="row mb-3">
                                <div class="col-lg-4">
                                    <div class="form-outline">
                                        <strong>
                                            <asp:Label CssClass="lblDetalle" runat="server" ClientIDMode="Static" ID="lblPrecio"></asp:Label></strong><br />
                                        <label class="form-label">Precio</label>
                                    </div>
                                </div>
                                <div class="col-lg-4">
                                    <div class="form-outline">
                                        <strong>
                                            <asp:Label CssClass="lblDetalle" runat="server" ClientIDMode="Static" ID="lblCategoria"></asp:Label></strong><br />
                                        <label class="form-label">Categoria</label>
                                    </div>
                                </div>
                                <div class="col-lg-4">
                                    <div class="form-outline">
                                        <strong>
                                            <asp:Label CssClass="lblDetalle" runat="server" ClientIDMode="Static" ID="lblSubCategoria"></asp:Label></strong><br />
                                        <label class="form-label">Sub categoria</label>
                                    </div>
                                </div>
                            </div>
                            <div class="row mb-3" align="center">
                                <div class="col-lg-6">
                                    <div class="form-outline">
                                        <strong>
                                            <asp:Label CssClass="lblDetalle" runat="server" ClientIDMode="Static" ID="lblFehcaCreacion"></asp:Label></strong><br />
                                        <label class="form-label">Fecha creacion</label>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="form-outline">
                                        <strong>
                                            <asp:Label CssClass="lblDetalle" runat="server" ClientIDMode="Static" ID="lblFechaModificacion"></asp:Label></strong><br />
                                        <label class="form-label">Fecha modificacion</label>
                                    </div>
                                </div>
                            </div>
                            <div class="row mb-1">
                                <asp:textbox style="min-width: 100%; height:170px;" runat="server" ClientIDMode="Static" TextMode="MultiLine" class="form-control" id="txtDescripcion" rows="3" readonly="true"/>
                                <label class="form-label">Descripcion</label>
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="card FormCursoInterno" style="width: 100%;">
                                <asp:image runat="server" ClientIDMode="Static" class="CardItem" id="ItemImagen" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <br />
</asp:Content>
