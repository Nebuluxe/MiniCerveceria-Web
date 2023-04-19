<%@ Page Title="Mantenedores" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="VerCurso.aspx.cs" Inherits="MiniCerveceria.Mantenedores.Cursos.VerCurso" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
	<style>
		#barraNav{
			background: #000000;
			color: #ffffff;
			border-radius: 15px;
		}

		.optionNav{
			color: #000000 
		}

        .imgDefault{
            visibility: hidden;
        }

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

		.lblDetalle{
			font-size: 22px
		}

		#footerDefault{
			color:#ffffff
		}
	</style>
    <nav id="barraNav" class="navbar bg-body-tertiary">
	  <div class="container-fluid">
			<a runat="server" href="~/Mantenedores/Cursos/DefaultCursos.aspx"> 
				<img id="imgButtonBack" src="/Imagenes/Iconos/BackButtonWithe.png" height="40"> 
			</a>
			<strong class="titulo" style="font-size:1.9em; color: #ffffff;"><img src="/Imagenes/Iconos/CursosWithe.png" height="40" width="40"><span> </span> Ver Curso</strong>
			<span> </span>
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
							<strong class="titulo" style="font-size:1.9em; color: #ffffff;"><span> </span><asp:Label id="lblNombreItem" ClientIDMode="Static" runat="server"></asp:Label></strong>
							<br />
							<br />
							<div class="row mb-3">
							<div class="col">
								<div class="form-outline">
								<strong><asp:Label CssClass="lblDetalle" runat="server" ClientIDMode="Static">Xxxx xx xxxx xx</asp:Label></strong><br />
								<label class="form-label">xxxxx xxxx x x</label>
								</div>
							</div>
							<div class="col">
								<div class="form-outline">
								<strong><asp:Label CssClass="lblDetalle" runat="server" ClientIDMode="Static">Xxxx xxx x xxx</asp:Label></strong><br />
								<label class="form-label">xxxxx xxx xxxxx x</label>
								</div>
							</div>
							</div>
							<div class="row mb-3">
							<div class="col">
								<div class="form-outline">
								<strong><asp:Label CssClass="lblDetalle" runat="server" ClientIDMode="Static">Xxxx xxxxx xx x</asp:Label></strong><br />
								<label class="form-label">xxxxx xx xxxx</label>
								</div>
							</div>
							<div class="col">
								<div class="form-outline">
									<strong><asp:Label CssClass="lblDetalle" runat="server" ClientIDMode="Static">Xxxx xxx xx x</asp:Label></strong><br />
									<label class="form-label">xxxxxxxx xx</label>
								</div>
							</div>
							<div class="col">
								<div class="form-outline">
								<strong><asp:Label CssClass="lblDetalle" runat="server" ClientIDMode="Static">Xxxx xxx xx x</asp:Label></strong><br />
								<label class="form-label">xxxxx xx xxxx</label>
								</div>
							</div>
							</div>
							<div class="row mb-3">
							<div class="col">
								<div class="form-outline">
								<strong><asp:Label CssClass="lblDetalle" runat="server" ClientIDMode="Static">Xxxx xxx x xx</asp:Label></strong><br />
								<label class="form-label">xxxxx xx xxxx</label>
								</div>
							</div>
							<div class="col">
								<div class="form-outline">
								<strong><asp:Label CssClass="lblDetalle" runat="server" ClientIDMode="Static">Xxxx xx x xx x x</asp:Label></strong><br />
								<label class="form-label">xxxxxxxx xx</label>
								</div>
							</div>
							<div class="col">
								<div class="form-outline">
								<strong><asp:Label CssClass="lblDetalle" runat="server" ClientIDMode="Static">Xxxx xx x x</asp:Label></strong><br />
								<label class="form-label">xxxxx xx xxxx</label>
								</div>
							</div>
							</div>
							<div class="row mb-1">
								<textarea class="form-control" id="textAreaDescriptio" rows="3" readonly></textarea>
								<label class="form-label">xxxxx xx xx xxx xx</label>
							</div>
						</div>
						<div class="col-lg-4">
							<div class="card FormCursoInterno" id="ItemImagen" style="width: 100%;">
								<img src="/Imagenes/Iconos/NoImage.png" class="CardItem">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<br />
</asp:Content>
