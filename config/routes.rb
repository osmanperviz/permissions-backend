Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :show] do
    member do
      post :add_premission
      post :add_to_group
      get :remove_permissions
    end
  end

  resources :groups, only: [:index, :show] do
    member do
      post :add_user
      post :add_permission
      get :remove_users_from_group
      get :remove_permissions_from_group
    end
  end
end
