Rails.application.routes.draw do
  root 'dashboard#index'

  devise_for :users, controllers: { sessions: "users/sessions" }
  devise_for :managers, controllers: { sessions: "users/sessions" }
  devise_for :clerks, controllers: { sessions: "users/sessions" }

  namespace :clerks do
    shallow do
      resources :vouchers
    end
    get '/', to: "vouchers#index"
  end

  namespace :managers do
    shallow do
      resource :company do
        resources :clerks
      end
    end
    get '/', to: "companies#show"
  end

end
