Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  post 'auth/login' => 'authentication#authenticate'
  post 'signup' => 'users#create'
  get '/status/check' => 'status#check'

  resources :users, only: [:create, :show, :update, :destroy]
end
