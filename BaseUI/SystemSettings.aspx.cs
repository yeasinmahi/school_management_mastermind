using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BaseUI_SystemSettings : System.Web.UI.Page
{
    private string message = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        failStatusLabel.InnerText = "";
        message = Request.QueryString["message"];
        failStatusLabel.InnerText = message;
    }
    protected void saveButton_Click(object sender, EventArgs e)
    {
        if (!String.IsNullOrEmpty(keyTextBox.Text.Trim()))
        {
            SWISDataContext db = new SWISDataContext();
            var getValue = db.SyestemSies.FirstOrDefault(x => x.Id == 1);
            if (getValue!=null)
            {
                getValue.SysCode = keyTextBox.Text;
                db.SubmitChanges();
                Response.Redirect("~/BaseUI/Default.aspx");
            }
        }
    }
}