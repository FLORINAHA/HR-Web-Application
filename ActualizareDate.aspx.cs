using Oracle.ManagedDataAccess.Client;
using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class ActualizareDate : System.Web.UI.Page
{
    OracleConnection conn;
    OracleCommand cmd;
    OracleDataAdapter da;
    DataSet ds;
    string str, str1;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            Image1.ImageUrl = "~/pic/logo.png";
            Image2.ImageUrl = "~/pic/logo3.png";

            try
            {
                Panel1.Visible = false;
                conn = new OracleConnection("DATA SOURCE=localhost:1521/XE;PASSWORD=STUDENT;PERSIST SECURITY INFO=True;USER ID=STUDENT");
                str = "SELECT * FROM Salariati";
                da = new OracleDataAdapter(str, conn);
                ds = new DataSet();
                da.Fill(ds, "salariati");
                if (ds.Tables[0].Rows.Count == 0)
                {
                    lblError.Text = "Nu exista angajati in baza de date!";
                }
            }
            catch (Exception ex)
            {
                lblError.Text = "Tabela angajatilor nu exista in baza de date!";
            }
        }
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

    protected void btnCauta_Click(object sender, EventArgs e)
    {
        try
        {
            lblError.Text = "";
            conn = new OracleConnection("DATA SOURCE=localhost:1521/XE;PASSWORD=STUDENT;PERSIST SECURITY INFO=True;USER ID=STUDENT");
            str = "SELECT * FROM Salariati WHERE nume='" + txtNumeCautat.Text + "'";
            da = new OracleDataAdapter(str, conn);
            ds = new DataSet();
            da.Fill(ds, "salariati");
            if (ds.Tables[0].Rows.Count == 0)
            {
                lblError.Text = "Nu exista niciun angajat cu numele " + txtNumeCautat.Text;
            }
            else
            {
                // ** Afişează datele
                GridView1.DataSource = ds.Tables["salariati"].DefaultView;
                GridView1.DataBind();
                Panel1.Visible = true;
                txtID.Enabled = false;
                btnActualizare.Enabled = false;
                lblError.Text = "Selectati angajatul pentru a-i actualiza datele!";
                lblError.ForeColor = System.Drawing.Color.Blue;
            }

            txtID.Text = "";
            txtNume.Text = "";
            txtPrenume.Text = "";
            txtFunctie.Text = "";
            txtSalardeBaza.Text = "";
            txtSpor.Text = "";
            txtPremiiBrute.Text = "";
            txtRetineri.Text = "";

        }
        catch (Exception ex)
        {
            lblError.Text = " Introduceti numele angajatului pe care doriti sa-l cautati. ";
        }
    }

    protected void btnActualizare_Click(object sender, EventArgs e)
    {
        try
        {
            conn = new OracleConnection("DATA SOURCE=localhost:1521/XE;PASSWORD=STUDENT;PERSIST SECURITY INFO=True;USER ID=STUDENT");
            conn.Open();

            str = "UPDATE Salariati SET nume = '" + txtNume.Text + "', prenume = '" + txtPrenume.Text + "', functie = '" + txtFunctie.Text + "', salar_baza = " + txtSalardeBaza.Text + ", spor = " + txtSpor.Text + ", premii_brute  = " + txtPremiiBrute.Text + ", retineri  = " + txtRetineri.Text + " WHERE id = " + txtID.Text;
            cmd = new OracleCommand(str, conn);
            cmd.ExecuteNonQuery();
            conn.Close();

            //aici se poate evental reincarca (Refresh) DataGrid
            str1 = "SELECT * FROM Salariati WHERE nume = '" + txtNume.Text + "' AND prenume = '" + txtPrenume.Text + "'";
            da = new OracleDataAdapter(str1, conn);
            ds = new DataSet();
            da.Fill(ds, "salariati");
            GridView1.DataSource = ds.Tables["salariati"].DefaultView;
            GridView1.DataBind();

            lblError.Text = "Datele au fost actualizate cu succes!";
            lblError.ForeColor = System.Drawing.Color.Green;

            txtID.Text = "";
            txtNume.Text = "";
            txtPrenume.Text = "";
            txtFunctie.Text = "";
            txtSalardeBaza.Text = "";
            txtSpor.Text = "";
            txtPremiiBrute.Text = "";
            txtRetineri.Text = "";
            txtNumeCautat.Text = "";
        }
        catch (Exception ex)
        {
            lblError.Text = "Actualizarea datelor nu a fost realizata cu succes!";// + ex.ToString();
            lblError.ForeColor = System.Drawing.Color.Red;
        }
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        txtID.Text = "";
        txtNume.Text = "";
        txtPrenume.Text = "";
        txtFunctie.Text = "";
        txtSalardeBaza.Text = "";
        txtSpor.Text = "";
        txtPremiiBrute.Text = "";
        txtRetineri.Text = "";
        txtNumeCautat.Text = "";
    }

    

    protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
    {
        lblError.Text = "";

        txtID.Text = GridView1.SelectedRow.Cells[1].Text;
        txtNume.Text = GridView1.SelectedRow.Cells[2].Text;
        txtPrenume.Text = GridView1.SelectedRow.Cells[3].Text;
        txtFunctie.Text = GridView1.SelectedRow.Cells[4].Text;
        txtSalardeBaza.Text = GridView1.SelectedRow.Cells[5].Text;
        txtSpor.Text = GridView1.SelectedRow.Cells[6].Text;
        txtPremiiBrute.Text = GridView1.SelectedRow.Cells[7].Text;
        txtRetineri.Text = GridView1.SelectedRow.Cells[13].Text;

        btnActualizare.Enabled = true;
    }
    
}