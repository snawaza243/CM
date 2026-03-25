using FSCN.Data;
using FSCN.Models;
using FSCN.Data;
using Oracle.ManagedDataAccess.Client;
using System;
using System.Collections.Generic;
using System.Data;

namespace FSCN.Services
{
    public class PaymentService
    {
        public static decimal InsertPayment(Payment payment)
        {
            string query = @"INSERT INTO Payments (InvoiceId, Amount, PaymentDate, PaymentMethod, ReferenceNumber, Notes, RecordedBy) 
                            VALUES (:InvoiceId, :Amount, :PaymentDate, :PaymentMethod, :ReferenceNumber, :Notes, :RecordedBy) 
                            RETURNING PaymentId INTO :PaymentId";

            var paymentIdParam = new OracleParameter(":PaymentId", OracleDbType.Decimal) { Direction = ParameterDirection.Output };

            var parameters = new OracleParameter[] {
                new OracleParameter(":InvoiceId", payment.InvoiceId),
                new OracleParameter(":Amount", payment.Amount),
                new OracleParameter(":PaymentDate", payment.PaymentDate),
                new OracleParameter(":PaymentMethod", payment.PaymentMethod),
                new OracleParameter(":ReferenceNumber", payment.ReferenceNumber ?? (object)DBNull.Value),
                new OracleParameter(":Notes", payment.Notes ?? (object)DBNull.Value),
                new OracleParameter(":RecordedBy", payment.RecordedBy),
                paymentIdParam
            };

            OracleHelper.ExecuteNonQuery(query, parameters);

            // Update invoice status if fully paid
            UpdateInvoiceStatusIfPaid(payment.InvoiceId);

            return Convert.ToDecimal(paymentIdParam.Value);
        }

        private static void UpdateInvoiceStatusIfPaid(decimal invoiceId)
        {
            string query = @"
                DECLARE
                    total_amount NUMBER;
                    total_paid NUMBER;
                BEGIN
                    SELECT TotalAmount INTO total_amount FROM Invoices WHERE InvoiceId = :InvoiceId;
                    SELECT NVL(SUM(Amount), 0) INTO total_paid FROM Payments WHERE InvoiceId = :InvoiceId;
                    
                    IF total_paid >= total_amount THEN
                        UPDATE Invoices SET Status = 'Paid' WHERE InvoiceId = :InvoiceId;
                    ELSIF total_paid > 0 THEN
                        UPDATE Invoices SET Status = 'Partial' WHERE InvoiceId = :InvoiceId;
                    END IF;
                END;";

            var parameters = new OracleParameter[] {
                new OracleParameter(":InvoiceId", invoiceId)
            };

            OracleHelper.ExecuteNonQuery(query, parameters);
        }
    }
}