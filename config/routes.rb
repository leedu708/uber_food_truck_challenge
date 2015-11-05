Rails.application.routes.draw do
  root 'food_facility#index'
  resources :food_facility, :only => [:index]
end
