Rails.application.routes.draw do

  root to: 'public/homes#top'
  get '/admin' => 'admin/homes#top'
  get '/about' => 'public/homes#about'

  #adminの設定
 devise_for :admin, controllers: {
  sessions: 'admin/sessions'
}
  #customerの設定
  devise_for :customers

  #adminの設定
  namespace :admin do

    resources :products, only: [:index, :show, :new, :create, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:show, :update]
    resources :ordering_products, only: [:update]


  end

  #customerの設定
  namespace :public do

    resources :products, only: [:index, :show]
    resources :genres, only: [:index]
    resources :cart_items, only: [:index, :create, :update, :destroy]
    delete '/cart_items/destroy_all' => 'public/cart_items#destroy_all'
    resources :orders, only: [:new, :create, :index, :show]
    get '/orders/complete' => 'public/orders#complete'
    post '/orders/confirm' => 'public/orders#confirm'
    resources :customers, only: [:edit, :update]
    get '/customers/my_page' => 'public/customers#show'
    get '/customers/unsubscribe' => 'public/customers#unsubscribe'
    patch '/customers/withdraw' => 'public/customers#withdraw'
    resources :addresses, only: [:index, :create, :edit, :update, :destroy]

  end

end
