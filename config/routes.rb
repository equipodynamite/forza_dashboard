Rails.application.routes.draw do
  namespace :users do
    get 'dashboard' => "dashboard#index"
    get 'dashboard/attendance'
    get 'dashboard/payments'
  end
  devise_for :users, controllers: { registrations: 'users/registrations' }

  devise_scope :user do
    authenticated :user do
      root to: "users/dashboard#index", as: :authenticated_root
    end

    unauthenticated :user do
      root to: "devise/sessions#new", as: :unauthenticated_root
    end
  end
  resources :attendances, :payments, only: [:index]
end
