Contest::Application.routes.draw do
  
  ActiveAdmin.routes(self)
  
  #devise_for :users
  devise_for :users, path: "auth", path_names: { sign_in: 'signin', sign_out: 'signout', password: 'secret', 
    confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'signup' }
  
  get "home", to: "static_pages#home", controller: "static_pages", action: "home"
  get "about", to: "static_pages#about"
  get "contact", to: "static_pages#contact"
  get "instructions", to: "static_pages#instructions"
  root  "static_pages#home"

  resources :score_details
  resources :score_items
  resources :scores
  resources :judges
  resources :awards
  resources :divisions
  resources :organization_details
  resources :user_organizations
  resources :organizations
  resources :submissions
  resources :users
  resources :categories
  resources :submission_details
  
  resources :submissions do
    resources :submission_details
    resources :scores
  end
  
  resources :categories do
    resources :score_items
  end
  
  #resources :sessions, only: [:new, :create, :destroy]
  
  #match '/signup',           to: 'users#new',         via: 'get'
  #match '/signin',           to: 'sessions#new',      via: 'get'
  #match '/signout',          to: 'sessions#destroy',  via: 'delete'

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
