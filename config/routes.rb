Monologue::Engine.routes.draw do
  get 'authors/:id' => "users#show"

match '/admin/settings/all/edit' => 'settings#edit_all', :as => :edit_all, :via => :get
match '/admin/settings/all/update' => 'settings#update_all', :as => :update_all, :via => :put
match '/admin/menu/all/edit' => 'admin#edit_multiple_menu', :as => :edit_multiple_menu, :via => :get
match '/admin/menu/all/update' => 'admin#update_multiple_menu', :as => :update_multiple_menu, :via => :put


   namespace :admin, path: "admin", controller: 'Monologue::Admin' do
     resources :users, except: :edit
     post "/users/:id/" => "users#update", as: 'edit'
     get "logout" => "sessions#destroy"
     get "login" => "sessions#new"
     resources :sessions
end

end

Rails.application.routes.draw do

  get 'authors/:id' => "users#show"

match '/admin/settings/all/edit' => 'settings#edit_all', :as => :edit_all, :via => :get
match '/admin/settings/all/update' => 'settings#update_all', :as => :update_all, :via => :put
match '/admin/menu/all/edit' => 'admin#edit_multiple_menu', :as => :edit_multiple_menu, :via => :get
match '/admin/menu/all/update' => 'admin#update_multiple_menu', :as => :update_multiple_menu, :via => :put

  resources :selected_posts, path: '/admin/selected_posts/', except: [:show]
  get '/search' => "posts#search"
  resources :app_data, path: '/admin/widgets', except: [:show, :new]
  resources :pages, id: /[0-9]+\/.+/, only: [:index, :new, :create], format: false, path: '/admin/pages/'
  scope format: false do
    get 'admin/pages/*id/edit', to: "pages#edit", as: 'edit_page'
    patch 'admin/pages/*id', to: "pages#update"
    put 'admin/pages/*id', to: "pages#update"
    delete 'admin/pages/*id', to: "pages#destroy"
    get 'admin/pages/*id', to: "pages#show", as:'page', controller: 'PagesController'
  end
  get '/admin' => "admin#index"
  get '/admin/views' => "admin#views"
  resources :templates, path: '/admin/templates'
  root 'pages#homepage'
  resources :layouts, path: '/admin/layouts'

  #Mount the Monologue Engine
  mount Monologue::Engine, at: '/' 



end
