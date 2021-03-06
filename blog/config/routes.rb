Rails.application.routes.draw do

  devise_for :users
  root "welcome#index"
  get 'pages', to: 'pages#index'
  
  get 'pages/atarek'
  get 'pages/aya'
  get 'pages/walid'
  get 'pages/tarek'
  get 'pages/alfy'
  get 'pages/karim'
  get 'pages/rana'
  get 'pages/amy'
  resources :messages, only: [:new, :create]
   resources :articles do
    member do
      put "like" => "articles#upvote"
      put "unlike" => "articles#downvote"
    end
  end
  resources :conversations, only: [:index, :show, :destroy] do
    member do
      post :reply
      post :mark_as_read
    end
  end
 resources :users do
  resources :comments
end
  resources :articles do
    resources :youtubes
  end
  resources :articles do
    resources :photos
  end
   resources :articles  do
    resources :comments 
  end
   resources :comments do
     resources :sub_comments
  end
  
  devise_scope :user do
    get '/logout',  :to => 'users/sessions#destroy'
  end

  devise_scope :user do
    get '/login',  :to => 'users/sessions#create'
  end

  devise_scope :user do
    get '/edit_acc',  :to => 'users/registrations#edit'
  end

  devise_scope :user do
    get '/signup',  :to => 'users/registrations#new'
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
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
