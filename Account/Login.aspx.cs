using System;
using System.Linq;
using System.Security.Policy;
using System.Web;
using System.Web.Security;
using System.Web.Services;
using System.Web.UI;
using App_Code;


    public partial class Account_Login : System.Web.UI.Page
    {
        private readonly SWISDataContext db = new SWISDataContext();
        //private readonly SystryManager _systryManager = new SystryManager();

        protected void Page_Load(object sender, EventArgs e)
        {
            //RegisterHyperLink.NavigateUrl = "~/Admin/Register.aspx";
            //?ReturnUrl=" +
            // HttpUtility.UrlEncode(Request.QueryString["ReturnUrl"]);
        }

        private Custom d = new Custom();

        [WebMethod]
        public string LogIn(string uN, string p)
        {
            tbl_user_info aOperator = new tbl_user_info();
            aOperator.uid = uN;
            aOperator.upass = p;
            OperatorManager operatorManager = new OperatorManager();
            tbl_user_info loggedOperator = operatorManager.Login(aOperator);
            FailureText.Text = "";
            //if (UserName.Text.Equals("admin") && Password.Text.Equals("admin"))
            //{
            //    if (_systryManager.CheckActivation())
            //    {
            //        Session["login"] = "y";
            //        Response.Redirect("~/Default.aspx");
            //    }
                
            //}
            //if (_systryManager.CheckActivation())
            //{
            //    if (loggedOperator.id != 0)
            //    {

            //        Session["uid"] = loggedOperator.uid;
            //        Session["VarBranchId"] = loggedOperator.VarBranchId;
            //        Session["VarShiftCode"] = loggedOperator.VarShiftCode;
            //        FormsAuthentication.RedirectFromLoginPage(loggedOperator.urole, RememberMe.Checked);

            //        d.SetSessionVariable("operator", loggedOperator);
            //        Response.Redirect("~/BaseUI/Default.aspx");
            //    }
            //    else
            //    {
            //        FailureText.Text = "Login Failed. Please Try Again.";
            //        return "F";
            //    }
                
            //}
            //else
            //{
            //    FailureText.Text = "Software Suscription Expaired";
            //}
            if (loggedOperator.id != 0)
            {

                Session["uid"] = loggedOperator.uid;
                Session["VarBranchId"] = loggedOperator.VarBranchId;
                Session["VarShiftCode"] = loggedOperator.VarShiftCode;
                FormsAuthentication.RedirectFromLoginPage(loggedOperator.urole, RememberMe.Checked);

                d.SetSessionVariable("operator", loggedOperator);
                Response.Redirect("~/BaseUI/Default.aspx");
            }
            else
            {
                FailureText.Text = "Login Failed. Please Try Again.";
                return "F";
            }
            return "OK";
        }

        [WebMethod]
        public static bool CheckLogIn(string uN, string p)
        {
            tbl_user_info aOperator = new tbl_user_info();
            aOperator.uid = uN;
            aOperator.upass = p;

            OperatorManager operatorManager = new OperatorManager();
            return operatorManager.CheckLogIn(aOperator);

        }

        public void LoginButton_Click(object sender, EventArgs e)
        {
            string uId = UserName.Text;
            string p = Password.Text;

            if (!String.IsNullOrEmpty(uId) && !String.IsNullOrEmpty(p))
            {
                LogIn(uId, p);
            }
        }

        protected void linkGoSomewhere_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Admin/Register.aspx");
        }

    }

