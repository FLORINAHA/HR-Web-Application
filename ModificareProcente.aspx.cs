using Oracle.ManagedDataAccess.Client;
using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class ModificareProcente : System.Web.UI.Page
{
    OracleConnection conn;
    OracleCommand cmd;
    OracleDataReader dr;
    OracleDataAdapter da;
    DataSet ds;
    string str;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            Image1.ImageUrl = "~/pic/logo.png";
            Image2.ImageUrl = "~/pic/logo3.png";

            lblCAS.Visible = false;
            lblCASS.Visible = false;
            lblImpozit.Visible = false;

            txtCAS.Visible = false;
            txtCASS.Visible = false;
            txtImpozit.Visible = false;

            btnActualizare.Visible = false;
            btnRenuntare.Visible = false;
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

    protected void btnConectare_Click(object sender, EventArgs e)
    {
        try
        {
            conn = new OracleConnection("DATA SOURCE=localhost:1521/XE;PASSWORD=STUDENT;PERSIST SECURITY INFO=True;USER ID=STUDENT");
            conn.Open();
            str = "SELECT parola FROM Procente WHERE parola = '" + txtParola.Text + "'";
            cmd = new OracleCommand(str, conn);

            dr = cmd.ExecuteReader();
            if (!dr.Read())
            {
                lblError.Text = "Parola este gresita!";
                lblError.ForeColor = System.Drawing.Color.Red;
            }
            else
            {
                btnActualizare.Enabled = true;
                lblError.Text = "Parola este corecta! Acum puteti modifica procentele!";
                lblError.ForeColor = System.Drawing.Color.Green;

               
                str = "SELECT CAS, CASS, impozit FROM Procente WHERE parola = '" + txtParola.Text + "'";
                cmd = new OracleCommand(str, conn);
                dr = cmd.ExecuteReader();
                //citire o linie (prima linie returnata de Select)
                dr.Read();

                float cas, cass, imp;
                cas = float.Parse(dr["CAS"].ToString()) * 100;
                cass = float.Parse(dr["CASS"].ToString()) * 100;
                imp = float.Parse(dr["impozit"].ToString()) * 100;

                //popularea textbox-urilor
                txtCAS.Text = cas.ToString();
                txtCASS.Text = cass.ToString();
                txtImpozit.Text = imp.ToString();

                dr.Close();

                btnRenuntare.Visible = true;
                btnActualizare.Visible = true;
                txtImpozit.Visible = true;
                txtCASS.Visible = true;
                txtCAS.Visible = true;
                lblCAS.Visible = true;
                lblCASS.Visible = true;
                lblImpozit.Visible = true;

                txtParola.Visible = false;
                btnConectare.Visible = false;
                lblParola.Visible = false;

            }

            dr.Close();
            conn.Close();

        }
        catch (Exception ex)
        {
            lblError.Text = "Parola este gresita!";
            lblError.ForeColor = System.Drawing.Color.Red;
        }
    }

    protected void btnRenuntare_Click(object sender, EventArgs e)
    {
        btnRenuntare.Visible = false;
        btnActualizare.Visible = false;
        txtImpozit.Visible = false;
        txtCASS.Visible = false;
        txtCAS.Visible = false;
        lblCAS.Visible = false;
        lblCASS.Visible = false;
        lblImpozit.Visible = false;

        txtParola.Visible = true;
        btnConectare.Visible = true;
        lblParola.Visible = true;
    }

    protected void btnActualizare_Click(object sender, EventArgs e)
    {
        try
        {
            conn = new OracleConnection("DATA SOURCE=localhost:1521/XE;PASSWORD=STUDENT;PERSIST SECURITY INFO=True;USER ID=STUDENT");
            conn.Open();
            float cas, cass, imp;
            cas = float.Parse(txtCAS.Text) / 100;
            cass = float.Parse(txtCASS.Text) / 100;
            imp = float.Parse(txtImpozit.Text) / 100;

            str = "UPDATE Procente SET CAS = " + cas + ", cass = " + cass + ", impozit = " + imp;
            cmd = new OracleCommand(str, conn);
            cmd.ExecuteNonQuery();
            conn.Close();

            lblError.Text = "Procentele au fost actualizate cu succes!";
            lblError.ForeColor = System.Drawing.Color.Green;

        }
        catch(Exception ex)
        {
            lblError.Text = "Procente invalide!";
            lblError.ForeColor = System.Drawing.Color.Red;
        }
    }
}