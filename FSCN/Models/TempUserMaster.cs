using System;

namespace FSCN.Models
{
    public class TempUserMaster
    {
        public decimal UserId { get; set; }                    // Primary Key
        public string FirstName { get; set; }                  // User First Name
        public string LastName { get; set; }                   // User Last Name
        public string Email { get; set; }                      // Unique Email
        public string Phone { get; set; }                      // Phone Number
        public string PasswordHash { get; set; }               // Encrypted Password

        // password
        public string Password { get; set; }                   // Plain text password (for input only, not stored)
        public string MarketingEmails { get; set; }            // 'Y' or 'N'
        public string TermsAccepted { get; set; }              // 'Y' or 'N'
        public string AccountStatus { get; set; }              // PENDING / ACTIVE / BLOCKED
        public DateTime CreatedDate { get; set; }              // Account creation timestamp
        public DateTime? UpdatedDate { get; set; }             // Last updated timestamp
        public string CreatedIp { get; set; }                  // IP address during signup
        public DateTime? LastLoginDate { get; set; }           // Last login timestamp
        public string LastLoginIp { get; set; }                // Last login IP
        public string Username { get; set; }                   // Optional username
        public string EmailVerified { get; set; }              // 'Y' or 'N'
        public string VerificationToken { get; set; }          // Token for email verification
        public string ResetToken { get; set; }                 // Token for password reset
        public DateTime? ResetTokenExpiry { get; set; }        // Token expiry datetime
        public string UserRole { get; set; }                   // USER / ADMIN
        public string Source { get; set; }                     // MANUAL / GOOGLE / FACEBOOK

        // Computed property for display
        public string FullName => $"{FirstName} {LastName}";

        public bool AgreedTerms { get; set; }                  // Whether user agreed to terms

        public bool MarketingOptIn { get; set; }               // Whether user opted in for marketing emails



    }
}
