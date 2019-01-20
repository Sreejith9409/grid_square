Rails.application.routes.draw do
	get 'users/index'
	root 'users#index'
  mount ActionCable.server => '/cable'  
	resources :users
	resources :sessions, only: [:new, :create, :destroy]

	resources :square_boards do 
		post :update_square_board
		get  :leader_board
	end
	get 'signup', to: 'users#new', as: 'signup'
	get 'login', to: 'sessions#new', as: 'login'
	get 'logout', to: 'sessions#destroy', as: 'logout'

end
