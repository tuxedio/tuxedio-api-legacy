TuxedoProto::Application.routes.draw do

  #DEVISE
  devise_for :vendors
  devise_for :customers

  #ROUTES
  root to: 'static_pages#home'
  match  '/registration_choice', to: 'static_pages#registration_choice', via: 'get'
  match '/profile', to: 'customers#show', via: 'get'

  #RESOURCES
  resource :customers

end
