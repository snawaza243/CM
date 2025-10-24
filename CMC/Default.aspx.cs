using CMC.Controllers;
using CMC.Helper;
using Oracle.ManagedDataAccess.Client;
using Oracle.ManagedDataAccess.Types;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CMC
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        [WebMethod]
        public static object GetCMListServices(string forType, string by, string x, string role, string logId)
        {
            try
            {
                var parameters = new List<OracleParameter>();

                // Input parameters
                parameters.Add(new OracleParameter("P_FOR", forType));
                parameters.Add(new OracleParameter("P_BY", by ?? (object)DBNull.Value));
                parameters.Add(new OracleParameter("P_X", x ?? (object)DBNull.Value));
                parameters.Add(new OracleParameter("P_ROLE", role ?? (object)DBNull.Value));
                parameters.Add(new OracleParameter("P_LOGID", logId ?? (object)DBNull.Value));

                // Output parameters
                parameters.Add(new OracleParameter("P_SUCCESS", OracleDbType.Int32) { Direction = ParameterDirection.Output });
                parameters.Add(new OracleParameter("P_MESSAGE", OracleDbType.Varchar2, 500) { Direction = ParameterDirection.Output });
                parameters.Add(new OracleParameter("P_CURSOR", OracleDbType.RefCursor) { Direction = ParameterDirection.Output });

                var result = OracleHelper.ExecuteProcedureWithCursorSafe("PROC_CMLIST_COMMON", parameters);
                bool success = result.Success;
                string message = result.Message;
                var dataList = CommonHelper.ConvertDataTableToDictionary(result.CursorData);

                return new
                {
                    success = result.Success,
                    message = result.Message,
                    data = dataList
                };
            }
            catch (Exception ex)
            {
                return new
                {
                    success = false,
                    message = "Error: " + ex.Message,
                    data = new List<Dictionary<string, object>>()
                };
            }
        }

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
            string approvedStatus,
            string approvedBy,
            string currentStatus,
            string createdBy,
            string updatedBy
        )
        {
            try
            {
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

                // Output parameters
                parameters.Add(new OracleParameter("P_SUCCESS", OracleDbType.Int32) { Direction = ParameterDirection.Output });
                parameters.Add(new OracleParameter("P_MESSAGE", OracleDbType.Varchar2, 500) { Direction = ParameterDirection.Output });

                // Create an instance of OracleHelper to call the non-static method
                var result = OracleHelper.ExecuteProcedureWithCursorSafe("PROC_CM_TRM_SAVE", parameters);

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
    }
}