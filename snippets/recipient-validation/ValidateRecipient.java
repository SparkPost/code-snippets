
// API call example. See https://www.sparkpost.com/docs/recipient-validation/integration-guide/

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

class ValidateRecipient {
    // Your program begins with a call to main().
    // Prints "Hello, World" to the terminal window.
    public static void main(final String args[]) throws Exception {
        // set to api.eu.sparkpost.com for EU accounts

        final String apiKey = System.getenv("SPARKPOST_API_KEY");

        final String recipient = "test@gmail.com";
        final URL url = new URL("https://api.sparkpost.com/api/v1/recipient-validation/single/" + recipient);

        final HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-Type", "application/json");
        conn.setRequestProperty("Authorization", apiKey);

        final int code = conn.getResponseCode();
        System.out.printf("%d %s\n", code, conn.getResponseMessage());

        if (code >= 200 && code <= 299) {
            final StringBuilder sb = new StringBuilder();

            // Production code would try/catch around this
            final BufferedReader rd = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));

            // Buffer the result into a string:
            String line;
            while ((line = rd.readLine()) != null) {
                sb.append(line);
            }
            final String msg = sb.toString();
            System.out.println(msg);
        }
    }
}