# frozen_string_literal: true

require('spec_helper')

describe 'app' do
  say = '<Say voice="alice">Thanks for calling! We just sent you a text with a clue.</Say>'
  parameters = { From: '+5931231231234', To: '+1234567890' }

  describe 'post /answer' do
    it 'responds 200' do
      post '/answer', :params => parameters
      expect(last_response).to be_ok
      expect(last_response.body).to include(say)
    end
  end

  describe 'get /answer' do
    it 'responds 200' do
      get '/answer', :params => parameters
      expect(last_response).to be_ok
      expect(last_response.body).to include(say)
    end
  end
end
