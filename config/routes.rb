TuxedoProto::Application.routes.draw do

  #DEVISE
  devise_for :vendors
  devise_for :customers

  #ROUTES
  root to: 'static_pages#home'
  match  '/registration_choice', to: 'static_pages#registration_choice', via: 'get'
  match '/profile', to: 'static_pages#profile', via: 'get'
  match '/profile/edit', to: 'static_pages#profile_edit', via: 'get'
end
