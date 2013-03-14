ActionController::Routing::Routes.draw do |map|
  map.resources :avoirs

  map.resources :groupapps, :has_many=>[:applications, :roles]

  map.resources :presentations

  map.resources :fichiercompressions, :collection => {:getversion => :get, :remplacement_shapes => :get, :supnameshapes => :get, :addnameshapes => :get, :sortable_marques_topics => :get, :sortable_marques_topics_javascript => :get, :sortable_logos_blocks_javascript => :get, :set_position_logos => :get, :set_position_logos_circle_red => :get, :suplogosplans => :get, :set_position_logos_remplacement => :get, :version_file => :get, :set_version_apps => :get, :filepdfimg => :get, :detailimgpdf => :get, :getcurrentversion => :get, :test_envoie_file_local_ftp => :get, :affichage_svg => :get}, :has_many=>:avoirs

  map.resources :pings, :member => { :validate => :get }, :collection => {:create => :get}

  map.resources :applications, :collection => {:edit_client => :get, :edit_etat => :get, :valid_edit_etat => :get, :valid_edit_client => :get, :search_auto_completion => :get, :get_sha => :get, :get_statpaiement => :get, :apps_sharing_zips => :get, :get_command => :get, :set_command => :get, :set_old_serial_apps => :get, :get_remotename => :get, :set_remotename => :get, :get_all_apps_fichiercompressions => :get, :getappgroup => :get}, :has_one=>[:groupapps], :has_many=>[:users, :avoirs]

  map.resources :controllersdroits

  #aliases
  map.resouces "addrolessimplifie", :controller=>:roles, :action=>"new"
  map.resouces "newpdfreader", :controller=>:fichiercompressions, :action=>"new"
  #fin aliases
 
  map.resources :roles, :has_many=>[:users, :controllersdroits, :groupapps]

  map.root :controller=> "user_sessions", :action=>"new"
  map.login "login", :controller=>"user_sessions", :action=>"new"
  map.logout "logout", :controller=>"user_sessions", :action=>"destroy"
  map.resources :user_sessions

  map.resources :users, :has_many=>:applications, :collection => {:search_user_auto_completion => :get, :valid_search_user => :post}
  map.resources :javascript, :collection => {:addnamestranslations => :get, :popup_logos_for_mark => :get, :add_block => :get, :see_all_topics_blocks => :get, :sortable_logos_blocks_javascript => :get, :add_logos => :get, :updatelogos => :get, :liste_applications_groupapps => :get, :detail_apps => :get, :tableau_recapitulatif_fichiercompressions => :get, :tab_select_apps => :get, :tableau_recapitulatif_all_apps => :get, :apps_javascript_periodicalupdater => :post, :message_popup_affichage => :get, :show_get_name_value => :get, :search_bornes => :get, :add_new_groupapps => :get, :valid_add_new_groupapps => :get, :check_number_apps => :get, :get_info_fichiercompressions => :get, :file_liste_all_apps => :get, :get_groupapp_name => :get, :snatch_close_window => :post}
  map.resources :connect
  map.resources :statistics, :collection => {:new => :post, :create => :post, :visugraph => :get, :menu => :get, :edit_colonne_table => :get, :comparaisonstat => :get, :categoriecolonne => :get, :newcategoriecolonnetables => :get, :assoc_colonne_table => :get, :update_colonne_table => :get, :statistiquesprincipal => :get, :statistiquesprincipalindex => :get, :testcopiestat => :get }

  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
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
