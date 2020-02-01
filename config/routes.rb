Rails.application.routes.draw do
  post 'user_token' => 'user_token#create'
  resources :customers

  mount ActionCable.server => '/cable'

  resources :users do
    member do
      get :next_notification
      post :acknowledge_notification
      get :download_data
    end
  end
  get 'get_env' => "users#get_env"

  resources :notifications

  post "resetpassword", controller: 'users', action: 'reset_password'
  post "unsubscribe", controller: 'users', action: 'unsubscribe'

  resources :audits, only: [:index, :show, :update]
end
