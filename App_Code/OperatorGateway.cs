using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace App_Code
{
    public class OperatorGateway : DBConnection
    {
        public tbl_user_info Login(tbl_user_info aOperator)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(conString))
                {
                    string query = "SELECT dbo.tbl_user_info.* FROM dbo.tbl_user_info WHERE uid=@uid and upass=@pass";

                    SqlCommand cmd = new SqlCommand(query, con);

                    cmd.Parameters.Clear();
                    cmd.Parameters.AddWithValue("@uid", aOperator.uid);
                    cmd.Parameters.AddWithValue("@pass", aOperator.upass);

                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        aOperator.id = Convert.ToInt32(reader["id"].ToString());
                        aOperator.user_full_name = reader["user_full_name"].ToString();
                        aOperator.isactive = reader["isactive"].ToString();

                        aOperator.urole = reader["urole"].ToString();

                        aOperator.VarBranchId = reader["VarBranchId"].ToString();
                        aOperator.VarShiftCode = reader["VarShiftCode"].ToString();
                    }

                    reader.Close();
                    con.Close();

                    return aOperator;
                }
            }
            catch (Exception e)
            {
                return aOperator;
            }
        }

        public bool LogOut(tbl_user_info aOperator)
        {
            try
            {
                using (SqlConnection con2 = new SqlConnection(conString))
                {
                    string query = "UPDATE tbl_user_info SET LoggedIn=@status WHERE id=@oid";

                    SqlCommand cmd = new SqlCommand(query, con2);

                    cmd.Parameters.Clear();
                    cmd.Parameters.AddWithValue("@oid", aOperator.id);

                    bool res = false;

                    con2.Open();

                    if (cmd.ExecuteNonQuery() > 0)
                    {
                        res = true;
                    }

                    con2.Close();


                    return res;
                }
            }
            catch (Exception e)
            {
                return false;
            }
        }

        public bool CheckLogIn(tbl_user_info aOperator)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(conString))
                {
                    string query = "Select * FROM tbl_user_info WHERE uid=@uid and upass=@oPass";

                    SqlCommand cmd = new SqlCommand(query, con);

                    cmd.Parameters.Clear();
                    cmd.Parameters.AddWithValue("@uid", aOperator.uid);
                    cmd.Parameters.AddWithValue("@oPass", aOperator.upass);

                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.Read())
                    {
                        aOperator.user_full_name =reader["user_full_name"].ToString();
                    }

                    bool exists = aOperator.id != 0;

                    reader.Close();
                    con.Close();

                    return exists;
                }
            }
            catch (Exception e)
            {
                return false;
            }
        }

        public bool CheckPageAccess(int oid, string pageName)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(conString))
                {
                    string query = "SELECT dbo.MenuTree.MenuUrl, dbo.MenuTree.Id, dbo.MenuControl.OperatorId FROM dbo.MenuTree INNER JOIN dbo.MenuControl ON dbo.MenuTree.Id = dbo.MenuControl.MenuId WHERE dbo.MenuControl.OperatorId = @id and (dbo.MenuTree.MenuUrl = @pageName OR dbo.MenuTree.MenuUrl like @pageName2)";

                    SqlCommand cmd = new SqlCommand(query, con);

                    cmd.Parameters.Clear();
                    cmd.Parameters.AddWithValue("@id", oid);
                    cmd.Parameters.AddWithValue("@pageName", pageName);
                    cmd.Parameters.AddWithValue("@pageName2", "%/"+pageName);

                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    string menuid = "";
                    if (reader.Read())
                    {
                        menuid = reader["id"].ToString();
                    }

                    bool exists = !String.IsNullOrEmpty(menuid);

                    reader.Close();
                    con.Close();

                    return exists;
                }
            }
            catch (Exception e)
            {
                return false;
            }
        }

    }
}