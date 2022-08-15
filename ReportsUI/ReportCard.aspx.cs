using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CrystalDecisions.CrystalReports.Engine;

public partial class ReportsUI_ReportCard : System.Web.UI.Page
{
    SWISDataContext db=new SWISDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
            ReportCardGenerators();
        }
    }
    protected void ShowButton_Click(object sender, EventArgs e)
    {
        successStatusLabel.InnerText = "";
        failStatusLabel.InnerText = "";
        var getHighestMarks = (from tbl_ExamMarks in db.tbl_ExamMarks
            group tbl_ExamMarks by new
            {
                tbl_ExamMarks.UniqueSubId,
                tbl_ExamMarks.VarSession,
                tbl_ExamMarks.VarClassId,
                tbl_ExamMarks.VarSection,
                tbl_ExamMarks.ExamCode
            }
            into g
            select new
            {
                g.Key.VarSession,
                g.Key.VarClassId,
                g.Key.VarSection,
                g.Key.ExamCode,
                g.Key.UniqueSubId,
                highestMarks = (double?) g.Max(p => p.Total_Marks)
            });
        foreach (var highestMark in getHighestMarks)
        {
            var mark = highestMark;
            var getAll = from x in db.tbl_ExamMarks
                where x.VarSession == mark.VarSession && x.VarClassId == mark.VarClassId
                                              && x.VarSection == mark.VarSection && x.ExamCode == mark.ExamCode && x.UniqueSubId==mark.UniqueSubId
                select new{x.VarStudentId};
            foreach (var hMark in getAll)
            {
                var isExist =
                    db.tbl_ExamMarks.FirstOrDefault(
                        x =>
                            x.VarStudentId == hMark.VarStudentId && x.VarSession == mark.VarSession &&
                            x.VarClassId == mark.VarClassId && x.UniqueSubId == mark.UniqueSubId
                            && x.VarSection == mark.VarSection && x.ExamCode == mark.ExamCode);
                if (isExist != null)
                {
                    isExist.SubHighestMarks = highestMark.highestMarks;
                    db.SubmitChanges();
                }
            }
        }
        ReportCardGenerators();
    }

    private void ReportCardGenerators()
    {
        Subscription sub = new Subscription();
        string output = sub.SubcriptionCheck();
        if (output == "Error")
        {
            //string s = "Your product validity expired.Please contact with provider.";
            //Response.Redirect("~/BaseUI/SystemSettings.aspx?message=" + s);
            while (true)
            {
                //Do My Loop Stuff
            }
        }
        var report = new ReportDocument();
        report.Load(Server.MapPath("~/Reports/ReportCard.rpt"));
        if (sessionDropDownList.SelectedValue != "" && studentIdTextBox.Text != "" )
        {
            ReportCardGenerator.ReportSource = report;
            ReportCardGenerator.SelectionFormula = "{tbl_ExamMarks.VarStudentId}='" + studentIdTextBox.Text +
                                                  "'AND {tbl_ExamMarks.VarSession}='" +
                                                  sessionDropDownList.SelectedValue + "'and {tbl_ExamMarks.ExamCode}='" + examNameDropDownList.SelectedValue + "'";
            ReportCardGenerator.RefreshReport();
            //{tbl_ExamMarks.VarSession}{tbl_ExamMarks.VarStudentId}
        }
    }
}