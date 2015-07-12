Rails.application.routes.draw do
  resources :incidents
  resources :concepts
  resources :cops 
  resources :evaluations
   root 'cops#index'
end
