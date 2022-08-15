using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace App_Code
{
    public class MenuManager
    {
        public List<MyMenu> GetMenuItemByOperator(int operatorId)
        {
            MenuGateway menuGateway = new MenuGateway();
            return menuGateway.GetMenuItemByOperator(operatorId);
        }

        public List<MyMenu> GetMenuItemByOperatorAndParentId(int operatorId, int parentId)
        {
            MenuGateway menuGateway = new MenuGateway();
            return menuGateway.GetMenuItemByOperatorAndParentId(operatorId, parentId);
        }

        public List<MyMenu> GetAllMenus()
        {
            MenuGateway menuGateway = new MenuGateway();
            return menuGateway.GetAllMenus();
        }

        public int SaveMenuItem(MyMenu aMyMenu)
        {
            MenuGateway menuGateway = new MenuGateway();
            return menuGateway.SaveMenuItem(aMyMenu);
        }

        public int SetHasChildToMenuItem(int parentId, char value)
        {
            MenuGateway menuGateway = new MenuGateway();
            return menuGateway.SetHasChildToMenuItem(parentId, value);
        }

        public void LoadMenuTreeForAdministrator(int? id)
        {
            MenuGateway menuGateway = new MenuGateway();
            menuGateway.LoadMenuTreeForAdministrator(id);
        }
    }
}