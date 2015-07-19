Rails.application.routes.draw do
  devise_for :users

  root 'prototype#index'

  resources :events, only: [:index, :show, :new, :create]

  get 'beta_sign_in' => 'prototype#sign_in', as: :sign_in
  get 'beta_sign_up' => 'prototype#sign_up', as: :sign_up
  get 'main' => 'prototype#main'
  get 'subjects' => 'prototype#subjects_index', as: :subjects
  get 'subject/23' => 'prototype#subject_show', as: :show_subject
end
