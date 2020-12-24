Rails.application.routes.draw do
  scope '(:locale)', locale: /#{I18n.available_locales.join('|')}/ do
    devise_for :users
    root 'events#index'

    resources :events do
      resources :comments, only: [:create, :destroy]
      resources :subscriptions, only: [:create, :destroy]
      resources :photos, only: [:create, :destroy]
    end
    resources :users, only: [:show, :edit, :update]
  end
end
