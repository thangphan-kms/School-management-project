Rails.application.routes.draw do
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
