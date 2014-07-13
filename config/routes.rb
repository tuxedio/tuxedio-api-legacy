TuxedoProto::Application.routes.draw do

  #DEVISE
  devise_for :vendors
  devise_for :people

  #ROUTES
  root to: 'static_pages#home'
  match '/registration_choice', to: 'static_pages#registration_choice', via: 'get'
  match '/person_profile',    to: 'people#show',                   via: 'get'
  match '/vendor_profile',      to: 'vendors#show',                     via: 'get'
  match '/explore',             to: 'activities#explore',               via: 'get'
  # Routes for Yelp information
  resource :vendors do
    collection do
      get :confirm_details
      put :update_details
    end
  end

  resource :activities do
    member do
      get :explore
    end
  end

  resource :people do
	 resource :adventures
  end

  resource :adventures do
    resource :itinerary_items do
      member do
        post :change
      end
    end
  end

  resource :vendors do
    resource :activities
  end

  resource :activities do
    resource :activity_times
  end
end
