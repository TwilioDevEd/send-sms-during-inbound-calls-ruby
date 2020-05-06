<a href="https://www.twilio.com">
  <img src="https://static0.twilio.com/marketing/bundles/marketing/img/logos/wordmark-red.svg" alt="Twilio" width="250" />
</a>

# Send an SMS during a phone call. Powered by Twilio and Ruby/Sinatra

![](https://github.com/TwilioDevEd/send-sms-during-inbound-calls-ruby/workflows/Ruby/badge.svg)

> We are currently in the process of updating this sample template. If you are encountering any issues with the sample, please open an issue at [github.com/twilio-labs/code-exchange/issues](https://github.com/twilio-labs/code-exchange/issues) and we'll try to help you.

Learn how to send an SMS to someone who's called your Twilio phone number while they're on the call.

This small sample application will say a short message to an inbound caller and, at the same time, send them an SMS.

[Read the full tutorial here!](https://www.twilio.com/docs/sms/tutorials/send-sms-during-phone-call-ruby)

## Features

- [Sinatra](http://sinatrarb.com/)
- [Twilio Ruby Helper Library](https://www.twilio.com/docs/libraries/ruby)
- Unit tests using [`Rspec`](https://rspec.info/)
- [Automated CI testing using GitHub Actions](/.github/workflows/rails.yml)

## Set up

### Requirements

- [Ruby](https://www.ruby-lang.org/en/) **2.6.x** version.

### Twilio Account Settings

You need to collect all the config values to run the application.

| Config Value  | Description |
| :-------------  |:------------- |
TWILIO_ACCOUNT_SID / TWILIO_AUTH_TOKEN | In [Twilio Account Settings](https://www.twilio.com/console).


### Local development

1. First clone this repository and `cd` into it.

   ```bash
   $ git clone https://github.com/TwilioDevEd/send-sms-during-inbound-calls-ruby.git
   $ cd send-sms-during-inbound-calls-ruby
   ```

1. Install the dependencies.

    ```bash
    $ bundle install
    ```

1. Copy the sample configuration file and edit it to match your configuration.

    ```bash
    $ cp .env.example .env
    ```
   See [Twilio Account Settings](#twilio-account-settings) to locate the necessary environment variables.

1. Start the server, the following command will run the application on port 4567.

    ```bash
    $ bundle exec ruby app.rb
    ```

1. Expose the application to the wider Internet using [ngrok](https://ngrok.com/).

    ```bash
    $ ngrok http 4567 -host-header="localhost:4567"
    ```

1. Configure Twilio to call your webhooks

  You will need to configure Twilio to call your application when calls are
  received in your [*Twilio Number*](https://www.twilio.com/user/account/messaging/phone-numbers).
  The voice url should look something like this:

  ```
  https://<your-ngrok-subdomain>.ngrok.io/answer
  ```

That's it!

### Test

1. To run the tests locally, execute the following command.

    ```bash
    $ bundle exec rspec
    ```

## Meta

* No warranty expressed or implied. Software is as is. Diggity.
* The CodeExchange repository can be found [here](https://github.com/twilio-labs/code-exchange/).
* [MIT License](http://www.opensource.org/licenses/mit-license.html)
* Lovingly crafted by Twilio Developer Education.
