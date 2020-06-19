Rails.application.routes.draw do
  post "/graphql", to: "graphql#execute"
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end

  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  mount ActionCable.server => '/cable'

  # api versioning: https://paweljw.github.io/2017/07/rails-5.1-api-app-part-3-api-versioning/
  namespace :api do
    namespace :v1 do
      post 'user_token' => 'user_token#create'

      resources :organizations
      resources :users do
        member do
          get :next_notification
          post :acknowledge_notification
          get :download_data
        end
      end
      get 'get_profile' => "users#get_profile"
    
      resources :notifications
    
      post "resetpassword", controller: 'users', action: 'reset_password'
      post "unsubscribe", controller: 'users', action: 'unsubscribe'
    
      resources :audits, only: [:index, :show, :update]
    end
  end
end
