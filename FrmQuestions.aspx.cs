using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using MySql.Data.MySqlClient;
using System.Configuration;
using DeveloperForum.App_Code;


public partial class FrmQuestions : System.Web.UI.Page
{
    #region "Variable declaration"
    String StrUsername;
    DataAccess ObjDataAccess = new DataAccess();
    static String KeyUsername = "username";
    #endregion
   
    protected void Page_Load(object sender, EventArgs e)
    {   
        DataTable dtQuestion = new DataTable();
        dtQuestion = ObjDataAccess.ExecStoredProcedureDataset("PrcQuestion");
        this.GvQuestions.DataSource = dtQuestion;
        this.GvQuestions.DataBind();
        PopulateDdlrelatedto();
    }

    protected void BtnAddQuestion_Click(object sender, EventArgs e)
    {
        
    }
    protected void BtnPostQuestion_Click(object sender, EventArgs e)
    {
        if (Session[KeyUsername].ToString() != null)
        {
            this.StrUsername = Session["username"].ToString();
        }
        else
        {
            return;
        }
        Session["relatedto"] = DdlRelatedto.SelectedValue.ToString();
       

        Dictionary<String, String> ProcParameters = new Dictionary<String, String>()
        {
            { "queryid",""+Session["relatedto"].ToString()+"" },
            { "question",""+ TxtPostQuestion.Text.ToString()+""},
            { "username", ""+StrUsername+""},
    
        };


        ObjDataAccess.ExecStoredProcedure("PrcInsTblQuestion", ProcParameters);

        Response.Redirect("FrmQuestions.aspx");
       
    }
    public void PopulateDdlrelatedto()
    {
        MySqlDataReader Ddldata;
        Ddldata = ObjDataAccess.ExecStoredprocedurereader("PrcDdlrelatedto");
        DdlRelatedto.DataSource = Ddldata;
        while (Ddldata.Read() == true)
        {
            ListItem listItem = new ListItem();
            listItem.Text = Ddldata["queryDesc"].ToString();
            listItem.Value = Ddldata["queryid"].ToString();
            DdlRelatedto.Items.Add(listItem);

        }


    }
    protected void GvQuestions_PageIndexChanging(object sender, EventArgs e)
    {

    }
}