# frozen_string_literal: true

Rails.application.routes.draw do
  root 'pages#index'

  resources :questions do
    resources :answers, except: %i[show new]
  end
end
