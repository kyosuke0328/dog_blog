Rails.application.routes.draw do
  	devise_for :members
  	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  	root 'homes#top'
	  get 'homes/about'
  	resources :members, only: [:show, :edit, :update] do
    	resource :relationships, only: [:create, :destroy]
    	get 'follows' => 'relationships#follower', as: 'follows'
    	get 'followers' => 'relationships#followed', as: 'followers'
  	end
  	resources :blogs do
  		resources :post_comments, only: [:create, :destroy]
  		resource :favorites, only: [:create, :destroy]
  	end
  	resources :photos do
  		resources :post_comments, only: [:create, :destroy]
  		resource :favorites, only: [:create, :destroy]
  	end
end