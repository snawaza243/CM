using Oracle.ManagedDataAccess.Client;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;

namespace CMC.Controllers
{
    public class OracleHelper
    {
        private static string connectionString = ConfigurationManager.ConnectionStrings["OracleConnection"].ConnectionString;

        public static OracleConnection GetConnection()
        {
            return new OracleConnection(connectionString);
        }

        // Execute Non-Query (INSERT, UPDATE, DELETE)
        public static int ExecuteNonQuery(string query, params OracleParameter[] parameters)
        {
            using (OracleConnection conn = GetConnection())
            {
                conn.Open();
                using (OracleCommand cmd = new OracleCommand(query, conn))
                {
                    cmd.Parameters.AddRange(parameters);
                    return cmd.ExecuteNonQuery();
                }
            }
        }

        // Execute Scalar
        public static object ExecuteScalar(string query, params OracleParameter[] parameters)
        {
            using (OracleConnection conn = GetConnection())
            {
                conn.Open();
                using (OracleCommand cmd = new OracleCommand(query, conn))
                {
                    cmd.Parameters.AddRange(parameters);
                    return cmd.ExecuteScalar();
                }
            }
        }

        // Get DataReader
        public static OracleDataReader ExecuteReader(string query, params OracleParameter[] parameters)
        {
            OracleConnection conn = GetConnection();
            conn.Open();
            OracleCommand cmd = new OracleCommand(query, conn);
            cmd.Parameters.AddRange(parameters);
            return cmd.ExecuteReader(CommandBehavior.CloseConnection);
        }

        // Get DataTable
        public static DataTable GetDataTable(string query, params OracleParameter[] parameters)
        {
            DataTable dt = new DataTable();
            using (OracleConnection conn = GetConnection())
            {
                conn.Open();
                using (OracleCommand cmd = new OracleCommand(query, conn))
                {
                    cmd.Parameters.AddRange(parameters);
                    using (OracleDataAdapter da = new OracleDataAdapter(cmd))
                    {
                        da.Fill(dt);
                    }
                }
            }
            return dt;
        }

        /// <summary>
        /// Executes any stored procedure with parameters.
        /// Returns a dictionary of OUT parameters if any.
        /// </summary>
        public Dictionary<string, object> ExecuteProcedure(string procedureName,List<OracleParameter> parameters)
        {
            var outParams = new Dictionary<string, object>();

            using (OracleConnection conn = new OracleConnection(connectionString))
            {
                conn.Open();
                using (OracleCommand cmd = new OracleCommand(procedureName, conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    // Add all provided parameters
                    if (parameters != null)
                    {
                        cmd.Parameters.AddRange(parameters.ToArray());
                    }

                    // Execute the procedure
                    cmd.ExecuteNonQuery();

                    // Collect OUT and INOUT parameters
                    if (parameters != null)
                    {
                        foreach (var param in parameters)
                        {
                            if (param.Direction == ParameterDirection.Output ||
                                param.Direction == ParameterDirection.InputOutput)
                            {
                                outParams[param.ParameterName] = param.Value;
                            }
                        }
                    }
                }
            }

            return outParams;
        }


        public DataTable ExecuteProcedureWithCursor(string procedureName, List<OracleParameter> parameters)
        {
            DataTable dt = new DataTable();

            using (OracleConnection conn = new OracleConnection(connectionString))
            {
                conn.Open();
                using (OracleCommand cmd = new OracleCommand(procedureName, conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    // Add parameters
                    if (parameters != null)
                    {
                        cmd.Parameters.AddRange(parameters.ToArray());
                    }

                    // Find REF CURSOR parameter
                    OracleParameter cursorParam = null;
                    if (parameters != null)
                    {
                        cursorParam = parameters.FirstOrDefault(p => p.OracleDbType == OracleDbType.RefCursor);
                    }

                    if (cursorParam != null)
                    {
                        using (OracleDataAdapter da = new OracleDataAdapter(cmd))
                        {
                            da.Fill(dt); // Fill DataTable from REF CURSOR
                        }
                    }
                    else
                    {
                        // If no REF CURSOR, just execute normally
                        cmd.ExecuteNonQuery();
                    }
                }
            }

            return dt;
        }


    }
}