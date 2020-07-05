// API call example. See https://www.sparkpost.com/docs/recipient-validation/integration-guide/
//use hyper;
use reqwest;
use std::env;
use tokio;
//use std::collections::HashMap;

#[tokio::main]
async fn main() -> Result<(), reqwest::Error> {
    // set to api.eu.sparkpost.com for EU accounts
    let url = "https://api.sparkpost.com/api/v1/recipient-validation/single/";

    let recipient = "test@gmail.com";

    // API key from environment variable. Should have Recipient Validation rights
    match env::var("SPARKPOST_API_KEY") {
        Ok(api_key) => {
            println!("{:#?} {:#?} {:#?}", url, api_key, recipient);

            let req_url = String::from(url) + recipient;
            // h = {'Authorization': apiKey, 'Accept': 'application/json'}

            let client = reqwest::Client::new();
            let resp = client.get(&req_url).send().await?;
            // .json::<HashMap<String, String>>()
            println!("{:#?}", resp);
        }
        Err(e) => {
            println!("SPARKPOST_API_KEY {}", e);
        }
    }
    Ok(())
}
