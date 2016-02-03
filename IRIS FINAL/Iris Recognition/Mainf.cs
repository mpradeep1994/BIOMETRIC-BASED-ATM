using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using System.IO;
using System.Net.Mail;
using System.Net;
using vb = Microsoft.VisualBasic;
using System.Drawing.Imaging;
using System.Security.Cryptography;
namespace CannyEdgeDetectionCSharp
{
    public partial class Mainf : Form
    {
        public static int MF = 0;
        public SqlConnection con;
        public SqlCommand cmd;
        public SqlDataAdapter adp;
        public DataTable dt= new DataTable();
        public SqlParameter param;
        public Byte[] fn;
        public Byte[] fn1;
        public MemoryStream ms;
        public String CardNO, PinNo,HV;

        Canny CannyData;

        public Mainf()
        {
            InitializeComponent();
        }

        private void Mainf_Load(object sender, EventArgs e)
        {
            label24.BringToFront();
            string str = "Persist Security Info=True; Trusted_Connection=True;Initial Catalog=ATM;Data Source=ADMIN-PC";
            con = new SqlConnection(str);
            con.Open();

            cmd = new SqlCommand();
            cmd.Connection = con;

            adp = new SqlDataAdapter();

            Width = 1000;
            Height = 600;
            Left = Screen.PrimaryScreen.Bounds.Width / 2 - (Width / 2);
            Top = Screen.PrimaryScreen.Bounds.Height / 2 - (Height / 2);
            TabControl1.Visible = false;
            MF = 0;
            Login L=new Login();
            L.ShowDialog();
            if (MF == 1)
            {
                TabControl1.Visible = true;
                TabPage2.Hide();
                TabPage3.Hide();
                tabPage4.Hide();
                TabPage1.Show();
                clr();
            }
            else if (MF == 2)
            {
                TabControl1.Visible = true;
                TabPage1.Hide();
                TabPage2.Hide();
                tabPage4.Hide();
                TabPage3.Show();
            }
            else
                Close();
        }
        public void clr()
        {
            HV = "";
            TextBox1.Text = "";
            TextBox2.Text = "";
            TextBox3.Text = "";
            TextBox4.Text = "";
            ComboBox1.Text = "";
            TextBox5.Text = "";
            TextBox6.Text = "";
            TextBox7.Text = "";
            TextBox8.Text = "";
            fn = File.ReadAllBytes(AppDomain.CurrentDomain.BaseDirectory + "empty.jpg");
            PictureBox1.Image = Image.FromFile(AppDomain.CurrentDomain.BaseDirectory + "empty.jpg");
            fn1 = File.ReadAllBytes(AppDomain.CurrentDomain.BaseDirectory + "empty.jpg");
            PictureBox2.Image = Image.FromFile(AppDomain.CurrentDomain.BaseDirectory + "empty.jpg");
        }

        private void Button3_Click(object sender, EventArgs e)
        {
            OFD1.Filter = "All Files(*.jpg) | *.jpg";
            if (OFD1.ShowDialog() == DialogResult.OK)
            {
                fn = File.ReadAllBytes(OFD1.FileName);
                PictureBox1.Image = Image.FromFile(OFD1.FileName);
            }
        }

        private void DateTimePicker1_ValueChanged(object sender, EventArgs e)
        {
            TextBox2.Text = DateTimePicker1.Value.Date.Day + "/" + DateTimePicker1.Value.Date.Month + "/" + DateTimePicker1.Value.Date.Year;
        }

        private void Button4_Click(object sender, EventArgs e)
        {
            OFD1.Filter = "All Files(*.jpg) | *.jpg";
            if (OFD1.ShowDialog() == DialogResult.OK)
            {
                fn1 = File.ReadAllBytes(OFD1.FileName);
                PictureBox2.Image = Image.FromFile(OFD1.FileName);
                HV = Hash(OFD1.FileName);
            }
        }

        private void Button2_Click(object sender, EventArgs e)
        {
            clr();
        }

