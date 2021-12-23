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
    public partial class AuthorManagement : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection("Data Source=LAPTOP-88MGAFOU;Initial Catalog=AM_Library;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            GridAutherInfo.DataBind();
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if (checkIfAuthorExists())
            {
                Response.Write("<script>alert('Author with this ID already Exist. You cannot add another Author with the same Author ID');</script>");
            }
            else
            {
                addNewAuthor();
            }

        }
        void addNewAuthor()
        {
            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("INSERT INTO author_master_tbl values" +
                    "('"+TxtAuthID.Text+"','"+TxtAuthName.Text+"')", conn);

                cmd.ExecuteNonQuery();
                conn.Close();
                Response.Write("<script>alert('Author added Successfully');</script>");
                clearForm();
                GridAutherInfo.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        bool checkIfAuthorExists()
        {
            try
            {
                SqlCommand cmd = new SqlCommand("SELECT * from author_master_tbl where author_id='" + TxtAuthID.Text+ "';", conn);
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
        void clearForm()
        {
            TxtAuthID.Text = "";
            TxtAuthName.Text = "";
        }

        protected void btnGo_Click(object sender, EventArgs e)
        {
            getAuthorByID();
        }

        void getAuthorByID()
        {
            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("SELECT * from author_master_tbl where author_id='" + TxtAuthID.Text.Trim() + "';", conn);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count >= 1)
                {
                    TxtAuthName.Text = dt.Rows[0][1].ToString();
                }
                else
                {
                    Response.Write("<script>alert('Invalid Author ID');</script>");
                }
                conn.Close();

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        protected void btnupdate_Click(object sender, EventArgs e)
        {
            if (checkIfAuthorExists())
            {
                updateAuthor();
            }
            else
            {
                Response.Write("<script>alert('Author does not exist');</script>");
            }
        }

        void updateAuthor()
        {
            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("UPDATE author_master_tbl SET author_name='"+TxtAuthName.Text+"' WHERE author_id='" + TxtAuthID.Text + "'", conn);

                cmd.ExecuteNonQuery();
                conn.Close();
                Response.Write("<script>alert('Author Updated Successfully');</script>");
                clearForm();
                GridAutherInfo.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        protected void btndelete_Click(object sender, EventArgs e)
        {
            if (checkIfAuthorExists())
            {
                deleteAuthor();
            }
            else
            {
                Response.Write("<script>alert('Author does not exist');</script>");
            }
        }
        void deleteAuthor()
        {
            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("DELETE from author_master_tbl WHERE author_id='" + TxtAuthID.Text+ "'", conn);

                cmd.ExecuteNonQuery();
                conn.Close();
                Response.Write("<script>alert('Author Deleted Successfully');</script>");
                clearForm();
                GridAutherInfo.DataBind();

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
    }
}