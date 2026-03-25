using System;

namespace FSCN.Models
{
    public class Expense
    {
        public decimal ExpenseId { get; set; }
        public decimal ProjectId { get; set; }
        public string Category { get; set; }
        public string Description { get; set; }
        public decimal Amount { get; set; }
        public DateTime ExpenseDate { get; set; }
        public string Supplier { get; set; }
        public string ReceiptImageUrl { get; set; }
        public decimal RecordedBy { get; set; }
        public DateTime RecordedDate { get; set; }

        // Navigation properties
        public Project Project { get; set; }
        public Employee RecordedByEmployee { get; set; }

        // Computed property
        public string CategoryDisplay
        {
            get
            {
                switch (Category)
                {
                    case "Materials": return "Materials";
                    case "Labor": return "Labor";
                    case "Equipment": return "Equipment";
                    case "Subcontractor": return "Subcontractor";
                    case "Transportation": return "Transportation";
                    case "Other": return "Other";
                    default: return Category;
                }
            }
        }
    }
}