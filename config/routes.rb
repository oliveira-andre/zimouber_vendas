# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :establishments
  resources :advertisements, except: :destroy
  root to: 'home#index'
end
