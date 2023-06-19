using Microsoft.Ajax.Utilities;
using Oracle.ManagedDataAccess.Client;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Windows.Forms;

namespace MiniCerveceria.Controladores
{
    public class Conexion
    {
        private static Conexion Con = null;
        public Conexion() 
        {
           
        }

        public OracleConnection CrearConexion()
        {
            OracleConnection conexion = new OracleConnection();
            try
            {
                conexion.ConnectionString = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
                OracleConfiguration.TnsAdmin = ConfigurationManager.ConnectionStrings["Wallet"].ConnectionString;
                OracleConfiguration.WalletLocation = OracleConfiguration.TnsAdmin;
            }
            catch (Exception ex)
            {
                conexion = null;
                throw ex;
            }
            return conexion;
        }

        public static Conexion getInstancia() 
        {
            if (Con == null)
            {
                Con = new Conexion();
            }
            return Con;
        }
    }
}