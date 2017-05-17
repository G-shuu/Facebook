Rails.application.routes.draw do

  resources :topics, only: [:index, :new, :create, :show, :update, :edit, :destroy]

  root 'top#index'

end
