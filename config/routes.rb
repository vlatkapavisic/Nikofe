Nikofe::Application.routes.draw do
  mount Bootsy::Engine => '/bootsy', as: 'bootsy'

  root 'cms_pages#home'
  get '/website-structure' => 'cms_pages#website_structure', as: 'website_structure'
  resources :pages, :navbar_items, :websites
  devise_for :users, :controllers => { :registrations => :registrations }, 
    path_names: { sign_in: "sign-in", sign_out: "sign-out", sign_up: "sign-up" }
  get '/:website_slug' => 'cms_pages#website_preview', as: 'website_preview'
  get '/:website_slug/:page_slug' => 'cms_pages#show_page', as: 'show_page'
  
end
