defmodule MyApp.Mailer do
  def deliver do
    email = %Mailman.Email{
      subject: "Email using Elixir!",
      from: "elixir@sp.richleland.com",
      to: [ "rich.leland@sparkpost.com" ],
      text: "Sending using SparkPost, Elixir, and Mailman.",
      html: "<p>Sending using SparkPost, Elixir, and Mailman.</p>"
    }
    Mailman.deliver(email, config)
  end

  def config do
    %Mailman.Context{
      config: %Mailman.SmtpConfig{
        relay: "smtp.sparkpostmail.com",
        username: "SMTP_Injection",
        password: "YOUR-API-KEY",
        port: 587,
        tls: :always,
        auth: :always,
        ssl: false
      },
      composer: %Mailman.EexComposeConfig{}
    }
  end
end
