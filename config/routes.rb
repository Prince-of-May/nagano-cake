Rails.application.routes.draw do
  
 devise_for :admin, controllers: {
  sessions: 'admin/sessions'
}
  devise_for :customers
  
  #customerの設定
  
  #adminの設定
  
end
