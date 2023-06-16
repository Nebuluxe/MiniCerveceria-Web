<%@ Page Title="Favoritos" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Favoritos.aspx.cs" Inherits="MiniCerveceria.Ventanas.Usuario.Favoritos" %>

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
        
        #Favoritos {
	        height: 550px;
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
                        Configurar datos personales
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
                <a runat="server" href="~/Ventanas/Usuario/Pedidos">
                    <img src="\Imagenes\Iconos\NovedadesBlack.png" style="width:40px;top: 40px !important;" class="rounded-circle" alt="Alternate Text" />
                    <span>
                        Pedidos
                    </span>
                </a>
            </div>
            <div class="col-lg-3" style="align-content:center; justify-content:center">
                <div class="card OptionSelected">
                    <a runat="server" href="~/Ventanas/Usuario/Favoritos">
                        <img src="\Imagenes\Iconos\NovedadesWithe.png" style="width:40px;top: 40px !important;" class="rounded-circle" alt="Alternate Text" />
                        <span style="color: #ffffff">
                            Favoritos
                        </span>
                    </a>
                </div>
            </div>
        </div>
      </div>
    </div>
    <br />
    <div class="card" id="Favoritos">
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
</asp:Content>