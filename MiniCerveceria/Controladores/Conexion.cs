using Microsoft.Ajax.Utilities;
using Oracle.ManagedDataAccess.Client;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Windows.Forms;

namespace MiniCerveceria.Controladores
{
    public class Conexion
    {
        string connectionString = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        public Conexion()
        {
            OracleConfiguration.TnsAdmin = ConfigurationManager.ConnectionStrings["Wallet"].ConnectionString;
            OracleConfiguration.WalletLocation = OracleConfiguration.TnsAdmin;
        }

        public Conexion(string conn)
        {
            this.connectionString = conn;
        }

        public DataTable Execute(string SQL)
        {
            using (OracleConnection con = new OracleConnection(this.connectionString))
            {
                using (OracleCommand cmd = con.CreateCommand())
                {
                    try
                    {
                        con.Open();

                        cmd.CommandText = SQL;
                        OracleDataReader reader = cmd.ExecuteReader();
                        var dt = new DataTable();
                        dt.Load(reader);

                        con.Close();
                        return dt;
                    }
                    catch (Exception ex)
                    {
                        Console.WriteLine(ex.Message);
                    }
                    con.Close();
                    return new DataTable();
                }
            }
        }
    }
}