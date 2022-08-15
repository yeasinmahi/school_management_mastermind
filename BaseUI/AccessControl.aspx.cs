using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BaseUI_AccessControl : System.Web.UI.Page
{
    SWISDataContext db = new SWISDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadUser();
            LoadMainMenu();
        }
    }

    public void LoadUser()
    {
        var getAllUser = from x in db.tbl_user_infos
                         where x.isactive == "True" && x.id > 1
                         select new { value = x.id.ToString(), x.user_full_name };

        foreach (var a in getAllUser.AsEnumerable())
        {
            string aa = a.user_full_name;
        }
        userDropDownList.DataSource = getAllUser;
        userDropDownList.DataTextField = "user_full_name";
        userDropDownList.DataValueField = "value";
        userDropDownList.DataBind();
        userDropDownList.Items.Insert(0, new ListItem("--Select--", ""));
    }
    public void LoadMainMenu()
    {
        var getAllUser = from x in db.MenuTrees
                         where x.HasChild == 'Y'
                         select new { x.Id, x.MenuTitle };

        mainMenuDropDownList.DataSource = getAllUser.AsEnumerable();
        mainMenuDropDownList.DataTextField = "MenuTitle";
        mainMenuDropDownList.DataValueField = "Id";
        mainMenuDropDownList.DataBind();
        mainMenuDropDownList.Items.Insert(0, new ListItem("--Select--", ""));
    }
    //protected void saveButton_Click(object sender, EventArgs e)
    //{

    //}
    protected void mainMenuDropDownList_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (mainMenuDropDownList.SelectedValue=="")
        {
            subMenuCheckBoxList.Items.Clear();
        }
        else
        {
            var getSubMenu = from x in db.MenuTrees
                             where x.ParentId == Convert.ToInt32(mainMenuDropDownList.SelectedValue)
                             select new { x.MenuTitle, x.Id };
            subMenuCheckBoxList.DataSource = getSubMenu.AsEnumerable();
            subMenuCheckBoxList.DataTextField = "MenuTitle";
            subMenuCheckBoxList.DataValueField = "Id";
            subMenuCheckBoxList.DataBind();
            foreach (var md in getSubMenu)
            {
                var isAssign =
                    db.MenuControls.FirstOrDefault(
                        x => x.OperatorId == Convert.ToInt32(userDropDownList.SelectedValue) && x.MenuId == md.Id);
                if (isAssign!=null)
                {
                    subMenuCheckBoxList.Items.FindByValue(md.Id.ToString()).Selected = true;
                }
                
            }
            
        }
        
        //subMenuCheckBoxList.Items.FindByValue("4").Selected = true;
        
    }
    protected void saveButton_Click(object sender, EventArgs e)
    {
        var isExist =
            db.MenuControls.FirstOrDefault(
                x =>
                    x.OperatorId == Convert.ToInt32(userDropDownList.SelectedValue) &&
                    x.MenuId == Convert.ToInt32(mainMenuDropDownList.SelectedValue));
        if (isExist == null)
        {
            MenuControl menuControl = new MenuControl();
            menuControl.OperatorId = Convert.ToInt32(userDropDownList.SelectedValue);
            menuControl.MenuId = Convert.ToInt32(mainMenuDropDownList.SelectedValue);
            db.MenuControls.InsertOnSubmit(menuControl);
            db.SubmitChanges();
        }
        foreach (ListItem subMenu in subMenuCheckBoxList.Items)
        {
            MenuControl menuControl = new MenuControl();
            if (subMenu.Selected)
            {

                int i = Convert.ToInt32(subMenu.Value);
                var isExistSubMenu =db.MenuControls.FirstOrDefault(
                x =>x.OperatorId == Convert.ToInt32(userDropDownList.SelectedValue) &&
                    x.MenuId == i);
                if (isExistSubMenu == null)
                {
                    //MenuControl menuControl = new MenuControl();
                    menuControl.OperatorId = Convert.ToInt32(userDropDownList.SelectedValue);
                    menuControl.MenuId = i;
                    db.MenuControls.InsertOnSubmit(menuControl);
                    db.SubmitChanges();
                }
            }
        }
    }
}