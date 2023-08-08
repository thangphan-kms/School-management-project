Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [] do
        scope module: :users do
          resources :courses, only: [:index, :show]
        end
      end

      resources :courses, only: [:index, :show]
    end
  end

  scope :api do
    scope :v1 do
      devise_for :users, path: '', path_names: {
        sign_in: 'login',
        sign_out: 'logout',
        registration: 'signup'
      }, controllers: {
        sessions: 'api/v1/users/sessions',
        registrations: 'api/v1/users/registrations'
      }

      get '/current_user', to: 'api/v1/current_user#index'
      get '/roles', to: 'api/v1/role#index'
    end
  end
end
