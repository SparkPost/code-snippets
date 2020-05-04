Imports System.IO
Imports System.Net

Namespace Recipient_Validation
    Public Class RVsample
        Public Shared Sub Main()
            Const url As String = "https://api.sparkpost.com/api/v1/recipient-validation/single/recipient="
            Dim apiKey As String = System.Environment.GetEnvironmentVariable("SPARKPOST_API_KEY", EnvironmentVariableTarget.User)

            ' replace this line with some loop to pull from a data source
            Dim recipient As String = "test@gmail.com"

            ' Create a request for the URL.  
            Dim client As WebRequest = WebRequest.Create(url & recipient)
            Console.WriteLine(client.Headers)
            client.Headers.Add("Authorization", apiKey)
            client.Headers.Add("Accept", "application/json")
            ' may need to tweak this error handling
            Try
                Using dataStream As Stream = client.GetResponse().GetResponseStream()
                    ' Open the stream using a StreamReader for easy access.  
                    Dim reader As New StreamReader(dataStream)
                    ' Read the content.  
                    Dim responseFromServer As String = reader.ReadToEnd()
                    ' Display the content.  
                    Console.WriteLine(responseFromServer)
                End Using
                ' client.GetResponse().Close()
            Catch e As HttpListenerException
                Console.WriteLine(vbLf & "Exception Caught!")
                Console.WriteLine("Message :{0} ", e.Message)
            End Try

        End Sub
    End Class
End Namespace
