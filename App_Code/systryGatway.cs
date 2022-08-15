using System;
using System.Data;
using System.Data.OleDb;
using System.Data.SqlClient;


namespace App_Code
{
    public class SystryGatway
    {
        private readonly Object _lockThis = new Object();
        private string connectionString = "Provider=Microsoft.Jet.OLEDB.4.0; Data Source=C:\\inetpub\\wwwroot\\kcipark\\App_Data\\kcpark.dll; User id=admin; Password=";
        //private string connectionString = "Provider=Microsoft.Jet.OLEDB.4.0; Data Source=I:\\Yeasin\\niparmgmanagement\\NipaRMGManagement\\App_Data\\kcpark.dll; User id=admin; Password=";
        public SystryGatway()
        {
            Connection = new OleDbConnection(connectionString);
            Command = new OleDbCommand();
            Command.Connection = Connection;
        }

        public OleDbConnection Connection;
        public OleDbCommand Command;
        public OleDbDataReader reader;
        private string Query { get; set; }
        public Systry GetMc()
        {
            lock (_lockThis)
            {
                Query = "select * from systry";
                Command.Parameters.Clear();
                Command.CommandText = Query;
                Command.CommandType = CommandType.Text;
                Connection.Open();
                reader = null;
                Systry systry = new Systry();
                try
                {
                    reader = Command.ExecuteReader();
                    while (reader.Read())
                    {
                        systry.Id = reader["ID"] != DBNull.Value ? Convert.ToInt32(reader["ID"].ToString()) : 0;
                        systry.Mc = reader["MC"] != DBNull.Value ? reader["MC"].ToString() : string.Empty;
                        systry.Date = reader["date"] != DBNull.Value ? Convert.ToDateTime(reader["date"].ToString()) : DateTime.MinValue;
                    }
                }
                catch (Exception)
                {
                    return null;
                }
                finally
                {
                    if (reader != null) reader.Close();
                    Connection.Close();
                }

                return systry;
            }
        }
        public int UpdateMc(string mc)
        {
            lock (_lockThis)
            {
                Query = "update systry set MC = @mc";
                Command.Parameters.Clear();
                Command.CommandText = Query;
                Command.CommandType = CommandType.Text;
                Command.Parameters.AddWithValue("@mc", SqlDbType.VarChar).Value = mc;
                Connection.Open();
                int rowAffected = 0;
                try
                {
                    rowAffected = Command.ExecuteNonQuery();
                }
                catch (Exception)
                {
                    return 0;
                }
                finally
                {
                    Connection.Close();
                }

                return rowAffected;
            }
        }
    }
}