using FSCN.Data;
using FSCN.Models;
using FSCN.Data;
using FSCN.Models;
using Oracle.ManagedDataAccess.Client;
using System;
using System.Collections.Generic;
using System.Data;

namespace FSCN.Services
{
    public class ProjectService
    {
        public static List<Project> GetAllProjects()
        {
            var projects = new List<Project>();
            string query = @"
                SELECT p.*, c.CompanyName, c.ContactFirstName, c.ContactLastName, 
                       e.FirstName as CreatedByFirstName, e.LastName as CreatedByLastName
                FROM Projects p
                LEFT JOIN Clients c ON p.ClientId = c.ClientId
                LEFT JOIN Employees e ON p.CreatedBy = e.EmployeeId
                ORDER BY p.CreatedDate DESC";

            var dt = OracleHelper.GetDataTable(query);
            foreach (DataRow row in dt.Rows)
            {
                projects.Add(MapDataRowToProject(row));
            }
            return projects;
        }

        public static Project GetProjectById(decimal projectId)
        {
            string query = @"
                SELECT p.*, c.CompanyName, c.ContactFirstName, c.ContactLastName, 
                       e.FirstName as CreatedByFirstName, e.LastName as CreatedByLastName
                FROM Projects p
                LEFT JOIN Clients c ON p.ClientId = c.ClientId
                LEFT JOIN Employees e ON p.CreatedBy = e.EmployeeId
                WHERE p.ProjectId = :ProjectId";

            var parameters = new OracleParameter[] {
                new OracleParameter(":ProjectId", projectId)
            };

            var dt = OracleHelper.GetDataTable(query, parameters);
            if (dt.Rows.Count > 0)
            {
                return MapDataRowToProject(dt.Rows[0]);
            }
            return null;
        }

        public static List<Project> GetProjectsByStatus(string status)
        {
            var projects = new List<Project>();
            string query = @"
                SELECT p.*, c.CompanyName, c.ContactFirstName, c.ContactLastName, 
                       e.FirstName as CreatedByFirstName, e.LastName as CreatedByLastName
                FROM Projects p
                LEFT JOIN Clients c ON p.ClientId = c.ClientId
                LEFT JOIN Employees e ON p.CreatedBy = e.EmployeeId
                WHERE p.Status = :Status
                ORDER BY p.CreatedDate DESC";

            var parameters = new OracleParameter[] {
                new OracleParameter(":Status", status)
            };

            var dt = OracleHelper.GetDataTable(query, parameters);
            foreach (DataRow row in dt.Rows)
            {
                projects.Add(MapDataRowToProject(row));
            }
            return projects;
        }

        public static decimal InsertProject(Project project)
        {
            string query = @"INSERT INTO Projects (ClientId, ProjectName, Description, StartDate, EstimatedEndDate, ActualEndDate, ContractValue, Status, Address, CreatedBy) 
                            VALUES (:ClientId, :ProjectName, :Description, :StartDate, :EstimatedEndDate, :ActualEndDate, :ContractValue, :Status, :Address, :CreatedBy) 
                            RETURNING ProjectId INTO :ProjectId";

            var projectIdParam = new OracleParameter(":ProjectId", OracleDbType.Decimal) { Direction = ParameterDirection.Output };

            var parameters = new OracleParameter[] {
                new OracleParameter(":ClientId", project.ClientId),
                new OracleParameter(":ProjectName", project.ProjectName),
                new OracleParameter(":Description", project.Description ?? (object)DBNull.Value),
                new OracleParameter(":StartDate", project.StartDate ?? (object)DBNull.Value),
                new OracleParameter(":EstimatedEndDate", project.EstimatedEndDate ?? (object)DBNull.Value),
                new OracleParameter(":ActualEndDate", project.ActualEndDate ?? (object)DBNull.Value),
                new OracleParameter(":ContractValue", project.ContractValue),
                new OracleParameter(":Status", project.Status),
                new OracleParameter(":Address", project.Address ?? (object)DBNull.Value),
                new OracleParameter(":CreatedBy", project.CreatedBy),
                projectIdParam
            };

            OracleHelper.ExecuteNonQuery(query, parameters);
            return Convert.ToDecimal(projectIdParam.Value);
        }

