using CMC.Helper;
using Oracle.ManagedDataAccess.Client;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CMA.Pages
{
    public partial class Projects : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }



        [WebMethod]
        public static object GetTempProjectList(string forType, string by, string x, string role, string logId)
        {
            try
            {
                var parameters = new List<OracleParameter>();

                // Input parameters
                parameters.Add(new OracleParameter("P_FOR", forType));
                parameters.Add(new OracleParameter("P_BY", by ?? (object)DBNull.Value));
                parameters.Add(new OracleParameter("P_BY_VALUE", x ?? (object)DBNull.Value));
                parameters.Add(new OracleParameter("P_LOG_ID", logId ?? (object)DBNull.Value));
                parameters.Add(new OracleParameter("P_ROLE_ID", logId ?? (object)DBNull.Value));

                // Output parameters
                parameters.Add(new OracleParameter("P_SUCCESS", OracleDbType.Varchar2, 10)
                {
                    Direction = ParameterDirection.Output
                });
                parameters.Add(new OracleParameter("P_MESSAGE", OracleDbType.Varchar2, 500)
                {
                    Direction = ParameterDirection.Output
                });
                parameters.Add(new OracleParameter("P_COUNT", OracleDbType.Varchar2, 50)
                {
                    Direction = ParameterDirection.Output
                });
                parameters.Add(new OracleParameter("P_CURSOR", OracleDbType.RefCursor)
                {
                    Direction = ParameterDirection.Output
                });

                // Execute the procedure
                var result = OracleHelper.ExecuteProcedureWithCursorSafe("PROC_CM_GET_DATA_COUNT", parameters);

                // Read output values
                bool success = (parameters.FirstOrDefault(p => p.ParameterName == "P_SUCCESS")?.Value?.ToString() == "1");
                string message = parameters.FirstOrDefault(p => p.ParameterName == "P_MESSAGE")?.Value?.ToString();
                string countValue = parameters.FirstOrDefault(p => p.ParameterName == "P_COUNT")?.Value?.ToString();

                var dataList = CommonHelper.ConvertDataTableToDictionary(result.CursorData);

                return new
                {
                    success = success,
                    message = message,
                    count = countValue,
                    data = dataList
                };

            }
            catch (Exception ex)
            {
                return new
                {
                    success = false,
                    message = "Error: " + ex.Message,
                    count = 0,
                    data = new List<Dictionary<string, object>>()
                };
            }
        }

    }
}