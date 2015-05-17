Rails.application.routes.draw do
  devise_for :users
  devise_for :clerks, controllers: { registrations: "clerks/registrations" }
  root 'dashboard#index'
end
