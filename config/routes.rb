Rails.application.routes.draw do
  # root to: 'tests#index'
  # get '/tests/:category/:title', to: 'tests#search'

  resources :tests do
    resources :questions, swallow: true
  end
end
