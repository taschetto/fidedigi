Rails.application.routes.draw do
  get 'companies/index'

  get 'list_users/index'

  root 'dashboard#index'

  get 'listusers', to: 'list_users#index'

  post 'redeem', to: "points#redeem"

  resources :points, only: [:new]

  devise_for :users, controllers: { sessions: "users/sessions" }
  devise_for :managers, controllers: { sessions: "users/sessions" }
  devise_for :clerks, controllers: { sessions: "users/sessions" }

  get "promotions/all", to: "promotions#all"
  shallow do
    resources :companies, only: [:index] do
      resources :promotions, only: [:index, :show]
    end
  end

  resources :points, only: [:index, :show]

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
