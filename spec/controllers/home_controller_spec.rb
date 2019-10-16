# frozen_string_literal: true

require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  describe 'index home' do
    context "when user isn't logged" do
      it 'access page with success' do
        get :index
        expect(response).to have_http_status(:successful)
      end
    end

    context 'when user is logged' do
      it 'access page with success' do
        sign_in FactoryBot.create(:establishment)
        get :index
        expect(response).to have_http_status(:successful)
      end
    end
  end
end
