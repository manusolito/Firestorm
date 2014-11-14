Rails.application.routes.draw do
  get "welcome/index"

  get "static_pages/Sobre_bestnid", to: 'static_pages#Sobre_Bestnid'

  get "static_pages/Ayuda", to: 'static_pages#Ayuda'

  get "static_pages/Contacto", to: 'static_pages#Contacto'

  get "ofertas/new", to: 'ofertas#new'

  get "ofertas", to: 'ofertas#index'
  
  post "producto/new", to: 'productos#new'

  get "producto/new", to: 'productos#new'

  get  "ofertas/:id", to: "ofertas#show"

  post  "oferta/:id", to: "ofertas#create"



  resources :categorias

  resources :ofertas

  resources :productos

  resources :usuarios
  root 'welcome#index'

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
