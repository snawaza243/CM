using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CMC.Controllers
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
            /* How to use
             * stirng input = "userInputPassword";
             * string hashed = PasswordHelper.HashPassword(input);
             * Store 'hashed' in database
             */
            
            if (string.IsNullOrEmpty(plainPassword))
                throw new ArgumentException("Password cannot be null or empty.");

            // Use BCrypt to hash the password with a default work factor (10)
            return BCrypt.Net.BCrypt.HashPassword(plainPassword);
        }

      
        public static bool VerifyPassword(string plainPassword, string hashedPassword)
        {
            /* How to use
             * stirng input = "userInputPassword";
             * string dbHashed = GetHashedPasswordFromDatabase();
             * return PasswordHelper.VerifyPassword(input, dbHashed) ;
             * 
             * true if matches, false otherwise
             */
            if (string.IsNullOrEmpty(plainPassword) || string.IsNullOrEmpty(hashedPassword))
                return false;

            return BCrypt.Net.BCrypt.Verify(plainPassword, hashedPassword);
        }
    }

}



