<a href="https://www.sparkpost.com"><img src="https://www.sparkpost.com/sites/default/files/attachments/SparkPost_Logo_2-Color_Gray-Orange_RGB.svg" width="200px"/></a>

[Sign up](https://app.sparkpost.com/join?src=Dev-Website&sfdcid=70160000000pqBb) for a SparkPost account and visit our [Developer Hub](https://developers.sparkpost.com) for even more content.

# [Recipient Validation Examples](/snippets/recipient-validation)

Set environment variable `SPARKPOST_API_KEY` prior to running.

```
export SPARKPOST_API_KEY="###YOUR API KEY HERE###"
```

Each example prints the results in that language's native format.

## Bash script (`curl`)
```
./validateRecipient.sh
{"results":{"valid":false,"is_role":true,"is_disposable":false,"is_free":true,"reason":"Invalid Recipient","result":"undeliverable"}}
```

## PHP
```
php validateRecipient.php
string(133) "{"results":{"valid":false,"is_role":true,"is_disposable":false,"is_free":true,"reason":"Invalid Recipient","result":"undeliverable"}}"
```

## Python
Uses [requests](https://requests.readthedocs.io/en/master/) module; See `Pipfile`.
```
python3 validateRecipient.py
{'results': {'valid': False, 'is_role': True, 'is_disposable': False, 'is_free': True, 'reason': 'Invalid Recipient', 'result': 'undeliverable'}}
```

## Node.js
Shows both the older [request](https://www.npmjs.com/package/request) package and the newer [axios](https://www.npmjs.com/package/axios) package.

```
node validateRecipient.js

Axios:
{
  results: {
    valid: false,
    is_role: true,
    is_disposable: false,
    is_free: true,
    reason: 'Invalid Recipient',
    result: 'undeliverable'
  }
}

Request:
error: null
statusCode: 200
body: {"results":{"valid":false,"is_role":true,"is_disposable":false,"is_free":true,"reason":"Invalid Recipient","result":"undeliverable"}}
```

## Go
This example unmarshals the results into a struct variable, then prints it.

```
go run validateRecipient.go
Status: 200
{Results:{Valid:false IsRole:true IsDisposable:false IsFree:true Reason:Invalid Recipient Result:undeliverable} Errors:[]}
```

## C#
Uses the [GetStringAsync](https://docs.microsoft.com/en-us/dotnet/api/system.net.http.httpclient.getstringasync?view=netframework-4.8) call.
```
dotnet run
{"results":{"valid":false,"is_role":true,"is_disposable":false,"is_free":true,"reason":"Invalid Recipient","result":"undeliverable"}}
```

## Ruby

Using the [Net::http](https://ruby-doc.org/stdlib-2.7.0/libdoc/net/http/rdoc/Net/HTTP.html) library.
```
ruby validateRecipient.rb
200
{"results":{"valid":false,"is_role":true,"is_disposable":false,"is_free":true,"reason":"Invalid Recipient","result":"undeliverable"}}
```

TODO: Ruby, Perl, Elixir, Java, ...

See [SparkPost documentation](https://www.sparkpost.com/docs/recipient-validation/integration-guide/) for more information on how to use Recipient Validation.
