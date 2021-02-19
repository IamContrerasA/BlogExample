Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "articles#index"
  
  resources :articles do
    resources :comments
  end

  #single routes
  post "/articles/update_status", to: "articles#update_status"
  
end
