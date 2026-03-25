using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CMC.Pages
{
    [System.Web.Script.Services.ScriptService]
    public partial class Account : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [System.Web.Services.WebMethod]
        [System.Web.Script.Services.ScriptMethod]
        public static object LoginUser(string email, string password)
        {
            try
            {
                // Your authentication logic here - replace with actual database check
                if (IsValidUser(email, password))
                {
                    // Get user details from database
                    var user = GetUserByEmail(email);

                    return new
                    {
                        success = true,
                        message = "Login successful",
                        email = user.Email,
                        name = user.Name,
                        role = user.Role,
                        type = user.Type
                    };
                }
                else
                {
                    return new
                    {
                        success = false,
                        message = "Invalid email or password"
                    };
                }
            }
            catch (Exception ex)
            {
                return new
                {
                    success = false,
                    message = "Login error: " + ex.Message
                };
            }
        }

        // Example helper methods - replace with your actual data access
        private static bool IsValidUser(string email, string password)
        {
            // Replace with your actual authentication logic
            // This could be database check, Active Directory, etc.

            // Example using hardcoded values (remove this in production)
            var validUsers = new Dictionary<string, string>
    {
        { "admin@buildright.com", "admin123" },
        { "client1@buildright.com", "client123" },
        { "client2@buildright.com", "client456" },
        { "client3@buildright.com", "client789" }
    };

            return validUsers.ContainsKey(email) && validUsers[email] == password;
        }

        private static dynamic GetUserByEmail(string email)
        {
            // Replace with your actual user data retrieval
            var users = new[]
            {
        new { Email = "admin@buildright.com", Name = "Admin User", Role = "Administrator", Type = "admin" },
        new { Email = "client1@buildright.com", Name = "John Client", Role = "Customer", Type = "client" },
        new { Email = "client2@buildright.com", Name = "Sarah Builder", Role = "Customer", Type = "client" },
        new { Email = "client3@buildright.com", Name = "David Contractor", Role = "Partner", Type = "client" }
    };

            return users.FirstOrDefault(u => u.Email == email) ?? new { Email = email, Name = "User", Role = "User", Type = "client" };
        }

        private static bool IsValidUserDB(string email, string password)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["YourConnectionString"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT COUNT(*) FROM Users WHERE Email = @Email AND Password = @Password AND IsActive = 1";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Email", email);
                cmd.Parameters.AddWithValue("@Password", password); // In production, use hashed passwords

                conn.Open();
                int count = (int)cmd.ExecuteScalar();
                return count > 0;
            }
        }

        private static dynamic GetUserByEmailDB(string email)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["YourConnectionString"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT Name, Role, UserType FROM Users WHERE Email = @Email";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Email", email);

                conn.Open();
                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        return new
                        {
                            Email = email,
                            Name = reader["Name"].ToString(),
                            Role = reader["Role"].ToString(),
                            Type = reader["UserType"].ToString()
                        };
                    }
                }
            }

            return new { Email = email, Name = "User", Role = "User", Type = "client" };
        }

        [WebMethod]
        //[ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static string CreateProfile(string firstName, string lastName, string email, string phone, string address)
        {
            try
            {
                // Example: save to database
                // Replace this block with actual DB insert logic (using Oracle, SQL, etc.)

                // For example:
                // string query = "INSERT INTO CLIENT_MASTER (FIRST_NAME, LAST_NAME, EMAIL, PHONE, ADDRESS) VALUES (:firstName, :lastName, :email, :phone, :address)";
                // OracleCommand cmd = new OracleCommand(query, connection);
                // cmd.Parameters.Add(":firstName", firstName);
                // ...
                // cmd.ExecuteNonQuery();

                return "Profile created for " + firstName + " " + lastName;
            }
            catch (Exception ex)
            {
                return "Error: " + ex.Message;
            }
        }

    }
}