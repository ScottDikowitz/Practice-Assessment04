Links::Application.routes.draw do
  resources :users, only: [:new, :create, :show]
  resource :session, only: [:new, :create, :destroy]
  resources :links #do
  #   resources :comments, except: [:index]
  # end
  resources :comments, except: [:index]
end
