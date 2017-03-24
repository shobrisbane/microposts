Rails.application.routes.draw do
    root to: 'static_pages#home'
  get    'signup', to: 'users#new'
  get    'login' , to: 'sessions#new'
  post   'login' , to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :users
  resources :microposts
  resources :relationships, only: [:create, :destroy]
  
  resources :users do
    member do
     get :following, :followers
    end
  end
 
Retweeter::Application.routes.draw do
  resources :users do
    member do
      get :following, :followers
    end
  end
  
  resources :sessions, :only => [:new, :create, :destroy]
  resources :microposts, :only => [:create, :destroy]
  resources :relationships, :only => [:create, :destroy]
  
  resource :microposts do
    member do
      get :retweet
    end
  end
end

end

  
