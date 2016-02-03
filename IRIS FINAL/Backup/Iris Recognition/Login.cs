using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using System.Data.SqlClient;
namespace CannyEdgeDetectionCSharp
{
    public partial class Login : Form
    {
        //SqlConnection con;
        //SqlCommand cmd;
        //SqlDataAdapter adp;
        //DataTable dt;
        public Login()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            if (textBox1.Text == "banking" && textBox2.Text == "banking")
            {
                Mainf.MF = 1;
                Close();
            }
            else if (textBox1.Text == "atm" && textBox2.Text == "atm")
            {
                Mainf.MF = 2;
                Close();
            }
            else
            {
                MessageBox.Show("   Incorrect User Name and Password    ");
                textBox1.Text = "";
                textBox2.Text = "";
                textBox1.Focus();
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            Mainf.MF = 0;
            Close();
        }

        private void Login_Load(object sender, EventArgs e)
        {
            Left = (Screen.PrimaryScreen.Bounds.Width / 2) - (Width / 2);
            Top = (Screen.PrimaryScreen.Bounds.Height / 2) - (Height / 2);

            //con = new SqlConnection("Persist Security Info=True;User ID=sa;Initial Catalog=ATM;Data Source=LAP001\\SQLEXPRESS");
            //con.Open();

            //cmd = new SqlCommand();
            //cmd.Connection = con;

            //adp = new SqlDataAdapter();
        }
    }
}