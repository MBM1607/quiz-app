Rails.application.routes.draw do
  resources :quizzes
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    confirmations: 'users/confirmations',
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }

  root 'quizzes#index'

  get 'quizzes/show_answer/:question_id', to: 'quizzes#show_answer', as: 'show_answer'

  post 'quizzes/random', to: 'quizzes#choose_random', as: 'choose_random'
end
