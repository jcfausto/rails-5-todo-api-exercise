# spec/controllers/application_controller.rb
require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do
  # create a test user
  let(:user) { create(:user) }
  # set headers
  let(:headers) { { 'Authorization' => token_generator(user.id) } }
  # set an invalid header
  let(:invalid_headers) { { 'Authorization' => '' } }

  describe '#authorize_request' do
    context 'when auth token is passed' do
      before { allow(request).to receive(:headers).and_return(headers) }

      it 'sets the current user' do
        expect(subject.instance_eval { authorize_request }).to eq(user)
      end
    end

    # context 'when auth token is not passed' do
    #   before { allow(request).to receive(:headers).and_return(invalid_headers) }
    #
    #   it 'raises a MissingToken error' do
    #     expect(subject.instance_eval { authorize_request }).to
    #       raise_error(ExceptionHandler::MissingToken, Message.missing_token)
    #   end
    # end
  end
end
