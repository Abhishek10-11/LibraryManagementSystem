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
    public partial class PublisherManagement : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection("Data Source=LAPTOP-88MGAFOU;Initial Catalog=AM_Library;Integrated Security=True");

       
        void clearForm()
        {
            TxtPublisherID.Text = "";
            TxtPubName.Text = "";
        }

        protected void btnpubGo_Click(object sender, EventArgs e)
        {
            getPublisherDetails();
        }

        void getPublisherDetails()
        {
            try
            {
                conn.Open();
                SqlCommand c1 = new SqlCommand("Select * from publisher_master_tbl where " +
                    "publisher_id='"+TxtPublisherID.Text+"'", conn);
                SqlDataAdapter s1 = new SqlDataAdapter(c1);
                DataTable d1 = new DataTable();
                s1.Fill(d1);
                if (d1.Rows.Count >= 1)
                {
                    TxtPubName.Text = d1.Rows[0][1].ToString();
                }
                else
                {
                    Response.Write("<script>alert('Invalid Publisher ID');</script>");
                }
                conn.Close();
            }
            catch(Exception e)
            {
                Response.Write("<script>alert('" + e.Message + "');</script>");
            }
        }

        protected void btnAddpub_Click(object sender, EventArgs e)
        {
            if (checkIfPublisherDetailsExists())
            {
                Response.Write("<script>alert('Publisher with this ID already Exist. You cannot add another Publisher with the same Publisher ID');</script>");
            }
            else
            {
                addNewPublisherDetails();
            }
        }

        bool checkIfPublisherDetailsExists()
        {
            try
            {
                SqlCommand c2 = new SqlCommand("SELECT * from publisher_master_tbl where " +
                    "Publisher_id='" + TxtPublisherID.Text + "';", conn);
                SqlDataAdapter s2 = new SqlDataAdapter(c2);
                DataTable d2 = new DataTable();
                s2.Fill(d2);

                if (d2.Rows.Count >= 1)
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

        void addNewPublisherDetails()
        {
            try
            {
                conn.Open();
                SqlCommand c3 = new SqlCommand("INSERT INTO publisher_master_tbl values" +
                    "('" + TxtPublisherID.Text + "','" + TxtPubName.Text + "')", conn);

                c3.ExecuteNonQuery();
                conn.Close();
                Response.Write("<script>alert('Publisher added Successfully');</script>");
                clearForm();
                GridPublisherInfo.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        protected void btnupdatepub_Click(object sender, EventArgs e)
        {
            if (checkIfPublisherDetailsExists())
            {
                updatePublisherDetails();
            }
            else
            {
                Response.Write("<script>alert('Publisher does not exist');</script>");
            }
        }

        void updatePublisherDetails()
        {
            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("UPDATE publisher_master_tbl SET " +
                    "Publisher_name='" + TxtPubName.Text + "' WHERE Publisher_id='" + TxtPublisherID.Text + "'", conn);

                cmd.ExecuteNonQuery();
                conn.Close();
                Response.Write("<script>alert('Publisher Updated Successfully');</script>");
                clearForm();
                GridPublisherInfo.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        protected void btndeletepub_Click(object sender, EventArgs e)
        {
            if (checkIfPublisherDetailsExists())
            {
                deletePublisherDetails();
            }
            else
            {
                Response.Write("<script>alert('Publisher does not exist');</script>");
            }
        }

        void deletePublisherDetails()
        {
            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("DELETE from publisher_master_tbl WHERE" +
                    " Publisher_id='" + TxtPublisherID.Text + "'", conn);

                cmd.ExecuteNonQuery();
                conn.Close();
                Response.Write("<script>alert('Publisher Deleted Successfully');</script>");
                clearForm();
                GridPublisherInfo.DataBind();

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

    }
}