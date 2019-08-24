Rails.application.routes.draw do

root to: 'toppages#index'

get 'signup', to: 'users#new'
resources :users, only: [:new, :show, :create, :index] do
    member do
        get :followings
        get :followers
        get :likes
    end
end

get 'login', to: 'sessions#new'
post 'login', to: 'sessions#create'
delete 'logout', to: 'sessions#destroy'

resources :microposts, only: [:create, :destroy]
resources :relationships, only: [:create, :destroy]
resources :favorites, only: [:create, :destroy]

end 
