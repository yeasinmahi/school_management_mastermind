using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace App_Code
{
    public class DBConnection
    {
        protected string conString = ConfigurationManager.ConnectionStrings["swis"].ConnectionString;
    }
}