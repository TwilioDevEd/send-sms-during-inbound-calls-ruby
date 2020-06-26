# frozen_string_literal: true

require('spec_helper')

class MessageFake
  def initialize
  end

  def create(from = '+1', to = '+2', body = 'body')
  end
end
class ClientFake
  def initialize
  end

  def messages
  end
end

describe 'app' do
  say = '<Say voice="alice">Thanks for calling! We just sent you a text with a clue.</Say>'
  parameters = { From: '+5931231231234', To: '+1234567890' }

  describe 'post /answer' do
    it 'responds 200' do
      post '/answer', parameters
      expect(last_response).to be_ok
      expect(last_response.body).to include(say)
    end

    it 'calls Twilio library to send message' do
      mock_client = ClientFake.new
      mock_message = MessageFake.new
      allow(Twilio::REST::Client).to receive(:new).and_return(mock_client)
      allow(mock_client).to receive(:messages).and_return(mock_message)
      allow(mock_message).to receive(:create)

      post '/answer', parameters
      expect(last_response).to be_ok
      expect(mock_message).to have_received(:create).with(
        body: "There's always money in the banana stand.",
        from: '+1234567890',
        to: '+5931231231234'
      )
    end
  end

  describe 'get /answer' do
    it 'responds 200' do
      get '/answer', parameters
      expect(last_response).to be_ok
      expect(last_response.body).to include(say)
    end
  end
end
