Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'

  get 'admin', to: 'admin#index'

  get 'studenthome', to: 'studenthome#show'

  resources :students
  resources :admin
end
