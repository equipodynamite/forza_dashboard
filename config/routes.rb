Rails.application.routes.draw do
  get 'users/search_member'
  devise_scope :user do
    authenticated :user do
      root to: 'passthrough#index', as: :authenticated_root
    end

    unauthenticated :user do
      root to: 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  devise_for :users, controllers: { registrations: 'users/registrations' }

  # Dashboard Passthrough routes (redirect to appropriate namespace)
  get 'dashboard'            => 'passthrough#index'
  get 'dashboard/attendance' => 'passthrough#attendance'
  get 'dashboard/payments'   => 'passthrough#payments'

  # Members dashboard routes
  namespace :members do
    get 'dashboard' => 'dashboard#index'
    get 'dashboard/attendance' => 'dashboard#attendance'
    get 'dashboard/payments'   => 'dashboard#payments'
  end

  # Admin dashboard routes
  namespace :admin do
    get  'dashboard'            => 'dashboard#index'
    get  'dashboard/attendance' => 'dashboard#attendance'
    get  'dashboard/payments'   => 'dashboard#payments'
    get  'physical_tests/new'   => 'physical_tests#new'
    post 'physical_tests/new'   => 'physical_tests#create'
  end

  # User search endpoint for autocomplete
  get 'search_members/:q' => 'users#search_member'

  resources :payments, only: [:create, :edit, :destroy]

  resources :attendances, only: [:create, :edit, :destroy]
end
