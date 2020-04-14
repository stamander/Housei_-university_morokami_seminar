Rails.application.routes.draw do
  root to: 'private#index'
  resources :front, only: [:index,:show] 
  resources :introduction, only: [:index] 
  resources :contact do
    collection do
      post 'confirm'
    end
  end

  resources :history, only: [:index]
  resources :private
end
