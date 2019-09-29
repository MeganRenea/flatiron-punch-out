Rails.application.routes.draw do
  resources :winners
  resources :computers
  resources :users do
    resources :games do
      post "/left_hook", to: "games#left_hook", as:"left_hook"
      post "/right_hook", to: "games#right_hook", as:"right_hook"
      post "/left_dodge", to: "games#left_dodge", as:"left_dodge"
      post "/right_dodge", to: "games#right_dodge", as:"right_dodge"
    end
  end
  root "users#new"
 
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
 end
