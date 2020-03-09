<a href="https://www.sparkpost.com"><img src="https://www.sparkpost.com/sites/default/files/attachments/SparkPost_Logo_2-Color_Gray-Orange_RGB.svg" width="200px"/></a>

[Sign up](https://app.sparkpost.com/join?src=Dev-Website&sfdcid=70160000000pqBb) for a SparkPost account and visit our [Developer Hub](https://developers.sparkpost.com) for even more content.

# [Recipient Validation Examples](/snippets/recipient-validation)

Set environment variable `SPARKPOST_API_KEY` prior to running - for example:

```
export SPARKPOST_API_KEY="###YOUR API KEY HERE###"
```

```
./validateRecipient.py

{'results': {'valid': False, 'is_role': True, 'is_disposable': False, 'is_free': True, 'reason': 'Invalid Recipient', 'result': 'undeliverable'}}
```

See [SparkPost documentation](https://www.sparkpost.com/docs/recipient-validation/integration-guide/) for more information on how to use Recipient Validation.