        private void Button1_Click(object sender, EventArgs e)
        {
            cmd = new SqlCommand();
            cmd.Connection = con;
            if (string.Compare(Button1.Text, "Update") == 0)
            {
                cmd.CommandText = "UPDATE ACCOUNT1 SET NAME='" + TextBox1.Text + "',DOB='" + TextBox2.Text + "',GENDER='" + ComboBox1.Text + "',ADD1='" + TextBox3.Text + "',ADD2='" + TextBox4.Text + "',STATE='" + TextBox5.Text + "',PIN='" + TextBox6.Text + "',PHNO='" + TextBox7.Text + "',MAILID='" + TextBox8.Text + "',PHOTO=@PHOT,IRIS=@IRS,HKEY='"+ HV +"' WHERE ACCNO=" + L1.Text + "";
                calparam();
                param.ParameterName = "@PHOT";
                param.Value = fn;
                cmd.Parameters.Add(param);

                calparam();
                param.ParameterName = "@IRS";
                param.Value = fn1;
                cmd.Parameters.Add(param);

                cmd.ExecuteNonQuery();
                MessageBox.Show("        Account Information Updated     :   " + L1.Text);
                Button1.Text = "Create Account";
            }
            else
            {
                int id = 0;
                if (TextBox1.Text == "")
                {
                    MessageBox.Show("Please Enter the Name?");
                    TextBox1.Focus();
                }
                else if (TextBox2.Text == "")
                {
                    MessageBox.Show("Please Enter Date of Birth?");
                    TextBox2.Focus();
                }
                else if (ComboBox1.Text == "")
                {
                    MessageBox.Show("Please Select Gender?");
                    ComboBox1.Focus();
                }
                else if (TextBox7.Text == "")
                {
                    MessageBox.Show("Please Enter Phone No.?");
                    TextBox7.Focus();
                }
                else if (TextBox8.Text == "")
                {
                    MessageBox.Show("Please Enter Mail ID?");
                    TextBox8.Focus();
                }
                else
                {
                    
                    cmd = new SqlCommand();
                    cmd.Connection = con;
                    adp = new SqlDataAdapter();
                    cmd.CommandText = "SELECT COUNT(*) FROM ACCOUNT1";
                    adp.SelectCommand = cmd;
                 
                    adp.Fill(dt);
                    id = int.Parse(dt.Rows[0][0].ToString()) + 1;
                    int pinno = 0;
                    for (int i = 0; i <=4; i++)
                        pinno = pinno * 10 + (i * id);
                    int cno = 0;
                    for (int i = 0; i <= 11; i++)
                        cno = cno * 10 + (i * id);
                    cmd.CommandText = "INSERT INTO ACCOUNT1 VALUES(" + id + ",'" + TextBox1.Text + "','" + TextBox2.Text + "','" + ComboBox1.Text + "','" + TextBox3.Text + "','" + TextBox4.Text + "','" + TextBox5.Text + "','" + TextBox6.Text + "','" + TextBox7.Text + "','" + TextBox8.Text + "', @PHOT,@IRIS,'" + pinno + "','" + Math.Abs( cno ) + "','"+ HV +"')";
                    calparam();
                    param.ParameterName = "@PHOT";
                    param.Value = fn;
                    cmd.Parameters.Add(param);

                    calparam();
                    param.ParameterName = "@IRIS";
                    param.Value = fn1;
                    cmd.Parameters.Add(param);
                    cmd.ExecuteNonQuery();
                    sendmail(pinno.ToString(), cno.ToString(), TextBox8.Text);
                    MessageBox.Show("        Account Created     :   " + id + "\n" + "ATM Pin Number Send to Registered Mail ID");
                    Cursor = Cursors.Default;
                    clr();
                    TextBox1.Focus();
                }
            }       
        }
        public void sendmail(String pno, String cno, String mid)
        {
            try
            {
                //String UsrNm = "padmanabansbcec@yahoo.com";
                //String Pwd = "enginee6";
                //String Srve = "smtp.mail.yahoo.com";
                int Int_port = 587;
                SmtpClient SmtpSvr;
                MailMessage E_MAIL;

                SmtpSvr = new SmtpClient();
                E_MAIL = new MailMessage();

                SmtpSvr.UseDefaultCredentials = false;
                SmtpSvr.Credentials = new NetworkCredential("achyuthnagaraj@yahoo.com", "revabalu123");
                SmtpSvr.Port = Int_port;
                SmtpSvr.Host = "smtp.mail.yahoo.com";

                E_MAIL = new MailMessage();
                E_MAIL.From = new MailAddress("achyuthnagaraj@yahoo.com", "Iris Authentication", System.Text.Encoding.UTF8);
                E_MAIL.IsBodyHtml = false;
                E_MAIL.Body = "ATM Card No.: " + cno + "\n" + "PIN No.: " + pno;

                SmtpSvr.EnableSsl = true;

                E_MAIL.To.Add(mid);
                E_MAIL.Subject = "ATM PIN Number";

                Cursor = Cursors.WaitCursor;
                SmtpSvr.Send(E_MAIL);
                //MsgBox("mail sent")
                Cursor = Cursors.Default;
            }
            catch (Exception e)
            {
                MessageBox.Show(e.ToString());
            }
        }
        public void calparam()
        {
            param = new SqlParameter();
            param.SqlDbType = SqlDbType.Image;
        }

