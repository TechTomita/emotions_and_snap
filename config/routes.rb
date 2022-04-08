Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  # Topページ
  root to: "snaps#index"
  
  # 会員登録ページ
  get "signup", to: "users#new"
  # users#show=ユーザ詳細ページ, users#create=ユーザ作成アクション
  resources :users, only: [:show, :create]
  
  
end

# Prefix              Verb            URI Pattern                Controller#Action

# root                GET             /                          snaps#index

# signup              GET             /signup(.:format)          users#new
# users               POST            /users(.:format)           users#create
# user                GET             /users/:id(.:format)       users#show