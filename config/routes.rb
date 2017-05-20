Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :show] do
    member do
      post :add_premission
      post :add_to_group
    end
  end

  resources :groups, only: [:index, :show] do
    member do
      post :add_user
      post :add_permission
    end
  end
end
