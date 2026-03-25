using FSCN.Data;
using FSCN.Helpers;
using FSCN.Models;
using Oracle.ManagedDataAccess.Client;
using System;
using System.Collections.Generic;
using System.Data;
using System.Web.Helpers;
//using BCrypt.Net;       // then call BCrypt.HashPassword(...)



namespace FSCN.Services
{
    public class TempUserService
    {
        // ✅ 1. INSERT NEW USER
        public static bool InsertUser(TempUserMaster user)
        {
            string query = @"
                INSERT INTO TEMP_USER_MASTER 
                    (FIRST_NAME, LAST_NAME, EMAIL, PHONE, PASSWORD_HASH, MARKETING_EMAILS, 
                     TERMS_ACCEPTED, ACCOUNT_STATUS, CREATED_DATE, CREATED_IP, USER_ROLE, SOURCE)
                VALUES 
                    (:FirstName, :LastName, :Email, :Phone, :PasswordHash, :MarketingEmails, 
                     'Y', 'PENDING', SYSDATE, :CreatedIp, :UserRole, :Source)";

            var parameters = new OracleParameter[]
            {
                new OracleParameter("FirstName", user.FirstName ?? (object)DBNull.Value),
                new OracleParameter("LastName", user.LastName ?? (object)DBNull.Value),
                new OracleParameter("Email", user.Email ?? (object)DBNull.Value),
                new OracleParameter("Phone", user.Phone ?? (object)DBNull.Value),
                new OracleParameter("PasswordHash", user.PasswordHash ?? (object)DBNull.Value),
                new OracleParameter("MarketingEmails", user.MarketingEmails ?? "N"),
                new OracleParameter("CreatedIp", user.CreatedIp ?? (object)DBNull.Value),
                new OracleParameter("UserRole", user.UserRole ?? "USER"),
                new OracleParameter("Source", user.Source ?? "MANUAL")
            };

            int result = OracleHelper.ExecuteNonQuery(query, parameters);
            return result > 0;
        }

        // ✅ 2. CHECK IF EMAIL EXISTS
        public static bool IsEmailExists(string email)
        {
            string query = "SELECT COUNT(*) FROM TEMP_USER_MASTER WHERE EMAIL = :Email";
            var param = new OracleParameter("Email", email);
            int count = Convert.ToInt32(OracleHelper.ExecuteScalar(query, param));
            return count > 0;
        }

        // ✅ 3. GET USER BY EMAIL
        public static TempUserMaster GetUserByEmail(string email)
        {
            string query = "SELECT * FROM TEMP_USER_MASTER WHERE EMAIL = :Email";
            var param = new OracleParameter("Email", email);
            DataTable dt = OracleHelper.GetDataTable(query, param);

            if (dt.Rows.Count == 0)
                return null;

            return MapToUser(dt.Rows[0]);
        }

        // ✅ 4. GET USER BY ID
        public static TempUserMaster GetUserById(decimal userId)
        {
            string query = "SELECT * FROM TEMP_USER_MASTER WHERE USER_ID = :UserId";
            var param = new OracleParameter("UserId", userId);
            DataTable dt = OracleHelper.GetDataTable(query, param);

            if (dt.Rows.Count == 0)
                return null;

            return MapToUser(dt.Rows[0]);
        }

        // ✅ 5. GET ALL USERS (ADMIN VIEW)
        public static DataTable GetAllUsers()
        {
            string query = @"
                SELECT USER_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE, ACCOUNT_STATUS, 
                       CREATED_DATE, USER_ROLE, SOURCE
                FROM TEMP_USER_MASTER
                ORDER BY CREATED_DATE DESC";
            return OracleHelper.GetDataTable(query);
        }

        // ✅ 6. VALIDATE USER LOGIN
        public static TempUserMaster ValidateUserLogin(string email, string password)
        {
            string query = "SELECT * FROM TEMP_USER_MASTER WHERE EMAIL = :Email AND ACCOUNT_STATUS = 'ACTIVE'";
            var param = new OracleParameter("Email", email);
            DataTable dt = OracleHelper.GetDataTable(query, param);

            if (dt.Rows.Count == 0)
                return null;

            DataRow row = dt.Rows[0];
            string storedHash = row["PASSWORD_HASH"].ToString();

            // Compare hashed passwords
            if (PasswordHelper.VerifyPassword(password, storedHash))
            {
                string updateQuery = "UPDATE TEMP_USER_MASTER SET LAST_LOGIN_DATE = SYSDATE WHERE EMAIL = :Email";
                OracleHelper.ExecuteNonQuery(updateQuery, param);
                return MapToUser(row);
            }

            return null;
        }

