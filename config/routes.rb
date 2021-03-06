Rails.application.routes.draw do

  namespace :api, defaults: { format: :json } do
    resources :users, only: [:index, :create, :destroy] do
      resources :lists, only: [:create, :update, :destroy], shallow: true
    end
    resources :lists, only: [] do
      resources :items, only: [:create, :update, :destroy], shallow: true do
        member do
          patch 'toggle_completed'
        end
      end
    end
  end

  devise_for :users
  root to: 'welcome#index'
end
