using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LibraryManagementSystem.Admin
{
    public partial class BookInventory : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection("Data Source=LAPTOP-88MGAFOU;Initial Catalog=AM_Library;Integrated Security=True");
        static string global_filepath;
        static int global_actual_stock, global_current_stock, global_issued_books;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //fillAuthorPublisherValues();
            }

            GridBookDetails.DataBind();
        }

        protected void btnGo_Click(object sender, EventArgs e)
        {
            getBookByID();
        }

        void getBookByID()
        {
            try
            {
                SqlCommand cmd = new SqlCommand("SELECT * from book_master_tbl " +
                    "WHERE book_id='" + txtBID.Text + "';", conn);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count >= 1)
                {
                    txtBname.Text = dt.Rows[0]["book_name"].ToString();
                    TxtPublishDate.Text = dt.Rows[0]["publish_date"].ToString();
                    TxtEdition.Text = dt.Rows[0]["edition"].ToString();
                    TxtBookCost.Text = dt.Rows[0]["book_cost"].ToString().Trim();
                    TxtPages.Text = dt.Rows[0]["no_of_page"].ToString().Trim();
                    TxtActualStock.Text = dt.Rows[0]["actual_stock"].ToString().Trim();
                    TxtCurrentStock.Text = dt.Rows[0]["current_stock"].ToString().Trim();
                    TxtBookDesc.Text = dt.Rows[0]["book_description"].ToString();
                    TxtIssuedBook.Text = "" + (Convert.ToInt32(dt.Rows[0]["actual_stock"].ToString()) - Convert.ToInt32(dt.Rows[0]["current_stock"].ToString()));

                    DrpLanguage.SelectedValue = dt.Rows[0]["language"].ToString().Trim();
                    DrpPublisher.SelectedValue = dt.Rows[0]["publisher_name"].ToString().Trim();
                    DrpAuthor.SelectedValue = dt.Rows[0]["author_name"].ToString().Trim();

                    global_actual_stock = Convert.ToInt32(dt.Rows[0]["actual_stock"].ToString().Trim());
                    global_current_stock = Convert.ToInt32(dt.Rows[0]["current_stock"].ToString().Trim());
                    global_issued_books = global_actual_stock - global_current_stock;
                    global_filepath = dt.Rows[0]["book_img_link"].ToString();

                }
                else
                {
                    Response.Write("<script>alert('Invalid Book ID');</script>");
                }

            }
            catch (Exception ex)
            {

            }
        }



        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if (checkIfBookExists())
            {
                Response.Write("<script>alert('Book Already Exists, try some other Book ID');</script>");
            }
            else
            {
                addNewBook();
            }
        }


        bool checkIfBookExists()
        {
            try
            {
                
                SqlCommand cmd = new SqlCommand("SELECT * from book_master_tbl where book_id='" + txtBID.Text + "'" +
                    " OR book_name='" + txtBname.Text + "';", conn);
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

        void addNewBook()
        {
            try
            {
                conn.Open();
                string filepath = "~/book_inventory/books1.png";
                string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
                FileUpload1.SaveAs(Server.MapPath("book_inventory/" + filename));
                filepath = "~/book_inventory/" + filename;

                SqlCommand cmd = new SqlCommand("INSERT INTO book_master_tbl" +
                    "(book_id,book_name,genre,author_name,publisher_name,publish_date,language,edition,book_cost,no_of_page,book_description," +
                    "actual_stock,current_stock,Book_img_link) values(@book_id,@book_name,@genre,@author_name,@publisher_name,@publish_date,@language," +
                    "@edition,@book_cost,@no_of_page,@book_description,@actual_stock,@current_stock,@book_img_link)", conn);

                cmd.Parameters.AddWithValue("@book_id", txtBID.Text);
                cmd.Parameters.AddWithValue("@book_name", txtBname.Text);
                cmd.Parameters.AddWithValue("@genre", DrpGenre.SelectedValue);
                cmd.Parameters.AddWithValue("@author_name", DrpAuthor.SelectedValue);
                cmd.Parameters.AddWithValue("@publisher_name", DrpPublisher.SelectedValue);
                cmd.Parameters.AddWithValue("@publish_date", TxtPublishDate.Text);
                cmd.Parameters.AddWithValue("@language", DrpLanguage.SelectedValue);
                cmd.Parameters.AddWithValue("@edition", TxtEdition.Text);
                cmd.Parameters.AddWithValue("@book_cost", TxtBookCost.Text.Trim());
                cmd.Parameters.AddWithValue("@no_of_page", TxtPages.Text);
                cmd.Parameters.AddWithValue("@book_description", TxtBookDesc.Text);
                cmd.Parameters.AddWithValue("@actual_stock", TxtActualStock.Text);
                cmd.Parameters.AddWithValue("@current_stock", TxtActualStock.Text);
                cmd.Parameters.AddWithValue("@book_img_link", filepath);

                cmd.ExecuteNonQuery();
                conn.Close();
                Response.Write("<script>alert('Book added successfully.');</script>");
                GridBookDetails.DataBind();

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }


        protected void btnUpdate_Click(object sender, EventArgs e)
        {
        //    updateBookByID();
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
        //    deleteBookByID()
        }
    }
}