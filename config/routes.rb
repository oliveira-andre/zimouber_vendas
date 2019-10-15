Rails.application.routes.draw do
  devise_for :establishments
  root to: 'home#index'
end
