<%@ Page Title="Cursos" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Cursos.aspx.cs" Inherits="MiniCerveceria.Cursos" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
        <br /><br /><br />

        <hr class="featurette-divider">

        <div class="row featurette">
            <div class="col-md-7">
                <h2 class="featurette-heading fw-normal lh-1">Title Curso Example.</h2>
                <p class="lead">And yes, this is the last block of representative placeholder content. Again, not really intended to be actually read, simply here to give you a better view of what this would look like with some actual content. Your content.</p>
            </div>
            <div class="col-md-5">
               <div class="cardo">
                    <img src="/Imagenes/Iconos/NoImage.png" class="cardo-img" alt="">
                    <div class="cardo-body">
                        <h1 class="cardo-title">NYC</h1>
                        <p class="cardo-sub-title">new your city</p>
                        <p class="cardo-info">Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsum non laboriosam tenetur! Molestiae sapiente ut enim quibusdam asperiores nihil itaque, ex harum soluta, reiciendis illum?</p>

                        <button class="cardo-btn">book tour</button>
                    </div>
                </div>
            </div>
        </div>

        <hr class="featurette-divider">

        <div class="row featurette">
            <div class="col-md-7 order-md-2">
                <h2 class="featurette-heading fw-normal lh-1">Title Curso Example.</h2>
                <p class="lead">Another featurette? Of course. More placeholder content here to give you an idea of how this layout would work with some actual real-world content in place.</p>
            </div>
            <div class="col-md-5 order-md-1">
                <a href="#" class="anodizado">
                    <img src="/Imagenes/Iconos/NoImage.png" class="imagenProductos" width="400" style="border: 1px solid; color: #bfbfbf;" >
                    <span></span>
                </a>
            </div>
        </div>

        <hr class="featurette-divider">

        <div class="row featurette">
            <div class="col-md-7">
                <h2 class="featurette-heading fw-normal lh-1">Title Curso Example.</h2>
                <p class="lead">And yes, this is the last block of representative placeholder content. Again, not really intended to be actually read, simply here to give you a better view of what this would look like with some actual content. Your content.</p>
            </div>
            <div class="col-md-5">
                <figure class="containerz">
                    <img src="/Imagenes/Iconos/NoImage.png" alt="sample89" />
                    <figcaption>
                        <h3>Buy Now</h3>
                    </figcaption>
                    <a href="#"></a>
                </figure>
            </div>
        </div>

        <br /><br /><br />

    <style>
        .cursosNav{
            text-shadow: 0 0 5px #fff, 0 0 5px #fff;
            transition: 1s;
        }
    </style>
</asp:Content>