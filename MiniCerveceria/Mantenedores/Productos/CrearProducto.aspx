<%@ Page enableEventValidation="false" Title="Mantenedores" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CrearProducto.aspx.cs" Inherits="MiniCerveceria.Mantenedores.Productos.CrearProducto" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <link href="/GlobalCss/Mantenedores.css" rel="stylesheet" type="text/css">

    <style>
		.FormCursoExterno{
			background:#000000;
			color: #ffffff;
			border-radius: 15px;
		}

		.FormCursoInterno{
			background:#ffffff;
			color: #000000;
			border-radius: 15px;
		}

		.CardItem{
			border-radius: 15px;
		}

		#headMaster {
			display: none;
		}

        #mainNav{
            display: none;
        }

        #footerDefault{
            display: none;
        }

		#chkEstado {width:50px; height:50px;}
	</style>

	<nav id="barraNav" class="navbar bg-body-tertiary">
	  <div class="container">
		<a runat="server" href="~/Mantenedores/Productos/DefaultProductos.aspx"> 
			<img id="imgButtonBack" src="/Imagenes/Iconos/BackButtonWithe.png" height="40"> 
		</a>
		<div class="row">
			<div class="col-2">
				<img src="/Imagenes/Iconos/ProductosWithe.png" height="40" width="40">
			</div>
			<div class="col-10">
				<asp:Label CssClass="titulo" style="font-size:1.9em; color: #ffffff;" runat="server" ClientIDMode="Static" id="CambioNomVentana"></asp:Label>
			</div>
		</div>
		<a href="#" id="btnGuardar"> 
			<img src="/Imagenes/Iconos/BotonGuardarWithe.png" class="d-flex" height="40" width="40">
		</a>
		<asp:Button runat="server" ClientIDMode="Static" ID="btnGuardarHide" CssClass="visually-hidden" OnClick="btnCrearProducto_Click"/>
		<asp:Button runat="server" ClientIDMode="Static" ID="btnActualizarHide" CssClass="visually-hidden" OnClick="btnModificarProducto_Click"/>
		<asp:HiddenField runat="server" ClientIDMode="Static" Value="" ID="update"/>
		<asp:HiddenField runat="server" ClientIDMode="Static" Value="" ID="hdnEstado"/>
	  </div>
	</nav>
	<br />
	<div>
		<div class="container">
		  <div class="row">
			<div class="col-lg-8">
				<br />
				<div class="card FormCursoExterno">
				  <br />
				  <div class="card-body">
					  <asp:Label  CssClass="titulo" style="font-size:1.9em; color: #ffffff;" id="lblNombreItem" ClientIDMode="Static" runat="server"></asp:Label>
					  <br />
					  <br />
					  <div class="row mb-3">
						<div class="col-lg-12">
						  <div class="form-outline">
							<asp:textbox runat="server" ClientIDMode="Static" type="text" id="txtNombreProducto" placeholder="Nombre producto" class="form-control" />
							<label class="form-label">Nombre producto</label>
						  </div>
						</div>
					  </div>
					  <div class="row mb-3">
						<div class="col-lg-4">
						  <div class="form-outline">
							<asp:textbox runat="server" ClientIDMode="Static" type="text" id="txtPrecioProucto" class="form-control" placeholder="999.999"/>
							<label class="form-label">Precio</label>
						  </div>
						</div>
						<div class="col-lg-4">
						  <div class="form-outline">
							<asp:DropDownList runat="server" ClientIDMode="Static" id="cboCategoria" class="form-select">
								<asp:ListItem selected="true" value="0">Seleccione...</asp:ListItem>
								<asp:ListItem value="1">Ingredientes</asp:ListItem>
								<asp:ListItem value="2">Accesorios</asp:ListItem>
								<asp:ListItem value="3">Cristaleria</asp:ListItem>
								<asp:ListItem value="4">Equipamiento</asp:ListItem>
							</asp:DropDownList>
							<label class="form-label">Categoria</label>
						  </div>
						</div>
						<div class="col-lg-4">
						  <div class="form-outline">
							<asp:HiddenField runat="server" ClientIDMode="Static" Value="" ID="hdnSubCate"/>
							<asp:DropDownList runat="server" ClientIDMode="Static" id="cboSubCategoria" class="form-select">
							</asp:DropDownList>
							<label class="form-label">Sub categoria</label>
						  </div>
						</div>
					  </div>
					  <div class="row mb-3">
						<div class="col-lg-6">
						  <div class="form-outline">
							<asp:textbox runat="server" ClientIDMode="Static" type="text" id="txtFechaCreacion" readonly="true" placeholder="00/00/0000" class="form-control" />
							<label class="form-label">Fecha crecion</label>
						  </div>
						</div>
						<div class="col-lg-6">
						  <div class="form-outline">
							<asp:textbox runat="server" ClientIDMode="Static" type="text" id="txtFechaModificacion" readonly="true" placeholder="00/00/0000" class="form-control" />
							<label class="form-label">Fecha modificacion</label>
						  </div>
						</div>
					  </div>
					  <div class="row mb-1">
						  <asp:textbox runat="server" ClientIDMode="Static" TextMode="MultiLine" class="form-control" id="txtDescripcion" rows="3"/>
						  <label class="form-label">Descripcion</label>
					  </div>
				  </div>
				</div>
			</div>
			<div class="col-lg-4">
				<br />
				<div class="card FormCursoExterno" style="width: 100%;">
					<asp:image runat="server" ClientIDMode="Static" class="CardItem anodizado" id="ItemImagen" />
				</div>
				<div class="input-group visually-hidden">
					<asp:FileUpload runat="server" ClientIDMode="Static" type="file" class="form-control" id="imputFotoItem" />
				</div>
			</div>
		  </div>
		</div>
	</div>
	<br />
	<script>
        $(document).ready(function () {
			$('#ItemImagen').on('click', function () {
				$('#imputFotoItem').click();
			});

			$('#btnGuardar').on('click', function () {
                var update = $('#update').val()

                if (update != "") {
                    $('#btnActualizarHide').click()
                } else {
                    $('#btnGuardarHide').click()
                }
			})

			$('#cboCategoria').on('change', function () {
				var option = $('#cboCategoria').val();

				var html = "";

				$('#cboSubCategoria').html('');

                console.log(option);

				if (option == '1') {
                    html += "<option value='0'>Seleccione...</option>";
					html += "<option value='1'>Azúcares & Extractos</option>";
                    html += "<option value='2'>Clarificantes</option>";
                    html += "<option value='3'>Sales & aditivos</option>";
					html += "<option value='4'>Maltas</option>";
					html += "<option value='5'>Levaduras</option>";
					html += "<option value='6'>Lupulos</option>";

                    $('#cboSubCategoria').html(html)
                }

				if (option == '2') {
                    html += "<option value='0'>Seleccione...</option>";
                    html += "<option value='7'>Embotellado</option>";
                    html += "<option value='8'>Fermentacion</option>";
                    html += "<option value='9'>Filtros</option>";
                    html += "<option value='10'>Medicion</option>";
                    html += "<option value='11'>Fogones</option>";
                    html += "<option value='12'>Enfriamiento</option>";

                    $('#cboSubCategoria').html(html)
				}

                if (option != '1' && option != '2') {
                    $('#hdnSubCate').val("0")
                }
			})

			$('#cboSubCategoria').on('change', function () {
				var valueSelected = $('#cboSubCategoria').val();

                $('#hdnSubCate').val(valueSelected)
            })
        });
    </script>
</asp:Content>

