Imports System
Imports System.Net
Imports System.Net.Http
Imports System.Threading.Tasks

' This is experimental code produced from the .cs app using https://converter.telerik.com/
Namespace recipient_validation
    Class Program
        Const url As String = "https://api.sparkpost.com/api/v1/recipient-validation/single/"
        Shared ReadOnly client As HttpClient = New HttpClient()

        Private Shared Async Function Main(ByVal args As String()) As Task
            Dim recipient As String = "test@gmail.com"
            Dim apiKey As String = Environment.GetEnvironmentVariable("SPARKPOST_API_KEY")

            Try
                client.DefaultRequestHeaders.Add("Authorization", apiKey)
                client.DefaultRequestHeaders.Add("Accept", "application/json")
                Dim result = Await client.GetStringAsync(url & recipient)
                Console.WriteLine(result)
            Catch e As HttpRequestException
                Console.WriteLine(vbLf & "Exception Caught!")
                Console.WriteLine("Message :{0} ", e.Message)
            End Try
        End Function
    End Class
End Namespace
