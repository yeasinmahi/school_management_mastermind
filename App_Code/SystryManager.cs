using System;
using App_Code;

namespace App_Code
{
    public class SystryManager
    {
        readonly SystryGatway _systryGatway = new SystryGatway();
        public bool CheckActivation()
        {
            Systry systry = _systryGatway.GetMc();
            if (systry!=null)
            {
                if (systry.Mc.Equals("~"))
                {
                    DateTime date = new DateTime(2017,12,29);
                    if (DateTime.Now>date)
                    {
                        int rowAffected =_systryGatway.UpdateMc("@");
                        if (rowAffected>0)
                        {
                            //update successfull
                        }
                        else
                        {
                            //update failed
                        }
                    }
                    else
                    {
                        return true;
                    }
                }
                else
                {
                    // in activate
                    return false;
                }
            }
            else
            {
                //database not found
            }
            return false;
        }
    }
}