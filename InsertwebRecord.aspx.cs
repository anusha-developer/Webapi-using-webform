using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebapiInsertFromWebform
{
    public partial class InsertwebRecord : System.Web.UI.Page
    {
        protected void page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                FillGridview();
            }
        }
        SqlConnection con = new SqlConnection("data source=.; database=DBEmployee; integrated security=SSPI");
        protected void BtnSave_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("insert into Tbl_Employee values('" + txtEmpName.Text + "','" + txtEmpEmailId.Text + "','" + txtEmpPhoneno.Text + "','" + txtEmpAddress.Text + "')", con);
            cmd.ExecuteNonQuery();
            FillGridview();
            con.Close();
           

        }
        public void FillGridview()
        {
            SqlCommand cmd = new SqlCommand("select * from Tbl_Employee",con);
            SqlDataAdapter sqladr = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sqladr.Fill(dt);
            gvEmployee.DataSource = dt;
            gvEmployee.DataBind();
        }
    }
}
