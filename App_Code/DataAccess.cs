using System;
using System.Collections.Generic;
using System.Data;
using MySql.Data.MySqlClient;
using System.Configuration;
using System.ComponentModel;


/// <summary>
/// Summary description for DataAccess
/// </summary>
public class DataAccess
{
    #region Variable declaration
    public bool connection_open;
    public MySqlConnection connection;
    MySqlDataReader DdlValues;
    #endregion

    public DataAccess() { 
        this.connection_open = false;
    }

    public void GetConnection()
    {
        this.connection_open = false;

        this.connection = new MySqlConnection();
        //connection = DB_Connect.Make_Connnection(ConfigurationManager.ConnectionStrings["SQLConnection"].ConnectionString);
        this.connection.ConnectionString = ConfigurationManager.ConnectionStrings["SqlConnection"].ConnectionString;
        if (OpenLocalConnection())
        {
            this.connection_open = true;
        }
        else
        {
            //					MessageBox::Show("No database connection connection made...\n Exiting now", "Database Connection Error");
            //					 Application::Exit();
        }

    }
    public bool OpenLocalConnection()
    {
        try
        {
            this.connection.Open();
            return true;
        }
        catch (Exception e)
        {
            return false;
        }
    }

    public MySqlDataReader ExecStoredprocedurereader(String Procname)
    {
        try
        {
            GetConnection();

            MySqlCommand cmd = new MySqlCommand();
            cmd.Connection = connection;
            cmd.CommandText = Procname;
            cmd.CommandType = CommandType.StoredProcedure;
            MySqlDataReader DdlValues = cmd.ExecuteReader();

            return DdlValues;



        }
        catch (Exception e)
        {
            return DdlValues;
        }

    }

    public void ExecStoredProcedure(String Procname, Dictionary<String, String> ProcParameters)
    {
        this.GetConnection();
        MySqlCommand cmd = new MySqlCommand();
        cmd.Connection = connection;
        cmd.CommandText = Procname;
        cmd.CommandType = CommandType.StoredProcedure;
        foreach (var procParameter in ProcParameters)
        {
            cmd.Parameters.Add(procParameter.Key, procParameter.Value);
        }
        cmd.Parameters.Add("datetime", DateTime.Now);

        cmd.ExecuteNonQuery();
    }

    public DataTable ExecStoredProcedureDataset(String Procname)
    {
        DataSet Dsquestion = new DataSet();
        this.GetConnection();
        MySqlCommand cmd = new MySqlCommand();
        cmd.Connection = connection;
        cmd.CommandText = Procname;
        cmd.CommandType = CommandType.StoredProcedure;

        MySqlDataAdapter adapter = new MySqlDataAdapter(cmd);
        adapter.Fill(Dsquestion);
        return Dsquestion.Tables[0];
    }

    public DataTable ExecStoredProcedureDatasetwithParam(String Procname, Dictionary<String, String> ProcParameters)
    {
        DataSet DsAnswer = new DataSet();
        this.GetConnection();
        MySqlCommand cmd = new MySqlCommand();
        cmd.Connection = connection;
        cmd.CommandText = Procname;
        cmd.CommandType = CommandType.StoredProcedure;
        foreach (var procParameter in ProcParameters)
        {
            cmd.Parameters.Add(procParameter.Key, procParameter.Value);
        }

        MySqlDataAdapter adapter = new MySqlDataAdapter(cmd);
        adapter.Fill(DsAnswer);
        return DsAnswer.Tables[0];
    }

}