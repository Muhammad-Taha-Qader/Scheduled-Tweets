Rails.application.routes.draw do
  # # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # # Can be used by load balancers and uptime monitors to verify that the app is live.
  # get "up" => "rails/health#show", as: :rails_health_check

  # # Render dynamic PWA files from app/views/pwa/*
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # # Defines the root path route ("/")
  # # root "posts#index"

  # Get /about
  get "/about", to: "about#index"
  # $NOTES$ OR works same : get "about", to: "about#index"
  #
  # <a class="nav-link" href="/about">About</a>
  # <%#
  # $NOTES$ above can be written as: <%= link_to "About", about_path, class="nav-link"
  #                                 <%= link_to "is content", <UR route name>_path, class="nav-link"
  #   Benifit of that is if you chnage your url link ie /about to /about_us you don't need to chnage the lick text everywhere
  # just mention:
  #                get "/about-us", to: "about#index" as: :about   and u can still use    <%= link_to "About", about_path, class="nav-link"  browser will respond to /about-us
  #    instead of: get "/about", to: "about#index"
  #             if u do: get "/about-us", to: "about#index"  it will auto make a name/prefix as about_us
  #
  # u can run rails routes  to see all routes in ur app
  # %>

  # Get /
  # get "/", to: "main#index"
  # $NOTES$ OR
  # get "", to: "main#index"
  root to: "main#index"    # root is rails' custom helper


  # GET /sign_up
  get "/sign_up", to: "registration#new"
  # post "/users", to: "registration#create"   by default new.html form will look for it , but's a confusing route for sign_up page as named as users
  post "/sign_up", to: "registration#create"  # if we named it as we did , we need to tell our form to look for this instead ie: <%= form_with model: @user, url: sign_up_path do |form|%>

  get "/sign_in", to: "sessions#new"
  post "/sign_in", to: "sessions#create"

  delete "/logout", to: "sessions#destroy"
end
