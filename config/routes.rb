BackChannel2::Application.routes.draw do
  resources :categories

  #match 'posts/:id/comment' => 'posts#comment', :as => :comment
  match '/posts/comment', :controller => 'posts', :action => 'comment'
  match '/posts/createComment', :controller => 'posts', :action => 'createComment'
  match '/posts/incvote', :controller => 'posts', :action => 'incvote'
  match '/posts/search', :controller => 'posts', :action => 'search'
  match '/users/logout', :controller => 'users', :action => 'logout'
  match '/users/edit', :controller => 'users', :action => 'edit'
  match '/users/destroy', :controller => 'users', :action => 'destroy'
  match '/users/showAll', :controller => 'users', :action => 'showAll'
  match '/posts/showvotes', :controller => 'posts', :action => 'showvotes'
  match '/categories/show', :controller => 'categories', :action => 'show'
  match '/users/showReport', :controller => 'users', :action => 'showReport'

  resources :votes

  resources :users

  resources :posts
  resources :categories

  root :to => 'users#authenticate'
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
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
