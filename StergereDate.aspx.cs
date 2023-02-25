using Oracle.ManagedDataAccess.Client;
using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class StergereDate : System.Web.UI.Page
{
    OracleConnection conn;
    OracleCommand cmd;
    OracleDataAdapter da;
    DataSet ds;
    string str;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            Image1.ImageUrl = "~/pic/logo.png";
            Image2.ImageUrl = "~/pic/logo3.png";
        }

        btnSterge.Enabled = false;
    }

    protected void Timer1_Tick(object sender, EventArgs e)
    {
        DateTime data = DateTime.Now;
        lblData.Text = data.ToString();

        Random rand = new Random();
        int i = rand.Next(1, 4);
        int j = rand.Next(0, 3);

        string[] sir = new string[100];
        sir[0] = "logo.png";
        sir[1] = "logo2.png";
        sir[2] = "logo3.png";
        Image1.ImageUrl = "~/pic/" + sir[i - 1];
        Image2.ImageUrl = "~/pic/" + sir[j];
    }

    

    protected void btnSterge_Click(object sender, EventArgs e)
    {
        try
        {
            lblError.Text = "";
            conn = new OracleConnection("DATA SOURCE=localhost:1521/XE;PASSWORD=STUDENT;PERSIST SECURITY INFO=True;USER ID=STUDENT");
            conn.Open();
            str = "DELETE FROM Salariati WHERE id = " + txtID.Text + " AND nume = '" + txtNume.Text + "'";
            cmd = new OracleCommand(str, conn);
            cmd.ExecuteNonQuery();

            lblError.Text = "Stergerea angajatului '" + txtNume.Text + "' a fost realizata cu succes!";
            lblError.ForeColor = System.Drawing.Color.Green;

            conn.Close();
            btnSterge.Enabled = false;
            txtID.Text = "";
            txtNume.Text = "";

            str = "SELECT * FROM Salariati";
            da = new OracleDataAdapter(str, conn);
            ds = new DataSet();
            da.Fill(ds, "salariati");
            GridView1.DataSource = ds.Tables["salariati"].DefaultView;
            GridView1.DataBind();
        }
        catch (Exception ex)
        {
            lblError.Text = "Selectati angajatul sau introduceti numele acestuia corect!";
            lblError.ForeColor = System.Drawing.Color.Red;
        }
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        txtNume.Text = "";
        txtID.Text = "";
        btnSterge.Enabled = false;
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        lblError.Text = "";

        txtNume.Text = GridView1.SelectedRow.Cells[2].Text;
        txtID.Text = GridView1.SelectedRow.Cells[1].Text;

        btnSterge.Enabled = true;
    }

    protected void btnCauta_Click(object sender, EventArgs e)
    {

        try
        {
            if (txtNume.Text == "")
            {
                lblError.Text = " Introduceti numele angajatului cautat. ";
                lblError.ForeColor = System.Drawing.Color.Red;
            }
            else
            {
                lblError.Text = "";
                conn = new OracleConnection("DATA SOURCE=localhost:1521/XE;PASSWORD=STUDENT;PERSIST SECURITY INFO=True;USER ID=STUDENT");
                str = "SELECT * FROM Salariati WHERE nume = '" + txtNume.Text + "'";
                da = new OracleDataAdapter(str, conn);
                ds = new DataSet();
                da.Fill(ds, "salariati");
                if (ds.Tables[0].Rows.Count == 0)
                {
                    lblError.Text = "Nu exista angajatul cu numele " + txtNume.Text;
                    lblError.ForeColor = System.Drawing.Color.Red;
                }
                else
                {
                    lblError.Text = "Selectati angajatul pe care doriti sa-l stergeti!";
                    lblError.ForeColor = System.Drawing.Color.Blue;
                   
                    
                }
                // ** Afişează datele
                GridView1.DataSource = ds.Tables["salariati"].DefaultView;
                GridView1.DataBind();
                
            }
        }
        catch (Exception ex)
        {
            lblError.Text = " Introduceti numele angajatului cautat. ";
            lblError.ForeColor = System.Drawing.Color.Red;
        }
    }
}