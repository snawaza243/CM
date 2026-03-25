using System;

namespace FSCN.Models
{
    public class Task
    {
        public decimal TaskId { get; set; }
        public decimal PhaseId { get; set; }
        public string TaskName { get; set; }
        public string Description { get; set; }
        public decimal? AssignedToEmployeeId { get; set; }
        public DateTime? DueDate { get; set; }
        public string Status { get; set; } = "NotStarted";
        public string Priority { get; set; } = "Medium";
        public DateTime CreatedDate { get; set; }

        // Navigation properties
        public ProjectPhase Phase { get; set; }
        public Employee AssignedToEmployee { get; set; }

        // Computed properties
        public bool IsOverdue => DueDate.HasValue && DateTime.Now > DueDate.Value && Status != "Completed";
        public string TaskStatusDisplay
        {
            get
            {
                switch (Status)
                {
                    case "NotStarted": return "Not Started";
                    case "InProgress": return "In Progress";
                    case "Completed": return "Completed";
                    case "Blocked": return "Blocked";
                    default: return Status;
                }
            }
        }

        public string PriorityClass
        {
            get
            {
                switch (Priority)
                {
                    case "Critical": return "priority-critical";
                    case "High": return "priority-high";
                    case "Medium": return "priority-medium";
                    case "Low": return "priority-low";
                    default: return "priority-medium";
                }
            }
        }
    }
}