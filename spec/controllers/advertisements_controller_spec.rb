# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AdvertisementsController, type: :controller do
  describe 'index ad' do
    context "when user isn't logged_in" do
      it 'show error and redirect to login' do
        get :index
        expect(flash[:alert]).to eq(
          'Para continuar, efetue login ou registre-se.'
        )
        expect(response).to redirect_to(new_establishment_session_path)
      end
    end

    context 'when user is logged in' do
      let(:establishment) { create(:establishment) }

      context 'when user have ads' do
        it 'access with success and show ad' do
          create(:advertisement, establishment: establishment)
          sign_in establishment
          get :index
          expect(response.status).to eq(200)
          expect(assigns(:ads)).not_to be_empty
        end
      end

      context "when user haven't ads" do
        it 'access with success but not show ad' do
          new_establishment = create(:establishment)
          sign_in new_establishment
          get :index
          expect(response.status).to eq(200)
          expect(assigns(:ads)).to be_empty
        end
      end
    end
  end

  describe 'new ad' do
    context "when user isn't logged_in" do
      it 'show error and redirect to login' do
        get :new
        expect(flash[:alert]).to eq(
          'Para continuar, efetue login ou registre-se.'
        )
        expect(response).to redirect_to(new_establishment_session_path)
      end
    end

    context 'when user is logged in' do
      let(:establishment) { create(:establishment) }

      context 'when try to create ad' do
        it 'show message and access with success' do
          sign_in establishment
          get :new
          expect(response.status).to eq(200)
          expect(assigns(:ad).establishment.id).to be(establishment.id)
        end
      end
    end
  end
end
