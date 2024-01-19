Rails.application.routes.draw do
  namespace :api do
    resources :books, only: [:index]
  end

  resources :books do
  member do
    get 'issue_confirmation'
    get 'issue_book'
    post 'confirm_issue_book' # or choose a different name if needed
  end
end

  resources :books
  resources :uni_libraries
   devise_for :users, controllers: {
        sessions: 'user/sessions',
        :registrations => "user/registrations",
        :passwords => "user/passwords",
         :confirmations => "user/confirmations"
      }
  get 'home/index'
  get 'home/about'

  root to: 'home#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
