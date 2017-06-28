Confligere::Application.routes.draw do
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
  
  get "logout" => "sessions#destroy", :as => "logout"
  get "login" => "sessions#new", :as => "login"
  post "login" => "sessions#create"
  get "signup" => "user#new", :as => "signup"
  # this makes the calendar work
  get "timeline/dow" => "timeline#dow"
  #match 'journal/:id' => 'journal#show', via: [:get, :post]
  
  scope :user do
    get "/basic" => "user#basic"
    get "/personal" => "user#personal"
    get "/relationships" => "user#relationships"
    get "/relationship/:id" => "user#relationship"
    get "/expectations" => "user#expectations"
    get "/expectation/:id" => "user#expectation"
    get "/password" => "user#password"
    post "/update" => "user#update"
    post "/create" => "user#create"
    post "/mod_relationship" => "user#mod_relationship"
    patch "/mod_relationship/:id" => "user#mod_relationship"
    post "/mod_expectation" => "user#mod_expectation"
    patch "/mod_expectation/:id" => "user#mod_expectation"
  end
    
  resources :sessions
  resources :dashboard
  resources :journal
  resources :timeline
  resources :user
  resources :goals

  root :to => "sessions#index"

end
