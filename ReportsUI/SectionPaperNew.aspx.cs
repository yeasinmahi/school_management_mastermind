using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CrystalDecisions.CrystalReports.Engine;

public partial class ReportsUI_SectionPaperNew : System.Web.UI.Page
{
    SWISDataContext db = new SWISDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void ShowButton_Click(object sender, EventArgs e)
    {
        var chekData = from x in db.temp_SectionPapers
            where x.UserId == Session["uid"].ToString() && x.BranchId==Convert.ToInt32(Session["VarBranchId"].ToString())
            select x;
        if (chekData.FirstOrDefault() != null)
        {
            db.temp_SectionPapers.DeleteAllOnSubmit(chekData);
            db.SubmitChanges();
        }
        GetStudent();
    }

    private void GetStudent()
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
        int branchId = Convert.ToInt32(Session["VarBranchId"].ToString());
        string uid = Session["uid"].ToString();
        string classId = null;
        if (sradio1.Checked)
        {

            var checkClass = db.tbl_EdexcelSubjectAssigns.FirstOrDefault(x => x.StudentId == studentIdTextBox.Text && x.Session == sessionDropDownList.SelectedValue);
            if (checkClass != null)
            {
                classId = checkClass.ClassId;
            }
            var getAll = from es in db.tbl_EdexcelSubjectAssigns
                         join s in db.tbl_Subjects on new { SubjectId = es.SubjectId } equals new { SubjectId = s.VarSubjectCode }
                         join eu in db.tbl_EdexelunitCodes
                             on new { es.UnitCodeNo, es.SubjectId }
                             equals new { UnitCodeNo = eu.UnitCodeSpeCode, SubjectId = eu.SpecificationCode }
                         where
                             es.Session == sessionDropDownList.SelectedValue &&
                             es.ClassId == classId &&
                             es.StudentId == studentIdTextBox.Text.Trim() &&
                             s.ClassId == classId &&
                             eu.Class == classId
                         orderby es.StudentId, s.SubSerial, es.UnitCode
                         select new
                         {
                             es.StudentId,
                             s.VarSubjectName,
                             es.UnitCode,
                             eu.IsLab,
                             es.Section
                         };
            int count = 0;
            string stdId = "";
            string subId = "";
            foreach (var addSub in getAll)
            {
                temp_SectionPaper sectionPaper = new temp_SectionPaper();
                var checkEmptySection =
                    db.temp_SectionPapers.FirstOrDefault(
                        x =>
                            x.StudentId == addSub.StudentId && x.VarSubjectName == addSub.VarSubjectName &&
                            x.Section == "0" && x.UserId==Session["uid"].ToString());
                var checkRecord = (from x in db.temp_SectionPapers
                                   where x.StudentId == addSub.StudentId && x.UserId==Session["uid"].ToString()
                                   select x).Count();
                var isExist =
                    db.temp_SectionPapers.FirstOrDefault(
                        x =>
                            x.VarSubjectName == addSub.VarSubjectName && x.StudentId == addSub.StudentId &&
                            x.IsLab == addSub.IsLab);
                if (isExist==null && checkEmptySection==null && checkRecord<13)
                {
                    sectionPaper.StudentId = addSub.StudentId;
                    sectionPaper.VarSubjectName = addSub.VarSubjectName;
                    sectionPaper.Unit = addSub.UnitCode;
                    sectionPaper.IsLab = addSub.IsLab;
                    sectionPaper.Section = addSub.Section;
                    sectionPaper.UserId = Session["uid"].ToString();
                    sectionPaper.BranchId = Convert.ToInt32(Session["VarBranchId"].ToString());
                    db.temp_SectionPapers.InsertOnSubmit(sectionPaper);
                    db.SubmitChanges();
                   
                }
                
            }
            var report = new ReportDocument();
            report.Load(Server.MapPath("~/Reports/SectionPaper.rpt"));
            sectionPaperReport.ReportSource = report;
            sectionPaperReport.SelectionFormula = "{temp_SectionPaper.StudentId}='" + studentIdTextBox.Text +
                "'and {temp_SectionPaper.UserId}='" + uid +
                "'and {temp_SectionPaper.BranchId}=" + branchId;
            //IdCardGenetaro.SelectionFormula = "{temp_IDCard.StudentId}='" + studentIdTextBox.Text + "'";{temp_SectionPaper.UserId}
            sectionPaperReport.RefreshReport();
        }
        else if (sradio2.Checked)
        {
            var getAll = from es in db.tbl_EdexcelSubjectAssigns
                         join s in db.tbl_Subjects on new { SubjectId = es.SubjectId } equals new { SubjectId = s.VarSubjectCode }
                         join eu in db.tbl_EdexelunitCodes
                             on new { es.UnitCodeNo, es.SubjectId }
                             equals new { UnitCodeNo = eu.UnitCodeSpeCode, SubjectId = eu.SpecificationCode }
                         where
                             es.Session == sessionDropDownList.SelectedValue &&
                             es.ClassId == classDropDownList.SelectedValue &&
                             s.ClassId == classDropDownList.SelectedValue &&
                             eu.Class == classDropDownList.SelectedValue
                         orderby es.StudentId, s.SubSerial, es.UnitCode
                         select new
                         {
                             es.StudentId,
                             s.VarSubjectName,
                             es.UnitCode,
                             eu.IsLab,
                             es.Section
                         };
            foreach (var addSub in getAll)
            {
                temp_SectionPaper sectionPaper = new temp_SectionPaper();
                var checkEmptySection =
                    db.temp_SectionPapers.FirstOrDefault(
                        x =>
                            x.StudentId == addSub.StudentId && x.VarSubjectName == addSub.VarSubjectName &&
                            x.Section == "0" && x.UserId == Session["uid"].ToString());
                var checkRecord = (from x in db.temp_SectionPapers
                                   where x.StudentId == addSub.StudentId && x.UserId == Session["uid"].ToString()
                                   select x).Count();
                var isExist =
                    db.temp_SectionPapers.FirstOrDefault(
                        x =>
                            x.VarSubjectName == addSub.VarSubjectName && x.StudentId == addSub.StudentId &&
                            x.IsLab == addSub.IsLab);
                if (isExist==null && checkEmptySection == null && checkRecord<13)
                {
                    sectionPaper.StudentId = addSub.StudentId;
                    sectionPaper.VarSubjectName = addSub.VarSubjectName;
                    sectionPaper.Unit = addSub.UnitCode;
                    sectionPaper.IsLab = addSub.IsLab;
                    sectionPaper.Section = addSub.Section;
                    sectionPaper.UserId = Session["uid"].ToString();
                    sectionPaper.BranchId = Convert.ToInt32(Session["VarBranchId"].ToString());
                    db.temp_SectionPapers.InsertOnSubmit(sectionPaper);
                    db.SubmitChanges();
                }
            }
            var report = new ReportDocument();
            report.Load(Server.MapPath("~/Reports/SectionPaper.rpt"));
            sectionPaperReport.ReportSource = report;
            sectionPaperReport.SelectionFormula = "{temp_SectionPaper.UserId}='" + uid +
                "'and {temp_SectionPaper.BranchId}=" + branchId;
            //IdCardGenetaro.SelectionFormula = "{temp_IDCard.StudentId}='" + studentIdTextBox.Text + "'";{temp_SectionPaper.UserId}
            sectionPaperReport.RefreshReport();
        }
    }
}