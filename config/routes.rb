Rails.application.routes.draw do

  get 'set_language/english'

  get 'set_language/swedish'

  mount JasmineRails::Engine => '/specs' if defined?(JasmineRails)
  devise_for :charities

  root 'home#index'
  get '/charity' => 'charities#index'

  resources :charities
  resources :donations do
    resources :donation_claims, only: [:create, :destroy]
  end
end
