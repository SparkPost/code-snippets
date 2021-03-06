<a href="https://www.sparkpost.com"><img src="https://www.sparkpost.com/sites/default/files/attachments/SparkPost_Logo_2-Color_Gray-Orange_RGB.svg" width="200px"/></a>

[Sign up](https://app.sparkpost.com/join?src=Dev-Website&sfdcid=70160000000pqBb) for a SparkPost account and visit our [Developer Hub](https://developers.sparkpost.com) for even more content.

# [Recipient Validation Examples](/snippets/recipient-validation)

Set environment variable `SPARKPOST_API_KEY` prior to running.

```
export SPARKPOST_API_KEY="###YOUR API KEY HERE###"
```

Each example prints the results in that language's native format.

## [Bash script (`curl`)](validateRecipient.sh)
```
./validateRecipient.sh
{"results":{"valid":false,"is_role":true,"is_disposable":false,"is_free":true,"reason":"Invalid Recipient","result":"undeliverable"}}
```

## [PHP](validateRecipient.php)
```
php validateRecipient.php
string(133) "{"results":{"valid":false,"is_role":true,"is_disposable":false,"is_free":true,"reason":"Invalid Recipient","result":"undeliverable"}}"
```

## [Python](validateRecipient.py)
Uses [requests](https://requests.readthedocs.io/en/master/) module; See `Pipfile`.
```
python3 validateRecipient.py
{'results': {'valid': False, 'is_role': True, 'is_disposable': False, 'is_free': True, 'reason': 'Invalid Recipient', 'result': 'undeliverable'}}
```

## [Node.js](validateRecipient.js)
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

## [Go](validateRecipient.go)
This example unmarshals the results into a struct variable, then prints it.

```
go run validateRecipient.go
Status: 200
{Results:{Valid:false IsRole:true IsDisposable:false IsFree:true Reason:Invalid Recipient Result:undeliverable} Errors:[]}
```

## [C#](validateRecipient.cs)
Uses the [GetStringAsync](https://docs.microsoft.com/en-us/dotnet/api/system.net.http.httpclient.getstringasync?view=netframework-4.8) call.
```
dotnet run
{"results":{"valid":false,"is_role":true,"is_disposable":false,"is_free":true,"reason":"Invalid Recipient","result":"undeliverable"}}
```

## [Ruby](validateRecipient.rb)
Using the [Net::http](https://ruby-doc.org/stdlib-2.7.0/libdoc/net/http/rdoc/Net/HTTP.html) library.
```
ruby validateRecipient.rb
200
{"results":{"valid":false,"is_role":true,"is_disposable":false,"is_free":true,"reason":"Invalid Recipient","result":"undeliverable"}}
```

## [Java](validateRecipient.java)
Using the [HttpURLConnection library](https://docs.oracle.com/javase/10/docs/api/java/net/HttpURLConnection.html). Compile and run:
```
javac ValidateRecipient.java && java ValidateRecipient
200 OK
{"results":{"valid":false,"is_role":true,"is_disposable":false,"is_free":true,"reason":"Invalid Recipient","result":"undeliverable"}}
```

## [C / C++](c/validateRecipient.cpp)
Using the [libcurl](https://curl.haxx.se/libcurl/) library; tested with `curl-7.69.1.tar.gz`. Downloaded and built with `make` (below on OSX, referencing `openssl` installed with `brew`). The `curl-config` tool can be used to find out your configuration and linking option flags.

```bash
cd curl-7.69.1/
./configure --enable-hidden-symbols --enable-threaded-resolver --with-gssapi --with-ssl=/usr/local/opt/openssl@1.1/
```

Check that the `configure` step shows you have `SSL` feature enabled, then:
```bash
make
make install
cd ..
```

Compile the app, linking required libraries:
```bash
gcc validateRecipient.cpp -o validateRecipient -lcurl
```

Run the app:
```
./validateRecipient
{"results":{"valid":false,"is_role":true,"is_disposable":false,"is_free":true,"reason":"Invalid Recipient","result":"undeliverable"}}
Response: 200
```

## [Lua](validateRecipient.lua)
Using Lua 5.3 and [luarocks](https://luarocks.org/) package manager, the following installs needed `luasocket` and `luasec` packages globally into `/usr/local`.

```bash
# installation - yours may need to differ!
brew install luarocks
sudo luarocks install luasocket
# link to openssl library (same as C code used)
sudo luarocks install luasec OPENSSL_DIR=/usr/local/opt/openssl@1.1/
# Set the following to suit your installation
export LUA_PATH="/usr/local/share/lua/5.3/?.lua;/usr/local/share/lua/5.3/?/init.lua;/usr/local/lib/lua/5.3/?.lua;/usr/local/lib/lua/5.3/?/init.lua;./?.lua;./?/init.lua;"
```

```
lua validateRecipient.lua
HTTP/1.1 200 OK
{"results":{"valid":false,"is_role":true,"is_disposable":false,"is_free":true,"reason":"Invalid Recipient","result":"undeliverable"}}
```


## [Perl](validateRecipient.pl)
Using Perl v5.16.3 with a little help from `LWP::UserAgent` and `HTTP::Request` 

```bash
# Do this first:
# use CPAN to install the Perl helpers
cpan install LWP JSON HTTP::Request Data::Dumper
# save the SparkPost API key to an environment variable
export SPARKPOST_API_KEY=191c<redactedredacted>c531c3
```

Pull the file then run it with `perl validateRecipient.pl`

The output should be an unformatted JSON string:
```bash
{"results":{"valid":false,"is_role":true,"is_disposable":false,"is_free":true,"reason":"Invalid Recipient","result":"undeliverable"}}
```

You can make that a little prettier with some formatting.
1) Remove the comments on these lines:
```bash
#use JSON;                             # Only needed for a structured output
#use Data::Dumper;                     # Only needed for a structured output
...
#  my $json = JSON->new;                # Only needed for a structured output]
#  my $data = $json->decode($message);  # Only needed for a structured output
#  print Dumper($data);                 # Only needed for a structured output
```
2) Comment this line:
```bash
  print $message,"\r\n";
```

And you will get an output like this:
```bash
$VAR1 = {
          'results' => {
                         'is_disposable' => bless( do{\(my $o = 0)}, 'JSON::PP::Boolean' ),
                         'reason' => 'Invalid Recipient',
                         'result' => 'undeliverable',
                         'is_free' => bless( do{\(my $o = 1)}, 'JSON::PP::Boolean' ),
                         'is_role' => $VAR1->{'results'}{'is_free'},
                         'valid' => $VAR1->{'results'}{'is_disposable'}
                       }
        };
```

If you want to make it real pretty, you can iterate through that array with a foreach and add formatting.  Take note of the Perl weirdness with booleans - `bless( do{\(my $o = 0)}, 'JSON::PP::Boolean'`. A line like that with `$o = 0` should be interpreted as `FALSE` and  where you see `$o = 1` interpret that as `TRUE`.

If you are acting on the results programatically, the raw JSON string should be all you really need.

## [Visual Basic .net](VB/validateRecipient.vb)

The easiest path to success is to use the Visual Studio SDK in a Windows platform. Fire up Visual Studio, start a new project and select Visual Basic, then select console.app.  Be sure to use the VB version not the C# version - it is easy to miss that in the SDK.

Paste the code from the repo into VS, buid and execute.

In order to make this code work, you need to add a Windows environment variable.  The easiest way to do this is to open a command prompt and use setx.exe like this: 
`C:\Users\me>setx SPARKPOST_API_KEY  "142<redacted\><redacted\>c531c3"`
In Windows 10, this is applied to your user environment, but is not immediately available in the current command session, so testing it with a “set” will not work, but it will be available to the code.

If you build and execute the code included in the repo, the result should look like this:
```bash
{"results":{"valid":true,"is_role":false,"is_disposable":false,"is_free":true,"result":"neutral"}}
```

## [Rust](rust_recipient_validation/src/main.rs)

This uses the `reqwest` library with `tokio` async (similar to [this](https://rust-lang-nursery.github.io/rust-cookbook/web/clients/requests.html)), as it does not seem possible to set request headers on the blocking `get` call.

The example includes a cargo package manager [configuration file](rust_recipient_validation/Cargo.toml), so you can build and run with:

```
cd rust_recipient_validation
cargo run

    Finished dev [unoptimized + debuginfo] target(s) in 0.10s
     Running `target/debug/rust_recipient_validation`

Status: 200 OK
Body:
{"results":{"valid":false,"is_role":true,"is_disposable":false,"is_free":true,"reason":"Invalid Recipient","result":"undeliverable"}}
```

The code uses `std:env` to read the `SPARKPOST_API_KEY` environment variable. A `match` clause handles an undefined key with error reporting. A new `reqwest::Client` is created and an async call issued, followed by an `.await?` (see [here](https://rust-lang.github.io/async-book/01_getting_started/04_async_await_primer.html)). This (rather than the simpler blocking call) seems to be needed to set the request header for authorization.

Response body text is read with a second `.await?` as per [this example](https://dtantsur.github.io/rust-openstack/reqwest/struct.Response.html).

## Summary
You made is this far, you earn the honorary badge of [Codefox 🦊](https://en.wikipedia.org/wiki/The_Hedgehog_and_the_Fox)!

See [SparkPost documentation](https://www.sparkpost.com/docs/recipient-validation/integration-guide/) for more information on how to use Recipient Validation.
