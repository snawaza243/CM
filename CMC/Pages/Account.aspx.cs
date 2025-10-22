using CMC.Controllers;
using CMC.Helper;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using Oracle.ManagedDataAccess.Client;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CMC.Pages
{
    [System.Web.Script.Services.ScriptService]
    public partial class Account : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            // check session clientID
            string clientId = Session["clientID"]?.ToString();
            if (string.IsNullOrEmpty(clientId))
            {
                //GetClientProfile(clientId);
            }

        }


        [WebMethod]
        public static object SaveProfile(string firstName, string lastName, string email, string phone, string address, string passwordHash, string isNew, string clientId = null)
        {
            try
            {

                // haissing pass
                if (isNew == "new")
                {
                    if (string.IsNullOrEmpty(passwordHash))
                    {
                        string msg= "Error: Password is required for new profiles.";
                        return new
                        {
                            success = false,
                            message = msg,
                            data = (object)null,
                            totalCount = 0
                        };
                    }
                }
                else if (isNew == "view")
                {
                    if (string.IsNullOrEmpty(clientId)) // || !int.TryParse(clientId, out _)
                    {
                        string msg =  "Error: Client details are invalid.";
                        return new
                        {
                            success = false,
                            message = msg,
                            data = (object)null,
                            totalCount = 0
                        };
                    }
                }


                string hashPadd = PasswordHelper.HashPassword(passwordHash);



                var parameters = new List<OracleParameter>();

                if (isNew == "new")
                {

                     


                    parameters.Add(new OracleParameter("p_FirstName", firstName));
                    parameters.Add(new OracleParameter("p_LastName", lastName));
                    parameters.Add(new OracleParameter("p_Email", email));
                    parameters.Add(new OracleParameter("p_Phone", phone ?? (object)DBNull.Value));
                    parameters.Add(new OracleParameter("p_Address", address ?? (object)DBNull.Value));
                    parameters.Add(new OracleParameter("p_PasswordHash", hashPadd ?? (object)DBNull.Value));
                    parameters.Add(new OracleParameter("p_CreatedBy", "WebUser"));

                    parameters.Add(new OracleParameter("p_ClientCode", OracleDbType.Varchar2, 20) { Direction = ParameterDirection.Output });
                    parameters.Add(new OracleParameter("p_Success", OracleDbType.Int32) { Direction = ParameterDirection.Output });
                    parameters.Add(new OracleParameter("p_Message", OracleDbType.Varchar2, 500) { Direction = ParameterDirection.Output });

                    var result = new OracleHelper().ExecuteProcedure("PROC_TC_INSERT", parameters);


                    // Access output values
                    var clientCode = result["p_ClientCode"];
                    var successFlag = result["p_Success"];
                    var message = result["p_Message"];



                    return new
                    {
                        success = (successFlag?.ToString() == "1"),
                        message = message?.ToString(),
                        clientCode = clientCode?.ToString()
                    };

                }
                else if (isNew == "view")
                {

                    var (success, message, newPassword) = CheckOldPasswordAndExtractNew(email, passwordHash);

                    if (!success)
                        return new { success = false, message };

                    string newHash = "";
                    if(success && !string.IsNullOrEmpty(newPassword))
                    {
                        newHash = PasswordHelper.HashPassword(newPassword); // assuming you already have HashPassword()

                    }
                    // Now hash the new password and update DB using your stored procedure



                    parameters.Add(new OracleParameter("P_CLIENTCODE", clientId)); // Convert.ToInt32(clientId)
                    parameters.Add(new OracleParameter("p_FirstName", firstName));
                    parameters.Add(new OracleParameter("p_LastName", lastName));
                    parameters.Add(new OracleParameter("p_Email", email));
                    parameters.Add(new OracleParameter("p_Phone", phone ?? (object)DBNull.Value));
                    parameters.Add(new OracleParameter("p_Address", address ?? (object)DBNull.Value));
                    parameters.Add(new OracleParameter("p_PasswordHash", newHash ?? (object)DBNull.Value));
                    parameters.Add(new OracleParameter("p_ModifiedBy", "WebUser"));

                    parameters.Add(new OracleParameter("p_Success", OracleDbType.Int32) { Direction = ParameterDirection.Output });
                    parameters.Add(new OracleParameter("p_Message", OracleDbType.Varchar2, 500) { Direction = ParameterDirection.Output });


                    // it is return dict type 
                    var result = new OracleHelper().ExecuteProcedure("PROC_TC_UPDATE", parameters);

                    // Access output values
                    var up_clientCode = clientId; // result["p_ClientCode"];
                    var up_successFlag = result["p_Success"];
                    var up_message = result["p_Message"];



                    return new
                    {
                        success = (up_successFlag?.ToString() == "1"),
                        message = up_message?.ToString(),
                        clientCode = up_clientCode?.ToString()
                    };

                }

                return new
                {
                    success = true,
                    message = "Invalid Operation",
                    data = (object)null,
                    totalCount = 0
                };
            }
            catch (Exception ex)
            {
                return new
                {
                    success = true,
                    message = "Error: " + ex.Message,
                    data = (object)null,
                    totalCount = 0
                };
            }
        }

        [WebMethod]
        public static object ClientLogin(string identifier, string inputPassword)
        {
            try
            {
                string clientId = null;
                string emailId = null;
                string phone = null;

                // Determine type of identifier
                if (!string.IsNullOrEmpty(identifier))
                {
                    if (identifier.StartsWith("TC", StringComparison.OrdinalIgnoreCase))
                        clientId = identifier.Substring(2);
                    else if (identifier.Contains("@"))
                        emailId = identifier;
                    else if (identifier.All(char.IsDigit))
                        phone = identifier;
                    else
                        return new { success = false, message = "Invalid login identifier." };
                }

                // Prepare Oracle parameters
                var getUserParams = new List<OracleParameter>
        {
            new OracleParameter("p_ClientID", string.IsNullOrEmpty(clientId) ? (object)DBNull.Value : Convert.ToInt32(clientId)),
            new OracleParameter("p_Email", string.IsNullOrEmpty(emailId) ? (object)DBNull.Value : emailId),
            new OracleParameter("p_Phone", string.IsNullOrEmpty(phone) ? (object)DBNull.Value : phone),
            new OracleParameter("p_ClientCode", OracleDbType.Varchar2, 50) { Direction = ParameterDirection.Output },
            new OracleParameter("p_PasswordHash", OracleDbType.Varchar2, 200) { Direction = ParameterDirection.Output }
        };

                var result = new OracleHelper().ExecuteProcedure("proc_tc_get_user", getUserParams);

                string clientCode = result.ContainsKey("p_ClientCode") ? result["p_ClientCode"]?.ToString() : null;
                string dbHashPass = result.ContainsKey("p_PasswordHash") ? result["p_PasswordHash"]?.ToString() : null;

                // Verify password
                bool isValidPassword = !string.IsNullOrEmpty(inputPassword) && PasswordHelper.VerifyPassword(inputPassword, dbHashPass);

                if (string.IsNullOrEmpty(clientCode))
                    return new { success = false, message = "User not found." };

                if (!isValidPassword)
                    return new { success = false, message = "Invalid password." };

                return new
                {
                    success = true,
                    clientCode = clientCode,
                    message = "Login successful."
                };
            }
            catch (Exception ex)
            {
                return new { success = false, message = "Error: " + ex.Message };
            }
        }


        [WebMethod]
        public static object GetClientProfile(string clientCode)
        {
            try
            {
                var clientParams = new List<OracleParameter>
        {
            new OracleParameter("p_ClientCode", clientCode),
            new OracleParameter("p_Cursor", OracleDbType.RefCursor) { Direction = ParameterDirection.Output }
        };

                DataTable clientData = new OracleHelper().ExecuteProcedureWithCursor("proc_tc_get_by_cc", clientParams);

                Dictionary<string, object> rowData = null;
                if (clientData.Rows.Count > 0)
                    rowData = CommonHelper.ConvertDataRowToDictionary(clientData.Rows[0]);

                return new
                {
                    success = rowData != null,
                    message = rowData != null ? "Data found!" : "No data found.",
                    data = rowData,
                    totalCount = clientData.Rows.Count
                };
            }
            catch (Exception ex)
            {
                return new
                {
                    success = false,
                    message = "Error: " + ex.Message,
                    data = (object)null
                };
            }
        }

        private const string Separator = "@#$PASS@#$";
        public static (bool success, string message, string newPassword) CheckOldPasswordAndExtractNew(string identifier, string passwordHash)
        {
            try
            {
                if (string.IsNullOrEmpty(identifier))
                    return (false, "Identifier is required.", null);

                if (string.IsNullOrEmpty(passwordHash))
                    return (false, "Password data is missing.", null);

                var parts = passwordHash.Split(new[] { Separator }, StringSplitOptions.None);
                if (parts.Length != 2)
                    return (false, $"Invalid format. Expected: newPass{Separator}oldPass", null);

                string newPass = parts[0];
                string oldPass = parts[1];

                if (string.IsNullOrEmpty(oldPass))
                {
                    return (true, "User is not changing password.", newPass);

                }

                // Call your existing ClientLogin web method directly
                var loginResult = ClientLogin(identifier, oldPass);

                // Convert anonymous result into JObject to read properties
                var resultObj = JObject.FromObject(loginResult);
                bool oldPassValid = resultObj["success"]?.ToObject<bool>() ?? false;

                if (!oldPassValid)
                    return (false, "Old password verification failed.", null);

                return (true, "Old password verified successfully.", newPass);
            }
            catch (Exception ex)
            {
                return (false, "Error verifying old password: " + ex.Message, null);
            }
        }



    }
}