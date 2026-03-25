using FSCN.Controllers;
using System;
using System.Web;
using System.Web.UI;

namespace FSCN
{
    public partial class SiteMaster : MasterPage, IPostBackEventHandler
    {
        CommonHelper helper = new CommonHelper();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {

                if (Session["UserEmail"] != null)
                {
                    // User is logged in
                    liLogin.Visible = false;
                    liProfile.Visible = true;

                    // Show user's email or name
                    lblUserName.Text = Session["UserEmail"].ToString();
                }
                else
                {
                    // User not logged in
                    liLogin.Visible = true;
                    liProfile.Visible = false;
                }
                }catch(Exception ex)
                {
                    string errMsg = ex.Message;
                   

                    return;
                }
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            // Clear all session data
            Session.Clear();
            Session.Abandon();

            // Optional: clear cookies if you are using "Remember Me"
            if (Request.Cookies["UserEmail"] != null)
            {
                HttpCookie cookie = new HttpCookie("UserEmail")
                {
                    Expires = DateTime.Now.AddDays(-1)
                };
                Response.Cookies.Add(cookie);
            }

            // Redirect to login page
            Response.Redirect("~/Login.aspx");


        }

        protected void lnkProfile_Click(object sender, EventArgs e)
        {

            // Populate modal fields
            lblProfileName.Text = Session["UserName"]?.ToString();
            lblProfileEmail.Text = Session["UserEmail"]?.ToString();

            ScriptManager.RegisterStartupScript(
    UpdatePanelProfile,              // <-- Target the UpdatePanel
    UpdatePanelProfile.GetType(),
    "ShowProfileModal",
    "var profileModal = new bootstrap.Modal(document.getElementById('profileModal')); profileModal.show();",
    true
);

        }


        // ✅ Handle PostBack Events (for showing profile modal)
        public void RaisePostBackEvent(string eventArgument)
        {
            if (eventArgument == "ShowProfile")
            {
                ShowUserProfile();
            }
        }

        // ✅ This function fills profile modal and shows it
        private void ShowUserProfile()
        {
            if (Session["UserEmail"] != null)
            {
                lblProfileEmail.Text = Session["UserEmail"].ToString();
                lblProfileName.Text = Session["UserName"] != null ? Session["UserName"].ToString() : "Guest User";
                lblProfileRole.Text = Session["UserRole"] != null ? Session["UserRole"].ToString() : "User";
                lblProfileDate.Text = DateTime.Now.ToString("dd-MMM-yyyy"); // Replace with DB date if available

                // Open Bootstrap modal
                ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowProfileModal", "$('#profileModal').modal('show');", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "LoginFirst", "alert('Please login to view your profile.');", true);
            }
        }
    }
}
