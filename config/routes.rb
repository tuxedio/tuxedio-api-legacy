TuxedoProto::Application.routes.draw do

  #DEVISE
  devise_for :vendors
  devise_for :customers

  #ROUTES
  root to: 'static_pages#home'
  match '/registration_choice', to: 'static_pages#registration_choice', via: 'get'
  match '/customer_profile',    to: 'customers#show',                   via: 'get'
  match '/vendor_profile',      to: 'vendors#show',                     via: 'get'
  match '/explore',             to: 'activities#explore',               via: 'get'
  match '/activities',          to: redirect('/explore'),               via: 'get'
  # Routes for Yelp information
  resource :vendors do
    collection do
      get 'confirm_details'
      get 'update_details'
    end
  end

  resource :activities do
    collection do
      get 'explore'
    end
  end

  resource :customers do
	 resource :trips
  end

  resource :trips do
    resource :itinerary_items
  end

  resource :vendors do
    resource :activities
  end

  resource :activities do
    resource :activity_times
  end
end
