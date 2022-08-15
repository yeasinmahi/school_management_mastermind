using System;
using System.Collections.Generic;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;
using App_Code;

public partial class SiteMaster : MasterPage
{

    MenuManager menuManager = new MenuManager();
    public tbl_user_info cO = new tbl_user_info();
    private string currentPage = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            Custom s = new Custom();

            cO = s.GetSessionVariable("operator");
            currentPage = Path.GetFileName(Request.PhysicalPath);
            if (cO != null)
            {
                if (currentPage != "Default.aspx")
                {
                    if (!CheckPageAccess(Convert.ToInt32(cO.id), currentPage))
                    {
                        Response.Redirect("~/BaseUI/Default.aspx");
                    }
                }
                OperatorManager operatorManager = new OperatorManager();
                if (!operatorManager.CheckLogIn(cO))
                {
                    Response.Redirect("~/Account/Login.aspx");
                }

                Label1.Text = cO.user_full_name;


                if (cO.urole == "Administrator")
                {
                    menuManager.LoadMenuTreeForAdministrator(cO.id);
                }


                xx = "";

                Play(GetMenuItemByOperatorAndParentId(Convert.ToInt32(cO.id), 0), Convert.ToInt32(cO.id), out xx);

                menuList.InnerHtml = xx;

            }
            else
            {
                Response.Redirect("~/Account/Login.aspx");
            }

        }

    }

    public List<MyMenu> GetMenuItemByOperator(int operatorId)
        {
            return menuManager.GetMenuItemByOperator(operatorId);
        }
        public List<MyMenu> GetMenuItemByOperatorAndParentId(int operatorId, int parentId)
        {
            return menuManager.GetMenuItemByOperatorAndParentId(operatorId, parentId);
        }
    private bool CheckPageAccess(int oId, string pageName)
    {
        OperatorManager operatorManager = new OperatorManager();
        return operatorManager.CheckPageAccess(oId, pageName);
    }

    private string xx = "";
    public void Play(List<MyMenu> mMenus, int oId, out string s)
    {
        for (int i = 0; i < mMenus.Count; i++)
        {
            
            if (mMenus[i].HasChild == 'Y')
            {
                if (mMenus[i].ParentId == 0)
                {
                    xx = xx + "<li class=\"dropdown-toggle-li-base\">";
                }
                else
                {
                    xx = xx + "<li class=\"dropdown-toggle-li\">";
                }
                xx = xx + "<a class=\"dropdown-toggle\" runat=\"server\" href=\"#\">" +
                mMenus[i].MenuTitle + "<span class=\"caret\"></span></a>";
                xx = xx + "<ul class=\"dropdown-menu sub\">";

                Play(GetMenuItemByOperatorAndParentId(oId, mMenus[i].Id), oId, out s);
            }
            else
            {
                xx = xx + "<li>";
            }
            if (mMenus[i].HasChild == 'Y')
            {
                xx = xx + "</ul>";
            }
            else
            {
                if (mMenus[i].ParentId == -1)
                {
                    xx = xx + "<a runat=\"server\" href=\"../Reports/" + mMenus[i].MenuUrl + "\">" + mMenus[i].MenuTitle + "</a>";
                }
                else
                {
                    xx = xx + "<a runat=\"server\" href=\"../" + mMenus[i].MenuUrl + "\">" + mMenus[i].MenuTitle + "</a>";
                }

            }

            xx = xx + "</li>";
        }
        s = xx;
    }

    private string menuHtml = "";
    private bool recruisive = true, hasTail = false;


    protected void NavigationMenu_MenuItemDataBound(object sender, MenuEventArgs e)
    {
        if (!Page.User.IsInRole("SuperAdmin"))
        {
            if (e.Item.NavigateUrl.Equals("/Admin/"))
            {
                if (e.Item.Parent != null)
                {
                    MenuItem menu = e.Item.Parent;

                    menu.ChildItems.Remove(e.Item);
                }
                else
                {
                    var menu = (Menu)sender;

                    menu.Items.Remove(e.Item);
                }
            }
        }
    }
}