TuxedoProto::Application.routes.draw do
  namespace :v1, defaults: { format: :json } do
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

    devise_for :users, class_name: 'V1::User', controllers: {registrations: 'v1/user_registrations', omniauth_callbacks: 'v1/users/omniauth_callbacks'}

    devise_scope :user do
      get 'vendor/sign_up' => 'v1/user_registrations#new', :user => { :user_type => 'vendor' }
      get 'person/sign_up' => 'v1/user_registrations#new', :user => { :user_type => 'person' }
    end
  end
end
