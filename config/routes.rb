Rails.application.routes.draw do
  get 'current_user', to: 'users/current_user#index'

  devise_for :users, path:'', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  },
  controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "graphql#execute"
  end

  post "/graphql", to: "graphql#execute"
  
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end