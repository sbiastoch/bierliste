SampleApp::Application.routes.draw do

  resources :categories

  resources :semesters

  resources :entries

  post '/users/print' => 'users#print'


  get '/lists/food/' => 'list#food', month: Time.now.month.next, year: Time.now.year
  get '/lists/food/:month' => 'list#food', year: Time.now.year
  get '/lists/food/:year/:month' => 'list#food'

  get '/lists/poena/' => 'list#poena'

  get '/lists/drinks/' => 'list#drinks', month: Time.now.month.next, year: Time.now.year
  get '/lists/drinks/:month' => 'list#drinks', year: Time.now.year
  get '/lists/drinks/:year/:month' => 'list#drinks'

  root  'users#index'
  match '/signup',  to: 'users#new',            via: 'get'
  get '/home'     => 'static_pages#home'
  get '/help'     => 'static_pages#help'
  get '/about'    => 'static_pages#about'
  get '/contact'  => 'static_pages#contact'

  resources :users
  resources :sessions, only: [:new, :create, :destroy]

  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'

#  get '/receipts/simple_receipts/:id', to: 'receipts#show', type: 'SimpleReceipt'
#  get '/receipts/simple_receipts', to: 'receipts#index', type: 'SimpleReceipt'
#  get '/receipts/simple_receipts/new', to: 'receipts#new', type: 'SimpleReceipt'
#  match '/receipts/simple_receipts', to: 'receipts#create', type: 'SimpleReceipt', via: 'post'

#  get '/receipts/share_receipts', to: 'receipts#index', type: 'ShareReceipt'
#  get '/receipts/share_receipts/new', to: 'receipts#new', type: 'ShareReceipt'

  get '/share_receipts/new' => 'share_receipts#new', type: 'ShareReceipt', show: 'simple'
  get '/share_receipts/new/payout' => 'share_receipts#new', type: 'ShareReceipt', show: 'payout'
  get '/share_receipts/new/deposit' => 'share_receipts#new', type: 'ShareReceipt', show: 'deposit'

  #resources :receipts do
    resources :simple_receipts, type: 'SimpleReceipt'
  resources :drink_receipts, type: 'DrinkReceipt'
  resources :share_receipts, type: 'ShareReceipt'
  #end
  resources :receipts

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