        private void Button5_Click(object sender, EventArgs e)
        {
            L1.Text = "";
            String msg = Microsoft.VisualBasic.Interaction.InputBox("Enter the Account Number?", "Iris", "", 500, 250);
            if (msg != "")
            {
                cmd.CommandText = "SELECT * FROM ACCOUNT1 WHERE ACCNO=" + msg + "";
                adp.SelectCommand = cmd;
                dt = new DataTable();
                adp.Fill(dt);
                for (int i = 0; i <= dt.Rows.Count - 1; i++)
                {
                    TextBox1.Text = dt.Rows[i][1].ToString();
                    TextBox2.Text = dt.Rows[i][2].ToString();
                    TextBox3.Text = dt.Rows[i][4].ToString();
                    TextBox4.Text = dt.Rows[i][5].ToString();
                    ComboBox1.Text = dt.Rows[i][3].ToString();
                    TextBox5.Text = dt.Rows[i][6].ToString();
                    TextBox6.Text = dt.Rows[i][7].ToString();
                    TextBox7.Text = dt.Rows[i][8].ToString();
                    TextBox8.Text = dt.Rows[i][9].ToString();

                    byte[] imgBytes = (byte[])dt.Rows[i][10];
                    ms = new MemoryStream(imgBytes);
                    PictureBox1.Image = Image.FromStream(ms);
                    //MessageBox.Show(dt.Rows[i][1].ToString());

                    byte[] imgBytes1 = (byte[])dt.Rows[i][11];
                    ms = new MemoryStream(imgBytes1);
                    PictureBox2.Image = Image.FromStream(ms);
                }
                L1.Text = msg;
                Button1.Text = "Update";
            }
        }

        private void Button18_Click(object sender, EventArgs e)
        {
            if (CText.Text == "")
            {
                MessageBox.Show("Please Enter Card Number?");
                CText.Focus();
            }
            else
            {
                cmd.CommandText = "SELECT ATMPIN FROM ACCOUNT1 WHERE ATMCARD='"+ CText.Text  +"'";
                adp.SelectCommand = cmd;
                dt = new DataTable();
                adp.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    CardNO = CText.Text;
                    PinNo = dt.Rows[0][0].ToString();
                    TabPage3.Hide();
                    TabPage1.Hide();
                    tabPage4.Hide();
                    tabPage5.Hide();
                    TabPage2.Show();
                }
                else
                {
                    MessageBox.Show("Invalid Card Number");
                    CText.Text  = "";
                    T1.Text = "";
                    CardNO = "";
                    PinNo = "";
                }
            }
        }

