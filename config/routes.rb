Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  root 'prototype#index'

  resources :events, only: [:index, :show, :new, :create] do
    resources :comments, :controller => 'event_comments'
    member do
      post :collect
    end
  end



  resources :subjects, only: [:index, :show, :new, :create]


  resources :orders, only: [:index, :show, :new, :create] do
    get :checkout_allpay, :on => :member
    post "notify", on: :member
  end

  resources :hosts

  get 'beta_sign_in' => 'prototype#sign_in', as: :sign_in
  get 'beta_sign_up' => 'prototype#sign_up', as: :sign_up
  get 'main' => 'prototype#main'
  #get 'subjects' => 'prototype#subjects_index', as: :subjects
  #get 'subject/23' => 'prototype#subject_show', as: :show_subject
  get 'dm_poster' => 'prototype#dm_poster'
  get 'host_page' => 'prototype#host_page'
  get 'host_new_subject' => 'prototype#host_new_subject'
  get 'host_new_event' => 'prototype#host_new_event'
  get 'host_promotion' => 'prototype#host_promotion'

end
