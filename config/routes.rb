Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      namespace :users do
        resources :dashboards, only: :index
        resource :current_user, only: :show
        post '/login', to: 'authentications#create'
      end
      resources :church_annexes
      resources :churches
    end
  end
end
