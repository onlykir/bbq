Rails.application.routes.draw do
  scope '(:locale)', locale: /#{I18n.available_locales.join('|')}/ do
    devise_for :users
    root 'events#index'

    resources :events
    resources :users, only: [:show, :edit, :update]
  end
end
