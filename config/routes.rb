Rails.application.routes.draw do
  get 'set_language/english'

  get 'set_language/swedish'

  mount JasmineRails::Engine => '/specs' if defined?(JasmineRails)
  mount Attachinary::Engine => "/attachinary"
  devise_for :charities, :donors

  root 'home#index'
  get '/charity' => 'charities#index'

  resources :charities
  resources :donations
  resources :donors, only: [:show]
end
