Rails.application.routes.draw do
  root 'chatroom#index'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'register', to: 'users#new'
  post 'create', to: 'users#create'
  post 'message', to: 'messages#create'

  scope :sessions do
    get 'logout' => 'sessions#destroy'
  end

  mount ActionCable.server, at: '/cable'
end
