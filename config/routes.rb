Rails.application.routes.draw do
  devise_for :users


  # root 'projects#index'

  # 首页设置为本周周报
  root 'weeklies#this_week'


  resources :projects do
    resources :workflows
  end


  # 管理员路由
  namespace :admin do
    resources :users do
      member do 
        post :set_admin
        post :cancel_admin
        post :set_pm
        post :cancel_pm
      end 
      resources :weeklies
    end
    resources :projects do
      member do
        post :enable_workflow
        post :disable_workflow
      end
    end
    resources :weekly_templates
  end



  # 普通用户
  resources :weeklies do
    collection do
      get :this_week
    end
    resources :workflows
  end
  resources :users


  namespace :api, :defaults => { :format => :json } do
    namespace :v1 do
      # resources :trains, only: [:index, :show]
      # resources :reservations, ony:[:show, :create, :update, :destroy] 
      # 为了更明白的给api 使用者显示,所以最好手动列出来,并且将'id'换成对应的参数
      get "/projects/:project_code" => "projects#show", as: :project
    end
  end

end