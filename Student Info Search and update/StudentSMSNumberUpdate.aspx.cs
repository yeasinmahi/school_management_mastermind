using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Student_Info_Search_and_update_StudentSMSNumberUpdate : System.Web.UI.Page
{
    SWISDataContext db=new SWISDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void searchButton_Click(object sender, EventArgs e)
    {
        var getAll = from x in db.Students
            where x.VarSessionName == sessionDropDownList.SelectedValue && x.PClassID == classDropDownList.SelectedValue
                  && x.RecommendAdmissionSection == sectionDropDownList.SelectedValue &&
                  x.VarShiftCode == shiftDropDownList.SelectedValue && x.Status=="P"
                  orderby x.StudentRoll
            select new {x.VarStudentID, FullNAme=x.VarStudentFirstName+" "+x.VarStudentLastName,x.StudentRoll,x.VarStudenHomeCell};
        searchResultGridView.DataSource = getAll.AsEnumerable();
        searchResultGridView.DataBind();
    }
   
    protected void classDropDownList_SelectedIndexChanged1(object sender, EventArgs e)
    {
        sectionDropDownList.Items.Clear();
        sectionDropDownList.Items.Insert(0, new ListItem("--Select--", "0"));
    }
    protected void saveButton_Click(object sender, EventArgs e)
    {
        foreach (GridViewRow gvrow in searchResultGridView.Rows)
        {
            string studentId = ((Label)gvrow.Cells[1].FindControl("studentIdLabel")).Text;
            string smsNumber = ((TextBox)gvrow.Cells[4].FindControl("smsNumberTextBox")).Text;

            Student isStudentExist =
                (from d in db.Students
                 where d.VarStudentID == studentId
                 select d).SingleOrDefault();
            if (isStudentExist != null)
            {
                isStudentExist.VarStudenHomeCell = smsNumber;
            }

           

            db.SubmitChanges();
        }
        ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Student SMS Number Updated Successfully!');", true);
        searchResultGridView.DataSource = null;
        searchResultGridView.DataBind();
        classDropDownList.SelectedValue = "0";
        sessionDropDownList.SelectedValue = "0";
        sectionDropDownList.SelectedValue = "0";
        shiftDropDownList.SelectedValue= "0";
    }
}