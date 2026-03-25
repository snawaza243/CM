using System;

namespace FSCN.Models
{
    public class Payment
    {
        public decimal PaymentId { get; set; }
        public decimal InvoiceId { get; set; }
        public decimal Amount { get; set; }
        public DateTime PaymentDate { get; set; }
        public string PaymentMethod { get; set; }
        public string ReferenceNumber { get; set; }
        public string Notes { get; set; }
        public decimal RecordedBy { get; set; }
        public DateTime RecordedDate { get; set; }

        // Navigation properties
        public Invoice Invoice { get; set; }
        public Employee RecordedByEmployee { get; set; }

        // Computed property
        public string PaymentMethodDisplay
        {
            get
            {
                switch (PaymentMethod)
                {
                    case "Check": return "Check";
                    case "BankTransfer": return "Bank Transfer";
                    case "CreditCard": return "Credit Card";
                    case "Cash": return "Cash";
                    default: return PaymentMethod;
                }
            }
        }
    }
}