Rails.application.routes.draw do
    root to: 'static_pages#home'
  get    'signup', to: 'users#new'
  get    'login' , to: 'sessions#new'
  post   'login' , to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :users
  
    root 'static_pages#home'
  resources :users , except: [:new]
end


  
