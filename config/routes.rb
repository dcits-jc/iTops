Rails.application.routes.draw do
  devise_for :users


  root 'projects#index'

  resources :projects do
    resources :workflows do
      member do
        post :confirm
      end
    end
    member do
      get :invite
      post :join_in
      post :refuse
    end
  end


  # 管理员路由
  namespace :admin do
    resources :users do
      member do 
        post :set_admin
        post :cancel_admin
      end 
    end
    resources :projects

  end



end