using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LibraryManagementSystem.Admin
{
    public partial class ManageMember : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection("Data Source=LAPTOP-88MGAFOU;Initial Catalog=AM_Library;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            GridMemberDetails.DataBind();
        }

        protected void btnGo_Click(object sender, EventArgs e)
        {
            getMemberByID();
        }

        void getMemberByID()
        {
            try
            {
                conn.Open();
                SqlCommand c1 = new SqlCommand("select * from member_master_tbl where " +
                    "member_id='" + TxtMID.Text + "'", conn);
                SqlDataReader dr = c1.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        TxtFName.Text = dr.GetValue(0).ToString();
                        TxtAStatus.Text = dr.GetValue(10).ToString();
                        TxtDOB.Text = dr.GetValue(1).ToString();
                        TxtCno.Text = dr.GetValue(2).ToString();
                        TxtEmailID.Text = dr.GetValue(3).ToString();
                        TxtState.Text = dr.GetValue(4).ToString();
                        TxtCity.Text = dr.GetValue(5).ToString();
                        TxtPin.Text = dr.GetValue(6).ToString();
                        TxtAddress.Text = dr.GetValue(7).ToString();

                    }

                }
                else
                {
                    Response.Write("<script>alert('Invalid credentials');</script>");
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
        bool checkIfMemberExists()
        {
            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("SELECT * from member_master_tbl " +
                    "where member_id='" + TxtMID.Text + "';", conn);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count >= 1)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                return false;
            }
        }
        protected void btnActive_Click(object sender, EventArgs e)
        {
            updateMemberStatusByID("active");
        }

        protected void btnPending_Click(object sender, EventArgs e)
        {
            updateMemberStatusByID("pending");
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            updateMemberStatusByID("deactive");
        }
        void updateMemberStatusByID(string status)
        {
            if (checkIfMemberExists())
            {
                try
                {
                    SqlCommand cmd = new SqlCommand("UPDATE member_master_tbl " +
                        "SET account_status='" + status + "' WHERE member_id='" + TxtMID.Text + "'", conn);
                    cmd.ExecuteNonQuery();
                    conn.Close();
                    GridMemberDetails.DataBind();
                    Response.Write("<script>alert('Member Status Updated');</script>");


                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Invalid Member ID');</script>");
            }

        }
        protected void btnDel_Click(object sender, EventArgs e)
        {
            deleteMemberByID();
        }

        void deleteMemberByID()
        {
            if (checkIfMemberExists())
            {
                try
                {

                    SqlCommand cmd = new SqlCommand("delete from member_master_tbl " +
                        "where member_id='" + TxtMID.Text + "'", conn);

                    cmd.ExecuteNonQuery();
                    SqlCommand cm = new SqlCommand("delete from login_master_tbl " +
                        "where username='" + TxtEmailID.Text + "'", conn);
                    cm.ExecuteNonQuery();
                    conn.Close();
                    Response.Write("<script>alert('Member Deleted Successfully');</script>");
                    clearForm();
                    GridMemberDetails.DataBind();

                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }

            }
            else
            {
                Response.Write("<script>alert('Invalid Member ID');</script>");
            }
        }
        void clearForm()
        {
            
            TxtMID.Text = "";
            TxtAStatus.Text = "";
            TxtFName.Text = "";
            TxtDOB.Text = "";
            TxtAddress.Text = "";
            TxtCity.Text = "";
            TxtCno.Text = "";
            TxtEmailID.Text = "";
            TxtPin.Text = "";
            TxtState.Text = "";
        }
    }
}