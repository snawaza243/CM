using System;
using System.Collections.Generic;

namespace FSCN.Models
{
    public class Invoice
    {
        public decimal InvoiceId { get; set; }
        public decimal ProjectId { get; set; }
        public string InvoiceNumber { get; set; }
        public DateTime InvoiceDate { get; set; }
        public DateTime DueDate { get; set; }
        public string Status { get; set; } = "Draft";
        public decimal TotalAmount { get; set; }
        public decimal TaxAmount { get; set; }
        public string Notes { get; set; }
        public DateTime CreatedDate { get; set; }

        // Navigation properties
        public Project Project { get; set; }
        public List<InvoiceLineItem> LineItems { get; set; } = new List<InvoiceLineItem>();
        public List<Payment> Payments { get; set; } = new List<Payment>();

        // Computed properties
        public decimal AmountDue => TotalAmount - TotalPaid;
        public decimal TotalPaid
        {
            get
            {
                decimal paid = 0;
                foreach (var payment in Payments)
                {
                    paid += payment.Amount;
                }
                return paid;
            }
        }

        public bool IsOverdue => DueDate < DateTime.Now && Status != "Paid" && Status != "Cancelled";
        public bool IsFullyPaid => AmountDue <= 0 && Status == "Paid";

        public string StatusDisplay
        {
            get
            {
                if (IsFullyPaid) return "Paid";
                if (IsOverdue) return "Overdue";
                if (TotalPaid > 0 && AmountDue > 0) return "Partial";
                return Status;
            }
        }
    }
}