Rails.application.routes.draw do
  #post 'topics/[:topic_id]/comments/new'

  get 'favorites/index'

  get 'sessions/new'

  root 'pages#index'
  get 'pages/help'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources 'users'
  resources 'topics' do
    resources 'comments'
  end
  post '/favorites', to: 'favorites#create'
  get '/favorites', to: 'favorites#index'

end
