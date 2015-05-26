Rails.application.routes.draw do
  get 'companies/index'

  get 'list_users/index'

  root 'dashboard#index'

  get 'listusers', to: 'list_users#index'

  post 'redeem', to: "points#redeem"

  resources :points, only: [:new, :index] do
    collection do
      get "company/:company_id", to: "points#show", as: "company"
    end
  end

  devise_for :users, controllers: { sessions: "users/sessions" }
  devise_for :managers, controllers: { sessions: "users/sessions" }
  devise_for :clerks, controllers: { sessions: "users/sessions" }

  get "promotions/all", to: "promotions#all"
  shallow do
    resources :companies, only: [:index] do
      resources :promotions, only: [:index, :show] do
        member do
          get :buy
        end
      end
    end
  end

  namespace :clerks do
    shallow do
      resources :vouchers do
        collection do
          get :all
        end
      end
    end
    get '/', to: "vouchers#index"
    get 'blah', to: "coupons#blah"
    post 'redeem', to: "coupons#redeem"
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
