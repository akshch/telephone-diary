Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'login', to: 'users#new', as: 'login'
  get 'logout', to: 'users#destroy', as: 'logout'
  

  resources :users
  resources :contacts
  get 'contacts/*unmatched_route', to: 'application#not_found'
  root :to => redirect('/contacts')
end
