Rails.application.routes.draw do

  root "main#index"

  match 'about', to: "main#about", via: :get
  match 'hello', to: "main#hello", via: :get

  get 'main/index'

  resources :categories do
    member do
      get :delete
    end
  end

  resources :books do
    member do
      get :delete
    end
  end

  resources :posts

end
