Rails.application.routes.draw do
  resources :documents
  resources :videos
  resources :sections
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'welcome#home'
  get 'welcome/myeu', to: 'welcome#myeu'
  get 'confirm_phone', to: 'welcome#confirm_phone'
  post 'verify_otp', to: 'welcome#verify_otp'

end
