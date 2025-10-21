using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace CMC.Helper
{
    public class CommonHelper
    {

        public static string CreateJsonResponse(bool success, string message)
        {
            return JsonConvert.SerializeObject(new
            {
                success,
                message
            }, Formatting.None);
        }

        public static Dictionary<string, object> ConvertDataRowToDictionary(DataRow row)
        {
            var dict = new Dictionary<string, object>();
            foreach (DataColumn col in row.Table.Columns)
            {
                dict[col.ColumnName] = row[col] is DBNull ? null : row[col];
            }
            return dict;
        }

    }
}