        // ✅ 7. GENERATE RESET TOKEN
        public static string GenerateResetToken(string email)
        {
            string token = Guid.NewGuid().ToString();
            string query = @"
                UPDATE TEMP_USER_MASTER 
                SET RESET_TOKEN = :Token, RESET_TOKEN_EXPIRY = SYSDATE + INTERVAL '30' MINUTE
                WHERE EMAIL = :Email";

            var parameters = new OracleParameter[]
            {
                new OracleParameter("Token", token),
                new OracleParameter("Email", email)
            };

            int result = OracleHelper.ExecuteNonQuery(query, parameters);
            return result > 0 ? token : null;
        }

        // ✅ 8. RESET PASSWORD USING TOKEN
        public static bool ResetPassword(string token, string newPassword)
        {
            string hashedPassword = PasswordHelper.HashPassword(newPassword);

            string query = @"
                UPDATE TEMP_USER_MASTER
                SET PASSWORD_HASH = :Password, RESET_TOKEN = NULL, RESET_TOKEN_EXPIRY = NULL
                WHERE RESET_TOKEN = :Token AND RESET_TOKEN_EXPIRY > SYSDATE";

            var parameters = new OracleParameter[]
            {
                new OracleParameter("Password", hashedPassword),
                new OracleParameter("Token", token)
            };

            int result = OracleHelper.ExecuteNonQuery(query, parameters);
            return result > 0;
        }

        // ✅ 9. VERIFY EMAIL TOKEN (ACTIVATE ACCOUNT)
        public static bool VerifyEmail(string token)
        {
            string query = @"
                UPDATE TEMP_USER_MASTER
                SET ACCOUNT_STATUS = 'ACTIVE', EMAIL_VERIFIED = 'Y', VERIFICATION_TOKEN = NULL
                WHERE VERIFICATION_TOKEN = :Token";

            var param = new OracleParameter("Token", token);
            int result = OracleHelper.ExecuteNonQuery(query, param);
            return result > 0;
        }

        // ✅ 10. MAP DATABASE ROW TO MODEL
        private static TempUserMaster MapToUser(DataRow row)
        {
            return new TempUserMaster
            {
                UserId = Convert.ToDecimal(row["USER_ID"]),
                FirstName = row["FIRST_NAME"]?.ToString(),
                LastName = row["LAST_NAME"]?.ToString(),
                Email = row["EMAIL"]?.ToString(),
                Phone = row["PHONE"]?.ToString(),
                PasswordHash = row["PASSWORD_HASH"]?.ToString(),
                MarketingEmails = row["MARKETING_EMAILS"]?.ToString(),
                TermsAccepted = row["TERMS_ACCEPTED"]?.ToString(),
                AccountStatus = row["ACCOUNT_STATUS"]?.ToString(),
                CreatedDate = Convert.ToDateTime(row["CREATED_DATE"]),
                UpdatedDate = row["UPDATED_DATE"] == DBNull.Value ? (DateTime?)null : Convert.ToDateTime(row["UPDATED_DATE"]),
                CreatedIp = row["CREATED_IP"]?.ToString(),
                LastLoginDate = row["LAST_LOGIN_DATE"] == DBNull.Value ? (DateTime?)null : Convert.ToDateTime(row["LAST_LOGIN_DATE"]),
                LastLoginIp = row["LAST_LOGIN_IP"]?.ToString(),
                Username = row["USERNAME"]?.ToString(),
                EmailVerified = row["EMAIL_VERIFIED"]?.ToString(),
                VerificationToken = row["VERIFICATION_TOKEN"]?.ToString(),
                ResetToken = row["RESET_TOKEN"]?.ToString(),
                ResetTokenExpiry = row["RESET_TOKEN_EXPIRY"] == DBNull.Value ? (DateTime?)null : Convert.ToDateTime(row["RESET_TOKEN_EXPIRY"]),
                UserRole = row["USER_ROLE"]?.ToString(),
                Source = row["SOURCE"]?.ToString()
            };
        }
    }
}
