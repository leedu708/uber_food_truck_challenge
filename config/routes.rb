Rails.application.routes.draw do

  root 'food_facilities#index'
  resources :food_facilities, :only => [:index]
  post '/food_facilities', :to => 'food_facilities#index'

  
end
