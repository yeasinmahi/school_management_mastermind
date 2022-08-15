using System.Web.Services;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace App_Code
{
  public class Custom:Page {
      [WebMethod]
      public void SetSessionVariable(string sKey, dynamic sValue)
      {
          if (Session[sKey] == null)
          {
              Session[sKey] = sValue;
          }
          else
          {
              Session[sKey] = sValue;
          }

      }
      [WebMethod]
      public dynamic GetSessionVariable(string sKey)
      {
          dynamic myVar = Session[sKey];
          return myVar;
      }

      [WebMethod]
      public void RemoveSessionVariable(string sKey)
      {
          Session.Remove(sKey);
      }
  }

}