Rails.application.routes.draw do
  resources :roasts do
    get "/import", on: :collection, to: "roasts#import_form"
    post "/import", on: :collection, to: "roasts#import"
    get "/import/:job_id", to: "roasts#import_wait", on: :collection, as: :import_wait
  end

  # Auth resources
  get "/login", to: "sessions#new", as: :new_session
  post "/login", to: "sessions#create", as: :session
  resources :register, only: %i[ new create ]
  resources :passwords, param: :token
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  root "roasts#index"
end
