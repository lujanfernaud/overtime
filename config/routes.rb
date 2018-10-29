Rails.application.routes.draw do
  devise_for :users, skip: :registrations

  root "statics#index"

  resources :posts
end
