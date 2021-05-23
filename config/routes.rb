Rails.application.routes.draw do

  root to: 'public/homes#top'
  get '/admin' => 'admin/homes#top'
  get '/about' => 'public/homes#about'

  #adminの設定
 devise_for :admin, controllers: {
  sessions: 'admin/sessions'
}
  #customerの設定
  devise_for :customers, controllers: {
    sessions: 'public/sessions',
    registrations: 'public/registrations'
  }

  #adminの設定
  namespace :admin do

    resources :products, only: [:index, :show, :new, :create, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:show, :update, :index]
    resources :ordering_products, only: [:update]


  end

  #customerの設定
  namespace :public do

    resources :products, only: [:index, :show]
    resources :genres, only: [:index]
    resources :cart_items, only: [:index, :create, :update, :destroy]
    delete '/cart_items/destroy_all' => 'cart_items#destroy_all'
    resources :orders, only: [:new, :create, :index, :show]
    get '/orders/complete' => 'orders#complete'
    post '/orders/confirm' => 'orders#confirm'
    resources :customers, only: [:edit, :update]
    get '/customers/my_page' => 'customers#show'
    get '/customers/unsubscribe' => 'customers#unsubscribe'
    patch '/customers/withdraw' => 'customers#withdraw'
    resources :addresses, only: [:index, :create, :edit, :update, :destroy]

  end

end
