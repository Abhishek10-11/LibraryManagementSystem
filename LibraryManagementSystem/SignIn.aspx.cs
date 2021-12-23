using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace LibraryManagementSystem
{
    public partial class SignIn : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection("Data Source=LAPTOP-88MGAFOU;Initial Catalog=AM_Library;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {

            string roles = string.Empty;
            conn.Open();
            SqlCommand cmd = new SqlCommand("select * from login_master_tbl where username='"+TxtEmailId.Text+"' and password='"+TxtPassword.Text+"'",conn);
            SqlDataReader r = cmd.ExecuteReader();
            if(r.Read())
            {
                Session["username"] = TxtEmailId.Text;
                roles = r["Role"].ToString();
                
                if(roles=="Admin")
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Login Successfully');window.location='" + Request.ApplicationPath + "Admin/AdminHomePage.aspx';", true);
                }   
                else if(roles=="Member")
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Login Successfully');window.location='" + Request.ApplicationPath + "Member/MemberHomePage.aspx';", true);
                }
                
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Invalid Email Id And Password..!!');", true);
            }

            conn.Close();
        }
    }
}