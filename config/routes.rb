Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show, :edit, :update] do
      collection do
      get ':id/rooms_list' => 'users#rooms_list'
      get ':id/friends_list' => 'users#friends_list'
    end
  end
  root to: 'top#index'
  resources :rooms, only: [:new, :create, :show, :edit, :update] do
    resources :messages, only: [:create]
  end
end
