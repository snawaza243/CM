using FSCN.Controllers;
using Newtonsoft.Json;
using Oracle.ManagedDataAccess.Client;
using System;
 using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Helpers;
using System.Web.Mvc;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace FSCN
{
    public partial class Login : System.Web.UI.Page



    {

        OracleHelper orcl = new OracleHelper();
        CommonHelper ch = new CommonHelper(); 
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnSignup_Click(object sender, EventArgs e)
        {
            try
            {

                string firstName = txtFirstName.Text.Trim();
                string lastName = txtLastName.Text.Trim();
                string email = txtEmail.Text.Trim();
                string phone = txtPhone.Text.Trim();
                string password = txtPassword.Text.Trim();
                string createdIp = Request.UserHostAddress;
                string marketingEmails = chkMarketingEmails.Checked ? "Y" : "N";
                string termsAccepted = chkTermsAgreement.Checked ? "Y" : "N";

                var parameters = new List<OracleParameter>
{
    new OracleParameter("P_FIRST_NAME", OracleDbType.Varchar2) { Value = firstName },
    new OracleParameter("P_LAST_NAME", OracleDbType.Varchar2) { Value = lastName },
    new OracleParameter("P_EMAIL", OracleDbType.Varchar2) { Value = email },
    new OracleParameter("P_PHONE", OracleDbType.Varchar2) { Value = phone },
    new OracleParameter("P_PASSWORD_HASH", OracleDbType.Varchar2) { Value = PasswordHelper.HashPassword(password) },
    new OracleParameter("P_MARKETING_EMAILS", OracleDbType.Char) { Value = marketingEmails },
    new OracleParameter("P_TERMS_ACCEPTED", OracleDbType.Char) { Value = termsAccepted },
    new OracleParameter("P_CREATED_IP", OracleDbType.Varchar2) { Value = createdIp },
    new OracleParameter("P_USERNAME", OracleDbType.Varchar2) { Value = email },
    new OracleParameter("P_USER_ROLE", OracleDbType.Varchar2) { Value = "USER" },
    new OracleParameter("P_SOURCE", OracleDbType.Varchar2) { Value = "WEB" },
    new OracleParameter("P_STATUS_CODE", OracleDbType.Varchar2, 50) { Direction = ParameterDirection.Output },
    new OracleParameter("P_STATUS_MESSAGE", OracleDbType.Varchar2, 4000) { Direction = ParameterDirection.Output }
};
                var output = orcl.ExecuteProcedure("PROC_TEMP_USER_INSERT", parameters);

                // 5️⃣ Read OUT parameters
                string statusCode = output.ContainsKey("P_STATUS_CODE") ? output["P_STATUS_CODE"].ToString() : "";
                string statusMessage = output.ContainsKey("P_STATUS_MESSAGE") ? output["P_STATUS_MESSAGE"].ToString() : "";

                // 6️⃣ Show message on ASPX page
                ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('{statusMessage}');", true);
                ch.ShowAlert(this, statusMessage);


            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Error: " + ex.Message.Replace("'", "") + "');", true);
                ch.ShowAlert(this, "Error: " + ex.Message.Replace("'", ""));

            }
        }


        protected void btnLogin_Click(object sender, EventArgs e)
        {
            var ch = new FSCN.Controllers.CommonHelper(); // Initialize helper once
            try
            {
                string email = txtLoginEmail.Text.Trim();
                string password = txtLoginPassword.Text.Trim();
                string role = ddlLoginAs.SelectedValue.ToUpper();
                string loginIp = Request.UserHostAddress;
                bool rememberMe = chkLoginRememberMe.Checked; // your checkbox

                // Prepare parameters
                var parameters = new List<OracleParameter>
        {
            new OracleParameter("P_EMAIL", OracleDbType.Varchar2) { Value = email },
            new OracleParameter("P_PASSWORD", OracleDbType.Varchar2) { Value = password },
            new OracleParameter("P_USER_ROLE", OracleDbType.Varchar2) { Value = role },
            new OracleParameter("P_LOGIN_IP", OracleDbType.Varchar2) { Value = loginIp },
            new OracleParameter("P_STATUS_CODE", OracleDbType.Varchar2, 50) { Direction = ParameterDirection.Output },
            new OracleParameter("P_STATUS_MESSAGE", OracleDbType.Varchar2, 4000) { Direction = ParameterDirection.Output }
        };

                // Execute login procedure
                var output = orcl.ExecuteProcedure("PROC_USER_LOGIN", parameters);

                // Read OUT parameters
                string statusCode = output.ContainsKey("P_STATUS_CODE") ? output["P_STATUS_CODE"].ToString() : "";
                string statusMessage = output.ContainsKey("P_STATUS_MESSAGE") ? output["P_STATUS_MESSAGE"].ToString() : "";

                // Show message
                ch.ShowAlert(this, statusMessage);

                if (statusCode == "SUCCESS")
                {
                    if (!PasswordHelper.VerifyPassword(password, statusMessage))
                    {
                        ch.ShowAlert(this, "Invalid password.");
                        return;
                    }

                    // Set session
                    Session["UserEmail"] = email;
                    Session["UserRole"] = role;

                    // Handle Remember Me cookie
                    if (rememberMe)
                    {
                        HttpCookie cookieEmail = new HttpCookie("UserEmail", email);
                        HttpCookie cookieRole = new HttpCookie("UserRole", role);

                        // Set cookie expiration (e.g., 30 days)
                        cookieEmail.Expires = DateTime.Now.AddDays(30);
                        cookieRole.Expires = DateTime.Now.AddDays(30);

                        Response.Cookies.Add(cookieEmail);
                        Response.Cookies.Add(cookieRole);
                    }
                    else
                    {
                        // Remove cookies if exist
                        if (Request.Cookies["UserEmail"] != null)
                        {
                            Response.Cookies["UserEmail"].Expires = DateTime.Now.AddDays(-1);
                        }
                        if (Request.Cookies["UserRole"] != null)
                        {
                            Response.Cookies["UserRole"].Expires = DateTime.Now.AddDays(-1);
                        }
                    }

                    // Redirect to home or dashboard
                    Response.Redirect("~/");
                }
                else
                {
                    ch.ShowAlert(this, statusMessage);
                }
            }
            catch (Exception ex)
            {
                ch.ShowAlert(this, "Error: " + ex.Message.Replace("'", ""));
            }
        }



    }
}