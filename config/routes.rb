Rails.application.routes.draw do
  root to: 'static_pages#home'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  resources :users, only: [:index, :show, :new, :create]
  
  resources :orders, only: [:index, :show, :create] do
    member do
      get :line_items
    end
  end
  
  resources :projects do
    member do
       get :orders
       resources :orders, only: [:new]
    end
  end
  
  resources :partners
  
  resources :items, only: [:index, :new, :create, :edit, :update, :destroy]
  
  resources :item_categories
  
end
