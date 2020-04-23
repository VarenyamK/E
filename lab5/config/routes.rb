Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'

  get 'admin', to: 'admin#index'

  get 'studenthome', to: 'studenthome#index'
  get 'teacherhome', to: 'teacherhome#index'

  get 'course_refresh', to: 'courses#refresh'
  get 'scrape', to: 'scraper#scrape'

  resources :scraper
  resources :courses
  resources :students
  resources :admin
  resources :users
  resources :recommendations
  resources :requests
end
