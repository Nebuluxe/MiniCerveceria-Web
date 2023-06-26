﻿<%@ Page Title="Mantenedores" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CursosInscritos.aspx.cs" Inherits="MiniCerveceria.Mantenedores.Cursos.CursosInscritos" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

	<link href="/GlobalCss/Mantenedores.css" rel="stylesheet" type="text/css">
	
	<style>
		.card-body{
			background:#000000;
			color: #ffffff;
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

       #barraNav {
            background: #000000 !important;
            color: #ffffff;
            border-radius: 15px;
        }
	</style>
    <nav id="barraNav" class="navbar bg-body-tertiary">
        <div class="container-fluid">
            <a runat="server" href="~/Mantenedores/Default.aspx" data-title="Volver">
                <img id="imgButtonBack" src="/Imagenes/Iconos/BackButtonWithe.png" height="40">
            </a>
            <div class="row">
                <div class="col-2">
                    <img src="/Imagenes/Iconos/CursosInscritosWithe.png" height="50" width="50">
                </div>
                <div class="col-10">
                    <asp:Label CssClass="titulo" Style="font-size: 1.9em; color: #ffffff;" runat="server" ClientIDMode="Static">Cursos inscritos</asp:Label>
                </div>
            </div>
            <span>

            </span>
        </div>
    </nav>
    <br />


	<script>

    </script>
</asp:Content>