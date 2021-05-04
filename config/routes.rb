Rails.application.routes.draw do
  resources :quizzes
  devise_for :users

  post 'quizzes/random', to: 'quizzes#choose_random', as: 'choose_random'
  root 'quizzes#index'
end
