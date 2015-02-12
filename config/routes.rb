Rails.application.routes.draw do
  resources :songs

  devise_for :users
  resources :comments
  resources :user_followers
  resources :song_users
  
  


  devise_scope :user do 
    get 'register', to: 'devise/registrations#new', as: :register
    get 'login', to: 'devise/sessions#new', as: :login
    get 'logout', to: 'devise/sessions#destroy', as: :logout
  end

  resources :comments
  get 'feed', to: 'comments#index', as: :feed
  root 'songs#index'

  get '/profile/:id', to: 'profiles#show', as: 'profile'

  post '/favourites', to: 'favourites#create'

  

end






  # as :user do 
  #   get '/register', to: 'devise/registrations#new', as: :register
  #   get '/login', to: 'devise/sessions#new', as: :login
  #   get '/logout', to: 'devise/sessions#destroy', as: :logout
  # end

  # devise_for :users, skip: [:sessions]

  # as :user do 
  #  get "/login" => "devise/sessions#new", as: :new_user_session
  #  post "/login" => "deivse/sessions#create", as: :new_user_session
  #  delete "/logout" => 'devise/sessions#destroy', as: :destroy_user_session
  # end


  # resources :user_followers
  

  # resources :comments
  # get 'feed', to: 'comments#index', as: :feed
  # root 'comments#index'

  # get '/:id', to: 'profiles#show', as: 'profile'
  
