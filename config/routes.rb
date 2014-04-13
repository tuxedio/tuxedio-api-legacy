TuxedoProto::Application.routes.draw do

  #DEVISE
  devise_for :vendors
  devise_for :customers

  #ROUTES
  root to: 'static_pages#home'
  match  '/registration_choice', to: 'static_pages#registration_choice', via: 'get'

  # match '/signup',  to: 'users#new',        via: 'get'
  # match '/signin',  to: 'sessions#new',     via: 'get'
  # match '/signout', to: 'sessions#destroy', via: 'delete'

end
