Rails.application.routes.draw do

  devise_for :users
  resources :topics, only: [:index, :new, :create, :show, :update, :edit, :destroy]

  root 'top#index'

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
