Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  # Topページ
  root to: "snaps#index"
  
  # 会員登録ページ
  get "signup", to: "users#new"
  # users#show=ユーザ詳細ページ, users#create=ユーザ作成アクション
  resources :users, only: [:show, :create]
  
  # sessions#new=ログインページ, sessions#create=ログインアクション, sessions#destroy=ログアウトアクション
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  
  # snaps#index=Topページ, snaps#
  resources :snaps
  
  # favorite_relationships#create=お気に入り登録アクション, favorite_relationships#destroy=お気に入り削除アクション
  resources :favorite_relationships, only: [:create, :destroy]
end

# Prefix                 Verb   URI Pattern                           Controller#Action

# root                   GET    /                                     snaps#index

# signup                 GET    /signup(.:format)                     users#new
# users                  POST   /users(.:format)                      users#create
# user                   GET    /users/:id(.:format)                  users#show

# login                  GET    /login(.:format)                      sessions#new
#                        POST   /login(.:format)                      sessions#create
# logout                 DELETE /logout(.:format)                     sessions#destroy

# snaps                  GET    /snaps(.:format)                      snaps#index
#                        POST   /snaps(.:format)                      snaps#create
# new_snap               GET    /snaps/new(.:format)                  snaps#new
# edit_snap              GET    /snaps/:id/edit(.:format)             snaps#edit
# snap                   GET    /snaps/:id(.:format)                  snaps#show
#                        PATCH  /snaps/:id(.:format)                  snaps#update
#                        PUT    /snaps/:id(.:format)                  snaps#update
#                        DELETE /snaps/:id(.:format)                  snaps#destroy

# favorite_relationships POST   /favorite_relationships(.:format)     favorite_relationships#create
# favorite_relationship  DELETE /favorite_relationships/:id(.:format) favorite_relationships#destroy