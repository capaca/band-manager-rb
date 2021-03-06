ActionController::Routing::Routes.draw do |map|
  map.devise_for :users
  
  map.namespace :admin do |admin|
    admin.root :controller => "bands", :action => "index"
    
    admin.resources :users
    admin.resources :genres
    admin.resources :countries
    admin.resources :albums
    
    # Bands
    admin.resources :bands do |bands|
      bands.resources :posts
      bands.resources :concerts
    
      bands.resources :releases do |releases|
        releases.resources :songs
      end
    end
  end
  
  # Configuration
  map.configuration(
    '/configuration/:action', 
    :controller => :configuration,
    :action => :action
  )
  
  # Configuration
#  map.custom_style(
#    '/custom_style/edit/:band_id', 
#    :controller => :custom_style,
#    :action => :edit,
#    :band_id => :band_id
#  )

  # Load Playlists
  map.load_playlists(
    '/playlists/load/:id', 
    :controller => :playlists,
    :action => :load
  )
  
  # Site
  map.site(
    "/:screen_name/:locale",
    :locale => 'pt-BR',
    :controller => :site,
    :action => :index
  )
  
  map.root :controller => "site", :action => "index" 


  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # Admin
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  # map.root :controller => "welcome"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing or commenting them out if you're using named routes and resources.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
