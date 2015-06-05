Rails.application.routes.draw do
  post '/rate' => 'rater#create', :as => 'rate'
  get 'donors/index'

  get 'donors/show'

  get 'set_language/english'

  get 'set_language/swedish'

  mount JasmineRails::Engine => '/specs' if defined?(JasmineRails)
  mount Attachinary::Engine => '/attachinary'
  devise_for :charities
  devise_for :donors, controllers: { registrations: 'donors/registrations' }

  root 'home#index'
  get '/charity' => 'charities#index'

  resources :charities
  resources :donations do
    resources :donation_claims, only: [:create, :destroy] do
      member do
        patch :accept_claim
        patch :unaccept_claim
      end
    end
  end
  resources :donors do
    resources :donor_comments, only: [:create]
  end
end
