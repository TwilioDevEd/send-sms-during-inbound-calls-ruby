require 'sinatra'
require 'twilio-ruby'

post '/answer' do
  from = params['From']
  twilio_number = params['To']
  send_sms(from, twilio_number)

  Twilio::TwiML::VoiceResponse.new do |r|
    r.say(
      message: 'Thanks for calling! We just sent you a text with a clue.',
      voice: 'alice'
    )
  end.to_s
end

def send_sms(from, twilio_number)
  account_sid = ENV['ACCOUNT_SID']
  auth_token = ENV['AUTH_TOKEN']
  client = Twilio::REST::Client.new(account_sid, auth_token)

  begin
    client.messages.create(
      from: twilio_number,
      to: from,
      body: "There's always money in the banana stand."
    )
  rescue Twilio::REST::RestError => e
    if e.code == 21614
      puts "Uh oh, looks like this caller can't receive SMS messages."
    end
  end
end
