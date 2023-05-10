Rails.application.routes.draw do


# devise_for :users
# devise_for :members
  # post '/guest_sign_in', to: 'homes#guest'

# URL /customers/sign_in ...
devise_for :members,skip: [:passwords], controllers: {
  registrations: "member/registrations",
  sessions: 'member/sessions'

}
devise_scope :members do
  post '/guest_sign_in', to: 'homes#guest'
end

# 管理者用
# URL /admin/sign_in ...
devise_for :admin,skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
}

scope module: :member do #会員側のルート
  root to: 'homes#top'
  get '/my_recipes' => 'homes#my_recipe', as: 'my_recipe'
  resources :homes, only: [:destroy]
  # get '/goods' => 'homes#goods', as: 'goods'
  resources :recipes, only: [:index, :show, :new, :create] do
    resource :goods, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
  end
  resources :members do
    member do
      get :goods
    end
  end

  end

namespace :admin do
  resources :recipes, only: [:index, :show] do
    resources :post_comments, only: [:destroy]
  end
  resources :members, only: [:index, :show, :update]
  resources :genres, only: [:index, :create, :destroy]
end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
