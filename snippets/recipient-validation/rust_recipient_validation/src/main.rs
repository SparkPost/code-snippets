// API call example. See https://www.sparkpost.com/docs/recipient-validation/integration-guide/
//use hyper;
use reqwest;
use std::env;
use tokio;

#[tokio::main]
async fn main() -> Result<(), reqwest::Error> {
    // set to api.eu.sparkpost.com for EU accounts
    let url = "https://api.sparkpost.com/api/v1/recipient-validation/single/";

    let recipient = "test@gmail.com";

    // API key from environment variable. Should have Recipient Validation rights
    match env::var("SPARKPOST_API_KEY") {
        Ok(api_key) => {
            let req_url = String::from(url) + recipient;
            let client = reqwest::Client::new();
            let res = client
                .get(&req_url)
                .header("Authorization", api_key)
                .header("Accept", "application/json")
                .send()
                .await?;

            println!("Status: {}", res.status());
            let body = res.text().await?;
            println!("Body:\n{}", body);
        }
        Err(e) => {
            println!("SPARKPOST_API_KEY {}", e);
        }
    }
    Ok(())
}
