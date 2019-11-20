Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
	resources :locations
  resources :users
	root 'locations#index'
end
