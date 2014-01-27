Osra::Application.routes.draw do

  # post   '/partners/:partner_id/orphan_lists/validate' => 'orphan_lists#validate', :as => :validate_partner_orphan_list
  post   '/partners/:partner_id/orphan_lists/:id/import' => 'orphan_lists#import', :as => :import_partner_orphan_list
  resources :partners do
    resources :orphan_lists
  end

  resources :orphans

  devise_for :users, :controllers => { :registrations => "users/registrations" }

  resources :sponsors

  resources :organizations

  root 'main#index'
  get '/locale/:id' => 'main#set_locale', :as => :set_locale
  
#
#
# get '/orphan_lists/validation' => 'orphan_lists#show_validation', :as => :show_validation#

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
