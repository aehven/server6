Rails.application.routes.draw do
  resources :customers
  mount_devise_token_auth_for 'User', at: 'auth'

  mount ActionCable.server => '/cable'

  resources :users do
    member do
      get :next_notification
      post :acknowledge_notification
      get :download_data
    end
  end

  resources :notifications

  post "resetpassword", controller: 'users', action: 'reset_password'
  post "unsubscribe", controller: 'users', action: 'unsubscribe'

  resources :audits, only: [:index, :show, :update]
end
