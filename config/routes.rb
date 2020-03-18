Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  
  get '/home/questions', to: 'home#questions', as: :home_questions
  
  resources :questions
  resources :answers
  resources :topics
  
  get 'follow_user/:id', to: 'followings#follow_user', as: :follow_user 
  get 'follow_topic/:id', to: 'followings#follow_topic', as: :follow_topic 
end
