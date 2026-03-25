using FSCN.Data;
using FSCN.Models;
using Oracle.ManagedDataAccess.Client;
using System;
using System.Collections.Generic;
using System.Data;

namespace FSCN.Services
{
    public class EmployeeService
    {
        public static List<Employee> GetAllEmployees()
        {
            var employees = new List<Employee>();
            string query = "SELECT * FROM Employees ORDER BY FirstName, LastName";

            var dt = OracleHelper.GetDataTable(query);
            foreach (DataRow row in dt.Rows)
            {
                employees.Add(MapDataRowToEmployee(row));
            }
            return employees;
        }

        public static List<Employee> GetActiveEmployees()
        {
            var employees = new List<Employee>();
            string query = "SELECT * FROM Employees WHERE IsActive = 1 ORDER BY FirstName, LastName";

            var dt = OracleHelper.GetDataTable(query);
            foreach (DataRow row in dt.Rows)
            {
                employees.Add(MapDataRowToEmployee(row));
            }
            return employees;
        }

        public static Employee GetEmployeeById(decimal employeeId)
        {
            string query = "SELECT * FROM Employees WHERE EmployeeId = :EmployeeId";
            var parameters = new OracleParameter[] {
                new OracleParameter(":EmployeeId", employeeId)
            };

            var dt = OracleHelper.GetDataTable(query, parameters);
            if (dt.Rows.Count > 0)
            {
                return MapDataRowToEmployee(dt.Rows[0]);
            }
            return null;
        }

        public static decimal InsertEmployee(Employee employee)
        {
            string query = @"INSERT INTO Employees (FirstName, LastName, Email, Phone, HireDate, Position, HourlyRate, Salary, IsActive) 
                            VALUES (:FirstName, :LastName, :Email, :Phone, :HireDate, :Position, :HourlyRate, :Salary, :IsActive) 
                            RETURNING EmployeeId INTO :EmployeeId";

            var employeeIdParam = new OracleParameter(":EmployeeId", OracleDbType.Decimal) { Direction = ParameterDirection.Output };

            var parameters = new OracleParameter[] {
                new OracleParameter(":FirstName", employee.FirstName),
                new OracleParameter(":LastName", employee.LastName),
                new OracleParameter(":Email", employee.Email ?? (object)DBNull.Value),
                new OracleParameter(":Phone", employee.Phone ?? (object)DBNull.Value),
                new OracleParameter(":HireDate", employee.HireDate),
                new OracleParameter(":Position", employee.Position ?? (object)DBNull.Value),
                new OracleParameter(":HourlyRate", employee.HourlyRate ?? (object)DBNull.Value),
                new OracleParameter(":Salary", employee.Salary ?? (object)DBNull.Value),
                new OracleParameter(":IsActive", employee.IsActive ? 1 : 0),
                employeeIdParam
            };

            OracleHelper.ExecuteNonQuery(query, parameters);
            return Convert.ToDecimal(employeeIdParam.Value);
        }

        public static int UpdateEmployee(Employee employee)
        {
            string query = @"UPDATE Employees SET 
                            FirstName = :FirstName, 
                            LastName = :LastName,
                            Email = :Email,
                            Phone = :Phone,
                            HireDate = :HireDate,
                            Position = :Position,
                            HourlyRate = :HourlyRate,
                            Salary = :Salary,
                            IsActive = :IsActive
                            WHERE EmployeeId = :EmployeeId";

            var parameters = new OracleParameter[] {
                new OracleParameter(":FirstName", employee.FirstName),
                new OracleParameter(":LastName", employee.LastName),
                new OracleParameter(":Email", employee.Email ?? (object)DBNull.Value),
                new OracleParameter(":Phone", employee.Phone ?? (object)DBNull.Value),
                new OracleParameter(":HireDate", employee.HireDate),
                new OracleParameter(":Position", employee.Position ?? (object)DBNull.Value),
                new OracleParameter(":HourlyRate", employee.HourlyRate ?? (object)DBNull.Value),
                new OracleParameter(":Salary", employee.Salary ?? (object)DBNull.Value),
                new OracleParameter(":IsActive", employee.IsActive ? 1 : 0),
                new OracleParameter(":EmployeeId", employee.EmployeeId)
            };

            return OracleHelper.ExecuteNonQuery(query, parameters);
        }

        public static int DeleteEmployee(decimal employeeId)
        {
            string query = "UPDATE Employees SET IsActive = 0 WHERE EmployeeId = :EmployeeId";
            var parameters = new OracleParameter[] {
                new OracleParameter(":EmployeeId", employeeId)
            };
            return OracleHelper.ExecuteNonQuery(query, parameters);
        }

        private static Employee MapDataRowToEmployee(DataRow row)
        {
            return new Employee
            {
                EmployeeId = Convert.ToDecimal(row["EmployeeId"]),
                UserId = row["UserId"]?.ToString(),
                FirstName = row["FirstName"].ToString(),
                LastName = row["LastName"].ToString(),
                Email = row["Email"]?.ToString(),
                Phone = row["Phone"]?.ToString(),
                HireDate = Convert.ToDateTime(row["HireDate"]),
                Position = row["Position"]?.ToString(),
                HourlyRate = row["HourlyRate"] == DBNull.Value ? null : (decimal?)Convert.ToDecimal(row["HourlyRate"]),
                Salary = row["Salary"] == DBNull.Value ? null : (decimal?)Convert.ToDecimal(row["Salary"]),
                IsActive = Convert.ToBoolean(row["IsActive"])
            };
        }
    }
}