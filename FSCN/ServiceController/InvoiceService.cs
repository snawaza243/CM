using FSCN.Data;
using FSCN.Models;
using Oracle.ManagedDataAccess.Client;
using System;
using System.Collections.Generic;
using System.Data;

namespace FSCN.Services
{
    public class InvoiceService
    {
        public static List<Invoice> GetAllInvoices()
        {
            var invoices = new List<Invoice>();
            string query = @"
                SELECT i.*, p.ProjectName, c.CompanyName
                FROM Invoices i
                LEFT JOIN Projects p ON i.ProjectId = p.ProjectId
                LEFT JOIN Clients c ON p.ClientId = c.ClientId
                ORDER BY i.InvoiceDate DESC";

            var dt = OracleHelper.GetDataTable(query);
            foreach (DataRow row in dt.Rows)
            {
                invoices.Add(MapDataRowToInvoice(row));
            }
            return invoices;
        }

        public static Invoice GetInvoiceById(decimal invoiceId)
        {
            string query = @"
                SELECT i.*, p.ProjectName, c.CompanyName
                FROM Invoices i
                LEFT JOIN Projects p ON i.ProjectId = p.ProjectId
                LEFT JOIN Clients c ON p.ClientId = c.ClientId
                WHERE i.InvoiceId = :InvoiceId";

            var parameters = new OracleParameter[] {
                new OracleParameter(":InvoiceId", invoiceId)
            };

            var dt = OracleHelper.GetDataTable(query, parameters);
            if (dt.Rows.Count > 0)
            {
                var invoice = MapDataRowToInvoice(dt.Rows[0]);
                invoice.LineItems = GetInvoiceLineItems(invoiceId);
                invoice.Payments = GetInvoicePayments(invoiceId);
                return invoice;
            }
            return null;
        }

        public static List<InvoiceLineItem> GetInvoiceLineItems(decimal invoiceId)
        {
            var lineItems = new List<InvoiceLineItem>();
            string query = "SELECT * FROM InvoiceLineItems WHERE InvoiceId = :InvoiceId ORDER BY LineItemId";

            var parameters = new OracleParameter[] {
                new OracleParameter(":InvoiceId", invoiceId)
            };

            var dt = OracleHelper.GetDataTable(query, parameters);
            foreach (DataRow row in dt.Rows)
            {
                lineItems.Add(new InvoiceLineItem
                {
                    LineItemId = Convert.ToDecimal(row["LineItemId"]),
                    InvoiceId = Convert.ToDecimal(row["InvoiceId"]),
                    Description = row["Description"].ToString(),
                    Quantity = Convert.ToDecimal(row["Quantity"]),
                    UnitPrice = Convert.ToDecimal(row["UnitPrice"])
                });
            }
            return lineItems;
        }

        public static List<Payment> GetInvoicePayments(decimal invoiceId)
        {
            var payments = new List<Payment>();
            string query = @"
                SELECT p.*, e.FirstName, e.LastName
                FROM Payments p
                LEFT JOIN Employees e ON p.RecordedBy = e.EmployeeId
                WHERE p.InvoiceId = :InvoiceId
                ORDER BY p.PaymentDate";

            var parameters = new OracleParameter[] {
                new OracleParameter(":InvoiceId", invoiceId)
            };

            var dt = OracleHelper.GetDataTable(query, parameters);
            foreach (DataRow row in dt.Rows)
            {
                payments.Add(new Payment
                {
                    PaymentId = Convert.ToDecimal(row["PaymentId"]),
                    InvoiceId = Convert.ToDecimal(row["InvoiceId"]),
                    Amount = Convert.ToDecimal(row["Amount"]),
                    PaymentDate = Convert.ToDateTime(row["PaymentDate"]),
                    PaymentMethod = row["PaymentMethod"].ToString(),
                    ReferenceNumber = row["ReferenceNumber"]?.ToString(),
                    Notes = row["Notes"]?.ToString(),
                    RecordedBy = Convert.ToDecimal(row["RecordedBy"]),
                    RecordedDate = Convert.ToDateTime(row["RecordedDate"]),
                    RecordedByEmployee = new Employee
                    {
                        FirstName = row["FirstName"]?.ToString(),
                        LastName = row["LastName"]?.ToString()
                    }
                });
            }
            return payments;
        }

        public static decimal InsertInvoice(Invoice invoice)
        {
            string query = @"INSERT INTO Invoices (ProjectId, InvoiceNumber, InvoiceDate, DueDate, Status, TotalAmount, TaxAmount, Notes) 
                            VALUES (:ProjectId, :InvoiceNumber, :InvoiceDate, :DueDate, :Status, :TotalAmount, :TaxAmount, :Notes) 
                            RETURNING InvoiceId INTO :InvoiceId";

            var invoiceIdParam = new OracleParameter(":InvoiceId", OracleDbType.Decimal) { Direction = ParameterDirection.Output };

            var parameters = new OracleParameter[] {
                new OracleParameter(":ProjectId", invoice.ProjectId),
                new OracleParameter(":InvoiceNumber", invoice.InvoiceNumber),
                new OracleParameter(":InvoiceDate", invoice.InvoiceDate),
                new OracleParameter(":DueDate", invoice.DueDate),
                new OracleParameter(":Status", invoice.Status),
                new OracleParameter(":TotalAmount", invoice.TotalAmount),
                new OracleParameter(":TaxAmount", invoice.TaxAmount),
                new OracleParameter(":Notes", invoice.Notes ?? (object)DBNull.Value),
                invoiceIdParam
            };

            OracleHelper.ExecuteNonQuery(query, parameters);
            return Convert.ToDecimal(invoiceIdParam.Value);
        }

        public static int UpdateInvoiceStatus(decimal invoiceId, string status)
        {
            string query = "UPDATE Invoices SET Status = :Status WHERE InvoiceId = :InvoiceId";
            var parameters = new OracleParameter[] {
                new OracleParameter(":Status", status),
                new OracleParameter(":InvoiceId", invoiceId)
            };
            return OracleHelper.ExecuteNonQuery(query, parameters);
        }

        // Generate next invoice number
        public static string GenerateNextInvoiceNumber()
        {
            string query = "SELECT COUNT(*) + 1 FROM Invoices WHERE EXTRACT(YEAR FROM InvoiceDate) = EXTRACT(YEAR FROM SYSDATE)";
            var count = Convert.ToInt32(OracleHelper.ExecuteScalar(query));
            return $"INV-{DateTime.Now:yyyy}-{count:D3}";
        }

        private static Invoice MapDataRowToInvoice(DataRow row)
        {
            return new Invoice
            {
                InvoiceId = Convert.ToDecimal(row["InvoiceId"]),
                ProjectId = Convert.ToDecimal(row["ProjectId"]),
                InvoiceNumber = row["InvoiceNumber"].ToString(),
                InvoiceDate = Convert.ToDateTime(row["InvoiceDate"]),
                DueDate = Convert.ToDateTime(row["DueDate"]),
                Status = row["Status"].ToString(),
                TotalAmount = Convert.ToDecimal(row["TotalAmount"]),
                TaxAmount = Convert.ToDecimal(row["TaxAmount"]),
                Notes = row["Notes"]?.ToString(),
                CreatedDate = Convert.ToDateTime(row["CreatedDate"]),
                Project = new Project
                {
                    ProjectName = row["ProjectName"]?.ToString(),
                    Client = new Client
                    {
                        CompanyName = row["CompanyName"]?.ToString()
                    }
                }
            };
        }
    }
}