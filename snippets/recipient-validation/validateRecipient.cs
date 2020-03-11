// API call example. See https://www.sparkpost.com/docs/recipient-validation/integration-guide/

using System;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;

namespace recipient_validation
{
    class Program
    {
        // set to api.eu.sparkpost.com for EU accounts
        const string url = "https://api.sparkpost.com/api/v1/recipient-validation/single/";
        static readonly HttpClient client = new HttpClient();

        // baed on https://docs.microsoft.com/en-us/dotnet/api/system.net.http.httpclient?redirectedfrom=MSDN&view=netframework-4.8
        static async Task Main(string[] args)
        {
            string recipient = "test@gmail.com";
            string apiKey = Environment.GetEnvironmentVariable("SPARKPOST_API_KEY"); // API key from environment variable. Should have Recipient Validation rights

            try
            {
                using var client = new HttpClient();
                client.DefaultRequestHeaders.Add("Authorization", apiKey);
                client.DefaultRequestHeaders.Add("Accept", "application/json");

                var result = await client.GetStringAsync(url + recipient);
                Console.WriteLine(result);
            }
            catch (HttpRequestException e)
            {
                Console.WriteLine("\nException Caught!");
                Console.WriteLine("Message :{0} ", e.Message);
            }
        }
    }
}
