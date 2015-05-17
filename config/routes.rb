Rails.application.routes.draw do
  devise_for :users
  devise_for :managers, controllers: { registrations: "managers/registrations" }
  root 'dashboard#index'

  namespace :managers do
    resource :company do
    end
  end
end
