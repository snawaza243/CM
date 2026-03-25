using FSCN.Models;
using System;

namespace FSCN.Models
{
    public class Project
    {
        public decimal ProjectId { get; set; }
        public decimal ClientId { get; set; }
        public string ProjectName { get; set; }
        public string Description { get; set; }
        public DateTime? StartDate { get; set; }
        public DateTime? EstimatedEndDate { get; set; }
        public DateTime? ActualEndDate { get; set; }
        public decimal ContractValue { get; set; }
        public string Status { get; set; } = "Pending";
        public string Address { get; set; }
        public DateTime CreatedDate { get; set; }
        public decimal CreatedBy { get; set; }

        // Navigation properties (will be populated in service layer)
        public Client Client { get; set; }
        public Employee CreatedByEmployee { get; set; }

        // Computed properties
        public bool IsOverdue => EstimatedEndDate.HasValue && DateTime.Now > EstimatedEndDate.Value && Status != "Completed";
        public string ProgressStatus
        {
            get
            {
                if (Status == "Completed") return "Completed";
                if (IsOverdue) return "Overdue";
                if (DateTime.Now >= StartDate) return "In Progress";
                return "Scheduled";
            }
        }
    }
}