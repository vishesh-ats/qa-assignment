Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  
  get '/home/questions', to: 'home#questions', as: :home_questions
  
  resources :questions
  resources :answers
  resources :topics  
end
