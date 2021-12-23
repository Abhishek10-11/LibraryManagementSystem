using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LibraryManagementSystem
{
    public partial class SignUp : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection("Data Source=LAPTOP-88MGAFOU;Initial Catalog=AM_Library;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string query = "select StateId, StateName from state_master_tbl";
                BindDropDownList(Drpstate, query, "StateName", "StateId", "Select State");
                DrpCity.Enabled = false;
                DrpCity.Items.Insert(0, new ListItem("Select City", "0"));
            }
        }
        private void BindDropDownList(DropDownList ddl, string query, string text, string value, string defaultText)
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand(query,conn);
            SqlDataAdapter sda = new SqlDataAdapter();
            ddl.DataSource = cmd.ExecuteReader();
            ddl.DataTextField = text;
            ddl.DataValueField = value;
            ddl.DataBind();
            conn.Close();
            ddl.Items.Insert(0, new ListItem(defaultText, "0"));
        }
        protected void btnSignup_Click(object sender, EventArgs e)
        {
            string status = "pending";
            string role = "Member";
            conn.Open();

            SqlCommand cm = new SqlCommand("select * from member_master_tbl " +
                "where email='" + TxtEmail.Text + "'", conn);
            SqlDataReader sd = cm.ExecuteReader();
            if(sd.HasRows)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Alerady Inserted');", true);
            }
            else
            {
                sd.Close();
                string statename="";
                string cityname="";
                SqlCommand c = new SqlCommand("SELECT StateName from state_master_tbl " +
                    "where StateId='" + Drpstate.SelectedValue + "';", conn);
                SqlDataAdapter da = new SqlDataAdapter(c);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count >= 1)
                {
                    statename = dt.Rows[0]["StateName"].ToString();
                }

                SqlCommand sm = new SqlCommand("SELECT CityName from city_master_tbl " +
                    "where CityId='" + DrpCity.SelectedValue + "';", conn);
                SqlDataAdapter d = new SqlDataAdapter(sm);
                DataTable dat = new DataTable();
                d.Fill(dat);

                if (dat.Rows.Count >= 1)
                {
                    cityname = dat.Rows[0]["CityName"].ToString();
                }

                SqlCommand cmd = new SqlCommand("insert into member_master_tbl values ('" + TxtFullname.Text + "','" + TxtDob.Text + "','" + TxtCno.Text + "','" + TxtEmail.Text + "'," +
                "'" + statename + "','" + cityname + "','" + Txtpin.Text + "','" + TxtAddress.Text + "','" + Txtpass.Text + "','" + status + "')", conn);
                cmd.ExecuteNonQuery();
                SqlCommand cmmd = new SqlCommand("insert into login_master_tbl values('" + TxtEmail.Text + "'," +
                    "'" + Txtpass.Text + "','" + TxtFullname.Text + "','" + role + "')", conn);
                cmmd.ExecuteNonQuery();
                conn.Close();
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Insert Successfully');window.location='" + Request.ApplicationPath + "SignIn.aspx';", true);
            }
       
        }

        protected void Drpstate_SelectedIndexChanged(object sender, EventArgs e)
        {
            DrpCity.Enabled = false;
            DrpCity.Items.Clear();
            DrpCity.Items.Insert(0, new ListItem("Select City", "0"));
            int stateId = int.Parse(Drpstate.SelectedItem.Value);
            if (stateId > 0)
            {
                string query = string.Format("select CityId, CityName from city_master_tbl where StateId = {0}", stateId);
                BindDropDownList(DrpCity, query, "CityName", "CityId", "Select City");
                DrpCity.Enabled = true;
            }
        }
    }
}