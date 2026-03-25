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

        
    }
}