        public static int UpdateProject(Project project)
        {
            string query = @"UPDATE Projects SET 
                            ClientId = :ClientId, 
                            ProjectName = :ProjectName,
                            Description = :Description,
                            StartDate = :StartDate,
                            EstimatedEndDate = :EstimatedEndDate,
                            ActualEndDate = :ActualEndDate,
                            ContractValue = :ContractValue,
                            Status = :Status,
                            Address = :Address
                            WHERE ProjectId = :ProjectId";

            var parameters = new OracleParameter[] {
                new OracleParameter(":ClientId", project.ClientId),
                new OracleParameter(":ProjectName", project.ProjectName),
                new OracleParameter(":Description", project.Description ?? (object)DBNull.Value),
                new OracleParameter(":StartDate", project.StartDate ?? (object)DBNull.Value),
                new OracleParameter(":EstimatedEndDate", project.EstimatedEndDate ?? (object)DBNull.Value),
                new OracleParameter(":ActualEndDate", project.ActualEndDate ?? (object)DBNull.Value),
                new OracleParameter(":ContractValue", project.ContractValue),
                new OracleParameter(":Status", project.Status),
                new OracleParameter(":Address", project.Address ?? (object)DBNull.Value),
                new OracleParameter(":ProjectId", project.ProjectId)
            };

            return OracleHelper.ExecuteNonQuery(query, parameters);
        }

        public static int UpdateProjectStatus(decimal projectId, string status)
        {
            string query = "UPDATE Projects SET Status = :Status WHERE ProjectId = :ProjectId";
            var parameters = new OracleParameter[] {
                new OracleParameter(":Status", status),
                new OracleParameter(":ProjectId", projectId)
            };
            return OracleHelper.ExecuteNonQuery(query, parameters);
        }

        public static int DeleteProject(decimal projectId)
        {
            string query = "DELETE FROM Projects WHERE ProjectId = :ProjectId";
            var parameters = new OracleParameter[] {
                new OracleParameter(":ProjectId", projectId)
            };
            return OracleHelper.ExecuteNonQuery(query, parameters);
        }

        // Dashboard statistics
        public static Dictionary<string, int> GetProjectStatistics()
        {
            var stats = new Dictionary<string, int>();
            string query = @"
                SELECT Status, COUNT(*) as Count 
                FROM Projects 
                GROUP BY Status";

            var dt = OracleHelper.GetDataTable(query);
            foreach (DataRow row in dt.Rows)
            {
                stats[row["Status"].ToString()] = Convert.ToInt32(row["Count"]);
            }
            return stats;
        }

        private static Project MapDataRowToProject(DataRow row)
        {
            var project = new Project
            {
                ProjectId = Convert.ToDecimal(row["ProjectId"]),
                ClientId = Convert.ToDecimal(row["ClientId"]),
                ProjectName = row["ProjectName"].ToString(),
                Description = row["Description"]?.ToString(),
                StartDate = row["StartDate"] == DBNull.Value ? null : (DateTime?)Convert.ToDateTime(row["StartDate"]),
                EstimatedEndDate = row["EstimatedEndDate"] == DBNull.Value ? null : (DateTime?)Convert.ToDateTime(row["EstimatedEndDate"]),
                ActualEndDate = row["ActualEndDate"] == DBNull.Value ? null : (DateTime?)Convert.ToDateTime(row["ActualEndDate"]),
                ContractValue = Convert.ToDecimal(row["ContractValue"]),
                Status = row["Status"].ToString(),
                Address = row["Address"]?.ToString(),
                CreatedDate = Convert.ToDateTime(row["CreatedDate"]),
                CreatedBy = Convert.ToDecimal(row["CreatedBy"])
            };

            // Set navigation properties if available
            if (row.Table.Columns.Contains("CompanyName"))
            {
                project.Client = new Client
                {
                    CompanyName = row["CompanyName"].ToString(),
                    ContactFirstName = row["ContactFirstName"]?.ToString(),
                    ContactLastName = row["ContactLastName"]?.ToString()
                };
            }

            if (row.Table.Columns.Contains("CreatedByFirstName"))
            {
                project.CreatedByEmployee = new Employee
                {
                    FirstName = row["CreatedByFirstName"]?.ToString(),
                    LastName = row["CreatedByLastName"]?.ToString()
                };
            }

            return project;
        }
    }
}