        private void Label12_Click(object sender, EventArgs e)
        {
            BtnCannyEdgeDetect.Enabled = false;
            PinNo = T1.Text;
            cmd.CommandText = "SELECT ACCNO FROM ACCOUNT1 WHERE ATMCARD='"+ CardNO +"' AND ATMPIN='"+ PinNo +"'";
            adp.SelectCommand = cmd;
            dt = new DataTable();
            adp.Fill(dt);
            if (dt.Rows.Count >0)
            {
                IrisImage.Image=Image.FromFile("empty.jpg");
                GaussianFilteredImage.Image = Image.FromFile("empty.jpg");
                HystThreshImage.Image = Image.FromFile("empty.jpg");
                GNH.Image = Image.FromFile("empty.jpg");
                GNL.Image  = Image.FromFile("empty.jpg");
                CannyEdges.Image = Image.FromFile("empty.jpg");
                //IrisImage.Dispose();
                //GaussianFilteredImage.Dispose();
                //HystThreshImage.Dispose();
                //GNH.Dispose();
                //GNL.Dispose();
                //CannyEdges.Dispose();

                TabPage1.Hide();
                TabPage2.Hide();
                TabPage3.Hide();
                tabPage5.Hide();
                tabPage4.Show();
            }
            else
            {
                MessageBox.Show("Invalid Pin Number");
                TabPage1.Hide();
                TabPage2.Hide();
                tabPage4.Hide();
                tabPage5.Hide();
                CText.Text  = "";
                T1.Text = "";
                CardNO = "";
                PinNo = "";
                TabPage3.Show();
            }
        }

        private void toolStripLabel1_Click(object sender, EventArgs e)
        {
            OpenFileDialog ofd = new OpenFileDialog();
            ofd.Filter = "Bitmap files (*.bmp)|*.bmp|PNG files (*.png)|*.png|TIFF files (*.tif)|*tif|JPEG files (*.jpg)|*.jpg |All files (*.*)|*.*";
            ofd.FilterIndex = 5;
            ofd.RestoreDirectory = true;

            if (ofd.ShowDialog() == DialogResult.OK)
            {

                try
                {
                    BtnCannyEdgeDetect.Enabled = true;
                    HV = Hash(ofd.FileName);
                    IrisImage.Image = Bitmap.FromFile(ofd.FileName);

                }
                catch (ApplicationException ex)
                {
                    MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }

            }
        }

        private void BtnCannyEdgeDetect_Click(object sender, EventArgs e)
        {
            DateTime dt1 = new DateTime();
            DateTime dt2 = new DateTime();
            TimeSpan dt3 = new TimeSpan();
            float TH, TL, Sigma;
            int MaskSize;

            dt1 = DateTime.Now;
            pg1.Value = 0;
            TH = (float)Convert.ToDouble(TxtTH.Text);
            TL = (float)Convert.ToDouble(TxtTL.Text);

            MaskSize = Convert.ToInt32(TxtGMask.Text);
            Sigma = (float)Convert.ToDouble(TxtSigma.Text);
            pg1.Value = 10;
            CannyData = new Canny((Bitmap)IrisImage.Image, TH, TL, MaskSize, Sigma);
            Canny CD = new Canny((Bitmap)IrisImage.Image, TH, TL, MaskSize, Sigma);
            HystThreshImage.Image = CannyData.DisplayImage(CannyData.NonMax);

            GaussianFilteredImage.Image = CannyData.DisplayImage(CannyData.FilteredImage);

            GNL.Image = CannyData.DisplayImage(CannyData.GNL);

            GNH.Image = CannyData.DisplayImage(CannyData.GNH);

            CannyEdges.Image = CannyData.DisplayImage(CannyData.EdgeMap);

            dt2 = DateTime.Now;
            dt3 = dt2 - dt1;
            time.Text = dt3.ToString();
            pg1.Value = 100;

            cmd.CommandText = "SELECT HKEY FROM ACCOUNT1 WHERE ATMCARD='"+ CardNO +"' AND ATMPIN='"+ PinNo +"'";
            adp.SelectCommand = cmd;
            dt = new DataTable();
            adp.Fill(dt);
            String h = dt.Rows[0][0].ToString();
            if (HV==h)
            {
                MessageBox.Show("Iris Verification Sucess");
                //L3.Visible = true;
                //L4.Visible = true;
                L2.Visible = false;
                TabPage1.Hide();
                TabPage2.Hide();
                TabPage3.Hide();
                tabPage4.Hide();
                CText.Text  = "";
                T1.Text  = "";
                CardNO = "";
                PinNo = "";
                L2.Visible = true;
                tabPage5.Show();

                //'System.Threading.Thread.Sleep(1000);
            }
            else
            {
                MessageBox.Show("Verification Failed");
                TabPage1.Hide();
                TabPage2.Hide();
                tabPage5.Hide();
                tabPage4.Hide();
                CText.Text  = "";
                T1.Text  = "";
                CardNO = "";
                PinNo = "";
                TabPage3.Show();
            }
            BtnCannyEdgeDetect.Enabled = false;
        }

