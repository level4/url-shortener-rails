Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "redirects#new"

  resources :redirects, only: [:create, :show, :new, :index]

  get "r/:id", controller: :request, action: :show

  namespace :api do
    resources :redirects, only: [:index, :show] do
      resources :visits, only: [:index]
    end
  end

end
