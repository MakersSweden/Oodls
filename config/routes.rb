Rails.application.routes.draw do
  get 'set_language/english'

  get 'set_language/swedish'

  mount JasmineRails::Engine => '/specs' if defined?(JasmineRails)
  mount Attachinary::Engine => "/attachinary"
  devise_for :charities, :donors

  root 'home#index'
  get '/charity' => 'charities#index'

  resources :charities
  resources :donations do
    post 'donations/:id', controller: :donations, action: :save_claimm, as: :create_claim
    resources :donation_claims, only: [:create, :destroy]
  end
  resources :donors, only: [:show]
end
