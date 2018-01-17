Rails.application.routes.draw do
  
  devise_for :users, controllers: {
            sessions: 'users/sessions'}
  # devise_for :admins, path: 'admins', controllers: { sessions: "admins/sessions"}
  resources :categories
  resources :menu_items
  
  controller :pages do 
	  get '/home', to: "pages#home"
	  get '/about', to: "pages#about"
	  get '/contact', to: "pages#contact"
	end

	root "pages#home"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
