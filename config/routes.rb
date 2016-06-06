Rails.application.routes.draw do
  resources :matches
  
  root to: 'matches#index'
  
  get '/past', to: 'matches#past'
end
