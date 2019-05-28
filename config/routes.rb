Rails.application.routes.draw do
  devise_for :users
  root 'posts#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	root 'posts#index'
	resources :posts, except: [:show] do
		post "/like", to: "likes#like_toggle"
	end
end
