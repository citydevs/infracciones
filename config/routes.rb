Rails.application.routes.draw do
  resources :incidents
  resources :concepts
  resources :cops 
   root 'cops#index'
end
