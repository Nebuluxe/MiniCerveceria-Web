<%@ Page Title="Productos" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Productos.aspx.cs" Inherits="MiniCerveceria.Productos" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        .optionItem:hover{
            background: #ffd800;
        }

        .optionItem{
            background-color: #ffffff;
            border: none;
            display: flex;
            width: 230px;
        }

        .colorList{
            background-color: #ffffff
        }

        *{
            list-style: none;
        }

        .pageSelector:hover{
            color: #ffd800;
        }

        .pageSelector{
            color: #000000;
            
        }

        #headMaster{
            height: 350px;
        }

        .headContent{
            display: none
        }

    </style>
    <br /><br /><br />

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
            <div class="input-group" style="justify-content: center">
              <input type="text" class="form-control" placeholder="Buscador..." aria-label="Buscador...">
              <span class="input-group-text" id="addon-wrapping" style="border: 10px"><img class="imgDefault" src="/Imagenes/Iconos/Lupa.png" height="20"> </span>
            </div>
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
            <div class="card navegacionItems">
                <div class="card-body">
                    <a href="#" class="pageSelector"><strong>1</strong></a><span> | </span><a href="#" class="pageSelector"><strong>2</strong></a><span> | </span><a href="#" class="pageSelector"><strong>3</strong></a>
                    <a href="#" class="pageSelector"><strong> Siguiente >></strong></a>
                </div>
            </div>
        </div>
    </div>

    <br /><br /><br /><br /><br /><br />
</asp:Content>
