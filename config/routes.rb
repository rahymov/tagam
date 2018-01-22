Rails.application.routes.draw do
  
  devise_for :users, path: 'users', controllers: {
            sessions: 'users/sessions'}
  devise_for :admins, path: 'admins', controllers: { sessions: "admins/sessions"}
  resources :categories
  resources :menu_items
  root "pages#home"

  get "/menus", to: "categories#index"
  get "/menu/:slug", to: "menu_items#menu_item_by_slug", as: :menu_item_by_slug
  controller :pages do 
	  get '/home', to: "pages#home"
	  get '/about', to: "pages#about"
	  get '/contact', to: "pages#contact"
	end

	
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
