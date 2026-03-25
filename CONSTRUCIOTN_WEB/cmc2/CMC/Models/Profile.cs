using System;

namespace CMC.Models
{
    public class Profile
    {
        // Basic login information
        public int UserId { get; set; }              // Primary key
        public string Email { get; set; }            // Login email
        public string Password { get; set; }         // Hashed password
        public bool RememberMe { get; set; }         // Remember me option

        // Personal details
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string FullName => $"{FirstName} {LastName}";
        public string PhoneNumber { get; set; }
        public DateTime? DateOfBirth { get; set; }

        // Address
        public string AddressLine1 { get; set; }
        public string AddressLine2 { get; set; }
        public string City { get; set; }
        public string State { get; set; }
        public string ZipCode { get; set; }
        public string Country { get; set; }

        // Account status
        public bool IsActive { get; set; }           // Active or deactivated
        public DateTime CreatedOn { get; set; }
        public DateTime? UpdatedOn { get; set; }

        // Roles / Permissions (optional)
        public string Role { get; set; }             // e.g., "Client", "Admin"

        // Other info
        public string Notes { get; set; }            // Optional notes
    }
}
