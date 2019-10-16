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

  describe 'create ad' do
    context "when user isn't logged_in" do
      it 'show error and redirect to login' do
        post :create
        expect(flash[:alert]).to eq(
          'Para continuar, efetue login ou registre-se.'
        )
        expect(response).to redirect_to(new_establishment_session_path)
      end
    end

    context 'when is logged in' do
      let(:establishment) { create(:establishment) }

      context 'when heading is blank' do
        it 'show error and redirect to new page' do
          sign_in establishment
          post :create, params: { advertisement: { value: 111 } }
          expect(flash[:error]).to eq(
            'Título é muito curto (mínimo: 2 caracteres)'
          )
          expect(response).to redirect_to(new_advertisement_path)
        end
      end

      context 'when value is blank' do
        it 'show error and redirect to new page' do
          sign_in establishment
          post :create, params: {
            advertisement: {
              heading: FFaker::LoremFR.sentence
            }
          }
          expect(flash[:error]).to eq('Valor não é um número')
          expect(response).to redirect_to(new_advertisement_path)
        end
      end

      context 'when value is negative' do
        it 'show error and redirect to new page' do
          sign_in establishment
          post :create, params: {
            advertisement: {
              heading: FFaker::LoremFR.word,
              value: -1
            }
          }
          expect(flash[:error]).to eq('Valor deve ser maior que 0')
          expect(response).to redirect_to(new_advertisement_path)
        end
      end

      context 'when all values is ok' do
        it 'create ad and redirect to index' do
          sign_in establishment
          post :create, params: {
            advertisement: {
              heading: FFaker::LoremFR.word,
              value: 111
            }
          }
          expect(flash[:success]).to eq(
            'Anúncio criado com sucesso!'
          )
          expect(response).to redirect_to(advertisements_path)
        end
      end
    end
  end

  describe 'edit ad' do
    context "when user isn't logged in" do
      it 'show error and redirect to login' do
        get :edit, params: { id: 0 }
        expect(flash[:alert]).to eq(
          'Para continuar, efetue login ou registre-se.'
        )
        expect(response).to redirect_to(new_establishment_session_path)
      end
    end

    context 'when user is logged in' do
      let(:ad) { create(:advertisement) }

      context "when ad doesn't exist" do
        it 'show error and redirect to root page' do
          sign_in ad.establishment
          get :edit, params: { id: 0 }
          expect(flash[:error]).to eq('Não encontrado')
          expect(response).to redirect_to(root_path)
        end
      end

      context 'when try to access a ad of another establishment' do
        it 'show error and redirect to root page' do
          new_ad = create(:advertisement)
          sign_in ad.establishment
          get :edit, params: { id: new_ad.id }
          expect(flash[:error]).to eq('Não autorizado')
          expect(response).to redirect_to(root_path)
        end
      end

      context 'try to access self product' do
        it 'get ad and show the edit page' do
          sign_in ad.establishment
          get :edit, params: { id: ad.id }
          expect(flash[:error]).to be_nil
          expect(response.status).to eq(200)
        end
      end
    end
  end

  describe 'update ad' do
    context "when user isn't logged in" do
      it 'show error and redirect to login' do
        put :update, params: { id: 0 }
        expect(flash[:alert]).to eq(
          'Para continuar, efetue login ou registre-se.'
        )
        expect(response).to redirect_to(new_establishment_session_path)
      end
    end

    context 'when user is logged in' do
      let(:ad) { create(:advertisement) }

      context "when ad doesn't exist" do
        it 'show error and redirect to root page' do
          sign_in ad.establishment
          put :update, params: { id: 0 }
          expect(flash[:error]).to eq('Não encontrado')
          expect(response).to redirect_to(root_path)
        end
      end

      context 'when try to update a ad of another establishment' do
        it 'show error and redirect to root page' do
          new_ad = create(:advertisement)
          sign_in ad.establishment
          put :update, params: { id: new_ad.id }
          expect(flash[:error]).to eq('Não autorizado')
          expect(response).to redirect_to(root_path)
        end
      end

      context 'when try to update own ad' do
        context 'try to let heading blank' do
          it 'show error and redirect to same page' do
            sign_in ad.establishment
            put :update, params: {
              id: ad.id,
              advertisement: {
                heading: ''
              }
            }
            expect(flash[:error]).to eq(
              'Título é muito curto (mínimo: 2 caracteres)'
            )
            expect(response).to redirect_to(edit_advertisement_path(ad))
          end
        end

        context 'try to let value blank' do
          it 'show error and redirect to same page' do
            sign_in ad.establishment
            put :update, params: {
              id: ad.id,
              advertisement: {
                value: ''
              }
            }
            expect(flash[:error]).to eq('Valor não é um número')
            expect(response).to redirect_to(edit_advertisement_path(ad))
          end
        end

        context 'when try with negative values' do
          it 'show error and redirect to same page' do
            sign_in ad.establishment
            put :update, params: {
              id: ad.id,
              advertisement: {
                value: -1
              }
            }
            expect(flash[:error]).to eq('Valor deve ser maior que 0')
            expect(response).to redirect_to(edit_advertisement_path(ad))
          end
        end

        context 'when all values is right' do
          it 'show error and redirect to same page' do
            sign_in ad.establishment
            put :update, params: {
              id: ad.id,
              advertisement: {
                heading: FFaker::LoremFR.sentence,
                value: 11
              }
            }
            expect(flash[:success]).to eq('Anúncio salvo com sucesso!')
            expect(response).to redirect_to(advertisements_path)
          end
        end
      end
    end
  end
end
