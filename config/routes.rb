Rails.application.routes.draw do

  root to: 'public/homes#top'
  get '/admin' => 'admin/homes#top'

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
    resources :customers, only: [:index, :create, :edit, :update]
    resources :orders, only: [:show, :update]
    resources :ordering_products, only: [:update]
  

  end

  #customerの設定
  namespace :public do
  end

end
