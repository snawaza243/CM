using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using FSCN.Admin; 

namespace FSCN.Admin
{
    public partial class Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //// Check if user is authenticated
                //if (Session["AdminUser"] == null)
                //{
                //    //Response.Redirect("Login.aspx");
                //    //return;
                //}

                //// Set admin name and current date
                //lblAdminName.Text = Session["AdminUser"].ToString();
                //lblCurrentDate.Text = DateTime.Now.ToString("dddd, MMMM dd, yyyy");

                //// Load data
                //LoadRecentProjects();
                //LoadRecentInvoices();
                //LoadProjectStats();
            }
        }

        private void LoadRecentProjects()
        {
            try
            {
                DataTable dt = new DataTable();// DatDashboardService.GetRecentProjects();
                gvRecentProjects.DataSource = dt;
                gvRecentProjects.DataBind();
            }
            catch (Exception ex)
            {
                // Handle error - you could show a message to the user
                System.Diagnostics.Debug.WriteLine("Error loading recent projects: " + ex.Message);
            }
        }

        private void LoadRecentInvoices()
        {
            try
            {
                DataTable dt =  new DataTable();//DashboardService.GetRecentInvoices();
                gvRecentInvoices.DataSource = dt;
                gvRecentInvoices.DataBind();
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("Error loading recent invoices: " + ex.Message);
            }
        }

        private void LoadProjectStats()
        {
            try
            {
                //var stats = ProjectService.GetProjectStatistics();
                //DataTable dt = new DataTable();
                //dt.Columns.Add("Status");
                //dt.Columns.Add("Count", typeof(int));

                //foreach (var stat in stats)
                //{
                //    dt.Rows.Add(stat.Key, stat.Value);
                //}

                //gvProjectStats.DataSource = dt;
                //gvProjectStats.DataBind();
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("Error loading project stats: " + ex.Message);
            }
        }

        // Method to get dashboard statistics (called from aspx)
        public Dictionary<string, object> GetDashboardStats()
        {
            return null;// DashboardService.GetDashboardStats();
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            // Clear session and logout
            Session.Clear();
            Session.Abandon();
            FormsAuthentication.SignOut();
            Response.Redirect("Login.aspx");
        }
    }
}