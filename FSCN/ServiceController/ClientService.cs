using FSCN.Data;
using FSCN.Models;
using Oracle.ManagedDataAccess.Client;
using System;
using System.Collections.Generic;
using System.Data;

namespace FSCN.Services
{
    public class ClientService
    {
        // Get all clients
        public static List<Client> GetAllClients()
        {
            var clients = new List<Client>();
            string query = "SELECT * FROM Clients ORDER BY CompanyName";

            var dt = OracleHelper.GetDataTable(query);
            foreach (DataRow row in dt.Rows)
            {
                clients.Add(MapDataRowToClient(row));
            }
            return clients;
        }

        // Get active clients only
        public static List<Client> GetActiveClients()
        {
            var clients = new List<Client>();
            string query = "SELECT * FROM Clients WHERE IsActive = 1 ORDER BY CompanyName";

            var dt = OracleHelper.GetDataTable(query);
            foreach (DataRow row in dt.Rows)
            {
                clients.Add(MapDataRowToClient(row));
            }
            return clients;
        }

        // Get client by ID
        public static Client GetClientById(decimal clientId)
        {
            string query = "SELECT * FROM Clients WHERE ClientId = :ClientId";
            var parameters = new OracleParameter[] {
                new OracleParameter(":ClientId", clientId)
            };

            var dt = OracleHelper.GetDataTable(query, parameters);
            if (dt.Rows.Count > 0)
            {
                return MapDataRowToClient(dt.Rows[0]);
            }
            return null;
        }

        // Insert new client
        public static decimal InsertClient(Client client)
        {
            string query = @"INSERT INTO Clients (CompanyName, ContactFirstName, ContactLastName, Email, Phone, Address, City, State, ZipCode, IsActive) 
                            VALUES (:CompanyName, :ContactFirstName, :ContactLastName, :Email, :Phone, :Address, :City, :State, :ZipCode, :IsActive) 
                            RETURNING ClientId INTO :ClientId";

            var clientIdParam = new OracleParameter(":ClientId", OracleDbType.Decimal) { Direction = ParameterDirection.Output };

            var parameters = new OracleParameter[] {
                new OracleParameter(":CompanyName", client.CompanyName),
                new OracleParameter(":ContactFirstName", client.ContactFirstName),
                new OracleParameter(":ContactLastName", client.ContactLastName),
                new OracleParameter(":Email", client.Email ?? (object)DBNull.Value),
                new OracleParameter(":Phone", client.Phone ?? (object)DBNull.Value),
                new OracleParameter(":Address", client.Address ?? (object)DBNull.Value),
                new OracleParameter(":City", client.City ?? (object)DBNull.Value),
                new OracleParameter(":State", client.State ?? (object)DBNull.Value),
                new OracleParameter(":ZipCode", client.ZipCode ?? (object)DBNull.Value),
                new OracleParameter(":IsActive", client.IsActive ? 1 : 0),
                clientIdParam
            };

            OracleHelper.ExecuteNonQuery(query, parameters);
            return Convert.ToDecimal(clientIdParam.Value);
        }

        // Update client
        public static int UpdateClient(Client client)
        {
            string query = @"UPDATE Clients SET 
                            CompanyName = :CompanyName, 
                            ContactFirstName = :ContactFirstName, 
                            ContactLastName = :ContactLastName,
                            Email = :Email,
                            Phone = :Phone,
                            Address = :Address,
                            City = :City,
                            State = :State,
                            ZipCode = :ZipCode,
                            IsActive = :IsActive
                            WHERE ClientId = :ClientId";

            var parameters = new OracleParameter[] {
                new OracleParameter(":CompanyName", client.CompanyName),
                new OracleParameter(":ContactFirstName", client.ContactFirstName),
                new OracleParameter(":ContactLastName", client.ContactLastName),
                new OracleParameter(":Email", client.Email ?? (object)DBNull.Value),
                new OracleParameter(":Phone", client.Phone ?? (object)DBNull.Value),
                new OracleParameter(":Address", client.Address ?? (object)DBNull.Value),
                new OracleParameter(":City", client.City ?? (object)DBNull.Value),
                new OracleParameter(":State", client.State ?? (object)DBNull.Value),
                new OracleParameter(":ZipCode", client.ZipCode ?? (object)DBNull.Value),
                new OracleParameter(":IsActive", client.IsActive ? 1 : 0),
                new OracleParameter(":ClientId", client.ClientId)
            };

            return OracleHelper.ExecuteNonQuery(query, parameters);
        }

        // Delete client (soft delete)
        public static int DeleteClient(decimal clientId)
        {
            string query = "UPDATE Clients SET IsActive = 0 WHERE ClientId = :ClientId";
            var parameters = new OracleParameter[] {
                new OracleParameter(":ClientId", clientId)
            };
            return OracleHelper.ExecuteNonQuery(query, parameters);
        }

        // Helper method to map DataRow to Client object
        private static Client MapDataRowToClient(DataRow row)
        {
            return new Client
            {
                ClientId = Convert.ToDecimal(row["ClientId"]),
                CompanyName = row["CompanyName"].ToString(),
                ContactFirstName = row["ContactFirstName"].ToString(),
                ContactLastName = row["ContactLastName"].ToString(),
                Email = row["Email"]?.ToString(),
                Phone = row["Phone"]?.ToString(),
                Address = row["Address"]?.ToString(),
                City = row["City"]?.ToString(),
                State = row["State"]?.ToString(),
                ZipCode = row["ZipCode"]?.ToString(),
                CreatedDate = Convert.ToDateTime(row["CreatedDate"]),
                IsActive = Convert.ToBoolean(row["IsActive"])
            };
        }
    }
}