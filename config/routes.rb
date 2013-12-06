Wafproject::Application.routes.draw do
  get "home/index"


  resources :forums

  resources :comments, only: [:create, :update, :destroy]

  #users
  get "user_sessions/new"

  resources :user_groups

  resources :user_sessions

  resources :users

  match 'login' => "user_sessions#new", :as => :login
  match 'log_in' => "user_sessions#new", :as => :log_in
  match 'signin' => "user_sessions#new", :as => :signin
  match 'sign_in' => "user_sessions#new", :as => :sign_in
  match 'logout' => "user_sessions#destroy", :as => :logout
  match 'account' => 'users#show', :as => :account
  match 'my_account' => 'users#show', :as => :my_account
  match 'signup' => 'users#new', :as => :signup
  match 'sign_up' => 'users#new', :as => :sign_up
  match 'register' => 'users#new', :as => :register
  match 'change_password' => 'users#change_password', :as => :change_password

  match 'new_vol_profile' => 'users#new_vol_profile', as: :new_vol_profile
  match 'new_ngo_profile' => 'users#new_ngo_profile', as: :new_ngo_profile
  match 'edit_vol_profile' => 'users#edit_vol_profile', as: :edit_vol_profile
  match 'edit_ngo_profile' => 'users#edit_ngo_profile', as: :edit_ngo_profile


  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'home#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
