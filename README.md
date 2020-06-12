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
- Automated CI testing using GitHub Actions

## Set up

### Requirements

- [Ruby](https://www.ruby-lang.org/en/) **2.6.x** version.

### Twilio Account Settings

You need to collect all the config values to run the application.

| Config Value | Description            |
| :----------- | :----------------------|
| TWILIO_ACCOUNT_SID  | Your primary Twilio account identifier - find this [in the Console](https://www.twilio.com/console) on project settings. |
| TWILIO_AUTH_TOKEN | Used to authenticate - [just like the above, you'll find this here](https://www.twilio.com/console) on project setting. |

### Local development

1. First clone this repository and `cd` into it.

   ```bash
   git clone https://github.com/TwilioDevEd/send-sms-during-inbound-calls-ruby.git
   cd send-sms-during-inbound-calls-ruby
   ```

2. Install the dependencies.

   ```bash
   make install
   ```

3. Copy the sample configuration file and edit it to match your configuration.

   ```bash
   cp .env.example .env
   ```

   See [Twilio Account Settings](#twilio-account-settings) to locate the necessary environment variables.

4. Start the server, the following command will run the application on port 4567.

   ```bash
   make serve
   ```

5. Expose the application to the wider Internet using [ngrok](https://ngrok.com/).

   ```bash
   ngrok http 4567 -host-header="localhost:4567"
   ```

6. Configure Twilio to call your webhooks

   You will need to configure Twilio to call your application when calls are
   received in your [*Twilio Number*](https://www.twilio.com/console/phone-numbers/incoming).
   The voice url should look something like this:

   ```
   https://0f72e8a8.ngrok.io/answer
   ```

7. Finally, call your Twilio number to test it out.

That's it!

### Docker

If you have [Docker](https://www.docker.com/) already installed on your machine, you can use our `docker-compose.yml` to setup your project.

1. Make sure you have the project cloned.
2. Setup the `.env` file as outlined in the [Local Development](#local-development) steps.
3. Run `docker-compose up`.
4. Follow the steps in [Local Development](#local-development) on how to expose your port to Twilio using a tool like [ngrok](https://ngrok.com/) and configure the remaining parts of your application.

### Tests

You can run the tests locally by typing:

```bash
bundle exec rspec
```

### Cloud deployment

Additionally to trying out this application locally, you can deploy it to a variety of host services. Here is a small selection of them.

Please be aware that some of these might charge you for the usage or might make the source code for this application visible to the public. When in doubt research the respective hosting service first.

| Service                           |                                                                                                                                                                                                                           |
| :-------------------------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| [Heroku](https://www.heroku.com/) | [![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy)                                                                                                                                       |

## Resources

- The CodeExchange repository can be found [here](https://github.com/twilio-labs/code-exchange/).

## Contributing

This template is open source and welcomes contributions. All contributions are subject to our [Code of Conduct](https://github.com/twilio-labs/.github/blob/master/CODE_OF_CONDUCT.md).

[Visit the project on GitHub](https://github.com/twilio-labs/sample-template-nodejs)

## License

[MIT](http://www.opensource.org/licenses/mit-license.html)

## Disclaimer

No warranty expressed or implied. Software is as is.

[twilio]: https://www.twilio.com
