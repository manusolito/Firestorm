Rails.application.routes.draw do
  get 'sessions/new'

  get 'welcome/index'
  get    'signup'  => 'users#new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  get   'confirmation'   => 'usuarios#confirmation'
  
  get 'static_pages/Sobre_bestnid', to: 'static_pages#Sobre_Bestnid'

  get 'static_pages/Ayuda', to: 'static_pages#Ayuda'

  get 'static_pages/Contacto', to: 'static_pages#Contacto'

  get '/oferta', to: 'oferta#index' 

  post '/oferta/:id', to: 'oferta#show'

  post '/oferta/:id/edit', to: 'oferta#edit'
  
  post '/oferta', to: 'oferta#create' 
  
   post '/productos/:id', to: 'productos#show'

   get '/productos/estadistica', to: 'productos#estadistica'

   post '/productos/:id/edit', to: 'productos#edit'
 
   get 'productos/:id/ganador', to: 'productos#ganador'
  
   post 'productos/:id/ganador', to: 'productos#ganador'
  

  resources :categoria

  resources :oferta

  resources :productos

  resources :usuarios
  
  resources :contactos
  
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
