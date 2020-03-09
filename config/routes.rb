Rails.application.routes.draw do
  root to: 'front#index'
  resources :front, only: [:index,:show] 
  resources :introduction, only: [:index] 
  resources :contact, only: [:index,:new,:create,:show]
  resources :history, only: [:index]
end
