Rails.application.routes.draw do
  root 'dashboard#index'

  devise_for :users, controllers: { sessions: "users/sessions" }
  devise_for :managers, controllers: { sessions: "users/sessions" }

  namespace :managers do
    resource :company
    get '/', to: "companies#show"
  end
end
