Rails.application.routes.draw do
  resources :results
  resources :answers
  resources :questions
  resources :quizzes
  devise_for :users

  root 'quizzes#index'
end
