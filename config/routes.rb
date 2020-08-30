Rails.application.routes.draw do
  	devise_for :members
  	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  	root 'homes#top'
	  get 'homes/about'
    get 'member_show/:id' => 'members#show', as: 'member_show'
    get 'member_edit' => 'members#edit', as: 'member_edit'
    get 'member_blog/:id' => 'members#blog', as: 'member_blog'
    get 'member_photo/:id' => 'members#photo', as: 'member_photo'
  	resources :members, only: [:update] do
      get 'page/:page', :action => :index, :on => :collection
    end

  	resources :blogs do
      get :search, on: :collection
  		resources :post_comments, only: [:create, :destroy]
  		resource :favorites, only: [:create, :destroy]
  	end
  	resources :photos
end