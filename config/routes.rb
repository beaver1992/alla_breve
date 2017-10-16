Rails.application.routes.draw do
  namespace :admin do
    resources :articles
    resources :redactor_images, only: :create
  end

  resources :articles, only: :show
  root 'pages#home'
end
