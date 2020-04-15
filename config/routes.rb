Rails.application.routes.draw do


  #会員側

  devise_for :end_users, controllers: {
    sessions: "end_users/sessions",
    registrations: "end_users/registrations",
    passwords: "end_users/passwords"
  }

  scope module: :end_user do
    root "homes#top"

    resources :end_users, only: [:update]
    get "my_page" => "end_users#my_page"
    get "my_page/edit" => "end_users#edit"
    get "check" => "end_users#check"
    patch "unsubscribed" => "end_users#unsubscribed"

    resources :examples, only: [:index, :show]

    get "examples/favorites" => "favorites#index"

    resources :contacts, only: [:new, :index, :show, :create, :update]
    get "contacts_check" => "contacts#check"
    get "thanks" => "contacts#thanks"
    patch "cancel" => "contacts#cancel"
  end


  #管理者側

  devise_for :admins, controllers: {
    sessions: "admins/sessions"
  }

  namespace :admin do

    root "homes#top"

    resources :end_users, only: [:index, :show, :update]

    resources :contacts, only: [:index, :show]
    patch "contacts/:id" => "contacts#react", as: "contact_react"
    patch "contacts/:id" => "contacts#assign", as: "contact_assign"
    patch "contacts/:id" => "contacts#memo", as: "contact_memo"

    resources :home_builders, only: [:index, :new, :create, :edit, :update, :destroy]

    resources :examples
    get "examples/check" => "examples#check"

    resources :categories, only: [:index, :create, :edit, :update, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
