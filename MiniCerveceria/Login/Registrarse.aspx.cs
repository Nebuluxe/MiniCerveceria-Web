﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using MiniCerveceria.Modelos;
using Oracle.ManagedDataAccess.Client;

namespace MiniCerveceria.Login
{
    public partial class Registrarse : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public void GuardarUsuario(string usuario, string contrasena)
        {
            try
            {
                //Usuario oUsuario = new Usuario();
                //OracleConfiguration.TnsAdmin = (ConfigurationManager.ConnectionStrings["Wallet"].ConnectionString);
                //OracleConfiguration.WalletLocation = OracleConfiguration.TnsAdmin;

                //using (BD.OracleConnection con = new BD.OracleConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString))
                //{
                //    string Query = "INSERT INTO usuario (id_usuario, id_permiso, id_comuna, nombre, apellido, direccion, telefono, fecha_nacimiento, email, password, tipo_usuario, activo, en_linea, fecha_creacion) \r\n\t\t\t VALUES " +
                //        "(1,1,1,'Alex','Parra','Pintor Durero #5754',936490068,'27-05-2001','parraalex2001@gmail.com','pandikwa2016',1,0,0,'30-05-2023');";
                //    using (OracleCommand command = new OracleCommand(Query, con))
                //    {
                //        con.Open();//SELECT 'DROP TABLE 'table_name' CASCADE CONSTRAINTS;' FROM user_tables;DROP TABLE COMENTARIOCURSO CASCADE CONSTRAINTS;DROP TABLE COMENTARIOPRODUCTO CASCADE CONSTRAINTS;DROP TABLE COMUNA CASCADE CONSTRAINTS;DROP TABLE CURSO CASCADE CONSTRAINTS;DROP TABLE CURSOSINSCRITOS CASCADE CONSTRAINTS;DROP TABLE DETALLEPEDIDO CASCADE CONSTRAINTS;DROP TABLE FAVORITOS CASCADE CONSTRAINTS;DROP TABLE TIPOUSUARIO CASCADE CONSTRAINTS;DROP TABLE FOTOSCURSOS CASCADE CONSTRAINTS;DROP TABLE FOTOSPRODUCTOS CASCADE CONSTRAINTS;DROP TABLE NOVEDADES CASCADE CONSTRAINTS;DROP TABLE PEDIDO CASCADE CONSTRAINTS;DROP TABLE PERMISOSUSUARIO CASCADE CONSTRAINTS;DROP TABLE PRODUCTOS CASCADE CONSTRAINTS;DROP TABLE RECETAS CASCADE CONSTRAINTS;DROP TABLE REGION CASCADE CONSTRAINTS;DROP TABLE STOCK CASCADE CONSTRAINTS;DROP TABLE USUARIO CASCADE CONSTRAINTS;"

                //        command.CommandType = System.Data.CommandType.Text;
                //        OracleDataReader reader = command.ExecuteReader();
                //        while (reader.Read())
                //        {
                //            int id = reader.GetInt32(0);
                //            string nombreReceta = reader.GetString(1);
                //            string descripcion = reader.GetString(2);
                //            DateTime fechaCreacion = reader.GetDateTime(3);
                //            DateTime fechaModificacion = reader.GetDateTime(4);
                //            MessageBox.Show("ID = " + id + " || Nombre Receta = " + nombreReceta + " || Descripción Receta = " + descripcion + " || Fecha Creación = " + fechaCreacion + " || Fecha Modificación = " + fechaCreacion);
                //        }
                //        con.Close();
                //    }
                //}
            }
            catch (Exception msg)
            {
                //MessageBox.Show("Mano mio te me le caiste:c, tiro este error wom ----> " + msg);
            }
        }
    }
}