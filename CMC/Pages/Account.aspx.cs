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
using System.Web.Services.Description;
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
        public static object SaveProfile(string firstName, string lastName, string email, string phone, string address, string passwordHash, string isNew, string clientId = null, string avatar = null)
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

                    byte[] imageBytes = CommonHelper.GetImageBytes(avatar);



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

                    //byte[] imageBytes = ;

                    parameters.Add(new OracleParameter("p_ProfileImage", OracleDbType.Blob)
                    {
                        Value = (object)CommonHelper.GetImageBytes(avatar, "p", resize: true) ?? DBNull.Value
                    });



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
                {
                    rowData = CommonHelper.ConvertDataRowToDictionary(clientData.Rows[0]);

                    // ✅ Convert byte[] image to Base64
                    if (clientData.Rows[0]["PROFILE_IMAGE"] != DBNull.Value)
                    {
                        byte[] imgBytes = (byte[])clientData.Rows[0]["PROFILE_IMAGE"];
                        string base64 = "data:image/png;base64," + Convert.ToBase64String(imgBytes);
                        rowData["PROFILE_IMAGE"] = base64;
                    }
                    else
                    {
                        rowData["PROFILE_IMAGE"] = null;
                    }
                }




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


        #region ADD NEW PROJECT
        [WebMethod]
        public static object SaveCMProject(
            int? projectId,
            string clientCode,
            string clientName,
            string email,
            string phone,
            string otherContacts,
            string projectType,
            string projectAddress,
            string projectDescription,
            decimal? estimatedBudget,
            string timeline,
            DateTime? expectedStartDate,
            DateTime? expectedDeadline,
            string projectName,
            string referenceName

        )
        {
            try
            {

                string approvedStatus = "";
                string approvedBy = "";
                string currentStatus = "";
                string createdBy = "";
                string updatedBy = "";






                var parameters = new List<OracleParameter>();

                // Input parameters
                parameters.Add(new OracleParameter("P_PROJECT_ID", projectId ?? (object)DBNull.Value) { Direction = ParameterDirection.InputOutput });
                parameters.Add(new OracleParameter("P_CLIENT_CODE", clientCode ?? (object)DBNull.Value));
                parameters.Add(new OracleParameter("P_CLIENT_NAME", clientName ?? (object)DBNull.Value));
                parameters.Add(new OracleParameter("P_EMAIL", email ?? (object)DBNull.Value));
                parameters.Add(new OracleParameter("P_PHONE", phone ?? (object)DBNull.Value));
                parameters.Add(new OracleParameter("P_OTHER_CONTACTS", otherContacts ?? (object)DBNull.Value));
                parameters.Add(new OracleParameter("P_PROJECT_TYPE", projectType ?? (object)DBNull.Value));
                parameters.Add(new OracleParameter("P_PROJECT_ADDRESS", projectAddress ?? (object)DBNull.Value));
                parameters.Add(new OracleParameter("P_PROJECT_DESCRIPTION", projectDescription ?? (object)DBNull.Value));
                parameters.Add(new OracleParameter("P_ESTIMATED_BUDGET", estimatedBudget ?? (object)DBNull.Value));
                parameters.Add(new OracleParameter("P_TIMELINE", timeline ?? (object)DBNull.Value));
                parameters.Add(new OracleParameter("P_EXPECTED_START_DATE", expectedStartDate ?? (object)DBNull.Value));
                parameters.Add(new OracleParameter("P_EXPECTED_DEADLINE", expectedDeadline ?? (object)DBNull.Value));
                parameters.Add(new OracleParameter("P_APPROVED_STATUS", approvedStatus ?? (object)DBNull.Value));
                parameters.Add(new OracleParameter("P_APPROVED_BY", approvedBy ?? (object)DBNull.Value));
                parameters.Add(new OracleParameter("P_CURRENT_STATUS", currentStatus ?? (object)DBNull.Value));
                parameters.Add(new OracleParameter("P_CREATED_BY", createdBy ?? (object)DBNull.Value));
                parameters.Add(new OracleParameter("P_UPDATED_BY", updatedBy ?? (object)DBNull.Value));
                parameters.Add(new OracleParameter("P_PROJECT_NAME", projectName ?? (object)DBNull.Value));
                parameters.Add(new OracleParameter("P_REFERENCE_NAME", referenceName?? (object)DBNull.Value));

                // Output parameters
                parameters.Add(new OracleParameter("P_SUCCESS", OracleDbType.Int32) { Direction = ParameterDirection.Output });
                parameters.Add(new OracleParameter("P_MESSAGE", OracleDbType.Varchar2, 500) { Direction = ParameterDirection.Output });

                // Create an instance of OracleHelper to call the non-static method
                var result = OracleHelper.ExecuteProcedureWithCursorSafe("PROC_CM_TPM_SAVE", parameters);

                // Get output values

                bool success = result.Success;
                string message = result.Message;
                int? newProjectId = projectId; // projectId is InputOutput

                return new
                {
                    success = result.Success,
                    message = result.Message,
                    data = (int?)null
                };




            }
            catch (Exception ex)
            {
                return new
                {
                    success = false,
                    message = "Error: " + ex.Message,
                    projectId = (int?)null
                };
            }
        }
        #endregion


        #region GET PROJECT LIST BY CLIENT CODE
    
        [WebMethod]
        public static object GetProjectsByClient(string clientCode)
        {
            try
            {
                var parameters = new List<OracleParameter>();

                // Input
                parameters.Add(new OracleParameter("P_CLIENT_CODE", clientCode ?? (object)DBNull.Value));

                // Output parameters
                var pSuccessParam = new OracleParameter("P_SUCCESS", OracleDbType.Varchar2, 10) { Direction = ParameterDirection.Output };
                var pMessageParam = new OracleParameter("P_MESSAGE", OracleDbType.Varchar2, 500) { Direction = ParameterDirection.Output };
                var pCursorParam = new OracleParameter("P_CURSOR", OracleDbType.RefCursor) { Direction = ParameterDirection.Output };

                parameters.Add(pSuccessParam);
                parameters.Add(pMessageParam);
                parameters.Add(pCursorParam);

                // Execute procedure
                var result = OracleHelper.ExecuteProcedureWithCursorSafe("PROC_CMTPM_GET_PROJECT_LIST", parameters);
                if (!result.Success)
                    return new { success = false, message = result.Message, data = new object[0] };


                //var dataList = CommonHelper.ConvertDataTableToDictionary(result.CursorData);

                DataTable cursorData = result.CursorData;

                var dataList = new List<object>();

                if (cursorData != null && cursorData.Rows.Count > 0)
                {
                    foreach (DataRow row in cursorData.Rows)
                    {
                        dataList.Add(new
                        {
                            ProjectId = row["PROJECT_ID"],
                            ProjectCode = row["PROJECT_CODE"],
                            ProjectName = row["PROJECT_NAME"],
                            ReferenceName = row["REFERENCE_NAME"],
                            ClientName = row["CLIENT_NAME"],
                            Email = row["EMAIL"],
                            Phone = row["PHONE"],
                            ProjectType = row["PROJECT_TYPE"],
                            ProjectAddress = row["PROJECT_ADDRESS"],
                            Budget = row["ESTIMATED_BUDGET"],
                            Timeline = row["TIMELINE"],
                            StartDate = row["EXPECTED_START_DATE"],
                            Deadline = row["EXPECTED_DEADLINE"],
                            Status = row["CURRENT_STATUS"], 
                            ApprovedStatus = row["APPROVED_STATUS"],
                            ApprovedBy = row["APPROVED_BY"],
                            LastUpdated = row["UPDATED_AT"]
                        });
                    }
                }

                    return new { success = true, message = result.Message, data = dataList };
            }
            catch (Exception ex)
            {
                return new
                {
                    success = false,
                    message = "Error: " + ex.Message,
                    data = new object[0]
                };
            }
        }


        #endregion
    }
}