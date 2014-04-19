TuxedoProto::Application.routes.draw do

  #DEVISE
  devise_for :vendors
  devise_for :customers

  #ROUTES
  root to: 'static_pages#home'
  match  '/registration_choice', to: 'static_pages#registration_choice', via: 'get'
  match '/customer_profile', to: 'customers#show', via: 'get'
  match '/vendor_profile', to: 'vendors#show', via: 'get'

  #RESOURCES
  resource :customers do
    resource :trips
  end
  resource :vendors do
    resource :activities
  end
end
