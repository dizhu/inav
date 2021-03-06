# -*- encoding : utf-8 -*-
Inav::Application.routes.draw do
  root :to => "main#index"

  get '/about' => 'main#about'

  resources :back_tasks, :only => [:create, :index]
  resources :items, :only => [:index]

  resources :user_sessions, :only => [:new, :destroy] do
    collection do
      match 'callback'
      get 'not_login'
      get 'oauth2_expired'
    end
  end

  resources :seller_cats, :only => [:index] do
    collection do
      put 'update_priorities'
    end
  end

  resource :setting, :only => [:show, :update] do
    member do
      get 'edit_template'
      put 'update_template'
      post 'preview_template'
    end
  end
end
