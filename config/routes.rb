Rails.application.routes.draw do
  get 'users/search_member'
  devise_scope :user do
    authenticated :user do
      root to: 'passthrough#attendance', as: :authenticated_root
    end

    unauthenticated :user do
      root to: 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  devise_for :users, controllers: { registrations: 'users/registrations' }

  # Dashboard Passthrough routes (redirect to appropriate namespace)
  get 'dashboard/attendance'      => 'passthrough#attendance'
  get 'dashboard/payments'        => 'passthrough#payments'
  get 'dashboard/member_progress' => 'passthrough#member_progress'

  # Members dashboard routes
  namespace :members do
    get 'dashboard'                 => 'dashboard#index'
    get 'dashboard/attendance'      => 'dashboard#attendance'
    get 'dashboard/payments'        => 'dashboard#payments'
    get 'dashboard/member_progress' => 'dashboard#member_progress'
  end

  # Admin dashboard routes
  namespace :admin do
    get  'dashboard'                    => 'dashboard#index'
    get  'dashboard/attendance'         => 'dashboard#attendance'
    get  'dashboard/behavior'           => 'dashboard#behavior'
    get  'dashboard/finances'           => 'dashboard#finances'
    get  'dashboard/members'            => 'dashboard#member_index'
    get  'dashboard/member_progress'    => 'dashboard#member_progress'
    get  'dashboard/payments'           => 'dashboard#payments'
    get  'dashboard/physical_tests/new' => 'physical_tests#new'
    post 'dashboard/physical_tests/'    => 'physical_tests#create'
  end

  # User search endpoint for autocomplete
  get 'search_members/:q'            => 'users#search_member'
  put 'toggle_member_status/:id'     => 'users#toggle_user_active', as: 'toggle_member_status'

  resources :payments, only: [:create, :edit, :destroy]
  resources :attendances, only: [:create, :edit, :destroy]
end
