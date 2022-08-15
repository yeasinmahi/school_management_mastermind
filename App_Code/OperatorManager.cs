using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace App_Code
{
    public class OperatorManager
    {
        public tbl_user_info Login(tbl_user_info aOperator)
        {
            OperatorGateway operatorGateway = new OperatorGateway();
            return operatorGateway.Login(aOperator);
        }

        public bool LogOut(tbl_user_info aOperator)
        {
            OperatorGateway operatorGateway = new OperatorGateway();
            return operatorGateway.LogOut(aOperator);
        }

        public bool CheckLogIn(tbl_user_info aOperator)
        {
            OperatorGateway operatorGateway = new OperatorGateway();
            return operatorGateway.CheckLogIn(aOperator);
        }

        public bool CheckPageAccess(int oId, string pageName)
        {
            OperatorGateway operatorGateway = new OperatorGateway();
            return operatorGateway.CheckPageAccess(oId, pageName);
        }

    }
}