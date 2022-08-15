using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using CrystalDecisions.CrystalReports.Engine;

public partial class ReportsUI_StudentSMSNumberReport : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GetStudentInfo();
        }
        
    }

    protected void searchButton_Click(object sender, EventArgs e)
    {
        Session["val"] = "1";
        GetStudentInfo();
        
    }
    protected void parentsContactButton_Click(object sender, EventArgs e)
    {
        Session["val"] = "2";
        GetStudentInfo();
       
    }

    private void GetStudentInfo()
    {
        Subscription sub = new Subscription();
        string output = sub.SubcriptionCheck();
        if (output == "Error")
        {
            while (true)
            {
                //Do My Loop Stuff
            }
        }
        //{tbl_Present_class.VarSection}{tbl_Present_class.VarShiftCode}
        var report = new ReportDocument();
        int brachId = Convert.ToInt32(Session["VarBranchId"]);
        string sectionN = sectionDropDownList.SelectedItem.Text;
        if (ReferenceEquals(Session["val"], "1"))
        {
            if (sectionDropDownList.SelectedValue == "0" && shiftDropDownList.SelectedValue == "0")
            {
                report.Load(Server.MapPath("~/Reports/StudentListWithSMSNumber.rpt"));
                StudentSMSNumberReport.ReportSource = report;
                StudentSMSNumberReport.SelectionFormula = "{Class.VarClassID} ='" + classDropDownList.SelectedValue +
                                                          "' and {tbl_Present_class.VarSessionId}='" +
                                                          sessionDropDownList.SelectedValue +
                                                          "'and {tbl_Present_class.Status}='" + "P" +
                                                            "'and{Student.VarBranchID}=" + brachId;
            }
            else if (sectionDropDownList.SelectedValue != "0" && shiftDropDownList.SelectedValue == "0")
            {
                report.Load(Server.MapPath("~/Reports/StudentListWithSMSNumber.rpt"));
                StudentSMSNumberReport.ReportSource = report;
                StudentSMSNumberReport.SelectionFormula = "{Class.VarClassID} ='" + classDropDownList.SelectedValue +
                                                          "' and {tbl_Present_class.VarSessionId}='" +
                                                          sessionDropDownList.SelectedValue +
                                                          "' and {tbl_Present_class.VarSection}='" +
                                                          sectionDropDownList.SelectedValue +
                                                          "'and {tbl_Present_class.Status}='" + "P" +
                                                            "'and{Student.VarBranchID}=" + brachId;
            }
            else if (sectionDropDownList.SelectedValue == "0" && shiftDropDownList.SelectedValue != "0")
            {
                report.Load(Server.MapPath("~/Reports/StudentListWithSMSNumber.rpt"));
                StudentSMSNumberReport.ReportSource = report;
                StudentSMSNumberReport.SelectionFormula = "{Class.VarClassID} ='" + classDropDownList.SelectedValue +
                                                          "' and {tbl_Present_class.VarSessionId}='" +
                                                          sessionDropDownList.SelectedValue +
                                                          "' and {tbl_Present_class.VarShiftCode}='" +
                                                          shiftDropDownList.SelectedValue +
                                                          "'and {tbl_Present_class.Status}='" + "P" +
                                                            "'and{Student.VarBranchID}=" + brachId;
            }
            else
            {
                report.Load(Server.MapPath("~/Reports/StudentListWithSMSNumber.rpt"));
                StudentSMSNumberReport.ReportSource = report;
                StudentSMSNumberReport.SelectionFormula = "{Class.VarClassID} ='" + classDropDownList.SelectedValue +
                                                          "' and {tbl_Present_class.VarShiftCode}='" +
                                                          shiftDropDownList.SelectedValue +
                                                          "' and {tbl_Present_class.VarSection}='" +
                                                          sectionDropDownList.SelectedValue +
                                                          "' and {tbl_Present_class.VarSessionId}='" +
                                                          sessionDropDownList.SelectedValue +
                                                          "'and {tbl_Present_class.Status}='" + "P" +
                                                            "'and{Student.VarBranchID}=" + brachId;
            }
        }
        else if (ReferenceEquals(Session["val"], "2"))
        {
            if (sectionDropDownList.SelectedValue == "0" && shiftDropDownList.SelectedValue == "0")
            {
                report.Load(Server.MapPath("~/Reports/ParentsContactList.rpt"));
                StudentSMSNumberReport.ReportSource = report;
                StudentSMSNumberReport.SelectionFormula = "{Class.VarClassID} ='" + classDropDownList.SelectedValue +
                                                          "' and {tbl_Present_class.VarSessionId}='" +
                                                          sessionDropDownList.SelectedValue +
                                                          "'and {tbl_Present_class.Status}='" + "P" +
                                                            "'and{Student.VarBranchID}=" + brachId;
            }
            else if (sectionDropDownList.SelectedValue != "0" && shiftDropDownList.SelectedValue == "0")
            {
                report.Load(Server.MapPath("~/Reports/ParentsContactList.rpt"));
                StudentSMSNumberReport.ReportSource = report;
                StudentSMSNumberReport.SelectionFormula = "{Class.VarClassID} ='" + classDropDownList.SelectedValue +
                                                          "' and {tbl_Present_class.VarSessionId}='" +
                                                          sessionDropDownList.SelectedValue +
                                                          "' and {tbl_Present_class.VarSection}='" +
                                                          sectionDropDownList.SelectedValue +
                                                          "'and {tbl_Present_class.Status}='" + "P" +
                                                            "'and{Student.VarBranchID}=" + brachId;
            }
            else if (sectionDropDownList.SelectedValue == "0" && shiftDropDownList.SelectedValue != "0")
            {
                report.Load(Server.MapPath("~/Reports/ParentsContactList.rpt"));
                StudentSMSNumberReport.ReportSource = report;
                StudentSMSNumberReport.SelectionFormula = "{Class.VarClassID} ='" + classDropDownList.SelectedValue +
                                                          "' and {tbl_Present_class.VarSessionId}='" +
                                                          sessionDropDownList.SelectedValue +
                                                          "' and {tbl_Present_class.VarShiftCode}='" +
                                                          shiftDropDownList.SelectedValue +
                                                          "'and {tbl_Present_class.Status}='" + "P" +
                                                            "'and{Student.VarBranchID}=" + brachId;
            }
            else
            {
                report.Load(Server.MapPath("~/Reports/ParentsContactList.rpt"));
                StudentSMSNumberReport.ReportSource = report;
                StudentSMSNumberReport.SelectionFormula = "{Class.VarClassID} ='" + classDropDownList.SelectedValue +
                                                          "' and {tbl_Present_class.VarShiftCode}='" +
                                                          shiftDropDownList.SelectedValue +
                                                          "' and {tbl_Present_class.VarSection}='" +
                                                          sectionDropDownList.SelectedValue +
                                                          "' and {tbl_Present_class.VarSessionId}='" +
                                                          sessionDropDownList.SelectedValue +
                                                          "'and {tbl_Present_class.Status}='" + "P" +
                                                            "'and{Student.VarBranchID}=" + brachId;
            }
        }
       
        
        StudentSMSNumberReport.RefreshReport();
    }

    protected void classDropDownList_SelectedIndexChanged(object sender, EventArgs e)
    {
        sectionDropDownList.Items.Clear();
        sectionDropDownList.Items.Insert(0, new ListItem("--All--", "0"));
    }
    
}