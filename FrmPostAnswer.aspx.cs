using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using MySql.Data.MySqlClient;
using System.Configuration;

public partial class FrmPostAnswer : System.Web.UI.Page
{
    #region Variable declaration
    DataAccess ObjDataAccess = new DataAccess();
    DataTable DtAnswer = new DataTable();
    DataTable DtQuestion = new DataTable();
    #endregion
    protected void Page_Load(object sender, EventArgs e)
    {
     
        Dictionary<String, String> ProcParameters = new Dictionary<String, String>()
        {
            { "qid",""+Request.QueryString["questionid"].ToString()+"" },
     
        };
        DtQuestion = ObjDataAccess.ExecStoredProcedureDatasetwithParam("PrcGetQuestionForLabel", ProcParameters);

        this.LblQuestion.Text = DtQuestion.Rows[0].ItemArray[0].ToString();

        DtAnswer = ObjDataAccess.ExecStoredProcedureDatasetwithParam("PrcGetAnswer", ProcParameters);
       if (DtAnswer.Rows.Count!=0)
       {
           this.GvAnswers.DataSource = DtAnswer;
           this.GvAnswers.DataBind();

     
       }
       else
       {
           this.Lblmsg.Text = "No answers posted yet.";
           this.Lblmsg.Visible = true;
          
       }
       
       

   
    }
    protected void BtnPostAnswer_Click(object sender, EventArgs e)
    {

    }
    protected void BtnAnswer_Click(object sender, EventArgs e)
    {
    //    if (TxtPostAnswer.Text==""||TxtPostAnswer.Text==null)
    //    {
    //        LblMsgAns.Visible = true;
    //        LblMsgAns.Text = "Please enter answer.";
           
    //        return;
    //    }
    //    else
    //    {
            Dictionary<String, String> ProcParameters = new Dictionary<String, String>()
        {
            { "questionid",""+Request.QueryString["questionid"].ToString()+"" },
            { "answer",""+ TxtPostAnswer.Text.ToString()+""},
            { "username", ""+Session["username"].ToString()+""},
    
        };


            ObjDataAccess.ExecStoredProcedure("PrcInsTblAnswer", ProcParameters);

            Response.Redirect("FrmPostAnswer.aspx?questionid=" + Request.QueryString["questionid"].ToString() + "");
       // }
       
    }
    protected void BtnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("FrmQuestions.aspx");
    }
}