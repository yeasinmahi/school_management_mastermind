using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;

public partial class ReportsUI_BoardExamResult : System.Web.UI.Page
{
    SWISDataContext db = new SWISDataContext();
    private int btnValue = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
            LoadAwardReport();
        }
    }
    private void GetAllData()
    {
        if (sessionDropDownList.SelectedValue != "0" && examSessionDropDownList.SelectedValue != "0")
        {
            var delAll = from x in db.TempBoardResults
                         select x;
            if (delAll.FirstOrDefault() != null)
            {
                db.TempBoardResults.DeleteAllOnSubmit(delAll);
                db.SubmitChanges();
            }
            var delAllGrade = from x in db.TempBoardResultGradeTopSheets
                              select x;
            if (delAllGrade.FirstOrDefault() != null)
            {
                db.TempBoardResultGradeTopSheets.DeleteAllOnSubmit(delAllGrade);
                db.SubmitChanges();
            }
            string studentId = "";
            int aStar = 0, a = 0, b = 0, c = 0, d = 0, e = 0, f = 0, g = 0, u = 0, ex = 0;

            if (levelDropDownList.SelectedValue != "0" && boardDropDownList.SelectedValue != "0")
            {
                var getAll = from x in db.tbl_BoardExamResults
                             where x.VarSession == sessionDropDownList.SelectedValue &&
                                   x.ExamSession == examSessionDropDownList.SelectedValue &&
                                   x.Class == levelDropDownList.SelectedValue &&
                                   x.Board == boardDropDownList.SelectedValue
                             orderby x.VarStudentId
                             select new { x.VarStudentId, x.SubCode, x.SubName, x.Grade };
                foreach (var allRecord in getAll)
                {
                    if (studentId != allRecord.VarStudentId)
                    {
                        var oldId = db.TempBoardResults.FirstOrDefault(x => x.StudentId == studentId);
                        if (oldId != null)
                        {
                            string grade = "";
                            double point = 0;
                            if (aStar != 0)
                            {
                                grade = aStar + "A*,";
                                point = aStar * 10;
                            }
                            if (a != 0)
                            {
                                grade += a + "A,";
                                point += a * 9;
                            }
                            if (b != 0)
                            {
                                grade += b + "B,";
                                point += b * 8;
                            }
                            if (c != 0)
                            {
                                grade += c + "C,";
                                point += c * 7;
                            }
                            if (d != 0)
                            {
                                grade += d + "D,";
                                point += d * 6;
                            }
                            if (e != 0)
                            {
                                grade += e + "E,";
                                point += e * 5;
                            }
                            if (f != 0)
                            {
                                grade += f + "F,";
                                point += f * 4;
                            }
                            if (g != 0)
                            {
                                grade += g + "G,";
                                point += g * 3;
                            }
                            if (u != 0)
                            {
                                grade += u + "U,";
                                point += u * 2;
                            }
                            if (ex != 0)
                            {
                                grade += ex + "X,";
                                point += ex * 1;
                            }
                            oldId.TotalGrade = grade;
                            oldId.Point = point / oldId.TotalSub;
                            db.SubmitChanges();
                            aStar = 0;
                            a = 0;
                            b = 0;
                            c = 0;
                            d = 0;
                            e = 0;
                            f = 0;
                            g = 0;
                            u = 0;
                            ex = 0;
                        }
                    }
                    var isExist = db.TempBoardResults.FirstOrDefault(x => x.StudentId == allRecord.VarStudentId);
                    if (isExist == null)
                    {
                        TempBoardResult boardResult = new TempBoardResult();
                        boardResult.StudentId = allRecord.VarStudentId;
                        if (allRecord.SubCode == "4AC0")
                        {
                            boardResult._4AC0 = allRecord.Grade;
                        }
                        else if (allRecord.SubCode == "4BE0")
                        {
                            boardResult._4BE0 = allRecord.Grade;
                        }
                        else if (allRecord.SubCode == "4BI0")
                        {
                            boardResult._4BI0 = allRecord.Grade;
                        }
                        else if (allRecord.SubCode == "4BS0")
                        {
                            boardResult._4BS0 = allRecord.Grade;
                        }
                        else if (allRecord.SubCode == "4CH0")
                        {
                            boardResult._4CH0 = allRecord.Grade;
                        }
                        else if (allRecord.SubCode == "4CM0")
                        {
                            boardResult._4CM0 = allRecord.Grade;
                        }
                        else if (allRecord.SubCode == "4EB0")
                        {
                            boardResult._4EB0 = allRecord.Grade;
                        }
                        else if (allRecord.SubCode == "4EC0")
                        {
                            boardResult._4EC0 = allRecord.Grade;
                        }
                        else if (allRecord.SubCode == "4HB0")
                        {
                            boardResult._4HB0 = allRecord.Grade;
                        }
                        else if (allRecord.SubCode == "4IT0")
                        {
                            boardResult._4IT0 = allRecord.Grade;
                        }
                        else if (allRecord.SubCode == "4MA0F")
                        {
                            boardResult._4MA0F = allRecord.Grade;
                        }
                        else if (allRecord.SubCode == "4MA0H")
                        {
                            boardResult._4MA0H = allRecord.Grade;
                        }
                        else if (allRecord.SubCode == "4MB0")
                        {
                            boardResult._4MB0 = allRecord.Grade;
                        }
                        else if (allRecord.SubCode == "4PH0")
                        {
                            boardResult._4PH0 = allRecord.Grade;
                        }
                        else if (allRecord.SubCode == "4PM0")
                        {
                            boardResult._4PM0 = allRecord.Grade;
                        }
                        else if (allRecord.SubCode == "9608")
                        {
                            boardResult._9608 = allRecord.Grade;
                        }
                        else if (allRecord.SubCode == "9609")
                        {
                            boardResult._9609 = allRecord.Grade;
                        }
                        else if (allRecord.SubCode == "9700")
                        {
                            boardResult._9700 = allRecord.Grade;
                        }
                        else if (allRecord.SubCode == "9701")
                        {
                            boardResult._9701 = allRecord.Grade;
                        }
                        else if (allRecord.SubCode == "9702")
                        {
                            boardResult._9702 = allRecord.Grade;
                        }
                        else if (allRecord.SubCode == "9706")
                        {
                            boardResult._9706 = allRecord.Grade;
                        }
                        else if (allRecord.SubCode == "9708")
                        {
                            boardResult._9708 = allRecord.Grade;
                        }
                        else if (allRecord.SubCode == "9709")
                        {
                            boardResult._9709 = allRecord.Grade;
                        }
                        else if (allRecord.SubCode == "YAC01")
                        {
                            boardResult.YAC01 = allRecord.Grade;
                        }
                        else if (allRecord.SubCode == "YBI01")
                        {
                            boardResult.YBI01 = allRecord.Grade;
                        }
                        else if (allRecord.SubCode == "YBS01")
                        {
                            boardResult.YBS01 = allRecord.Grade;
                        }
                        else if (allRecord.SubCode == "YCH01")
                        {
                            boardResult.YCH01 = allRecord.Grade;
                        }
                        else if (allRecord.SubCode == "YEC01")
                        {
                            boardResult.YEC01 = allRecord.Grade;
                        }
                        else if (allRecord.SubCode == "YET01")
                        {
                            boardResult.YET01 = allRecord.Grade;
                        }
                        else if (allRecord.SubCode == "YLA1")
                        {
                            boardResult.YLA1 = allRecord.Grade;
                        }
                        else if (allRecord.SubCode == "YMA01")
                        {
                            boardResult.YMA01 = allRecord.Grade;
                        }
                        else if (allRecord.SubCode == "YPH01")
                        {
                            boardResult.YPH01 = allRecord.Grade;
                        }
                        boardResult.TotalSub = 1;
                        db.TempBoardResults.InsertOnSubmit(boardResult);
                        if (allRecord.Grade == "A*")
                        {
                            aStar = 1;
                        }
                        else if (allRecord.Grade == "A")
                        {
                            a = 1;
                        }
                        else if (allRecord.Grade == "B")
                        {
                            b = 1;
                        }
                        else if (allRecord.Grade == "C")
                        {
                            c = 1;
                        }
                        else if (allRecord.Grade == "D")
                        {
                            d = 1;
                        }
                        else if (allRecord.Grade == "E")
                        {
                            e = 1;
                        }
                        else if (allRecord.Grade == "F")
                        {
                            f = 1;
                        }
                        else if (allRecord.Grade == "G")
                        {
                            g = 1;
                        }
                        else if (allRecord.Grade == "U")
                        {
                            u = 1;
                        }
                        else if (allRecord.Grade == "X")
                        {
                            ex = 1;
                        }
                    }
                    else
                    {
                        if (allRecord.SubCode == "4AC0")
                        {
                            isExist._4AC0 = allRecord.Grade;
                        }
                        else if (allRecord.SubCode == "4BE0")
                        {
                            isExist._4BE0 = allRecord.Grade;
                        }
                        else if (allRecord.SubCode == "4BI0")
                        {
                            isExist._4BI0 = allRecord.Grade;
                        }
                        else if (allRecord.SubCode == "4BS0")
                        {
                            isExist._4BS0 = allRecord.Grade;
                        }
                        else if (allRecord.SubCode == "4CH0")
                        {
                            isExist._4CH0 = allRecord.Grade;
                        }
                        else if (allRecord.SubCode == "4CM0")
                        {
                            isExist._4CM0 = allRecord.Grade;
                        }
                        else if (allRecord.SubCode == "4EB0")
                        {
                            isExist._4EB0 = allRecord.Grade;
                        }
                        else if (allRecord.SubCode == "4EC0")
                        {
                            isExist._4EC0 = allRecord.Grade;
                        }
                        else if (allRecord.SubCode == "4HB0")
                        {
                            isExist._4HB0 = allRecord.Grade;
                        }
                        else if (allRecord.SubCode == "4IT0")
                        {
                            isExist._4IT0 = allRecord.Grade;
                        }
                        else if (allRecord.SubCode == "4MA0F")
                        {
                            isExist._4MA0F = allRecord.Grade;
                        }
                        else if (allRecord.SubCode == "4MA0H")
                        {
                            isExist._4MA0H = allRecord.Grade;
                        }
                        else if (allRecord.SubCode == "4MB0")
                        {
                            isExist._4MB0 = allRecord.Grade;
                        }
                        else if (allRecord.SubCode == "4PH0")
                        {
                            isExist._4PH0 = allRecord.Grade;
                        }
                        else if (allRecord.SubCode == "4PM0")
                        {
                            isExist._4PM0 = allRecord.Grade;
                        }
                        else if (allRecord.SubCode == "9608")
                        {
                            isExist._9608 = allRecord.Grade;
                        }
                        else if (allRecord.SubCode == "9609")
                        {
                            isExist._9609 = allRecord.Grade;
                        }
                        else if (allRecord.SubCode == "9700")
                        {
                            isExist._9700 = allRecord.Grade;
                        }
                        else if (allRecord.SubCode == "9701")
                        {
                            isExist._9701 = allRecord.Grade;
                        }
                        else if (allRecord.SubCode == "9702")
                        {
                            isExist._9702 = allRecord.Grade;
                        }
                        else if (allRecord.SubCode == "9706")
                        {
                            isExist._9706 = allRecord.Grade;
                        }
                        else if (allRecord.SubCode == "9708")
                        {
                            isExist._9708 = allRecord.Grade;
                        }
                        else if (allRecord.SubCode == "9709")
                        {
                            isExist._9709 = allRecord.Grade;
                        }
                        else if (allRecord.SubCode == "YAC01")
                        {
                            isExist.YAC01 = allRecord.Grade;
                        }
                        else if (allRecord.SubCode == "YBI01")
                        {
                            isExist.YBI01 = allRecord.Grade;
                        }
                        else if (allRecord.SubCode == "YBS01")
                        {
                            isExist.YBS01 = allRecord.Grade;
                        }
                        else if (allRecord.SubCode == "YCH01")
                        {
                            isExist.YCH01 = allRecord.Grade;
                        }
                        else if (allRecord.SubCode == "YEC01")
                        {
                            isExist.YEC01 = allRecord.Grade;
                        }
                        else if (allRecord.SubCode == "YET01")
                        {
                            isExist.YET01 = allRecord.Grade;
                        }
                        else if (allRecord.SubCode == "YLA1")
                        {
                            isExist.YLA1 = allRecord.Grade;
                        }
                        else if (allRecord.SubCode == "YMA01")
                        {
                            isExist.YMA01 = allRecord.Grade;
                        }
                        else if (allRecord.SubCode == "YPH01")
                        {
                            isExist.YPH01 = allRecord.Grade;
                        }
                        isExist.TotalSub += 1;
                        if (allRecord.Grade == "A*")
                        {
                            aStar += 1;
                        }
                        else if (allRecord.Grade == "A")
                        {
                            a += 1;
                        }
                        else if (allRecord.Grade == "B")
                        {
                            b += 1;
                        }
                        else if (allRecord.Grade == "C")
                        {
                            c += 1;
                        }
                        else if (allRecord.Grade == "D")
                        {
                            d += 1;
                        }
                        else if (allRecord.Grade == "E")
                        {
                            e += 1;
                        }
                        else if (allRecord.Grade == "F")
                        {
                            f += 1;
                        }
                        else if (allRecord.Grade == "G")
                        {
                            g += 1;
                        }
                        else if (allRecord.Grade == "U")
                        {
                            u += 1;
                        }
                        else if (allRecord.Grade == "X")
                        {
                            ex += 1;
                        }
                    }
                    db.SubmitChanges();
                    studentId = allRecord.VarStudentId;

                    var isExistInTopSheet =
                        db.TempBoardResultGradeTopSheets.FirstOrDefault(
                            x => x.Grade == allRecord.Grade && x.SubCode == allRecord.SubCode);
                    if (isExistInTopSheet != null)
                    {
                        isExistInTopSheet.Total += 1;
                        db.SubmitChanges();
                    }
                    else
                    {
                        TempBoardResultGradeTopSheet topSheet = new TempBoardResultGradeTopSheet();
                        if (allRecord.Grade!="")
                        {
                            topSheet.Grade = allRecord.Grade;
                            topSheet.SubCode = allRecord.SubCode;
                            topSheet.Total = 1;
                            db.TempBoardResultGradeTopSheets.InsertOnSubmit(topSheet);
                            db.SubmitChanges();
                        }
                        
                    }
                }
                var getTotalGrade = from x in db.TempBoardResultGradeTopSheets
                                    orderby x.SubCode
                                    select new { x.Grade, x.SubCode, x.Total };
                foreach (var grd in getTotalGrade)
                {
                    var isExist =
                        db.TempBoardResultGradeTopSheets.FirstOrDefault(
                            x => x.Grade == "Total" && x.SubCode == grd.SubCode);
                    if (isExist == null)
                    {
                        var grade = getTotalGrade.Where(x => x.SubCode == grd.SubCode).Select(x => x.Total).Sum();
                        TempBoardResultGradeTopSheet topSheet = new TempBoardResultGradeTopSheet();
                        topSheet.Grade = "Total";
                        topSheet.SubCode = grd.SubCode;
                        topSheet.Total = grade;
                        db.TempBoardResultGradeTopSheets.InsertOnSubmit(topSheet);
                        db.SubmitChanges();
                    }

                }

                //var getAllIncome = (from z in db.tbl_UserAccount
                //                    where z.CID == cid
                //                    select new { z.DatDate, z.Amount, z.TranCID, z.TranType }).ToList();
                //var spotIncome = getAllIncome.Where(x => x.TranType == 1).Select(x => x.Amount).Sum();
                //var lvlIncome = getAllIncome.Where(x => x.TranType == 2).Select(x => x.Amount).Sum();
                var oldIdf = db.TempBoardResults.FirstOrDefault(x => x.StudentId == studentId);
                if (oldIdf != null)
                {
                    string grade = "";
                    double point = 0;
                    if (aStar != 0)
                    {
                        grade = aStar + "A*,";
                        point = aStar * 10;
                    }
                    if (a != 0)
                    {
                        grade += a + "A,";
                        point += a * 9;
                    }
                    if (b != 0)
                    {
                        grade += b + "B,";
                        point += b * 8;
                    }
                    if (c != 0)
                    {
                        grade += c + "C,";
                        point += c * 7;
                    }
                    if (d != 0)
                    {
                        grade += d + "D,";
                        point += d * 6;
                    }
                    if (e != 0)
                    {
                        grade += e + "E,";
                        point += e * 5;
                    }
                    if (f != 0)
                    {
                        grade += f + "F,";
                        point += f * 4;
                    }
                    if (g != 0)
                    {
                        grade += g + "G,";
                        point += g * 3;
                    }
                    if (u != 0)
                    {
                        grade += u + "U,";
                        point += u * 2;
                    }
                    if (ex != 0)
                    {
                        grade += ex + "X,";
                        point += ex * 1;
                    }
                    oldIdf.TotalGrade = grade;
                    oldIdf.Point = point / oldIdf.TotalSub;
                    db.SubmitChanges();
                    aStar = 0;
                    a = 0;
                    b = 0;
                    c = 0;
                    d = 0;
                    e = 0;
                    f = 0;
                    g = 0;
                    u = 0;
                    ex = 0;
                }
            }
        }
        else
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Please select Session And Exam-Session first!')", true);
        }
    }
    protected void sessionDropDownList_SelectedIndexChanged(object sender, EventArgs e)
    {
        var getSection = from c in db.tbl_ExamSessions
                         where c.SessionId == sessionDropDownList.SelectedValue
                         select new { c.ExamSessionId, c.ExamSessionName };

        examSessionDropDownList.DataSource = getSection;
        examSessionDropDownList.DataValueField = "ExamSessionId";
        examSessionDropDownList.DataTextField = "ExamSessionName";
        examSessionDropDownList.DataBind();
        examSessionDropDownList.Items.Insert(0, new ListItem("--Select--", "0"));
    }
    protected void fullResultButton_Click(object sender, EventArgs e)
    {
        GetAllData();
        //btnValue = 1;
        Session["btnval"] = 1.ToString();
        LoadAwardReport();
        //else if (levelDropDownList.SelectedValue == "O-LEVEL" && boardDropDownList.SelectedValue == "CAMBRIDGE")
        //{
        //    rd.Load(Path.Combine(Server.MapPath("~/Reports"), "BROLevelCam.rpt"));
        //    var textObject1 = rd.ReportDefinition.ReportObjects["title"] as TextObject;
        //    if (textObject1 != null) textObject1.Text = "O-LEVEL RESULT'S " + examSessionDropDownList.SelectedItem.Text;
        //    rd.RecordSelectionFormula = formulaString;
        //}
        //else if (levelDropDownList.SelectedValue == "A-LEVEL" && boardDropDownList.SelectedValue == "EDEXCEL")
        //{
        //    rd.Load(Path.Combine(Server.MapPath("~/Reports"), "BRALevelEdexcel.rpt"));
        //    var textObject1 = rd.ReportDefinition.ReportObjects["title"] as TextObject;
        //    if (textObject1 != null) textObject1.Text = "A-LEVEL RESULT'S " + examSessionDropDownList.SelectedItem.Text;
        //    rd.RecordSelectionFormula = formulaString;
        //}
        //else if (levelDropDownList.SelectedValue == "A-LEVEL" && boardDropDownList.SelectedValue == "CAMBRIDGE")
        //{
        //    rd.Load(Path.Combine(Server.MapPath("~/Reports"), "BRAlevelCam.rpt"));
        //    var textObject1 = rd.ReportDefinition.ReportObjects["title"] as TextObject;
        //    if (textObject1 != null) textObject1.Text = "A-LEVEL RESULT'S " + examSessionDropDownList.SelectedItem.Text;
        //    rd.RecordSelectionFormula = formulaString;
        //}

        //reportName = "Board Exam Result";

        //rd.ExportToHttpResponse(ExportFormatType.PortableDocFormat, System.Web.HttpContext.Current.Response, false, reportName);
        //Response.Buffer = false;
        //Response.ClearContent();



    }
    protected void totalGradeButton_Click(object sender, EventArgs e)
    {
        Session["btnval"] = 3.ToString();
        GetAllData();
        LoadAwardReport();
        //var rd = new ReportDocument();
        //try
        //{
        //    int branchId = Convert.ToInt32(Session["VarBranchId"]);
        //    Branch branchInitial = db.Branches.FirstOrDefault(c => c.VarBranchID == branchId);
        //    string reportName = null;
        //    if (levelDropDownList.SelectedValue == "O-LEVEL" && boardDropDownList.SelectedValue == "EDEXCEL")
        //    {
        //        rd.Load(Path.Combine(Server.MapPath("~/Reports"), "GradeWiseTopSheetOLevelEdexcel.rpt"));
        //        var textObject1 = rd.ReportDefinition.ReportObjects["title"] as TextObject;
        //        if (textObject1 != null) textObject1.Text = "O-LEVEL RESULT'S " + examSessionDropDownList.SelectedItem.Text;
        //        var textObject2 = rd.ReportDefinition.ReportObjects["branch"] as TextObject;
        //        if (textObject2 != null)
        //            if (branchInitial != null) textObject2.Text = "(" + branchInitial.VarBranchName + ")";
        //    }
        //    else if (levelDropDownList.SelectedValue == "O-LEVEL" && boardDropDownList.SelectedValue == "CAMBRIDGE")
        //    {
        //        rd.Load(Path.Combine(Server.MapPath("~/Reports"), "BROLevelCam.rpt"));
        //        var textObject1 = rd.ReportDefinition.ReportObjects["title"] as TextObject;
        //        if (textObject1 != null) textObject1.Text = "O-LEVEL RESULT'S " + examSessionDropDownList.SelectedItem.Text;

        //    }
        //    else if (levelDropDownList.SelectedValue == "A-LEVEL" && boardDropDownList.SelectedValue == "EDEXCEL")
        //    {
        //        rd.Load(Path.Combine(Server.MapPath("~/Reports"), "BRALevelEdexcel.rpt"));
        //        var textObject1 = rd.ReportDefinition.ReportObjects["title"] as TextObject;
        //        if (textObject1 != null) textObject1.Text = "A-LEVEL RESULT'S " + examSessionDropDownList.SelectedItem.Text;

        //    }
        //    else if (levelDropDownList.SelectedValue == "A-LEVEL" && boardDropDownList.SelectedValue == "CAMBRIDGE")
        //    {
        //        rd.Load(Path.Combine(Server.MapPath("~/Reports"), "BRAlevelCam.rpt"));
        //        var textObject1 = rd.ReportDefinition.ReportObjects["title"] as TextObject;
        //        if (textObject1 != null) textObject1.Text = "A-LEVEL RESULT'S " + examSessionDropDownList.SelectedItem.Text;

        //    }

        //    reportName = "Board Exam Result";

        //    rd.ExportToHttpResponse(ExportFormatType.PortableDocFormat, System.Web.HttpContext.Current.Response, false, reportName);
        //    Response.Buffer = false;
        //    Response.ClearContent();
        //}
        //catch (Exception ex)
        //{

        //    Response.Write(ex.Message);
        //}
        //finally
        //{
        //    rd.Close();
        //    rd.Dispose();
        //}
    }
    protected void topTenButton_Click(object sender, EventArgs e)
    {
        Session["btnval"] = 2.ToString();
        var delAll = from x in db.TempBoardResultTopSheets
                     select x;
        if (delAll.FirstOrDefault() != null)
        {
            db.TempBoardResultTopSheets.DeleteAllOnSubmit(delAll);
            db.SubmitChanges();
        }
        int position = 0;
        double point = 0;
        GetAllData();
        var getAll = from x in db.TempBoardResults
                     orderby x.Point descending
                     select x;

        foreach (TempBoardResult result in getAll)
        {
            if (position > 9)
            {
                if (result.Point == point)
                {
                    TempBoardResultTopSheet topSheet = new TempBoardResultTopSheet();
                    topSheet.StudentId = result.StudentId;
                    db.TempBoardResultTopSheets.InsertOnSubmit(topSheet);
                    db.SubmitChanges();
                }
                else
                {
                    break;
                }
            }
            else
            {
                TempBoardResultTopSheet topSheet = new TempBoardResultTopSheet();
                topSheet.StudentId = result.StudentId;
                db.TempBoardResultTopSheets.InsertOnSubmit(topSheet);
                db.SubmitChanges();

            }
            position = position + 1;
            if (result.Point != null) point = (double)result.Point;
        }
        LoadAwardReport();
        //var rd = new ReportDocument();
        //try
        //{

        //    string reportName = null;
        //    if (levelDropDownList.SelectedValue == "O-LEVEL" && boardDropDownList.SelectedValue == "EDEXCEL")
        //    {
        //        rd.Load(Path.Combine(Server.MapPath("~/Reports"), "BoardResultTopSheetOLevelEdexcel.rpt"));
        //        var textObject1 = rd.ReportDefinition.ReportObjects["title"] as TextObject;
        //        if (textObject1 != null) textObject1.Text = "O-LEVEL RESULT'S " + examSessionDropDownList.SelectedItem.Text;

        //    }
        //    else if (levelDropDownList.SelectedValue == "O-LEVEL" && boardDropDownList.SelectedValue == "CAMBRIDGE")
        //    {
        //        rd.Load(Path.Combine(Server.MapPath("~/Reports"), "BROLevelCam.rpt"));
        //        var textObject1 = rd.ReportDefinition.ReportObjects["title"] as TextObject;
        //        if (textObject1 != null) textObject1.Text = "O-LEVEL RESULT'S " + examSessionDropDownList.SelectedItem.Text;

        //    }
        //    else if (levelDropDownList.SelectedValue == "A-LEVEL" && boardDropDownList.SelectedValue == "EDEXCEL")
        //    {
        //        rd.Load(Path.Combine(Server.MapPath("~/Reports"), "BRALevelEdexcel.rpt"));
        //        var textObject1 = rd.ReportDefinition.ReportObjects["title"] as TextObject;
        //        if (textObject1 != null) textObject1.Text = "A-LEVEL RESULT'S " + examSessionDropDownList.SelectedItem.Text;

        //    }
        //    else if (levelDropDownList.SelectedValue == "A-LEVEL" && boardDropDownList.SelectedValue == "CAMBRIDGE")
        //    {
        //        rd.Load(Path.Combine(Server.MapPath("~/Reports"), "BRAlevelCam.rpt"));
        //        var textObject1 = rd.ReportDefinition.ReportObjects["title"] as TextObject;
        //        if (textObject1 != null) textObject1.Text = "A-LEVEL RESULT'S " + examSessionDropDownList.SelectedItem.Text;

        //    }

        //    reportName = "Board Exam Result";

        //    rd.ExportToHttpResponse(ExportFormatType.PortableDocFormat, System.Web.HttpContext.Current.Response, false, reportName);
        //    Response.Buffer = false;
        //    Response.ClearContent();
        //}
        //catch (Exception ex)
        //{

        //    Response.Write(ex.Message);
        //}
        //finally
        //{
        //    rd.Close();
        //    rd.Dispose();
        //}
    }
    protected void subCountButton_Click(object sender, EventArgs e)
    {
        Session["btnval"] = 4.ToString();
        GetAllData();
        LoadAwardReport();
        //var rd = new ReportDocument();
        //try
        //{
        //    string reportName = null;
        //    string formulaString = "";
        //    if (levelDropDownList.SelectedValue == "O-LEVEL" && boardDropDownList.SelectedValue == "EDEXCEL")
        //    {
        //        rd.Load(Path.Combine(Server.MapPath("~/Reports"), "BoardResultWithSubCountOLevelEdexcel.rpt"));
        //        var textObject1 = rd.ReportDefinition.ReportObjects["title"] as TextObject;
        //        if (textObject1 != null) textObject1.Text = "O-LEVEL RESULT'S " + examSessionDropDownList.SelectedItem.Text;
        //        rd.RecordSelectionFormula = formulaString;
        //    }
        //    else if (levelDropDownList.SelectedValue == "O-LEVEL" && boardDropDownList.SelectedValue == "CAMBRIDGE")
        //    {
        //        rd.Load(Path.Combine(Server.MapPath("~/Reports"), "BROLevelCam.rpt"));
        //        var textObject1 = rd.ReportDefinition.ReportObjects["title"] as TextObject;
        //        if (textObject1 != null) textObject1.Text = "O-LEVEL RESULT'S " + examSessionDropDownList.SelectedItem.Text;
        //        rd.RecordSelectionFormula = formulaString;
        //    }
        //    else if (levelDropDownList.SelectedValue == "A-LEVEL" && boardDropDownList.SelectedValue == "EDEXCEL")
        //    {
        //        rd.Load(Path.Combine(Server.MapPath("~/Reports"), "BRALevelEdexcel.rpt"));
        //        var textObject1 = rd.ReportDefinition.ReportObjects["title"] as TextObject;
        //        if (textObject1 != null) textObject1.Text = "A-LEVEL RESULT'S " + examSessionDropDownList.SelectedItem.Text;
        //        rd.RecordSelectionFormula = formulaString;
        //    }
        //    else if (levelDropDownList.SelectedValue == "A-LEVEL" && boardDropDownList.SelectedValue == "CAMBRIDGE")
        //    {
        //        rd.Load(Path.Combine(Server.MapPath("~/Reports"), "BRAlevelCam.rpt"));
        //        var textObject1 = rd.ReportDefinition.ReportObjects["title"] as TextObject;
        //        if (textObject1 != null) textObject1.Text = "A-LEVEL RESULT'S " + examSessionDropDownList.SelectedItem.Text;
        //        rd.RecordSelectionFormula = formulaString;
        //    }

        //    reportName = "Board Exam Result";

        //    rd.ExportToHttpResponse(ExportFormatType.PortableDocFormat, System.Web.HttpContext.Current.Response, false, reportName);
        //    Response.Buffer = false;
        //    Response.ClearContent();

        //}
        //catch (Exception ex)
        //{

        //    Response.Write(ex.Message);
        //}
        //finally
        //{
        //    rd.Close();
        //    rd.Dispose();
        //}

    }
    protected void awardStdButton_Click(object sender, EventArgs e)
    {
        Session["btnval"] = 5.ToString();
        var delAll = from x in db.tbl_BoardResultAwards
                     where x.UniqueId == sessionDropDownList.SelectedValue + examSessionDropDownList.SelectedValue
                     select x;
        if (delAll.FirstOrDefault() != null)
        {
            db.tbl_BoardResultAwards.DeleteAllOnSubmit(delAll);
            db.SubmitChanges();
        }
        var getAll = from x in db.tbl_BoardExamResults
                     where x.Class == levelDropDownList.SelectedValue && x.Board == boardDropDownList.SelectedValue && (x.Grade == "A*" || x.Grade == "A")
                     orderby x.VarStudentId
                     select new { x.VarStudentId, x.ExamSession, x.Class, x.Board, x.VarSession, x.SubName, x.Grade };
        foreach (var setData in getAll)
        {
            string grd = "";
            var isExist =
                db.tbl_BoardResultAwards.FirstOrDefault(x => x.StudentId == setData.VarStudentId && x.BoardLevel == setData.Class && x.Board == setData.Board);
            if (isExist != null)
            {

                if (isExist.FromSession != setData.ExamSession)
                {
                    isExist.ToSession = setData.ExamSession;
                }
                else
                {
                    isExist.ToSession = "0";
                }

                isExist.BoardLevel = setData.Class;
                isExist.Board = setData.Board;
                isExist.Session = sessionDropDownList.SelectedValue;
                if (setData.Grade == "A*")
                {
                    isExist.AStarCount += 1;
                    isExist.AstarSubject += setData.SubName + ", ";
                }
                else if (setData.Grade == "A")
                {
                    isExist.ACount += 1;
                    isExist.ASubject += setData.SubName + ", ";
                }
                if (isExist.AStarCount + isExist.ACount > 5)
                {
                    isExist.Status = "Y";
                }
                if (isExist.AStarCount != 0)
                {
                    grd = grd + (isExist.AStarCount).ToString() + "A*,";
                }
                if (isExist.ACount != 0)
                {
                    grd = grd + (isExist.ACount).ToString() + "A";
                }
                isExist.TotalCount = grd;
                if (isExist.Status != "Y")
                {
                    isExist.UniqueId = sessionDropDownList.SelectedValue + examSessionDropDownList.SelectedValue;
                }
                isExist.TotalGrade = isExist.AStarCount + isExist.ACount;
            }
            else
            {
                tbl_BoardResultAward resultAward = new tbl_BoardResultAward();
                resultAward.StudentId = setData.VarStudentId;
                resultAward.FromSession = setData.ExamSession;
                resultAward.BoardLevel = setData.Class;
                resultAward.Board = setData.Board;
                resultAward.Session = sessionDropDownList.SelectedValue;
                if (setData.Grade == "A*")
                {
                    resultAward.AStarCount = 1;
                    resultAward.ACount = 0;
                    resultAward.AstarSubject = setData.SubName + ", ";
                    resultAward.TotalCount = "1A*";
                }
                else if (setData.Grade == "A")
                {
                    resultAward.AStarCount = 0;
                    resultAward.ACount = 1;
                    resultAward.ASubject = setData.SubName + ", ";
                    resultAward.TotalCount = "1A";
                }
                else
                {
                    resultAward.AStarCount = 0;
                    resultAward.AstarSubject = "";
                    resultAward.ASubject = "";
                    resultAward.ACount = 0;
                }
                resultAward.TotalGrade = resultAward.AStarCount + resultAward.ACount;
                resultAward.UniqueId = sessionDropDownList.SelectedValue + examSessionDropDownList.SelectedValue;
                db.tbl_BoardResultAwards.InsertOnSubmit(resultAward);

            }
            db.SubmitChanges();
        }
        LoadAwardReport();
        //else if (levelDropDownList.SelectedValue == "O-LEVEL" && boardDropDownList.SelectedValue == "CAMBRIDGE")
            //{
            //    rd.Load(Path.Combine(Server.MapPath("~/Reports"), "BROLevelCam.rpt"));
            //    var textObject1 = rd.ReportDefinition.ReportObjects["title"] as TextObject;
            //    if (textObject1 != null) textObject1.Text = "O-LEVEL RESULT'S " + examSessionDropDownList.SelectedItem.Text;
            //    rd.RecordSelectionFormula = formulaString;
            //}
            //else if (levelDropDownList.SelectedValue == "A-LEVEL" && boardDropDownList.SelectedValue == "EDEXCEL")
            //{
            //    rd.Load(Path.Combine(Server.MapPath("~/Reports"), "BRALevelEdexcel.rpt"));
            //    var textObject1 = rd.ReportDefinition.ReportObjects["title"] as TextObject;
            //    if (textObject1 != null) textObject1.Text = "A-LEVEL RESULT'S " + examSessionDropDownList.SelectedItem.Text;
            //    rd.RecordSelectionFormula = formulaString;
            //}
            //else if (levelDropDownList.SelectedValue == "A-LEVEL" && boardDropDownList.SelectedValue == "CAMBRIDGE")
            //{
            //    rd.Load(Path.Combine(Server.MapPath("~/Reports"), "BRAlevelCam.rpt"));
            //    var textObject1 = rd.ReportDefinition.ReportObjects["title"] as TextObject;
            //    if (textObject1 != null) textObject1.Text = "A-LEVEL RESULT'S " + examSessionDropDownList.SelectedItem.Text;
            //    rd.RecordSelectionFormula = formulaString;
            //}
    }

    private void LoadAwardReport()
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
        var rd = new ReportDocument();

        string reportName = null;
        if (Convert.ToInt32(Session["btnval"])==1)
        {
            string formulaString = "";
            if (levelDropDownList.SelectedValue == "O-LEVEL" && boardDropDownList.SelectedValue == "EDEXCEL")
            {
                rd.Load(Path.Combine(Server.MapPath("~/Reports"), "BoardResultOLevelEdexcel.rpt"));
                var textObject1 = rd.ReportDefinition.ReportObjects["title"] as TextObject;
                if (textObject1 != null) textObject1.Text = "O-LEVEL RESULT'S " + examSessionDropDownList.SelectedItem.Text;
                rd.RecordSelectionFormula = formulaString;
                BoardResult.ReportSource = rd;
                BoardResult.RefreshReport();
            }
        }
        else if (Convert.ToInt32(Session["btnval"])== 2)
        {
            if (levelDropDownList.SelectedValue == "O-LEVEL" && boardDropDownList.SelectedValue == "EDEXCEL")
            {
                rd.Load(Path.Combine(Server.MapPath("~/Reports"), "BoardResultTopSheetOLevelEdexcel.rpt"));
                var textObject1 = rd.ReportDefinition.ReportObjects["title"] as TextObject;
                if (textObject1 != null) textObject1.Text = "O-LEVEL RESULT'S " + examSessionDropDownList.SelectedItem.Text;
                BoardResult.ReportSource = rd;
                BoardResult.RefreshReport();
            }
        }
        else if (Convert.ToInt32(Session["btnval"])== 3)
        {
            int branchId = Convert.ToInt32(Session["VarBranchId"]);
            Branch branchInitial = db.Branches.FirstOrDefault(c => c.VarBranchID == branchId);
            
            if (levelDropDownList.SelectedValue == "O-LEVEL" && boardDropDownList.SelectedValue == "EDEXCEL")
            {
                rd.Load(Path.Combine(Server.MapPath("~/Reports"), "GradeWiseTopSheetOLevelEdexcel.rpt"));
                var textObject1 = rd.ReportDefinition.ReportObjects["title"] as TextObject;
                if (textObject1 != null) textObject1.Text = "O-LEVEL RESULT'S " + examSessionDropDownList.SelectedItem.Text;
                var textObject2 = rd.ReportDefinition.ReportObjects["branch"] as TextObject;
                if (textObject2 != null)
                    if (branchInitial != null) textObject2.Text = "(" + branchInitial.VarBranchName + ")";
                BoardResult.ReportSource = rd;
                BoardResult.RefreshReport();
            }
        }
        else if (Convert.ToInt32(Session["btnval"])== 4)
        {
            if (levelDropDownList.SelectedValue == "O-LEVEL" && boardDropDownList.SelectedValue == "EDEXCEL")
            {
                rd.Load(Path.Combine(Server.MapPath("~/Reports"), "BoardResultWithSubCountOLevelEdexcel.rpt"));
                var textObject1 = rd.ReportDefinition.ReportObjects["title"] as TextObject;
                if (textObject1 != null) textObject1.Text = "O-LEVEL RESULT'S " + examSessionDropDownList.SelectedItem.Text;
                BoardResult.ReportSource = rd;
                BoardResult.RefreshReport();
            }
        }
        else if (Convert.ToInt32(Session["btnval"])== 5)
        {
            string uniId = sessionDropDownList.SelectedValue + examSessionDropDownList.SelectedValue;
            if (levelDropDownList.SelectedValue == "O-LEVEL" && boardDropDownList.SelectedValue == "EDEXCEL")
            {
                rd.Load(Path.Combine(Server.MapPath("~/Reports"), "BoardResultAward.rpt"));
                var textObject1 = rd.ReportDefinition.ReportObjects["title"] as TextObject;
                if (textObject1 != null) textObject1.Text = "O-LEVEL RESULT'S " + examSessionDropDownList.SelectedItem.Text;
                BoardResult.ReportSource = rd;
                BoardResult.SelectionFormula = "{tbl_BoardResultAward.UniqueId}='" + uniId +
                                               "'and {tbl_BoardResultAward.TotalGrade}>" + 5;
                BoardResult.RefreshReport();
            }
        }
        
    }

   
}