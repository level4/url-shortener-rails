Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "home#index"

  resources :redirects, only: [:create, :show, :new, :index]

  get "r/:id", controller: :request, action: :show

end
