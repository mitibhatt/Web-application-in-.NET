using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using MySql.Data.MySqlClient;
using System.Configuration;
using System.Web.UI.WebControls;

public partial class Index : System.Web.UI.Page
{
   
    protected void Page_Load(object sender, EventArgs e)
    {
       
    }

    protected void BtnContinue_Click(object sender, EventArgs e)
    {
      if ((TxtUSername.Text == null)||(TxtUSername.Text ==""))
      {
          this.LblMsg.Text = "Please enter username.";
          this.LblMsg.Visible = true;
          return;
      }
      else
      { 
        Session["username"] = TxtUSername.Text.ToString();
        Response.Redirect("FrmQuestions.aspx");
      }
    }
}