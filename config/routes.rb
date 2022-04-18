Rails.application.routes.draw do
  root to: 'pages#index'
  devise_for :users, :controllers => {:registrations => "registrations"}
  get 'dashboard', to: "pages#dashboard", as: :dashboard
  match '*path' => redirect('/'), via: :get
end
