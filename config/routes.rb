Rails.application.routes.draw do
  ##devise_for :users は、devise を使用する際に URL として users を含む
  devise_for :users
  root to: "homes#top"
  get 'homes/about', as: 'about'
  
  resources :post_images, only: [:new, :create, :index, :show, :destroy] do
    resource :favorite, only: [:create, :destroy] #単数形にすると、/:idがURLに含まれなくなる
    resources :post_comments, only: [:create, :destroy]
  end  
  resources :users, only: [:show, :edit, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
