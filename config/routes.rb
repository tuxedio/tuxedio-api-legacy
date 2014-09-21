TuxedoProto::Application.routes.draw do

  namespace :v1 do
    resources :experiences

    resource :people do
      resource :adventures
    end

    resource :vendors do
      resource :experiences
    end

    resource :vendors do
      collection do
        get :confirm_details
        put :update_details
      end
    end

    devise_for :users, class_name: 'V1::User', controllers: {registrations: 'v1/user_registrations', omniauth_callbacks: 'v1/users/omniauth_callbacks'}
    devise_scope :user do
      get 'vendor/sign_up' => 'v1/user_registrations#new', :user => { :user_type => 'vendor' }
      get 'person/sign_up' => 'v1/user_registrations#new', :user => { :user_type => 'person' }
    end
  end

  root to: 'static_pages#home'
  match '/registration_choice', to: 'static_pages#registration_choice', via: 'get'
  match '/person_profile',      to: 'v1/people#show',                   via: 'get'
  match '/vendor_profile',      to: 'vendors#show',                     via: 'get'
  match '/explore',             to: 'experiences#explore',              via: 'get'

  resource :adventures do
    resource :journey_items do
      member do
        post :change
      end
    end
  end


  resource :experiences do
    resource :experience_times
  end
end
