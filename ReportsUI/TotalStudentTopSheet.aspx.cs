using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CrystalDecisions.CrystalReports.Engine;

public partial class ReportsUI_TotalStudentTopSheet : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GetTotalStudent(); 
        }
        
    }
    protected void showButton_Click(object sender, EventArgs e)
    {
        GetTotalStudent();
    }
    private void GetTotalStudent()
    {
        //Class getClassType = db.Classes.FirstOrDefault(x => x.VarClassID == classDropDownList.SelectedValue);
        //{tbl_TransferHistory.TraSession}{Student.VarAdmissionSession}{Student.Status}
        //"'and {tbl_TransferHistory.TraSession}='" +
        //sessionDropDownList.SelectedValue +
        //"'or {tbl_TransferHistory.TraSession}='" +sessionDropDownList.SelectedValue +

        Subscription sub = new Subscription();
        string output = sub.SubcriptionCheck();
        if (output == "Error")
        {
            //string s = "Your product validity expired.Please contact with provider.";
            //Response.Redirect("~/BaseUI/SystemSettings.aspx?message=" + s);
            //return;
        }
        var report = new ReportDocument();
        report.Load(Server.MapPath("~/Reports/StudentTopSheet.rpt"));

        //if (sessionDropDownList.SelectedValue != "")
        //{
        //    var textObject = report.ReportDefinition.ReportObjects["SESSION"] as TextObject;
        //    if (textObject != null) textObject.Text = "SESSION: " + sessionDropDownList.SelectedItem.Text;
        //}

        TotalStudentTopSheetReport.ReportSource = report;
        TotalStudentTopSheetReport.SelectionFormula = "{tbl_Present_class.VarSessionId}='" + sessionDropDownList.SelectedValue +
                                        "'and{tbl_Present_class.Status}='" + "P" + "'";
        TotalStudentTopSheetReport.RefreshReport();
        //report.Dispose();
    }
}