﻿<%@ Page Title="Recetas" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Recetas.aspx.cs" Inherits="MiniCerveceria.Recetas" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>

        header.masthead{
            height: 350px;
            background-image: linear-gradient(rgba(0, 0, 0, .5), rgba(0, 0, 0, .5)), url("/Imagenes/CarrouselHome1.jpg");
        }

        .headContent{
            display: none
        }

        .TitlePage{
            font-size: 3.25rem;
            font-weight: 700;
            line-height: 3.25rem;
            margin-bottom: 2rem;
            font-family: "Montserrat", -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", "Noto Color Emoji";
        }

        .SubTitlePage{
            font-size: 1.5rem;
            font-style: italic;
            line-height: 1.5rem;
            margin-bottom: 25px;
            font-family: "Roboto Slab", -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", "Noto Color Emoji";
        }
    </style>
    <br /><br />
    <div>
        <div class="TitlePage"><img src="../../Imagenes/ChileBannerRecetas.png" style="width:260px;" /> Recetas Chilenas</div>
        <div class="SubTitlePage">LAS RECETAS CHILENAS SON CREACIONES HECHAS EN CHILE ACERCANDOSE A LAS RECETAS TRADICIONALES.</div>
    </div>
</asp:Content>