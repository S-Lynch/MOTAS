SampleMOTAS::Application.routes.draw do

  get "sessions/new"

resources :users # needed for the RESTful architecture by adding the users controller as a resource which adds the controller actions
resources :mots
# Limits the actions (methods) that can be performed
resources :sessions, :only => [:new, :create, :destroy]
resources :mots, :only => [:create, :destroy]

  # The priority is based upon order of creation:
  # first created -> highest priority.
  # The named routes that are attached to the corresponding controller and view
match '/mot', :to => 'mots#create'
match '/signup', :to => 'users#new'
match '/signin', :to => 'sessions#new'
match '/motdelete', :to => 'mots#destroy'
match '/signout', :to => 'sessions#destroy'
match '/contact', :to => 'pages#contact' # creates a link to the pages controller and the contact view.
match '/about', :to => 'pages#about' # the link is based on the incoming URL in this case '/about'. 
match '/help', :to => 'pages#help' # In Rails this is called a named route
match '/bookings', :to => 'mots#index'
    # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # 
  # routes to the first page to display to the user upon request 
   root :to => 'pages#home'

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

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