        public String Hash(String msg)
        {
            MD5CryptoServiceProvider MD5=new MD5CryptoServiceProvider();
            Byte[] inputBytes  = File.ReadAllBytes(msg);
            Byte[] hash = MD5.ComputeHash(inputBytes);
            String password = BitConverter.ToString(hash).Replace("-", "");
            return password.ToString();
        }
        private void tabPage4_Click(object sender, EventArgs e)
        {

        }

        private void TabPage1_Click(object sender, EventArgs e)
        {

        }

        private void Button12_Click(object sender, EventArgs e)
        {
            if (T1.Text.Length < 4)
            {
                T1.Text = T1.Text + Button12.Text;
            }
        }

        private void Button13_Click(object sender, EventArgs e)
        {
            if (T1.Text.Length < 4)
            {
                T1.Text = T1.Text + Button13.Text;
            }
        }

        private void Button6_Click(object sender, EventArgs e)
        {
            if (T1.Text.Length < 4)
            {
                T1.Text = T1.Text + Button6.Text;
            }
        }

        private void Button7_Click(object sender, EventArgs e)
        {
            if (T1.Text.Length < 4)
            {
                T1.Text = T1.Text + Button7.Text;
            }
        }

        private void Button8_Click(object sender, EventArgs e)
        {
            if (T1.Text.Length < 4)
            {
                T1.Text = T1.Text + Button8.Text;
            }
        }

        private void Button11_Click(object sender, EventArgs e)
        {
            if (T1.Text.Length < 4)
            {
                T1.Text = T1.Text + Button11.Text;
            }
        }

        private void Button10_Click(object sender, EventArgs e)
        {
            if (T1.Text.Length < 4)
            {
                T1.Text = T1.Text + Button12.Text;
            }
        }

        private void Button9_Click(object sender, EventArgs e)
        {
            if (T1.Text.Length < 4)
            {
                T1.Text = T1.Text + Button9.Text;
            }
        }

        private void Button14_Click(object sender, EventArgs e)
        {
            if (T1.Text.Length < 4)
            {
                T1.Text = T1.Text + Button14.Text;
            }
        }

        private void Button17_Click(object sender, EventArgs e)
        {

        }

        private void Button15_Click(object sender, EventArgs e)
        {
            try
            {
                T1.Text = Microsoft.VisualBasic.Strings.Mid(T1.Text, 1, T1.Text.Length - 1);
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message.ToString());
            }
        }

        private void label25_Click(object sender, EventArgs e)
        {
            //L3.Visible = false;
            //L4.Visible = false;
            L2.Visible = true;
            System.Threading.Thread.Sleep(1000);
            TabPage1.Hide();
            TabPage2.Hide();
            tabPage4.Hide();
            tabPage5.Hide();
            T1.Text = "";
            CText.Text ="";
            CardNO = "";
            PinNo = "";
            CText.Focus();
            TabPage3.Show();
        }

        private void label26_Click(object sender, EventArgs e)
        {
            //L3.Visible = false;
            //L4.Visible = false;
            L2.Visible = true;
            System.Threading.Thread.Sleep(1000);
            TabPage1.Hide();
            TabPage2.Hide();
            tabPage4.Hide();
            tabPage5.Hide();
            T1.Text = "";
            CText.Text  = "";
            CardNO = "";
            PinNo = "";
            CText.Focus();
            TabPage3.Show();
        }

        private void button19_Click(object sender, EventArgs e)
        {
            TabPage1.Hide();
            TabPage2.Hide();
            tabPage4.Hide();
            tabPage5.Hide();
            T1.Text = "";
            CText.Text = "";
            CardNO = "";
            PinNo = "";
            CText.Focus();
            TabPage3.Show();
        }

        private void Button16_Click(object sender, EventArgs e)
        {
            if (T1.Text.Length < 4)
            {
                T1.Text = T1.Text + Button16.Text;
            }
        }

        private void IrisImage_Click(object sender, EventArgs e)
        {

        }

        private void GNH_Click(object sender, EventArgs e)
        {

        }
    }
}


