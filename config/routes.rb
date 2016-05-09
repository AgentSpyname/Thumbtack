Rails.application.routes.draw do
  get '/admin' => "admin#index"
  get '/admin/views' => "admin#views"
  resources :templates
  root 'pages#homepage'
  resources :layouts
  resources :pages, id: /[0-9]+\/.+/, only: [:index, :new, :create], format: false
  scope format: false do
    get '/pages/*id/edit', to: "pages#edit", as: 'edit_page'
    patch '/pages/*id', to: "pages#update"
    put '/pages/*id', to: "pages#update"
    delete '/pages/*id', to: "pages#destroy"
    get '/pages/*id', to: "pages#show", as:'page', controller: 'PagesController'
  end

  #Mount the Monologue Engine
  mount Monologue::Engine, at: '/' 



end
