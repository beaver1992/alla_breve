Rails.application.routes.draw do
  namespace :admin do
    get '/', to: redirect('/admin/articles')
    resources :articles
    resources :redactor_images, only: :create
  end

  resources :articles, only: :show
  root 'pages#home'
end
