require 'rails_helper'

RSpec.describe RoomsController do
  describe 'GET /' do
    before { get :index }

    it '200 OKが返る' do
      expect(response).to be_success
    end
  end
end
