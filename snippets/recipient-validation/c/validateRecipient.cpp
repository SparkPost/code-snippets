// API call example. See https://www.sparkpost.com/docs/recipient-validation/integration-guide/
// This is essentially ANSI C .. using .cpp extension to allow line comments

#include <stdio.h>
#include <stdlib.h>
#include <strings.h>
#include <curl/curl.h>

// See https://curl.haxx.se/libcurl/c/https.html

// callback function to handle data coming back
static size_t write_data(void *ptr, size_t size, size_t nmemb, void *stream)
{
    size_t written = fwrite(ptr, size, nmemb, (FILE *)stream);
    return written;
}

int main(void)
{
    CURL *curl;
    CURLcode res;
    char *apiKey;

    curl_global_init(CURL_GLOBAL_DEFAULT);
    curl = curl_easy_init();
    if (curl)
    {
        // set to api.eu.sparkpost.com for EU accounts
        char url[1024] = "https://api.sparkpost.com/api/v1/recipient-validation/single/";

        // API key from environment variable.Should have Recipient Validation rights
        char *apiKey = getenv("SPARKPOST_API_KEY");

        const char recipient[] = "test@gmail.com";

        if (strlen(url) + strlen(recipient) >= sizeof(url))
        {
            printf("Please do some proper memory allocation code here");
            exit(1);
        }
        strcat(url, recipient); // compose the request url
        curl_easy_setopt(curl, CURLOPT_URL, url);

        // Set headers
        char auth[1024] = "Authorization: ";
        if (strlen(auth) + strlen(apiKey) >= sizeof(auth))
        {
            printf("Please do some proper memory allocation code here");
            exit(1);
        }
        strcat(auth, apiKey);

        struct curl_slist *list = NULL;
        list = curl_slist_append(list, auth);
        list = curl_slist_append(list, "Accept: application/json");
        curl_easy_setopt(curl, CURLOPT_HTTPHEADER, list);

        // send all data to this function
        curl_easy_setopt(curl, CURLOPT_WRITEFUNCTION, write_data);
        // write the page body to this file handle
        curl_easy_setopt(curl, CURLOPT_WRITEDATA, stdout);

        res = curl_easy_perform(curl);

        // Check for errors
        if (res != CURLE_OK)
            fprintf(stderr, "curl_easy_perform() failed: %s\n",
                    curl_easy_strerror(res));

        long response_code;
        curl_easy_getinfo(curl, CURLINFO_RESPONSE_CODE, &response_code);
        printf("\nResponse: %ld\n", response_code);

        curl_easy_cleanup(curl); // always cleanup
    }

    curl_global_cleanup();
    return 0;
}