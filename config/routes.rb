Rails.application.routes.draw do
  root 'dashboard#index'

  post 'redeem', to: "points#redeem"

  resources :points, only: [:new]

  devise_for :users, controllers: { sessions: "users/sessions" }
  devise_for :managers, controllers: { sessions: "users/sessions" }
  devise_for :clerks, controllers: { sessions: "users/sessions" }

  namespace :clerks do
    shallow do
      resources :vouchers do
        collection do
          get :all
        end
      end
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
