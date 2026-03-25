using System;

namespace FSCN.Models
{
    public class ProjectPhase
    {
        public decimal PhaseId { get; set; }
        public decimal ProjectId { get; set; }
        public string PhaseName { get; set; }
        public string Description { get; set; }
        public DateTime? EstimatedStartDate { get; set; }
        public DateTime? EstimatedEndDate { get; set; }
        public DateTime? ActualStartDate { get; set; }
        public DateTime? ActualEndDate { get; set; }
        public decimal? Budget { get; set; }
        public int? SortOrder { get; set; }

        // Navigation property
        public Project Project { get; set; }

        // Computed properties
        public bool IsCompleted => ActualEndDate.HasValue;
        public bool IsInProgress => ActualStartDate.HasValue && !ActualEndDate.HasValue;
        public string PhaseStatus
        {
            get
            {
                if (IsCompleted) return "Completed";
                if (IsInProgress) return "In Progress";
                if (EstimatedStartDate.HasValue && DateTime.Now >= EstimatedStartDate.Value) return "Delayed Start";
                return "Scheduled";
            }
        }
    }
}