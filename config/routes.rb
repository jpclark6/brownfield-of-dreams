Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :tutorials, only:[:show, :index]
      resources :videos, only:[:show]
    end
  end

  root 'welcome#index'
  get 'tags/:tag', to: 'welcome#index', as: :tag
  get '/register', to: 'users#new'

  namespace :admin do
    get "/dashboard", to: "dashboard#show"
    resources :tutorials, only: [:create, :edit, :update, :destroy, :new, :show] do
      resources :videos, only: [:create]
    end
    resources :videos, only: [:edit, :update, :destroy]

    namespace :api do
      namespace :v1 do
        put "tutorial_sequencer/:tutorial_id", to: "tutorial_sequencer#update"
        get "/test", to: 'tutorial_sequencer#index', as: 'admin_api'
      end
    end
  end

  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"

  get '/dashboard', to: 'users#show'
  get '/about', to: 'about#show'
  get '/get_started', to: 'get_started#show'

  post '/friendships', to: 'friendships#create', as: 'add_friend'

  # Is this being used?
  get '/video', to: 'video#show'

  resources :users, only: [:new, :create, :update, :edit]
  get '/', to: 'welcome#index'
  get '/auth/github', as: 'github_login'
  get '/auth/github/callback', to: 'sessions#create'
  get '/confirmation', to: 'confirmation#create', as: 'send_email'
  get '/confirmation/:id', to: 'confirmation#update', as: 'confirmation'
  get '/invite', to: 'invite#new', as: 'send_invite'
  post '/invite', to: 'invite#create'

  resources :tutorials, only: [:show, :index] do
    resources :videos, only: [:show, :index]
  end

  resources :user_videos, only:[:create, :destroy]
end
