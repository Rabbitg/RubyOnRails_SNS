Rails.application.routes.draw do
  devise_for :users
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	root 'posts#index'
	resources :posts, except: [:show] do
		post "/like", to: "likes#like_toggle"
		resources :comments, only: [:create, :destroy]
	end
	    resources :follows, only: [:create, :destroy]	
	
	get '/:user_id/posts/' => 'posts#mypost' , as:'mypost'
end
