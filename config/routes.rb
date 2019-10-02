Rails.application.routes.draw do
  resources :winners
  resources :computers
  resources :users do
    resources :games do
      post "/left_hook", to: "games#left_hook", as:"left_hook"
      post "/right_hook", to: "games#right_hook", as:"right_hook"
      post "/left_dodge", to: "games#left_dodge", as:"left_dodge"
      post "/right_dodge", to: "games#right_dodge", as:"right_dodge"
      post "/uppercut", to: "games#uppercut", as:"uppercut"
    end
  end
  root "users#new"

 get "/users/:id/leaderboard", to: "winners#index", as:"leaderboard"
 
 resources :users do
  get "/computer_lvl", to: "games#computer_lvl", as:"computer_lvl"
 end

 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
 end
