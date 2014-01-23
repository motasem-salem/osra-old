Osra::Application.routes.draw do

  resources :orphans

  devise_for :users, :controllers => { :registrations => "users/registrations" }

  resources :sponsors

  resources :partners

  resources :organizations

  root 'main#index'
  get '/locale/:id' => 'main#set_locale', :as => :set_locale
  
  get '/partners/:id/upload' => 'partners#upload', :as => :upload_list
  
  post 'partners/:id/import' => 'partners#import', :as => :import_list

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

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
