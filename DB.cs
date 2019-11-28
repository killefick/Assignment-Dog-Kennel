using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using Dapper;

namespace SKK13
{
    public class DB
    {
        // connectionString takes argument from "new DB"
        private readonly string connectionString;

        // constructor
        public DB(string connectionString)
        {
            this.connectionString = connectionString;
        }

        // public method to call from application
        // IEnumerable: allows looping over generic or non-generic lists
        public IEnumerable<Dog> GetAllDogsDB()
        {
            try
            {
                // connects to the database
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    return connection.Query<Dog>("EXEC GetAllDogs");
                }
            }
            catch (System.Exception)
            {
                throw;
            }
        }

        public int CountAllDogsDB()
        {
            try
            {
                // connects to the database
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    int result = 0;
                    string sql = "EXEC CountAllDogs";
                    SqlCommand cmd = new SqlCommand(sql, connection);
                    try
                    {
                        connection.Open();
                        result = (Int32)cmd.ExecuteScalar();
                    }
                    catch (Exception ex)
                    {
                        Console.WriteLine(ex.Message);
                    }
                    return result;
                }
            }
            catch (System.Exception)
            {
                throw;
            }
        }

        public int CountVeterinaryInfoDB()
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    int result = 0;
                    string sql = "EXEC CountVeterinaryData";
                    SqlCommand cmd = new SqlCommand(sql, connection);
                    try
                    {
                        connection.Open();
                        result = (Int32)cmd.ExecuteScalar();
                    }
                    catch (Exception ex)
                    {
                        Console.WriteLine(ex.Message);
                    }
                    return result;
                }

            }
            catch (System.Exception)
            {
                throw;
            }
        }


        public IEnumerable<Dog> GetDogInfoDB(int id)
        {
            try
            {
                // connects to the database
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    return connection.Query<Dog>($"EXEC GetDogInfo {id}");
                }

            }
            catch (System.Exception)
            {
                throw;
            }
        }

        public IEnumerable<Dog> GetSyblings()
        {
            try
            {
                // connects to the database
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    return connection.Query<Dog>($"EXEC GetSyblings");
                }

            }
            catch (System.Exception)
            {
                throw;
            }
        }
    }
}