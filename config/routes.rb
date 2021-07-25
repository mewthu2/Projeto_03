Rails.application.routes.draw do
   get 'inicio' , to: 'welcome#index'
  namespace :site do
    get 'welcome/index'
  end
  namespace :users_backoffice do
    get 'welcome/index'
  end
  namespace :admins_backoffice do
    get 'welcome/index'
  end
  devise_for :users
  devise_for :admins
  root to: 'site/welcome#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
