using System;

namespace FSCN.Models
{
    public class Employee
    {
        public decimal EmployeeId { get; set; }
        public string UserId { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Email { get; set; }
        public string Phone { get; set; }
        public DateTime HireDate { get; set; }
        public string Position { get; set; }
        public decimal? HourlyRate { get; set; }
        public decimal? Salary { get; set; }
        public bool IsActive { get; set; } = true;

        // Computed property for display
        public string FullName => $"{FirstName} {LastName}";
    }
}