SampleApp::Application.routes.draw do
  resources :points

  # resources :rows

  resources :rows do
    resources :points
  end

  resources :ds

  resources :standards

  resources :contexts

  resources :measurements

  resources :observations

  resources :traits

  resources :entities

  resources :users do
    member do
      get :following, :followers
    end
  end
  
  resources :sessions,      only: [:new, :create, :destroy]
  # resources :projects#,    only: [:create, :destroy, :show, :edit]
  
  # resources :projects
  resources :projects do
    member do
      post 'update_context'
      post 'update_row'
      get 'edit_context'
      get 'edit_row'
    end
  end
  resources :relationships, only: [:create, :destroy]
  root to: 'static_pages#home'
  match '/signup',  to: 'users#new',            via: 'get'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'
  match '/help',    to: 'static_pages#help',    via: 'get'
  match '/about',   to: 'static_pages#about',   via: 'get'
  match '/contact', to: 'static_pages#contact', via: 'get'
end
