Rails.application.routes.draw do

  namespace :api, defaults: { format: :json } do
    resources :users
  end

  devise_for :users
  root to: 'welcome#index'
end
