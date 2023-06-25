﻿using MiniCerveceria.Servicios.Implementacion;
using MiniCerveceria.Servicios;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using MiniCerveceria.Modelos;
using System.IO;

namespace MiniCerveceria.Mantenedores.Productos
{
    public partial class CrearProducto : System.Web.UI.Page
    {
		static string conn = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
		static IProductoAplicacionServicios productoApp = new ProductoServicio(conn);
		
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
				string uid = Request.QueryString["uid"] != null ? Request.QueryString["uid"] : "";

                if (!IsPostBack)
                {
					if (uid != "")
					{
						Producto oProducto = productoApp.ObtenerProducto(Convert.ToInt32(uid));

						txtNombreProducto.Text = oProducto.nombre_producto;
						txtDescripcion.Text = oProducto.descripcion;
						txtPrecioProucto.Text = oProducto.precio.ToString();
						cboCategoria.SelectedValue = oProducto.categoria.ToString();
						txtFechaCreacion.Text = oProducto.fecha_creacion.ToString();
						txtFechaModificacion.Text = oProducto.fecha_modificacion.ToString();
						ItemImagen.ImageUrl = oProducto.URL_img;
						hdnEstado.Value = oProducto.estado.ToString();

						CargarCboSubCate(oProducto.categoria);

						cboSubCategoria.SelectedValue = oProducto.sub_categoria.ToString();

						CambioNomVentana.Text = "Editar producto";
						lblNombreItem.Text = oProducto.nombre_producto;

						update.Value = oProducto.id_producto.ToString();
					}
					else
					{
						CambioNomVentana.Text = "Crear producto";
						ItemImagen.ImageUrl = "/Imagenes/Iconos/NoImage.png";
					}
				}
			}
            catch (Exception)
            {
                throw;
            }
        }

        protected void btnCrearProducto_Click(object sender, EventArgs e)
        {
            try
            {
                Producto oProducto = new Producto();

				oProducto.nombre_producto = txtNombreProducto.Text;
                oProducto.descripcion = txtDescripcion.Text;
                oProducto.precio = Convert.ToInt64(txtPrecioProucto.Text);
                oProducto.categoria = Convert.ToInt32(cboCategoria.SelectedValue);
				oProducto.estado = true;
                oProducto.fecha_creacion = DateTime.Now;
				oProducto.fecha_modificacion = Convert.ToDateTime("01/01/1900 00:00:00");
                oProducto.URL_img = "/Imagenes/Iconos/NoImage.png";
				oProducto.sub_categoria = Convert.ToInt32(hdnSubCate.Value == "" ? "0" : hdnSubCate.Value);

				productoApp.CrearProducto(oProducto);
			}
            catch (Exception)
            {
                throw;
            }

			Response.Redirect("~/Mantenedores/Productos/DefaultProductos.aspx");
		}

		protected void btnModificarProducto_Click(object sender, EventArgs e)
        {
            try
			{
				Producto oProducto = new Producto();

				oProducto.id_producto = Convert.ToInt32(update.Value);
				oProducto.nombre_producto = txtNombreProducto.Text;
				oProducto.descripcion = txtDescripcion.Text;
				oProducto.precio = Convert.ToInt32(txtPrecioProucto.Text);
				oProducto.categoria = Convert.ToInt32(cboCategoria.SelectedValue);
				oProducto.estado = Convert.ToBoolean(hdnEstado.Value);
				oProducto.fecha_modificacion = DateTime.Now;
				oProducto.URL_img = "/Imagenes/Iconos/NoImage.png";
				oProducto.sub_categoria = Convert.ToInt32(hdnSubCate.Value == "" ? "0" : hdnSubCate.Value);

				productoApp.ActualizarProducto(oProducto);
			}
            catch (Exception)
            {
                throw;
            }

			Response.Redirect("~/Mantenedores/Productos/DefaultProductos.aspx");
		}

		private void CargarCboSubCate(int idCate)
		{
			try
			{
				cboSubCategoria.Items.Clear();

				cboSubCategoria.Items.Add(new ListItem("Seleccione...", "0"));

				if (idCate == 1)
				{
					cboSubCategoria.Items.Add(new ListItem("Azúcares & Extractos", "1"));
					cboSubCategoria.Items.Add(new ListItem("Clarificantes", "2"));
					cboSubCategoria.Items.Add(new ListItem("Sales & aditivos", "3"));
					cboSubCategoria.Items.Add(new ListItem("Maltas", "4"));
					cboSubCategoria.Items.Add(new ListItem("Levaduras", "5"));
					cboSubCategoria.Items.Add(new ListItem("Lupulos", "6"));
				}
				else if (idCate == 2)
				{
					cboSubCategoria.Items.Add(new ListItem("Embotellado", "7"));
					cboSubCategoria.Items.Add(new ListItem("Fermentacion", "8"));
					cboSubCategoria.Items.Add(new ListItem("Filtros", "9"));
					cboSubCategoria.Items.Add(new ListItem("Medicion", "10"));
					cboSubCategoria.Items.Add(new ListItem("Fogones", "11"));
					cboSubCategoria.Items.Add(new ListItem("Enfriamiento", "12"));
				}
			}
			catch (Exception)
			{
				throw;
			}
		}
    }
}