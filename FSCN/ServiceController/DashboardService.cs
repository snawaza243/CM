using FSCN.Data;
using FSCN.Data;
using Oracle.ManagedDataAccess.Client;
using System;
using System.Collections.Generic;
using System.Data;

namespace FSCN.Services
{
    public class DashboardService
    {
        public static Dictionary<string, object> GetDashboardStats()
        {
            var stats = new Dictionary<string, object>();

            // Total Projects
            string projectsQuery = "SELECT COUNT(*) FROM Projects";
            stats["TotalProjects"] = Convert.ToInt32(OracleHelper.ExecuteScalar(projectsQuery));

            // Active Projects
            string activeProjectsQuery = "SELECT COUNT(*) FROM Projects WHERE Status = 'Active'";
            stats["ActiveProjects"] = Convert.ToInt32(OracleHelper.ExecuteScalar(activeProjectsQuery));

            // Total Clients
            string clientsQuery = "SELECT COUNT(*) FROM Clients WHERE IsActive = 1";
            stats["TotalClients"] = Convert.ToInt32(OracleHelper.ExecuteScalar(clientsQuery));

            // Total Revenue
            string revenueQuery = "SELECT NVL(SUM(TotalAmount), 0) FROM Invoices WHERE Status = 'Paid'";
            stats["TotalRevenue"] = Convert.ToDecimal(OracleHelper.ExecuteScalar(revenueQuery));

            // Pending Invoices
            string pendingInvoicesQuery = "SELECT COUNT(*) FROM Invoices WHERE Status IN ('Draft', 'Sent', 'Viewed')";
            stats["PendingInvoices"] = Convert.ToInt32(OracleHelper.ExecuteScalar(pendingInvoicesQuery));

            // Overdue Invoices
            string overdueInvoicesQuery = "SELECT COUNT(*) FROM Invoices WHERE DueDate < SYSDATE AND Status NOT IN ('Paid', 'Cancelled')";
            stats["OverdueInvoices"] = Convert.ToInt32(OracleHelper.ExecuteScalar(overdueInvoicesQuery));

            return stats;
        }

        public static DataTable GetRecentProjects()
        {
            string query = @"
                SELECT p.ProjectName, c.CompanyName, p.Status, p.StartDate, p.EstimatedEndDate
                FROM Projects p
                LEFT JOIN Clients c ON p.ClientId = c.ClientId
                ORDER BY p.CreatedDate DESC
                FETCH FIRST 5 ROWS ONLY";

            return OracleHelper.GetDataTable(query);
        }

        public static DataTable GetRecentInvoices()
        {
            string query = @"
                SELECT i.InvoiceNumber, p.ProjectName, i.TotalAmount, i.Status, i.DueDate
                FROM Invoices i
                LEFT JOIN Projects p ON i.ProjectId = p.ProjectId
                ORDER BY i.CreatedDate DESC
                FETCH FIRST 5 ROWS ONLY";

            return OracleHelper.GetDataTable(query);
        }
    }
}