using System;

namespace FSCN.Controllers
{
    public static class PasswordHelper
    {
        /// <summary>
        /// Hash a plain text password using BCrypt.
        /// </summary>
        /// <param name="plainPassword">The plain password.</param>
        /// <returns>Hashed password string.</returns>
        public static string HashPassword(string plainPassword)
        {
            if (string.IsNullOrEmpty(plainPassword))
                throw new ArgumentException("Password cannot be null or empty.");

            // Use BCrypt to hash the password with a default work factor (10)
            return BCrypt.Net.BCrypt.HashPassword(plainPassword);
        }

        /// <summary>
        /// Verify a plain password against a hashed password.
        /// </summary>
        /// <param name="plainPassword">The plain password input.</param>
        /// <param name="hashedPassword">The hashed password from DB.</param>
        /// <returns>True if password matches, otherwise false.</returns>
        public static bool VerifyPassword(string plainPassword, string hashedPassword)
        {
            if (string.IsNullOrEmpty(plainPassword) || string.IsNullOrEmpty(hashedPassword))
                return false;

            return BCrypt.Net.BCrypt.Verify(plainPassword, hashedPassword);
        }
    }



}
