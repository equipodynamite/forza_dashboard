Rails.application.routes.draw do
  root "users#sign_in"
  devise_for :users, controllers: { registrations: 'users/registrations' }

end
