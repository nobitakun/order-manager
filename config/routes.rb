Rails.application.routes.draw do
  root to: 'static_pages#home'
  
  get 'dbmap', to: 'static_pages#dbmap'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get '/order_lists/:id/copy_set', to: 'order_lists#copy_set', as: 'copy_set_order_list'
  get '/order_lists/:id/copy', to: 'order_lists#copy', as: 'copy_order_list'
  
  get 'signup', to: 'users#new'
  resources :users
  
  resources :order_lists, only: [:index, :show, :create, :edit, :update, :destroy] do
    member do
      get :line_items
    end
  end
  
  resources :orders, only: [:index, :show, :create, :edit, :update, :destroy] do
    member do
      get :line_items
    end
  end
  
  resources :projects do
    member do
       get :order_lists
       resources :order_lists, only: [:new, :edit, :update]
    end
  end
  
  resources :projects do
    member do
       get :orders
       resources :orders, only: [:new, :edit, :update]
    end
  end
  
  resources :partners
  
  resources :items, only: [:index, :new, :create, :edit, :update, :destroy]
  
  resources :item_categories, only: [:index, :new, :create, :edit, :update, :destroy]
  
  get 'ajax_select', to: 'items#ajax_select', as: 'ajax_select'
  
end
