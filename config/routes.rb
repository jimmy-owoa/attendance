Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      namespace :users do
        resources :dashboards, only: :index
        resource :current_user, only: :show
        post '/login', to: 'authentications#create'
      end
      resources :church_annexes, param: :slug do
        get :events, to: "church_annexes#events", on: :member
        get :members, to: "church_annexes#members", on: :member
        get "events/:id", to: "church_annexes#event", on: :member
        get "events/:id/attendees", to: "church_annexes#attendees", on: :member
        get "events/:id/event_members", to: "church_annexes#event_members", on: :member
        post "events/:id/register_attendee", to: "church_annexes#register_attendee", on: :member
        post "members", to: "church_annexes#create_member", on: :member
      end
      resources :churches
      resources :members
      resources :events
      resources :attendees
      post "members/search", to: "members#search"
    end
  end
end
