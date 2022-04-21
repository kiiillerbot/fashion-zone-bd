Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :products
  resources :categories
  root to: 'pages#index'
  devise_for :users, :controllers => {:registrations => "registrations"}
  get 'dashboard', to: "pages#dashboard", as: :dashboard
  get 'how-to-order', to: "pages#order", as: :order
  match '*path' => redirect('/'), via: :get
end
