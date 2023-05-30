using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using Oracle.ManagedDataAccess.Client;
using System.Configuration;

namespace MiniCerveceria.Modelos
{
    public class Database
    {
        //public string connectionString { get; set; }
        //public string connection { get; set; }

        //public Database(string wallet)
        //{
        //    string connection = (ConfigurationManager.ConnectionStrings["con"].ConnectionString);
        //    OracleConfiguration.TnsAdmin = wallet;
        //    OracleConfiguration.WalletLocation = OracleConfiguration.TnsAdmin;
        //    this.connectionString = connection.Trim();
        //    this.connection = new SqlConnection(connection, );
        //}

        //public void AbreConexionBD()
        //{
        //    if (connection.State != ConnectionState.Open)
        //    {
        //        connection.Open();
        //    }
        //}

        //public void CierraConexionBD()
        //{
        //    if (connection.State != ConnectionState.Closed)
        //    {
        //        connection.Close();
        //    }
        //}

        //public void Consulta(string query)
        //{
        //    SqlCommand command = new SqlCommand(query, connection);
        //    command.ExecuteNonQuery();
        //}

        //public DataTable Select(string query)
        //{
        //    DataTable dataTable = new DataTable();
        //    SqlDataAdapter dataAdapter = new SqlDataAdapter(query, connection);
        //    dataAdapter.Fill(dataTable);
        //    return dataTable;
        //}

        //public void Insert(string query)
        //{
        //    CreateCommand(query);
        //    Console.WriteLine("Registro insertado de manera éxitosa.");
        //}

        //public void Update(string query)
        //{
        //    CreateCommand(query);
        //    Console.WriteLine("Registro modificado de manera éxitosa.");
        //}

        //public void Delete(string query)
        //{
        //    CreateCommand(query);
        //    Console.WriteLine("Registro eliminado de manera éxitosa.");
        //}
    }
}