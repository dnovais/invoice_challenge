Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'invoices#welcome'

  get 'welcome', to: 'invoices#welcome'

  namespace :api do
    resources :invoices, only: [:index, :show, :create, :update]
  end
end
