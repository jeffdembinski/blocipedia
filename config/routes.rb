Rails.application.routes.draw do
  resources :wikis
  devise_for :users

  get 'about' => 'welcome#about'
  post 'success' => 'welcome#success'
  post 'downgrade'=>'welcome#downgrade'
  root 'welcome#index'

end
