using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace App_Code
{
    public class MenuGateway : DBConnection
    {
        public List<MyMenu> GetMenuItemByOperator(int operatorId)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(conString))
                {
                    string query = "Select * FROM MenuView WHERE OperatorId=@oId";

                    List<MyMenu> myMenus = new List<MyMenu>();

                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.Clear();
                    cmd.Parameters.AddWithValue("oId", operatorId);

                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        MyMenu menu = new MyMenu();
                        menu.Id = Convert.ToInt32(reader["MenuId"].ToString());
                        menu.MenuTitle = reader["MenuTitle"].ToString();
                        menu.MenuUrl = reader["MenuUrl"].ToString();
                        menu.ParentId = Convert.ToInt32(reader["ParentId"].ToString());

                        menu.HasChild = Convert.ToChar(reader["HasChild"].ToString());

                        myMenus.Add(menu);
                    }

                    reader.Close();
                    con.Close();

                    return myMenus;
                }
            }
            catch (Exception e)
            {
                return null;
            }
        }

        public List<MyMenu> GetMenuItemByOperatorAndParentId(int operatorId, int parentId)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(conString))
                {
                    string query = "Select * FROM MenuView WHERE OperatorId=@oId and ParentId=@parentId";

                    List<MyMenu> myMenus = new List<MyMenu>();

                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.Clear();
                    cmd.Parameters.AddWithValue("@oId", operatorId);
                    cmd.Parameters.AddWithValue("@parentId", parentId);

                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        MyMenu menu = new MyMenu();
                        menu.Id = Convert.ToInt32(reader["MenuId"].ToString());
                        menu.MenuTitle = reader["MenuTitle"].ToString();
                        menu.MenuUrl = reader["MenuUrl"].ToString();
                        menu.ParentId = Convert.ToInt32(reader["ParentId"].ToString());

                        menu.HasChild = Convert.ToChar(reader["HasChild"].ToString());

                        myMenus.Add(menu);
                    }

                    reader.Close();
                    con.Close();

                    return myMenus;
                }
            }
            catch (Exception e)
            {
                return null;
            }
        }

        public List<MyMenu> GetAllMenus()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(conString))
                {
                    string query = "Select DISTINCT * FROM MenuView";

                    List<MyMenu> myMenus = new List<MyMenu>();

                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.Clear();


                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        MyMenu menu = new MyMenu();
                        menu.Id = Convert.ToInt32(reader["MenuId"].ToString());
                        menu.MenuTitle = reader["MenuTitle"].ToString();
                        menu.MenuUrl = reader["MenuUrl"].ToString();
                        menu.ParentId = Convert.ToInt32(reader["ParentId"].ToString());

                        menu.HasChild = Convert.ToChar(reader["HasChild"].ToString());

                        myMenus.Add(menu);
                    }

                    reader.Close();
                    con.Close();

                    return myMenus;
                }
            }
            catch (Exception e)
            {
                return null;
            }
        }

        public List<MyMenu> GetAllRawMenuIds()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(conString))
                {
                    string query = "Select Id FROM MenuTree";

                    List<MyMenu> myMenus = new List<MyMenu>();

                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.Clear();


                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        MyMenu menu = new MyMenu();
                        menu.Id = Convert.ToInt32(reader["Id"].ToString());

                        myMenus.Add(menu);
                    }

                    reader.Close();
                    con.Close();

                    return myMenus;
                }
            }
            catch (Exception e)
            {
                return null;
            }
        }

        public bool CheckMenuItem(MyMenu aMyMenu)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(conString))
                {
                    string query = "Select DISTINCT * FROM MenuTree WHERE MenuTitle=@mT";

                    bool has = false;

                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.Clear();
                    cmd.Parameters.AddWithValue("@mT", aMyMenu.MenuTitle);

                    string mUrl = "";

                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        mUrl = reader["MenuUrl"].ToString();
                        
                    }

                    reader.Close();
                    con.Close();

                    if (!String.IsNullOrEmpty(mUrl))
                    {
                        has = true;
                    }

                    return has;
                }
            }
            catch (Exception e)
            {
                return false;
            }
        }

        public void LoadMenuTreeForAdministrator(int? id)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(conString))
                {
                    string query = "DELETE FROM MenuControl WHERE OperatorId=@adminisId";

                    int val = 0;

                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.Clear();
                    cmd.Parameters.AddWithValue("@adminisId", id ?? 1);

                    con.Open();

                    val = cmd.ExecuteNonQuery();

                    con.Close();

                    List<MyMenu> menus = new List<MyMenu>();
                    menus = GetAllRawMenuIds();

                    foreach (MyMenu menu in menus)
                    {
                        query = "INSERT INTO MenuControl VALUES(@oId, @mId)";

                        val = 0;

                        cmd = new SqlCommand(query, con);
                        cmd.Parameters.Clear();
                        cmd.Parameters.AddWithValue("@oId", id ?? 1);
                        cmd.Parameters.AddWithValue("@mId", menu.Id);

                        con.Open();

                        val = cmd.ExecuteNonQuery();

                        con.Close();

                    }
                }
            }
            catch
            {
            }
        }

        public int SaveMenuItem(MyMenu aMyMenu)
        {
            try
            {
                if (!CheckMenuItem(aMyMenu))
                {
                    using (SqlConnection con = new SqlConnection(conString))
                    {
                        string query = "INSERT INTO MenuTree VALUES(@mT, @mUrl, @pId, @hC)";

                        int val = 0;

                        SqlCommand cmd = new SqlCommand(query, con);
                        cmd.Parameters.Clear();
                        cmd.Parameters.AddWithValue("@mT", aMyMenu.MenuTitle);
                        cmd.Parameters.AddWithValue("@mUrl", aMyMenu.MenuUrl);
                        cmd.Parameters.AddWithValue("@pId", aMyMenu.ParentId);
                        cmd.Parameters.AddWithValue("@hC", aMyMenu.HasChild);

                        con.Open();

                        val = cmd.ExecuteNonQuery();

                        con.Close();

                        return val;
                    }
                }else
                {
                    return 0;
                }
            }
            catch (Exception e)
            {
                return 0;
            }
        }

        public int SetHasChildToMenuItem(int parentId, char value)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(conString))
                {
                    string query = "UPDATE MenuTree SET HasChild=@hC WHERE Id=@mId";


                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.Clear();
                    cmd.Parameters.AddWithValue("@mId", parentId);
                    cmd.Parameters.AddWithValue("@hC", value);


                    con.Open();

                    int val = cmd.ExecuteNonQuery();

                    con.Close();


                    return val;
                }
            }
            catch (Exception e)
            {
                return 0;
            }
        }
    }
}