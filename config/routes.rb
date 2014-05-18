Nikofe::Application.routes.draw do
  mount Bootsy::Engine => '/bootsy', as: 'bootsy'

  # root 'cms_pages#website_preview'

  # resources :pages, path: '/admin/pages'
  # resources :navbar_items, path: '/admin/navbar_items'
  # resources :websites, path: '/admin/websites'

  # devise_for :users, path: '/admin/', :controllers => { :registrations => :registrations }, 
  #   path_names: { sign_in: "sign-in", sign_out: "sign-out", sign_up: "sign-up" }

  # get '/admin/' => 'cms_pages#home', as: 'cms_home'
  # get '/admin/website-structure' => 'cms_pages#website_structure', as: 'website_structure'
  # get '/:slug' => 'cms_pages#show_page', as: 'show_page'

  root 'cms_pages#home'
  get '/website-structure' => 'cms_pages#website_structure', as: 'website_structure'
  resources :pages, :navbar_items, :websites
  devise_for :users, :controllers => { :registrations => :registrations }, 
    path_names: { sign_in: "sign-in", sign_out: "sign-out", sign_up: "sign-up" }
  get '/:website_slug' => 'cms_pages#website_preview', as: 'website_preview'
  get '/:website_slug/:page_slug' => 'cms_pages#show_page', as: 'show_page'
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
