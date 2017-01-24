Rails.application.routes.draw do

  root 'apps#index'
  get 'code' => 'static_pages#home' #allows localhost:3000/code to also go to promo code page

  get 'register' => 'static_pages#register'
  get 'signup'  => 'users#new'

  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'


  get 'connect_result' => 'networks#connect_result'

  resources :users
  resources :apps
  resources :turtles
  resources :networks

  get 'turtleinfo' => 'connections#turtleinfo'
  get 'connections' => 'connections#index'
  post 'promo' => 'promo#validate'

  #API for iOS app
  post 'ios_login' => 'sessions#login'
  post 'ios_register' => 'users#register'
  post 'ios_promo' => 'promo#validate_ios'
  post 'ios_turtle_profile' => 'turtles#populate_profile'

end
