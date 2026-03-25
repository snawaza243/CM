using System;

namespace FSCN.Models
{
    public class TimeLog
    {
        public decimal TimeLogId { get; set; }
        public decimal EmployeeId { get; set; }
        public decimal TaskId { get; set; }
        public decimal ProjectId { get; set; }
        public DateTime LogDate { get; set; }
        public decimal HoursWorked { get; set; }
        public string Description { get; set; }
        public bool IsApproved { get; set; }
        public decimal? ApprovedBy { get; set; }
        public DateTime? ApprovedDate { get; set; }

        // Navigation properties
        public Employee Employee { get; set; }
        public Task Task { get; set; }
        public Project Project { get; set; }
        public Employee ApprovedByEmployee { get; set; }

        // Computed properties
        public decimal TotalCost => HoursWorked * (Employee?.HourlyRate ?? 0);
        public string ApprovalStatus => IsApproved ? "Approved" : "Pending";
        public string FormattedHours => $"{HoursWorked:0.00} hours";
    }
}