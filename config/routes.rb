Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	root to: 'toppages#index'
	
	get 'login', to: 'sessions#new'
	post 'login', to: 'sessions#create'
	delete 'logout', to: 'sessions#destroy'
	
	get 'signup', to: 'users#new'
	# resources :users, only: [:index, :show, :new, :create]
	# For Following func
	resources :users, only: [:index, :show, :new, :create, :update] do
		member do
			get :followings
			get :followers
		end
		#collection do
		#	get :search
		#end
	end
	
	resources :tasks, only: [:create, :destroy, :show, :edit, :update, :index]
	resources :relationships, only: [:create, :destroy, :update, :show]
end
