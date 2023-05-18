Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'users#index'
  get 'users', to: 'users#index', as: 'users'
  get 'users/:id', to: 'users#show', as: 'user'
  get 'users/:user_id/posts', to: 'posts#index', as: 'user_posts'
  get 'posts/:id', to: 'posts#show', as: 'user_post'

  # resources :posts, only: [:create]
  resources :posts, only: [:create] do
    resources :comments, only: [:create]
    post 'like', to: 'likes#create', as: :like
    delete 'unlike', to: 'likes#destroy', as: :unlike
  end
end
