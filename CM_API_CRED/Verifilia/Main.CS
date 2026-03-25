using System;
using System.Threading.Tasks;
using Verifalia.Api;
using Verifalia.Api.EmailValidations;

class Program
{
    static async Task Main(string[] args)
    {
        // Replace with your Verifalia credentials
        var username = "YOUR_USERNAME";
        var apiKey = "YOUR_API_KEY";

        var client = new VerifaliaClient(username, apiKey);

        var emailToVerify = "example@example.com";

        // Submit the email for verification
        var response = await client.SubmitAsync(new EmailAddress(emailToVerify));

        foreach (var result in response.Entries)
        {
            Console.WriteLine($"Email: {result.Input}");
            Console.WriteLine($"Status: {result.Status}");
            Console.WriteLine($"QualityScore: {result.QualityScore}");
        }
    }
}
