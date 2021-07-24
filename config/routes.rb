Rails.application.routes.draw do
  get 'admin/index'

  # devise_for :users
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  
  get 'users/edit/:id', to:'admin#edit', as: 'edit_user'
  
  patch 'users/update/:id', to:'admin#update', as: 'update_user'

  resources :stories

  get 'my_pictories', to: 'stories#my_pictories'

  root 'stories#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end