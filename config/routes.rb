Rails.application.routes.draw do
  resources :winners
  resources :computers
  resources :games
  root "games#new"
  resources :users
  post "/games/menu", to: "games#menu", as: "menu"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
 end
