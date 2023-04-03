<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="MiniCerveceria._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div id="carouselExample" class="carousel slide">
      <div class="carousel-inner">
        <div class="carousel-item active">
          <img src="Imagenes/f.elconfidencial.com_original_cbe_7a6_03a_cbe7a603a178438d236336676c457cc2.jpg" class="d-block w-100" alt="...">
        </div>
        <div class="carousel-item">
          <img src="Imagenes/f.elconfidencial.com_original_cbe_7a6_03a_cbe7a603a178438d236336676c457cc2.jpg" class="d-block w-100" alt="...">
        </div>
        <div class="carousel-item">
          <img src="Imagenes/f.elconfidencial.com_original_cbe_7a6_03a_cbe7a603a178438d236336676c457cc2.jpg" class="d-block w-100">
        </div>
      </div>
      <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample" data-bs-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Previous</span>
      </button>
      <button class="carousel-control-next" type="button" data-bs-target="#carouselExample" data-bs-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Next</span>
      </button>
    </div>
</asp:Content>
