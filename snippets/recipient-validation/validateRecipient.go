package main

// API call example. See https://www.sparkpost.com/docs/recipient-validation/integration-guide/

import (
	"encoding/json"
	"fmt"
	"io/ioutil"
	"net/http"
	"os"
)

// set to api.eu.sparkpost.com for EU accounts
const url = "https://api.sparkpost.com/api/v1/recipient-validation/single/"

func main() {
	recipient := "test@gmail.com"
	apiKey := os.Getenv("SPARKPOST_API_KEY") // API key from environment variable. Should have Recipient Validation rights
	client := &http.Client{}
	req, err := http.NewRequest("GET", url+recipient, nil)
	if err != nil {
		fmt.Println(err)
		os.Exit(1)
	}
	req.Header.Add("Authorization", apiKey)
	req.Header.Add("Accept", "application/json")
	response, err := client.Do(req)
	if err != nil {
		fmt.Println(err)
		os.Exit(1)
	}
	body, err := ioutil.ReadAll(response.Body)
	if err != nil {
		fmt.Println(err)
		os.Exit(1)
	}

	// showing here how to unmarshal the []byte contents into a struct
	type RVResult struct {
		Results struct {
			Valid        bool   `json:"valid"`
			IsRole       bool   `json:"is_role"`
			IsDisposable bool   `json:"is_disposable"`
			IsFree       bool   `json:"is_free"`
			Reason       string `json:"reason"`
			Result       string `json:"result"`
		} `json:"results"`
		Errors []struct {
			Message string `json:"message"`
		} `json:"errors"`
	}
	var resObj RVResult
	err = json.Unmarshal(body, &resObj)
	if err != nil {
		fmt.Println(err)
		os.Exit(1)
	}
	fmt.Printf("Status: %d\n%+v\n", response.StatusCode, resObj)
}
