Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get "homes/about" => "homes#about", as: "about"
  resources :post_images, only: [:new, :create, :index, :show, :destroy] #自動作成された3つを1行に変更後、create.destroy追加
  resources :users, only: [:show, :edit, :update] #自動作成された2つを1行にした
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
